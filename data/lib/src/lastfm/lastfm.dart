import 'dart:convert';
import 'dart:typed_data';

import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:shared_dependencies/crypto.dart';
import 'package:shared_dependencies/utils.dart';

import 'session_key_generator.dart';

/// It stores useful information and a client for HTTP requests.
class LastFM {
  DioClient _client;

  static const String _API_KEY = '9f40d4ad9040a038459af70e0aa6801f';
  static const String _API_SECRET = '378a01463883c3c136ee38e970fb5a74';
  final String? _sessionKey;
  final String? _username;
  final String? _passwordHash;
  final bool _isAuth;

  /// Default constructor.
  LastFM._(this._sessionKey, this._username, this._passwordHash, this._isAuth)
      : _client = DioClient(
          baseUrl: 'https://ws.audioscrobbler.com/2.0/',
        );

  /// Default kind of API usage.
  /// You can use methods that does not required authentication.
  LastFM.noAuth() : this._(null, null, null, false);

  /// It creates a LastFM object with auth mode.
  static Future<LastFM> authenticate({
    required String username,
    required String password,
    String? sessionKey,
    String? proxy,
  }) async {
    final String passwordHash = generateMD5(password);

    if (sessionKey == null) {
      final Session session = await SessionKeyGenerator(
        LastFM._(
          null,
          null,
          null,
          false,
        ),
      ).getSessionKey(
        username: username,
        passwordHash: passwordHash,
      );

      return LastFM._(
        session.sessionKey,
        username,
        passwordHash,
        true,
      );
    } else {
      return LastFM._(
        sessionKey,
        username,
        passwordHash,
        true,
      );
    }
  }

  static Future<LastFM> authenticateWithPasswordHash({
    required String username,
    required String passwordHash,
    String? sessionKey,
  }) async {
    if (sessionKey == null) {
      final Session session = await SessionKeyGenerator(
        LastFM._(
          null,
          null,
          null,
          false,
        ),
      ).getSessionKey(
        username: username,
        passwordHash: passwordHash,
      );

      return LastFM._(
        session.sessionKey,
        username,
        passwordHash,
        true,
      );
    } else {
      return LastFM._(
        sessionKey,
        username,
        passwordHash,
        true,
      );
    }
  }

  /// It returns the created client.
  DioClient get client => _client;

  String get apiKey => _API_KEY;

  String get apiSecret => _API_SECRET;

  /// It returns, if authenticated, the session key.
  String? get sessionKey => _sessionKey;

  /// It returns, if authenticated, the username.
  String? get username => _username;

  /// It returns, if authenticated, the passwordHash.
  String? get passwordHash => _passwordHash;

  /// True if authenticated.
  bool get isAuth => _isAuth;
}

String generateMD5(String value) {
  final Uint8List content = const Utf8Encoder().convert(value);
  final Digest digest = md5.convert(content);
  return hex.encode(digest.bytes);
}
