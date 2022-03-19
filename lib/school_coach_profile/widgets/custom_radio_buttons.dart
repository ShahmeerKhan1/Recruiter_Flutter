import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recruiter_flutter/util/colors.dart';

class Gender {
  String name;
  String icon;
  bool isSelected;

  Gender(this.name, this.icon, this.isSelected);
}

class CustomRadio extends StatelessWidget {
  Gender _gender;

  CustomRadio(this._gender);

  genderWidget() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 150,
          width: 200,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color:
                  _gender.isSelected ? AppColor.goldenColor : AppColor.bgColor,
              border: Border.all(color: AppColor.greyBorderColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(
                      12.0) //                 <--- border radius here
                  )),
          // margin: new EdgeInsets.all(5.0),
          padding:
              EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0, top: 26.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                height: 50,
                width: 50,
                //  size: 40,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Text(
                  _gender.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: _gender.isSelected ? Colors.white : Colors.grey),
                ),
              )
            ],
          ),
        ),
        _gender.isSelected
            ? Positioned(
                top: 15,
                left: 15,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: new BoxDecoration(
                    color: AppColor.greenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 12),
                ),
              )
            : Container(),
      ],
    );
  }

  typeWidget() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          height: 185,
          width: 200,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color:
                  _gender.isSelected ? AppColor.goldenColor : AppColor.bgColor,
              border: Border.all(color: AppColor.greyBorderColor, width: 2),
              borderRadius: BorderRadius.all(Radius.circular(
                      12.0) //                 <--- border radius here
                  )),
          margin: new EdgeInsets.all(5.0),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                _gender.icon,
                color: _gender.isSelected ? Colors.white : Colors.grey,
                height: 60,
                width: 60,
                //  size: 40,
              ),
              SizedBox(height: 16),
              Expanded(
                child: Text(
                  _gender.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18.0,
                      color: _gender.isSelected ? Colors.white : Colors.grey),
                ),
              )
            ],
          ),
        ),
        _gender.isSelected
            ? Positioned(
                top: 15,
                left: 15,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: new BoxDecoration(
                    color: AppColor.greenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 12),
                ),
              )
            : Container(),
      ],
    );
  }

  atheticWidget() {
    return Stack(
      overflow: Overflow.visible,
      children: [
        Container(
          //    height: 125,
          //     width: 135,
          alignment: Alignment.topCenter,
          // decoration: BoxDecoration(
          //         color: _gender.isSelected ? AppColor.goldenColor : AppColor.bgColor,
          //         border: Border.all(color: AppColor.greyBorderColor, width: 1),
          //         borderRadius: BorderRadius.all(
          //             Radius.circular(14.0) //                 <--- border radius here
          //         )
          //     ),
          child: Image.asset(_gender.icon,
              fit: BoxFit.fill, width: 135, height: 125),
        ),
        Positioned(
            bottom: 32,
            left: 32,
            child: Text(_gender.name,
                style: TextStyle(color: Colors.white, fontSize: 16.0))),
        _gender.isSelected
            ? Positioned(
                top: 15,
                left: 30,
                child: Container(
                  width: 20.0,
                  height: 20.0,
                  decoration: new BoxDecoration(
                    color: AppColor.greenColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.check, color: Colors.white, size: 12),
                ),
              )
            : Container(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return typeWidget();
  }
}
