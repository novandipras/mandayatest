class AppErrorHandle {
  String authErrorMassages(String message) {
    String output = message.isNotEmpty ? message : 'Maaf, Terjadi Kesalahan';
    switch (message) {
      case 'user-not-found':
        output = 'User Belum Terdaftar';
        break;
      case 'email-already-in-use':
        output = 'Email Sudah Pernah Didaftarkan';
        break;
      case 'invalid-email':
        output = 'Masukan Email Dengan Benar';
        break;
      case 'wrong-password':
        output = 'Password Salah';
        break;
      case 'unknown':
        output = 'Terjadi Kesalahan, Periksa & Coba Kembali';
        break;
      default:
        output = output;
    }
    return output;
  }
}
