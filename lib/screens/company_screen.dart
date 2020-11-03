import 'package:flutter/material.dart';
import 'package:test_app/models/Company.dart';
import 'package:test_app/services/company_api.dart';
import 'package:test_app/widgets/constants.dart';

class CompanyScreen extends StatefulWidget {
  @override
  _CompanyScreenState createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  Company _company;

  // states
  bool _buildBodyState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCompanyInfo();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _buildBodyState == true ? _buildBody() : Container(),
    );
  }

  void _getCompanyInfo() {
    CompanyApi.getCompanyInfo().then((company) {
      Company companyObject = company;
      //print('Şirket adresi ' + companyObject.address);
      setState(() {
        this._company = company;
        _buildBodyState = true;
      });
    });
  }

  Widget _buildBody() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 80.0,
            backgroundColor: Colors.white,
            //backgroundImage: NetworkImage("${_company.logo}"),
            child: ClipOval(
              child: Image.network(
                '${_company.logo}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Text(
          'Coflow Teknoloji A.Ş.',
        ),
        Text(
          'AÇIKLAMA',
        ),
        SizedBox(
          height: 20.0,
          width: 150.0,
          child: Divider(
            color: Colors.teal.shade100,
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.add_location,
              color: kCompanyIconColor,
            ),
            title: Text(
              '${_company.address}',
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.phone,
              color: kCompanyIconColor,
            ),
            title: Text(
              '${_company.phone_number}',
            ),
          ),
        ),
        Card(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
          child: ListTile(
            leading: Icon(
              Icons.email,
              color: kCompanyIconColor,
            ),
            title: Text(
              '${_company.mail}',
            ),
          ),
        ),
      ],
    );
  }
}
