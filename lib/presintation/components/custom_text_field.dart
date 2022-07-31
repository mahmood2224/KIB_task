import 'package:flutter/material.dart';
import 'package:kib_task/app_consts/app_helpers.dart';



class CustomTextField extends StatefulWidget {

  TextEditingController controller;
  String? hint;
  double? width;
  double? height;
  bool required;
  bool obscure;
  String? label;
  IconData? suffixIcon;
  Widget? suffixIconWidget;
  IconData? prefixIcon;
  Widget? prefixIconWidget;
  Color? labelColor;
  TextInputType? textType;
  Function? onChange;
  Function? iconPressed;
  Function? onPressed;
  bool enabled;
  TextAlign? align;
  FocusNode? focusNode;
  int? maxLines;
  int? minLines;
  CustomTextField(
      {required this.controller,
        this.hint = "",
        this.width,
        this.height,
        this.obscure = false,
        this.label,
        this.suffixIcon,
        this.suffixIconWidget,
        this.enabled = true,
        this.labelColor,
        this.textType,
        this.onPressed,
        this.align,
        this.required = true,
        this.prefixIcon,
        this.prefixIconWidget,
        this.focusNode,
        this.maxLines,
        this.minLines,
        this.iconPressed,
        this.onChange});
  @override
  _CustomTextFieldState createState() {
    return _CustomTextFieldState();
  }
}

class _CustomTextFieldState extends State<CustomTextField> {
  String validationMessage = "This_field_is_required" ;
  bool isChanged = false ;
  @override
  void initState() {
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ()=>{
        if(widget.onPressed != null ) widget.onPressed!()
      },
      child: Container(
        height: widget.height,
        width: widget.width ?? (getWidth(context) - 48),

        child: Center(
          child: TextField(
            minLines: widget.minLines ?? 1,
            maxLines: widget.maxLines ?? 1,
            enabled: widget.enabled,
            keyboardType: widget.textType ?? TextInputType.text,
            controller: widget.controller,
            focusNode: widget.focusNode,

            onChanged: (txt){
              print(this.isChanged);
              this.isChanged =true ;
              setState((){});
              if(widget.onChange != null ) widget.onChange!(txt);
            },
            obscureText: widget.obscure,
            textAlign: widget.align ?? TextAlign.start,
            decoration: InputDecoration(
              hintText: widget.hint ?? "",
              labelText: widget.label,
              errorText: (widget.required) && (widget.controller.text.isEmpty) && this.isChanged ? validationMessage : null ,
              labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
              contentPadding: EdgeInsets.only(top: 6, right: 16, left: 16),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26),
                borderRadius: BorderRadius.circular(12)
              ),
              filled: true,
              fillColor: Colors.white,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black26), borderRadius: BorderRadius.circular(12)

              ),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26), borderRadius: BorderRadius.circular(12)
              ),
              focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26), borderRadius: BorderRadius.circular(12)
              ),
              disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26), borderRadius: BorderRadius.circular(12)
              ),
              errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black26), borderRadius: BorderRadius.circular(12)

              ),
              suffixIcon: widget.suffixIconWidget == null
                  ? (widget.suffixIcon == null
                  ? null
                  : InkWell(
                  onTap:  () {
                    if(widget.iconPressed != null )widget.iconPressed!();
                  },
                  child: Icon(
                    widget.suffixIcon,
                    size: 18,
                    color: Colors.grey,
                  )))
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.suffixIconWidget??Container(),
                ],
              ),
              prefixIcon: widget.prefixIconWidget == null
                  ? (widget.prefixIcon == null
                  ? null
                  : Icon(
                widget.prefixIcon,
                size: 18,
                color: Colors.grey,
              ))
                  : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  widget.prefixIconWidget??Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
