abstract class Failure {
  final String message;
  const Failure(this.message);
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class UnauthorizedFailure extends Failure {
  const UnauthorizedFailure() : super('Sesi habis, silakan login ulang');
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('Tidak ada koneksi internet');
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('Koneksi timeout, coba lagi');
}

class CacheFailure extends Failure {
  const CacheFailure() : super('Gagal memuat data lokal');
}