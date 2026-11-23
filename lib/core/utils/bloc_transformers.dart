import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_transform/stream_transform.dart';

/// Debounce + restartable, for events where only the latest input matters
/// (live search, live analysis).
///
/// * **Debounce:** an event is handled only after no other event arrived for
///   [duration]. Events in between are dropped; only the last one is kept.
/// * **Restartable:** if the handler of the previous event is still running
///   when the next one gets through, the old handler is cancelled and its
///   `emit` stops working.
EventTransformer<E> debounceRestartable<E>(Duration duration) {
  return (events, mapper) =>
      restartable<E>().call(events.debounce(duration), mapper);
}
