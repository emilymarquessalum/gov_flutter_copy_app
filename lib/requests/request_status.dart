




enum RequestStatus {
  empty,
  error,
  invalid,
  success,
  loading,
  timeout,
  frontEndError
}


extension RequestStatusExtension on RequestStatus {

  static fromInt(int status) {

    if (status >= 500) {
      return RequestStatus.error;
    }

    if (status >= 400) {
      return RequestStatus.invalid;
    }

    return RequestStatus.success;
  }
}