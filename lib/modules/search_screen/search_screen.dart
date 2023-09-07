import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../components/components.dart';
import '../../cubit/cubit.dart';
import '../../cubit/states.dart';

class SearchScreen extends StatelessWidget {
  var searchController =TextEditingController();

  SearchScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit ,NewsStates>(
      listener: (context , state){},
      builder: (context , state) {
        var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextFormField(
                  controller: searchController,
                  onChanged: (value)
                  {
                    NewsCubit.get(context).getSearch(keyWord: value);
                  },

                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Search must not be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    labelText: "Search",
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.search,
                    ),
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Expanded(child: articleBuilder(list, context )),
            ],
          ),
        );
      },
    );
  }
}
