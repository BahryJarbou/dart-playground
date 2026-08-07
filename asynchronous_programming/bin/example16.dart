import 'dart:async';

void main(List<String> args) async {
  // cancels stream after an error
  try {
    await for (final name in getNames().withTimeoutBetweenEvents(
      const Duration(seconds: 3),
    )) {
      print(name);
    }
  } on TimeoutBetweenEventsException catch (e, stackTrace) {
    print('TimeBetweenEventsException: $e');
    print('Stack trace: $stackTrace');
  }

  print('----------------------');
  // continues after an error
  final completer = Completer<void>();

  getNames()
      .withTimeoutBetweenEvents(const Duration(seconds: 3))
      .listen(
        (name) => print(name),
        onError: (e, stackTrace) => print('Timed out'),
        onDone: () => completer.complete(),
        cancelOnError: false,
      );
  await completer.future;
}

Stream<String> getNames() async* {
  yield 'John';
  await Future.delayed(const Duration(seconds: 1));
  yield 'Jane';
  await Future.delayed(const Duration(seconds: 6));
  yield 'Doe';
}

extension<T> on Stream<T> {
  Stream<T> withTimeoutBetweenEvents(Duration duration) => transform(
    TimeoutBetweenEvents(
      duration: duration,
    ),
  );
}

class TimeoutBetweenEvents<E> extends StreamTransformerBase<E, E> {
  final Duration duration;

  TimeoutBetweenEvents({required this.duration});

  @override
  Stream<E> bind(Stream<E> stream) {
    StreamController<E>? controller;
    StreamSubscription<E>? subscription;
    Timer? timer;

    controller = StreamController<E>(
      onListen: () {
        subscription = stream.listen(
          (data) {
            timer?.cancel();
            timer = Timer.periodic(duration, (timer) {
              controller?.addError(
                TimeoutBetweenEventsException(
                  'Timeout',
                ),
              );
            });
            controller?.add(data);
          },
          onError: controller?.addError,
          onDone: controller?.close,
        );
      },
      onCancel: () {
        subscription?.cancel();
        timer?.cancel();
      },
    );
    return controller.stream;
  }
}

class TimeoutBetweenEventsException implements Exception {
  final String message;

  TimeoutBetweenEventsException(this.message);
}
