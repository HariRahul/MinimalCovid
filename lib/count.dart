class StatesDaily {
  String an;
  String ap;
  String ar;
  String as;
  String br;
  String ch;
  String ct;
  String date;
  String dd;
  String dl;
  String dn;
  String ga;
  String gj;
  String hp;
  String hr;
  String jh;
  String jk;
  String ka;
  String kl;
  String la;
  String ld;
  String mh;
  String ml;
  String mn;
  String mp;
  String mz;
  String nl;
  String or;
  String pb;
  String py;
  String rj;
  String sk;
  String status;
  String tg;
  String tn;
  String tr;
  String tt;
  String un;
  String up;
  String ut;
  String wb;

  StatesDaily({this.an,
    this.ap,
    this.ar,
    this.as,
    this.br,
    this.ch,
    this.ct,
    this.date,
    this.dd,
    this.dl,
    this.dn,
    this.ga,
    this.gj,
    this.hp,
    this.hr,
    this.jh,
    this.jk,
    this.ka,
    this.kl,
    this.la,
    this.ld,
    this.mh,
    this.ml,
    this.mn,
    this.mp,
    this.mz,
    this.nl,
    this.or,
    this.pb,
    this.py,
    this.rj,
    this.sk,
    this.status,
    this.tg,
    this.tn,
    this.tr,
    this.tt,
    this.un,
    this.up,
    this.ut,
    this.wb});

  factory StatesDaily.fromJson(Map<String, dynamic> json){
    return StatesDaily(
        an: json["an"],
        ap: json["ap"],
        as: json["as"],
        br: json["br"],
        ch: json["ch"],
        ct: json["ct"],
        date: json["date"],
        dd: json["dd"],
        dl: json["dl"],
        dn: json["dn"],
        ga: json["ga"],
        gj: json["gj"],
        hp: json["hp"],
        hr: json["hr"],
        jh: json["jh"],
        jk: json["jk"],
        ka: json["ka"],
        kl: json["kl"],
        la: json["la"],
        ld: json["ld"],
        mh: json["mh"],
        ml: json["ml"],
        mn: json["mn"],
        mp: json["mp"],
        mz: json["mz"],
        nl: json["nl"],
        or: json["or"],
        pb: json["pb"],
        py: json["py"],
        rj: json["rj"],
        sk: json["sk"],
        status: json["status"],
        tg: json["tg"],
        tn: json["tn"],
        tr: json["tr"],
        tt: json["tt"],
        un: json["un"],
        up: json["up"],
        ut: json["ut"],
        wb: json["wb"]
    );
  }
}

