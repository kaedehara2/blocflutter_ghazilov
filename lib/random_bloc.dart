import 'dart:async';
import 'dart:math';

class RandomNumberBloc {
  // Controller untuk memicu event generate random number
  final _generateRandomController = StreamController<void>();

  // Controller untuk mengirimkan angka random ke UI
  final _randomNumberController = StreamController<int>();

  // Sink untuk menerima trigger dari UI
  Sink<void> get generateRandom => _generateRandomController.sink;

  // Stream untuk mengirimkan angka ke StreamBuilder
  Stream<int> get randomNumber => _randomNumberController.stream;

  RandomNumberBloc() {
    _generateRandomController.stream.listen((_) {
      final random = Random().nextInt(10);
      _randomNumberController.sink.add(random);
    });
  }

  void dispose() {
    _generateRandomController.close();
    _randomNumberController.close();
  }
}
