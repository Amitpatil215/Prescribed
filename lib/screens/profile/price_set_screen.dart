import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_svg/svg.dart';
import '../../widgets/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceSetScreen extends StatelessWidget {
  static const routeName = 'price-set';
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    bool _showFloating = MediaQuery.of(context).viewInsets.bottom == 0.0;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: appBarColor,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              const Text(
                "Set Appointment Prices",
                style: TextStyle(fontSize: 25),
              ),
              const SizedBox(height: 7),
              Center(
                child: Container(
                    height: 200,
                    width: 250,
                    child: SvgPicture.asset(
                      "assets/images/price.svg",
                      fit: BoxFit.fill,
                    )),
              ),
              Container(
                padding: const EdgeInsets.all(18),
                child: const Text(
                  "Choose price between ₹ 200 to ₹ 800 multiple of 5",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black),
                ),
              ),
              PriceWidget(),
              SizedBox(height: 7),
              Container(
                padding: const EdgeInsets.all(18),
                child: Text(
                  "Choose price between ₹ 200 to ₹ 800 multiple of 5\nThere is no cap for on site clinic booking.",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                //  initialValue: "userData.name",
                                decoration: InputDecoration(
                                  hintText: "250",
                                  labelText: "Tele Consultation Price",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please provide your name";
                                  }
                                },
                                onSaved: (value) {
                                  //  userData.name = value;
                                },
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Row(
                          children: [
                            Icon(
                              FlutterIcons.hospital_alt_faw5s,
                              size: 30,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextFormField(
                                //  initialValue: "userData.name",
                                decoration: InputDecoration(
                                  hintText: "300",
                                  labelText: "Clinic Consultation Price",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                ),
                                validator: (value) {
                                  if (value.isNotEmpty) {
                                    return null;
                                  } else {
                                    return "Please provide your name";
                                  }
                                },
                                onSaved: (value) {
                                  //  userData.name = value;
                                },
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
            ],
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: _showFloating
          ? FloatingActionButton.extended(
              label: Row(
                children: [
                  Text(
                    "Save",
                    style: TextStyle(color: Colors.black),
                  ),
                ],
              ),
              isExtended: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              onPressed: () {},
            )
          : null,
    );
  }
}

class PriceWidget extends StatefulWidget {
  const PriceWidget({
    Key key,
  }) : super(key: key);

  @override
  _PriceWidgetState createState() => _PriceWidgetState();
}

class _PriceWidgetState extends State<PriceWidget> {
  var _isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350.w,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.grey, width: 0.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Price Guide",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              IconButton(
                  padding: EdgeInsets.all(0),
                  icon:
                      Icon(_isExpanded ? Icons.expand_less : Icons.expand_more),
                  onPressed: () {
                    setState(() {
                      _isExpanded = !_isExpanded;
                    });
                  })
            ],
          ),
          _isExpanded
              ? const Text(
                  "All your documents are verified manually If your identity verification attempt was unsuccessful, it simply means that the information you provided did not match the authoritative sources we use for verification. Unsuccessful verification attempts may be due to many reasons. ",
                  overflow: TextOverflow.ellipsis,
                  maxLines: 10,
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
