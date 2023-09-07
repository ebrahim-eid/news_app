
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/cubit.dart';

import '../models/class_model.dart';
import '../modules/web_view_screen/web_view_screen.dart';

Widget buildListItem(ArticlesModel model , context ) =>
    InkWell(
      onTap: (){
        NewsCubit.get(context).getWebView(model.url);
        Navigator.push(context,
            MaterialPageRoute(
                builder: (context)=>
                WebViewScreen())
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                      model.urlToImage
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child:  SizedBox(
                height: 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: Text(
                        model.title,
                        style:Theme.of(context).textTheme.bodyText1,
                        maxLines:4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      model.publishedAt,
                      style: const TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );

Widget separatedBuilder() => Padding(
  padding: const EdgeInsets.all(10.0),
  child:   Container(

    width: double.infinity,

    height: 1,

    color: Colors.grey[300],

  ),
);

Widget articleBuilder(list,context,) => ConditionalBuilder(
    condition: list.isNotEmpty,
    builder: (context) => ListView.separated(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) => buildListItem(list[index] , context),
      separatorBuilder: (context, index) => separatedBuilder(),
      itemCount: list.length,
    ),
    fallback: (context) =>  const Center(child: CircularProgressIndicator()));