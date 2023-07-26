import 'package:eng_mobile_app/config.dart';
import 'package:eng_mobile_app/utils/helpers.dart';
import 'package:eng_mobile_app/data/network/network.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class GlobalService {
  bool _shouldUpdateApp = false;
  bool get shouldUpdateApp => _shouldUpdateApp;

  List<Map<String, dynamic>> _intro = [];
  List<Map<String, dynamic>> get intro => _intro;

  List<Map<String, dynamic>> _languages = [];
  List<Map<String, dynamic>> get languages => _languages;

  Map<String, dynamic> get language => _language;
  Map<String, dynamic> _language = {};

  Future<bool> loadLanguage() async {
    try {
      if (_languages.isEmpty) return false;

      final prefs = await SharedPreferences.getInstance();
      final lang = prefs.getString('lang');

      if (lang == null || lang == '') return false;
      final foundLang = _languages.firstWhere((x) => x['lang'] == lang);
      
      _language = foundLang;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setLanguage(String lang) async {
    try {
      final foundLang = _languages.firstWhere((x) => x['lang'] == lang);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('lang', foundLang['lang']);

      _language = foundLang;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> loadUuid() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final uuid = prefs.getString('uuid');

      if (uuid != null) {
        final resp = await Network().get('/device?uuid=$uuid');
        if (!resp.ok) {
          _createUuid();
          return true;
        }
        _deviceId = resp.data['device_id'];
        return true;
      }

      _createUuid();

      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> _createUuid() async {
    final prefs = await SharedPreferences.getInstance();
    String newUuid = Uuid().v4();
    final resp = await Network().post('/device', data: {
      'uuid': newUuid,
    });

    if (!resp.ok) return false;

    _deviceId = resp.data['device_id'];
    await prefs.setString('uuid', newUuid);
    return true;
  }

  bool _isFirstTime = false;
  bool get isFirstTime => _isFirstTime;

  Future<bool> loadFirstTime() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final firstTime = prefs.getBool('first_time');
      if (firstTime != null) {
        _isFirstTime = firstTime;
        return true;
      }
      await prefs.setBool('first_time', true);
      _isFirstTime = true;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> setFirstTime(bool val) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('first_time', val);
      _isFirstTime = val;
      return true;
    } catch (e) {
      return false;
    }
  }

  int _deviceId = -1;

  Future<void> sendScreenFlow(String value) async {
    // if(_screenFlowStop) return;
    await Network().post('${Config.API_URL}/screen-flow',
        data: {
          'value': value,
          'device': _deviceId,
          'time': DateTime.now().toString()
        },
        absolutePath: true);
  }

  Future<bool> fetchGlobalSettings() async {
    try {
      Response? response;

      response = await Network(retries: 2).get(
          '${Config.BASE_URL}/global/config?version=${Config.APP_VERSION}',
          absolutePath: true);

      if (!response.ok) return false;

      _shouldUpdateApp = response.data['update_required'];
      // _languages = response.data['languages'];

      _languages = (response.data['languages'] as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList();

      _intro = (response.data['intro'] as List<dynamic>)
          .map((item) => item as Map<String, dynamic>)
          .toList();

      return true;
    } catch (e, s) {
      printError('fetchGlobalSettings: $e');
      printError(s.toString());
      return false;
    }
  }
}
