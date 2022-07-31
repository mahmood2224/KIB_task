import 'package:flutter/material.dart';
import 'package:kib_task/app_consts/app_colors.dart';
import 'package:kib_task/app_consts/app_helpers.dart';

import 'Loading.dart';


class CustomButton extends StatelessWidget {
  String? text ;
  Function onPressed ;
  double? width ;
  double? height ;
  double? textSize ;
  BoxDecoration? decoration;
  Color? textColor ;
  bool? loading ;
  Color? background ;
  Border? border ;
  Widget? icon ;
  double? borderRadius;
  BorderRadius? borderRadiusObject ;
  bool isSpaceBetween ;

  CustomButton({this.borderRadius,this.borderRadiusObject,this.textSize = 16,this.text, this.icon, this.background , this.border,required this.onPressed, this.width, this.height ,this.decoration ,this.textColor,this.loading =false , this.isSpaceBetween = false });

  @override
  Widget build(BuildContext context) {
    return (this.loading??false) ? Loading():InkWell(
      onTap: (){
        hideKeyboard(context);
          this.onPressed();
      },
      child: Container(
        width: width ??( getWidth(context) - 48 ),
        height: height ?? 50,
        padding: EdgeInsets.symmetric(horizontal: this.isSpaceBetween ? 16 : 0 ),
        decoration: decoration ?? BoxDecoration(
          color: this.background ?? AppColors.PRIMARY_COLOR,
          borderRadius:this.borderRadiusObject ??BorderRadius.circular(borderRadius ?? 12),
          border:  this.border
        ),
        child:Row(
          mainAxisAlignment: this.isSpaceBetween ? MainAxisAlignment.spaceBetween :MainAxisAlignment.center,
          children: [
            Text(text??"" , style: TextStyle(color: textColor??Colors.white , fontSize: this.textSize , fontWeight: FontWeight.bold),),
            this.icon!= null && (this.text?.isNotEmpty??false) ? SizedBox(width: 8,) : Container(),
            this.icon??Container(),
          ],
        )
      ),
    );
  }
}
