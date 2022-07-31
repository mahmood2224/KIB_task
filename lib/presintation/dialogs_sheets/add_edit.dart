import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kib_task/app_consts/app_helpers.dart';
import 'package:kib_task/data/models/item_model.dart';
import 'package:kib_task/data_manager/cubit/home_page/home_cubit.dart';
import 'package:kib_task/presintation/components/custom_button.dart';
import 'package:kib_task/presintation/components/custom_text_field.dart';

class AddEditDialog extends StatefulWidget {
  ItemModel? editableModel ;
  Function onFinish ;
  AddEditDialog({this.editableModel , required this.onFinish});

  @override
  _AddEditDialogState createState() {
    return _AddEditDialogState();
  }
}

class _AddEditDialogState extends State<AddEditDialog> {

   bool _loading = false ;
  final TextEditingController _name =  TextEditingController();
  final TextEditingController _desc =  TextEditingController();

  String errorMsg ="" ;

  bool isEdit = false ;
  @override
  void initState() {
    super.initState();
    _prepareData();
  }

  _prepareData(){
    if(widget.editableModel != null ) {
      isEdit = true ;
      _name.text = widget.editableModel?.name ?? "";
      _desc.text = widget.editableModel?.desc ?? "";
    }
  }


  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
             Text(isEdit ? "Edit Item":"Add Item" ,style: TextStyle(fontSize: 18 , fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 16,
            ),
            CustomTextField(
              hint: "Name",
              labelColor: Colors.black,
              textType: TextInputType.number,
              controller: _name,

            ),
            const SizedBox(
              height: 8,
            ),
            CustomTextField(
              hint: "description",
              labelColor: Colors.black,
              textType: TextInputType.text,
              maxLines: 4,
              minLines: 4,
              controller: _desc,

            ),
            SizedBox(
              height: getHeight(context , ratio: 0.017),
            ),
            BlocProvider(
              create: (context) => HomeCubit(),
              child: BlocConsumer<HomeCubit ,HomeState>(
                listener: (context ,state){
                  if(state is AddLoading || state is EditLoading)
                    _loading = true ;
                  else
                    _loading = false ;

                  if(state is ButtonLoaded){
                    Navigator.pop(context);
                    widget.onFinish();
                  }

                  if(state is HomeValidationError){
                    errorMsg = state.validation.message! ;
                  }
                },
                builder: (context ,state){
                    return Column(
                      children: [
                        CustomButton(
                          textColor: Colors.white,
                          text: isEdit ? "Edit" :"Add",
                          onPressed: (){
                            var data =     ItemSendModel(
                                id: isEdit ? widget.editableModel?.id : null ,
                                name: _name.text,
                                desc: _desc.text
                            ) ;
                            if(isEdit)
                             BlocProvider.of<HomeCubit>(context).editData(data);
                            else
                              BlocProvider.of<HomeCubit>(context).addData(data);
                            },
                          loading: _loading,
                        ),
                        const SizedBox(height: 16,),
                        Text(errorMsg , style: const TextStyle(color: Colors.red , fontSize: 14 , fontWeight: FontWeight.bold) ,),

                      ],
                    );
                },
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}

showAddEdit(BuildContext context ,{ItemModel? editableData , required Function() onFinish}){
  ShowDialog(context: context ,radius: BorderRadius.circular(16) , child: AddEditDialog(onFinish: onFinish , editableModel: editableData,) , alignment: Alignment.center , margin: EdgeInsets.symmetric(horizontal: getWidth(context ,ratio: 0.2)));
}