class messagemodel{
  final String text ;
  final String uniqueid ;

  messagemodel(this.text, this.uniqueid);

  factory messagemodel.fromjson(jsondata){
      return messagemodel(jsondata["message"] , jsondata["id"]) ;
  }
}