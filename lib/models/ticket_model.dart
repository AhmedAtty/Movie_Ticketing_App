class TicketModel{
  String moviePoster ;
  String movieName ;
  List<dynamic> seats ;
  int totalPrice ;
  String timePacked;

//<editor-fold desc="Data Methods">

  TicketModel({
    required this.moviePoster,
    required this.movieName,
    required this.seats,
    required this.totalPrice,
    required this.timePacked,
  });


  Map<String, dynamic> toMap() {
    return {
      'moviePoster': this.moviePoster,
      'movieName': this.movieName,
      'seats': this.seats,
      'totalPrice': this.totalPrice,
      'timePacked': this.timePacked,
    };
  }

  factory TicketModel.fromMap(Map<String, dynamic> map) {
    return TicketModel(
      moviePoster: map['moviePoster'] as String,
      movieName: map['movieName'] as String,
      seats: map['seats'] as List<dynamic>,
      totalPrice: map['totalPrice'] as int,
      timePacked: map['timePacked'] as String,
    );
  }

//</editor-fold>
}