import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DKMAddress extends StatefulWidget {
  @override
  _DKMAddressState createState() => _DKMAddressState();
}

class _DKMAddressState extends State<DKMAddress> {
  var _isShowMap = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20),
      decoration: BoxDecoration(
        // color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                FlutterIcons.location_city_mdi,
                size: 30,
              ),
              SizedBox(width: 5),
              Container(
                width: 150,
                child: Text(
                  "21 Nirmla Appartments Heights Kothrud, Pune-413225 working there",
                  overflow: TextOverflow.clip,
                  maxLines: 4,
                ),
              ),
              Spacer(),
              OutlineButton.icon(
                label: Text(_isShowMap ? "Hide Map" : "Show Map"),
                icon: Icon(FlutterIcons.location_ent),
                onPressed: () {
                  setState(() {
                    _isShowMap = !_isShowMap;
                  });
                },
              )
            ],
          ),
          _isShowMap
              ? Container(
                  margin: EdgeInsets.only(top: 10),
                  height: 300.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child:
                      Center(child: Text("Location snapshot will apear here")),
                )
              : Container()
        ],
      ),
    );
  }
}
