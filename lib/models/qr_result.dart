
import 'package:block_demo_dharmesh/models/qr_code_data.dart';

class QrResultData {
  String? roomName;
  String? issueDateTime;
  String? activationDateTime;
  String? expirationDateTime;
  String? numberOfCard;
  QrCodeData? qrCodeData;

  QrResultData({
    this.roomName,
    this.issueDateTime,
    this.activationDateTime,
    this.expirationDateTime,
    this.numberOfCard,
    this.qrCodeData,
  });

  Map<String, dynamic> toJson() {
    return {
      'room_name': roomName,
      'issue_date_time': issueDateTime,
      "activation_date_time": activationDateTime,
      "expiration_date_time": expirationDateTime,
      "number_of_cards": numberOfCard,
      "qrCodeData": qrCodeData
    };
  }

  factory QrResultData.fromJson(Map<String, dynamic> json) {
    return QrResultData(
      roomName: json['room_name'],
      issueDateTime: json['issue_date_time'],
      activationDateTime: json['activation_date_time'],
      expirationDateTime: json['expiration_date_time'],
      numberOfCard: json['number_of_cards'],
      qrCodeData: QrCodeData.fromJson(json['qrCodeData']), // Parse qrCodeData
    );
  }
}
