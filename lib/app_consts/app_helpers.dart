import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

NavigateTo(BuildContext context, Widget page,
    {bool removeAll = false, Function? onResult}) async {
  if (removeAll) {
    var result = await Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => page), (route) => false);
    if (onResult != null) onResult(result);
  } else {
    await Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => page));
    if (onResult != null) onResult();
  }
}

double getWidth(BuildContext context ,{double? ratio}) {
  return MediaQuery.of(context).size.width * (ratio??1.0);
}

double getHeight(BuildContext context , {double? ratio}) {
  return MediaQuery.of(context).size.height * (ratio??1.0);
}

hideKeyboard(BuildContext context) {
  FocusScopeNode scope = FocusScope.of(context);
  if (!scope.hasPrimaryFocus) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}

ShowDialog(
    {required BuildContext context,
      Widget? child,
      double opacity = 0.5,
      double? height,
      EdgeInsets? margin,
      bool dismiss = true ,
      BorderRadius? radius,
      Alignment? alignment}) {
  showGeneralDialog(
    barrierLabel: "Label",
    barrierDismissible: dismiss,
    barrierColor: Colors.black.withOpacity(opacity),
    transitionDuration: Duration(milliseconds: 100),
    context: context,
    pageBuilder: (context, anim1, anim2) {
      return child!;
    },
    transitionBuilder: (context, anim1, anim2, child) {
      return FadeTransition(
        opacity: Tween<double>(begin: 0.0, end: 1.0).animate(anim1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: height,
              color: Colors.transparent,
              margin: margin ?? EdgeInsets.only(bottom: 16, left: 12, right: 12),
              child: Material(
                color: Colors.transparent,
                borderRadius: radius ?? BorderRadius.circular(0),
                child: ClipRRect(
                    borderRadius: radius ?? BorderRadius.circular(0),
                    child: child),
              ),
            ),
          ],
        ),
      );
    },
  );
}
