import 'package:flutter/material.dart';
import '../../app_consts/app_colors.dart';

class Loading extends StatelessWidget {
  double height ;
  double width ;
  bool isBackground ;


  Loading({this.height = 50, this.width = 50 , this.isBackground = true });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: this.height,
        height: this.width,
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: this.isBackground ? AppColors.PRIMARY_COLOR : Colors.transparent,
          shape: BoxShape.circle
        ),
        child: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>( this.isBackground ?Colors.white :AppColors.PRIMARY_COLOR ),
        ),
      ),
    );
  }
}
