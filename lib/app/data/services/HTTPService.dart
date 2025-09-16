import 'package:http/http.dart';
import 'package:uffmobileplus/app/modules/internal_modules/login/modules/iduff/services/auth_iduff_service.dart';

class HTTPService {
  final Auth _auth;

  HTTPService(this._auth);

  Future<Response?> get(Uri url, {Map<String, String>? headers}) {
    return _exec(() => _auth.client!.get(url, headers: headers));
  }

  Future<Response?> post(
    Uri url, {
    Map<String, String>? headers,
    Object? body,
  }) {
    return _exec(() => _auth.client!.post(url, headers: headers, body: body));
  }

  Future<Response?> put(Uri url, {Map<String, String>? headers, Object? body}) {
    return _exec(() => _auth.client!.put(url, headers: headers, body: body));
  }

  Future<Response?> delete(Uri url, {Map<String, String>? headers}) {
    return _exec(() => _auth.client!.delete(url, headers: headers));
  }

  Future<Response?> _exec(Future<Response> Function() f) async {
    try {
      await _auth.refreshToken();
      Response response = await f();
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
