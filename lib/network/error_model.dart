
class ErrorModel {
  final int statusCode;
  final bool success;
  final String statusMessage;

  ErrorModel(
      {required this.statusCode,
      required this.success,
      required this.statusMessage
      });

 factory ErrorModel.fromJson(Map<String,dynamic>json){
   return ErrorModel(
       statusCode: json['status_code'],
       success: json['success'],
       statusMessage: json['status_message']
   );
 }

}
