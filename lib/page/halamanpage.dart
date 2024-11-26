import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la20_bloc/bloc/appBloc.dart';
import 'package:la20_bloc/bloc/appEvent.dart';
import 'package:la20_bloc/bloc/appState.dart';

class HalamanPage extends StatefulWidget {
  const HalamanPage({super.key});

  @override
  State<HalamanPage> createState() => _HalamanPageState();
}

class _HalamanPageState extends State<HalamanPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //menggunakan blocbuilder untuk membangun widget yang bereaksi thd perubahan state dari appbloc
    return BlocBuilder<Appbloc, Appstate>(
      //callback ketika appbloc berubah
      builder: (context, state) {
        //nilai awal state
        if (state is InitialState) {
          return _HalamanPage(context, 0);
          //setelah nilai state diperbarui
        } else if (state is UpdateState) {
          // memanggil fungsi dengan nilai dari state.nilai terbaru
          return _HalamanPage(context, state.nilai);
        }
        return const Center(
          //menampilkan indikator pemuatan event
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Widget _HalamanPage(BuildContext context, int nilai) {
    return Scaffold(
      //appbar yaitu judul dari app(header)
      appBar: AppBar(
        title: const Text(
          "Halaman Increment",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20.0),
            //textfile untuk form memasukkan inputan angka
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Masukkan angka",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
            ),
            // menampilkan nilai di tengah layar dengan ukuran 36
            const SizedBox(height: 20.0),
            Text(
              nilai.toString(),
              style: const TextStyle(fontSize: 36.0),
            ),
            const SizedBox(height: 20.0),
            //tombol untuk proses penambahan nilai 
            ElevatedButton(
              onPressed: () {
                // Implement logic to handle button press and update state
                int inputValue = int.tryParse(_controller.text) ?? 0; //mengambil nilai dari textfield 
                context.read<Appbloc>().add(NumberIncrementEvent(inputValue)); //dikirim ke appbloc dengan nilai inputvalue
                _controller.clear(); //clear textfield jika nilai sudah di eksekusi
              },
              style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(80), // nilai untuk mengatur tingkat kebulatan
                ),
                backgroundColor: Colors.purpleAccent, 
              ),
              child: const Text('Tambah'),
            ),
          ],
        ),
      ),
    );
  }
}