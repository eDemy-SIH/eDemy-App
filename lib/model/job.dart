
class CareerData {
  String careerId;
  String img1;
  String alt1;
  String title;
  String catDir;
  String cat;
  String duration;
  String p1_1;
  String p1_2;
  String desc;
  List<String> skills;
  List<String> educ;
  List<String> oppL;
  List<String> oppR;
  List<Map<String, String>> insti;
  List<String> pros;
  List<String> cons;

  CareerData({
    required this.careerId,
    required this.img1,
    required this.alt1,
    required this.title,
    required this.catDir,
    required this.cat,
    required this.duration,
    required this.p1_1,
    required this.p1_2,
    required this.desc,
    required this.skills,
    required this.educ,
    required this.oppL,
    required this.oppR,
    required this.insti,
    required this.pros,
    required this.cons,
  });

  factory CareerData.fromJson(Map<String, dynamic> json) {
    return CareerData(
      careerId: json['careerid'],
      img1: json['img1'],
      alt1: json['alt1'],
      title: json['title'],
      catDir: json['cat_dir'],
      cat: json['cat'],
      duration: json['duration'],
      p1_1: json['p1_1'],
      p1_2: json['p1_2'],
      desc: json['desc'],
      skills: List<String>.from(json['skills']),
      educ: List<String>.from(json['educ']),
      oppL: List<String>.from(json['opp_l']),
      oppR: List<String>.from(json['opp_r']),
      insti: List<Map<String, String>>.from(json['insti']),
      pros: List<String>.from(json['pros']),
      cons: List<String>.from(json['cons']),
    );
  }
}


