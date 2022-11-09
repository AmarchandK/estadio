class BookedResponse {
  BookedResponse({
    required this.status,
    required this.data,
  });

  bool status;
  List<Datas> data;

  factory BookedResponse.fromJson(Map<String, dynamic> json) => BookedResponse(
        status: json["status"],
        data: List<Datas>.from(json["data"].map((x) => Datas.fromJson(x))),
      );
}

class Datas {
  Datas({
    required this.id,
    required this.bookingDate,
    required this.turfId,
    required this.timeSlot,
  });

  String id;
  String bookingDate;
  String turfId;
  List<int> timeSlot;

  factory Datas.fromJson(Map<String, dynamic> json) => Datas(
        id: json["_id"],
        bookingDate: json["booking_date"],
        turfId: json["turf_id"],
        timeSlot: List<int>.from(json["time_slot"].map((x) => x)),
      );
}
