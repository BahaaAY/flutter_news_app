import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news_app/shared/cubit.dart';
import 'package:flutter_news_app/shared/states.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  Widget build( context) {
    return BlocProvider(
      create: ( context) => NewsCubit(),
      child: BlocConsumer<NewsCubit,NewsStates>(
        builder: ( context, state) {
          var cubit =  NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search))
              ],
              title: Text("News App"),
            ),
            body: cubit.screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.changeBottomNavBar(index);
              },
              items: cubit.bottomNavItems,
            ),
          );
        },
        listener: (BuildContext context, Object? state) {},
      ),
    );
  }
}
