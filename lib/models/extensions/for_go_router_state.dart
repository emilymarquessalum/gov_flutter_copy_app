



import 'package:go_router/go_router.dart';

extension GoRouterStateExtension on GoRouterState {

  T? extraIfData<T>() {

    if(extra is T) {
      return extra as T;
    }

    return null;
  }
}