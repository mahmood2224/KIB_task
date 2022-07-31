import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kib_task/app_consts/Messages.dart';
import 'package:kib_task/app_consts/app_helpers.dart';
import 'package:kib_task/data_manager/cubit/home_page/home_cubit.dart';
import 'package:kib_task/presintation/components/Loading.dart';
import 'package:kib_task/presintation/dialogs_sheets/add_edit.dart';
import 'package:kib_task/presintation/ui/items/item_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  BuildContext? _context   ;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (BuildContext context) => HomeCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Home Page",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showAddEdit(context, onFinish: () {
              BlocProvider.of<HomeCubit>(_context!).getData();
            });
          },
          child: const Icon(
            CupertinoIcons.plus,
            color: Colors.white,
            size: 30,
          ),
        ),
        body: BlocConsumer<HomeCubit, HomeState>(
          listener: (BuildContext context, state) {
            if (state is HomeValidationError) {
              showAlertMessage(context,
                  message: state.validation.message ?? "",
                  backgroundColor: Colors.red);
            }

            if(state is ButtonLoaded){
              BlocProvider.of<HomeCubit>(context).getData();
            }
          },
          builder: (context, state) {
            print(state);
            _context = context ;

            if (state is HomeLoading) {
              return Loading();
            }

            if (state is HomeEmpty || state is HomeInit) {
              return const Center(
                child: Text(
                  "There is no data",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              );
            }

            return SizedBox(
              height: getHeight(context),
              width: getWidth(context),
              child: ListView.builder(
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  return ItemWidget(
                    state.items[index],
                    onEdit: () {
                      showAddEdit(context, onFinish: () {
                        BlocProvider.of<HomeCubit>(context).getData();
                      }, editableData: state.items[index]);
                    },
                    onDelete: () {
                      BlocProvider.of<HomeCubit>(context)
                          .deleteData(state.items[index].id!);
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
