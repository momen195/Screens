import 'package:flutter/material.dart';
import 'package:untitled/layout/ToDO-App/cubit/cubit.dart';

void navigateTo(context,widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder:(context) => widget,
  ),
);

// ignore: non_constant_identifier_names
Widget MyDivider() => Container(
  height: 1.0,
  color: Colors.grey[300],
  width: double.infinity,
);

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  bool isPassword = false,
  final validate,
  final onChanged,
  final onSubmitted,
  final onTap,
  required String label,
  required IconData prefix,
  IconData? suffix,
  final suffixPressed,

}) => TextFormField(
  controller: controller,
  keyboardType: type,
  obscureText: isPassword,
  onChanged: onChanged,
  onTap: onTap,
  onFieldSubmitted: onSubmitted,
  decoration: InputDecoration(
    labelText: label,
    prefixIcon: Icon(prefix),
    suffixIcon: suffix!=null ? IconButton(
        onPressed: suffixPressed,
        icon: Icon(suffix),) : null,
    //border: InputBorder.none,
    border: OutlineInputBorder(),
  ),
  validator: validate,
);




Widget defaultButton ({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUppercases = true ,
  double radius = 0.0 ,
  double height = 40.0,
  required Function? function(),
  required String text ,
})
        => Container(
          height: height,
          decoration: BoxDecoration(
            color: background,
            borderRadius: BorderRadiusDirectional.circular(radius)
          ),
          width: width,
          child: MaterialButton(
          onPressed: function,
          child: Text(
          isUppercases ?text.toUpperCase():text,
          style: TextStyle(
          color: Colors.white,
          ),
        ),
      ),
    );


Widget BuildTaskItem(Map model, context) => Dismissible(
  key: Key(model['id'].toString()),
  child: Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        CircleAvatar(

          radius: 40.0,

          child: Text(

            '${model['Time']}',

            style: TextStyle(

              fontWeight: FontWeight.bold,

              fontSize: 16.0,

            ),

          ),

        ),

        SizedBox(

          width: 8.0,

        ),

        Expanded(

          child: Column(

            mainAxisSize: MainAxisSize.min,

            children: [

              Text(

                '${model['Title']}',

                style: TextStyle(

                  fontSize: 16.0,

                  fontWeight: FontWeight.bold,

                ),

              ),

              SizedBox(

                height: 4.0,

              ),

              Text(

                '${model['Date']}',

                style: TextStyle(

                    color: Colors.grey

                ),

              ),

            ],

          ),

        ),

        SizedBox(

          width: 8.0,

        ),

        IconButton(

            onPressed: (){

              AppCubit.get(context).UpdateData(status: 'done', id: model['id']);

            },

            icon: Icon(

              Icons.check_box_sharp,

              color: Colors.green,

            )),

        IconButton(

            onPressed: (){

              AppCubit.get(context).UpdateData(status: 'archive', id: model['id']);

            },

            icon: Icon(

              Icons.archive_outlined,

              color: Colors.black45,

            )),

      ],

    ),

  ),
  onDismissed: (direction) {
    AppCubit.get(context).DeleteData(id:model['id'],);
  },
);

Widget BuildNewsItem(articles,context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            image: DecorationImage(
              image: NetworkImage('${articles['urlToImage']}'),
              fit: BoxFit.cover,
            )

        ),
      ),
      const SizedBox(
        width: 8.0,
      ),
      Expanded(
        child: Container(
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '${articles['title']}',
                  maxLines: 2,
                  style: Theme.of(context).textTheme.bodyText1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                '${articles['publishedAt']}',
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
);

Widget BuildNews(list,context) => list.isNotEmpty ? ListView.separated(
physics: const BouncingScrollPhysics(),
itemBuilder: (context,index) => BuildNewsItem(list[index],context),
separatorBuilder: (context,index) => MyDivider(),
itemCount: 10) :Center(child: CircularProgressIndicator(),);