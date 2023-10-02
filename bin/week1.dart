

import 'dart:io';

class Pengeluaran {
  double jumlah;
  String kategori;
  String catatan;
  DateTime tanggal;

  Pengeluaran(this.jumlah, this.kategori, this.tanggal, this.catatan);
}

void main() {
  final List<Pengeluaran> riwayatPengeluaran = [];
  final DateTime sebulanLalu = DateTime.now().subtract(Duration(days: 30));

  while (true) {
    print(
        "\nMasukkan tindakan (1: Catat Pengeluaran, 2: Tampilkan Riwayat, 3: Total Sebulan, 0: Keluar): ");
    final tindakan = int.tryParse(stdin.readLineSync()!);

    switch (tindakan) {
      case 0:
        return;
      case 1:
        print("\nMasukkan jumlah pengeluaran: ");
        final inputJumlah = double.tryParse(stdin.readLineSync()!);

        if (inputJumlah == null) {
          print("Masukkan jumlah yang valid.");
          continue;
        }

        print("Masukkan kategori pengeluaran: ");
        final inputKategori = stdin.readLineSync()!;

        print("Masukkan catatan (opsional): ");
        final inputCatatan = stdin.readLineSync() ?? '';

        final tanggalPengeluaran = DateTime.now();
        final pengeluaran = Pengeluaran(
            inputJumlah, inputKategori, tanggalPengeluaran, inputCatatan);

        riwayatPengeluaran.add(pengeluaran);
        print("Pengeluaran berhasil dicatat.");
        break;
      case 2:
        print("\nRiwayat Pengeluaran:");
        if (riwayatPengeluaran.isEmpty) {
          print("Tidak ada riwayat pengeluaran.");
        } else {
          for (var pengeluaran in riwayatPengeluaran) {
            print(
                "Jumlah: ${pengeluaran.jumlah}, Kategori: ${pengeluaran.kategori}, "
                "Tanggal: ${pengeluaran.tanggal.toLocal()}, Catatan: ${pengeluaran.catatan}");
          }
        }
        break;
      case 3:
        final totalPengeluaranSebulanTerakhir = riwayatPengeluaran
            .where((pengeluaran) => pengeluaran.tanggal.isAfter(sebulanLalu))
            .map<double>((pengeluaran) => pengeluaran.jumlah);

        print(
            "\nTotal Pengeluaran dalam Sebulan Terakhir: $totalPengeluaranSebulanTerakhir");
        break;
      default:
        print("Tindakan tidak valid.");
        break;
    }
  }
}
