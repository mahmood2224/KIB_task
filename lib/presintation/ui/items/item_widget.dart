import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kib_task/app_consts/app_colors.dart';
import 'package:kib_task/data/models/item_model.dart';

class ItemWidget extends StatelessWidget {
  ItemModel? item ;
  Function onEdit ;
  Function onDelete ;

  ItemWidget(this.item, {Key? key ,required this.onDelete ,required this.onEdit}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 5)],
          borderRadius: BorderRadius.circular(12)),
      child: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                        color: AppColors.PRIMARY_COLOR,
                        borderRadius: BorderRadius.circular(12)),
                    child:  Center(
                      child: Text(
                        "#${item?.id??0}",
                        style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.WHITE),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  flex: 6,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item?.name??"",
                        style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        item?.desc??"",
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          PositionedDirectional(
            end: 0,
            top: 0,
            child: Container(
              width: 80,
              height: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                borderRadius: const BorderRadiusDirectional.only(topEnd: Radius.circular(12))
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  InkWell(
                      onTap: (){
                        onEdit();
                      },
                      child: const Icon(Icons.edit , color: AppColors.PRIMARY_COLOR , size: 20,)),
                  InkWell(
                      onTap: (){
                        onDelete();
                      },
                      child: const Icon(Icons.delete , color: Colors.red , size: 20,)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
