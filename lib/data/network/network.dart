import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'dart:convert';
import 'package:eng_mobile_app/data/network/enums.dart';
import 'package:eng_mobile_app/data/network/mockserver.dart';
import 'package:eng_mobile_app/config.dart';
// import 'package:eng_mobile_app/services/auth/auth_service.dart';
import 'package:eng_mobile_app/utils/helpers.dart';

class Response {
  bool ok;
  dynamic data;
  int? statusCode;

  Response({required this.ok, this.data, this.statusCode});
}

class Network {
  int timeout;
  int retries;
  String baseURL;

  Network(
      {apiVersion,
      this.timeout = 10 * 1000,
      this.baseURL = Config.BASE_URL,
      this.retries = 1});

  Future<Response> get(String path, {bool absolutePath = false}) async {
    return _builder(path, HttpMethod.GET, absolutePath, null);
  }

  Future<Response> post(path,
      {required Map<String, dynamic> data, bool absolutePath = false}) async {
    return _builder(path, HttpMethod.POST, absolutePath, data);
  }

  Future<Response> put(path, {required data, bool absolutePath = false}) async {
    return _builder(path, HttpMethod.PUT, absolutePath, data);
  }

  Future<Response> delete(path, {required data, absolutePath = false}) async {
    return _builder(path, HttpMethod.DELETE, absolutePath, data);
  }

  Future<Response> _builder(String path, HttpMethod method, bool absolutePath,
      Map<String, dynamic>? data) async {
    final url = Uri.parse(absolutePath
        ? path
        : Config.API_URL + (path[0] == '/' ? path : '/$path'));

    printInfo(
        'REQUEST -->>> | ${method.toString().toUpperCase()} | $path | $data');

    if (Config.MOCK) {
      MockReply? mockResp;

      if (method == HttpMethod.GET) {
        mockResp = await MockServer(url.path).get();
      }

      if (method == HttpMethod.POST) {
        mockResp = await MockServer(url.path).post(data!);
      }

      if (method == HttpMethod.PUT) {
        mockResp = await MockServer(url.path).post(data!);
      }

      if (method == HttpMethod.DELETE) {
        mockResp = await MockServer(url.path).post(data!);
      }

      return mockServerHandler(mockResp!, url.path, method);
    }

    Response response = Response(ok: true);
    for (var i = 0; i < retries; i++) {
      response = await makeHttpCall(url, method, payload: data);
      if (response.ok) break;
      await sleep(500);
    }

    return response;
  }

  Future<Response> makeHttpCall(Uri url, HttpMethod method,
      {Map? payload}) async {
    try {
      String reply = '';
      final httpClient = HttpClient();
      HttpClientRequest? request;

      if (method == HttpMethod.GET) {
        request = await httpClient.getUrl(url);
      }

      if (method == HttpMethod.POST) {
        request = await httpClient.postUrl(url);
      }

      if (method == HttpMethod.PUT) {
        request = await httpClient.putUrl(url);
      }

      if (method == HttpMethod.DELETE) {
        request = await httpClient.deleteUrl(url);
      }

      request!.headers.set('content-type', 'application/json');   

      if (payload != null) {
        request.headers.contentLength =
            utf8.encode(json.encode(payload)).length;
        request.add(utf8.encode(json.encode(payload)));
      }

      HttpClientResponse response =
          await request.close().timeout(Duration(milliseconds: timeout));
      reply = await response.transform(utf8.decoder).join();
      int statusCode = response.statusCode;
      httpClient.close();

      final data = reply != '' ? jsonDecode(reply) : '';
      log(reply);

      if (serverErrorHandler(
          reply, statusCode, url.path, method.toString(), false)) {
        return Response(ok: false, data: data, statusCode: statusCode);
      }

      printDebug('RESPONSE <<<-- | $statusCode | ${url.path} | $data');

      return Response(ok: true, data: data, statusCode: statusCode);
    } on TimeoutException catch (_) {
      printError(
          'Network --> ${method.toString()}($url) | Server connection timed out');
      return Response(ok: false);
    } on SocketException catch (_) {
      printError(
          "Network --> ${method.toString()}($url) | You aren't connected to internet");
      return Response(ok: false);
    } catch (e, s) {
      printError("Network --> ${method.toString()}($url) | Connection Lost");
      printError(e.toString());
      printError(s.toString());
      return Response(ok: false);
    }
  }

  bool serverErrorHandler(
      dynamic data, int statusCode, String path, String method,
      [bool showErrorMsg = true]) {
    final successStatus = [200, 201];

    if (successStatus.contains(statusCode)) return false;

    final djangoErr = extractErrorFromDjangoHTML(data);
    printError(
        'ERROR <<<-- | $statusCode | $method($path) | ${djangoErr.title} ::: ${djangoErr.message}');
    return true;
  }

  Response mockServerHandler(
      MockReply mockResp, String path, HttpMethod method) {
    String reply = mockResp.data;
    int statusCode = mockResp.statusCode;

    if (serverErrorHandler(reply, statusCode, path, method.toString(), false)) {
      return Response(ok: false);
    }

    // var replyText= json.encode(reply);
    log(reply);

    final data = reply != '' ? jsonDecode(reply) : '';

    printDebug('RESPONSE <<<-- | $statusCode | $path | $data');
    return Response(ok: true, data: data);
  }
}
