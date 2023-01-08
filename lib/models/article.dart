class article {
  String? codeArt;
  String? libArt;
  String? descrip;
  String? codeCat;
  String? prix1;
  String? imagepath;

  article(
      {this.codeArt,
      this.libArt,
      this.descrip,
      this.codeCat,
      this.prix1,
      this.imagepath});

  article.fromJson(Map<String, dynamic> json) {
    codeArt = json['CodeArt'];
    libArt = json['LibArt'];
    descrip = json['Descrip'];
    codeCat = json['CodeCat'];
    prix1 = json['prix1'];
    imagepath = json['imagepath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CodeArt'] = this.codeArt;
    data['LibArt'] = this.libArt;
    data['Descrip'] = this.descrip;
    data['CodeCat'] = this.codeCat;
    data['prix1'] = this.prix1;
    data['imagepath'] = this.imagepath;
    return data;
  }
}