class Company {
  String logo;
  String address;
  String phone_number;
  String mail;
  String primary_color;
  String secondary_color;
  String text_color;

  Company.toJSON(Map json) {
    this.logo = json['logo'];
    this.address = json['address'];
    this.phone_number = json['phone_number'];
    this.mail = json['mail'];
    this.primary_color = json['primary_color'];
    this.secondary_color = json['secondary_color'];
    this.text_color = json['text_color'];
  }
}

/*
*    "logo":"https:\/\/coflow.com.tr\/assets\/img\/logo.png",
   "address":"Esentepe Mah. M\u00fc\u015fir Abdullah Sk. \u015ei\u015fli\/\u0130STANBUL",
   "phone_number":"+90 (850) 885 5829",
   "mail":"info@coflow.com.tr",
   "primary_color":"#EF8052",
   "secondary_color":"#E84C4E",
   "text_color":"#000000"
* */
