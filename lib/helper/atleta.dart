class Atleta {
  // Atributos obrigatórios
  final String nome;
  final String email;
  final String tipoUsuario;

  final String? dtnNascimento;
  final String? naturalidade;
  final String? nacionalidade;
  final int? RG;
  final int? CPF;
  final String? sexo;
  final String? rua;
  final String? bairro;
  final int? numero;
  final int? cep;
  final int? telefonePessoal;
  final int? telefoneEmergencial;
  final List<String>? estilos;
  final List<String>? provas;
  final bool alergiaMedicamentos;
  final List<String>? telefonesOpcionais;
  // Atributos opcionais
  final String? nomeMae;
  final String? nomePai;
  final String? clubeOrigem;
  final String? localTrabalho;
  final String? convenioMedico;
  final List<String>? medicamentos;

  String senha = 'unasplash2023';

  Atleta(
    this.nome,
    this.email,
    this.tipoUsuario, {
    this.dtnNascimento,
    this.naturalidade,
    this.nacionalidade,
    this.RG,
    this.CPF,
    this.sexo,
    this.rua,
    this.bairro,
    this.numero,
    this.cep,
    this.telefonePessoal,
    this.telefoneEmergencial,
    this.alergiaMedicamentos = false,
    this.telefonesOpcionais,
    this.nomeMae,
    this.nomePai,
    this.clubeOrigem,
    this.localTrabalho,
    this.convenioMedico,
    this.medicamentos,
    this.estilos,
    this.provas,
  });
}
