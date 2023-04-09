class Konu {
  final String isim;
  Konu(this.isim,this.Basliklar);
  List<Baslik> Basliklar = [];
}

class Baslik {
  String konu;
  String video_link;
  Baslik(this.konu, this.video_link);
}
