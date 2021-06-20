class Lettre {
  final String lettre;
  final String exemples;
  final String son;
  final String image;
  final String francais;
  final String arabe;

  Lettre(
      {this.lettre,
      this.exemples,
      this.son,
      this.image,
      this.francais,
      this.arabe});

  factory Lettre.fromJson(Map<String, dynamic> json) {
    return Lettre(
      lettre: json['lettre'] as String,
      exemples: json['exemples'] as String,
      son: json['son'] as String,
      image: json['image'] as String,
      francais: json['francais'] as String,
      arabe: json['arabe'] as String,
    );
  }
}
