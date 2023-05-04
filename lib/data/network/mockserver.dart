// ignore_for_file: avoid_print

import 'package:eng_mobile_app/data/mocks/index.dart';
import 'package:eng_mobile_app/utils/helpers.dart';

class MockReply {
  int statusCode;
  String data;

  MockReply(this.statusCode, this.data);
}

class MockServer {
  String endpoint;

  MockServer(this.endpoint);

  Future<MockReply> get() async {
    print('\x1B[33m -------------------------------- \x1B[0m');
    print('\x1B[33m |          MOCKSERVER          | \x1B[0m');
    print('\x1B[33m -------------------------------- \x1B[0m');

    await sleep(1000);

    if (endpoint.contains('/questions')) {
      return MockReply(200, MockQuestions().json());
    }

    if (endpoint.contains('/global/config')) {
      return MockReply(200, MockBackendSettings().json());
    }

    return MockReply(404, 'Not Found');
  }

  Future<MockReply> post(Map<String, dynamic> data) async {
    print('\x1B[33m -------------------------------- \x1B[0m');
    print('\x1B[33m |          MOCKSERVER          | \x1B[0m');
    print('\x1B[33m -------------------------------- \x1B[0m');

    await sleep(1000);

    return MockReply(404, 'Not Found');
  }
}
