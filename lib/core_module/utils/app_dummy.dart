import 'app_enum.dart';

class AppDummy {
  static List<Map<String, dynamic>> defaultPaket = [
    {
      'id_paket': 'pkt1',
      'nama_paket': 'Kiloan Cuci Setrika',
      'satuan': Satuan.kg.name,
      'harga': {
        'nominal': 7000,
        'waktu_harga_dibuat': DateTime.now().toString(),
      },
      'waktu_paket_dibuat': DateTime.now().toString(),
      'waktu_paket_dihapus': null,
      'waktu_paket_terakhir_diubah': DateTime.now().toString(),
      'daftar_history_harga': [
        {
          'nominal': 7000,
          'waktu_harga_dibuat': DateTime.now().toString(),
        },
      ],
      'dihapus': false,
      'catatan': 'Pengerjaan Kurang Lebih 2-3 hari',
      'pembayaran_dibulatkan': false,
    },
  ];
  static List<Map<String, dynamic>> defaultParfum = [
    {
      'id_parfum': 'pf1',
      'nama_parfum': 'sakura',
      'karakter': 'manis',
      'dihapus': false,
    },
    {
      'id_parfum': 'pf2',
      'nama_parfum': 'snappy',
      'karakter': 'bunga',
      'dihapus': false,
    },
    {
      'id_parfum': 'pf3',
      'nama_parfum': 'akasia',
      'karakter': 'woody',
      'dihapus': false,
    },
  ];
}
