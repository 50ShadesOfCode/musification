part of 'app_exception.dart';

class NotFoundException extends AppException {
  final String errorDescription;

  NotFoundException({
    required String message,
    required this.errorDescription,
  }) : super(message);
}
