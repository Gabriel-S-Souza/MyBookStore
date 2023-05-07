class Failure implements Exception {
  final String message;

  Failure(this.message);

  @override
  String toString() => 'Failure: $message';
}

class ServerFailure extends Failure {
  ServerFailure([super.message = 'Erro na comunicação com o servidor']);
}

class BadRequestFailure extends Failure {
  BadRequestFailure([super.message = 'Requisição inválida']);
}

class NotFoundFailure extends Failure {
  NotFoundFailure([super.message = 'Não encontrado']);
}

class UnauthorizedFailure extends Failure {
  UnauthorizedFailure([super.message = 'Não autorizado']);
}

class OfflineFailure extends Failure {
  OfflineFailure([super.message = 'Sem conexão com a internet']);
}

class UnmappedFailure extends Failure {
  UnmappedFailure([super.message = 'Ops, algo deu errado']);

  @override
  String toString() => 'Ops, algo deu errado: $message. [UnmappedFailure]';
}
