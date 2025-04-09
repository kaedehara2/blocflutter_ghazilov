import 'package:flutter/material.dart';
import 'random_bloc.dart';

class RandomScreen extends StatefulWidget {
  const RandomScreen({super.key});

  @override
  State<RandomScreen> createState() => _RandomScreenState();
}

class _RandomScreenState extends State<RandomScreen> {
  late RandomNumberBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = RandomNumberBloc(); // Inisialisasi bloc saat widget dibuat
  }

  @override
  void dispose() {
    _bloc.dispose(); // Tutup stream saat widget dihancurkan
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random BLoC #Ghazilov'),
      ),
      body: Center(
        child: StreamBuilder<int>(
          stream: _bloc.randomNumber, // Dengarkan stream angka acak
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(
                snapshot.data.toString(),
                style: const TextStyle(fontSize: 80),
              );
            } else {
              return const Text(
                '-',
                style: TextStyle(fontSize: 80, color: Colors.grey),
              );
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _bloc.generateRandom.add(null); // Kirim sinyal untuk generate angka baru
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
