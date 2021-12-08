import 'package:flutter/material.dart';
import 'package:news/modules/contentScreen/content.dart';

Widget buildNews(articles, context) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>ContentScreen(articles['url'])));
      },
      child: Row(
        children: [
          Image(
            image: NetworkImage("${articles["urlToImage"]}"),
            width: 120,
            height: 120,
            fit: BoxFit.cover,
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 120,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Text(
                    "${articles["title"]}",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyText1,
                  )),
                  Text(
                    "${articles["publishedAt"]}",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Widget sharedTextFormField({
  BuildContext context,
  bool isPassword = false,
  @required TextEditingController controller,
  @required IconData prefixIcon,
  @required String text,
  @required Function validate,
  @required TextInputType type,
  Function tap,
  Function onchange,
  Function onTap,
  Color iconColor = Colors.blue,
  double radius = 0.0,
  IconData suffixIcon,
}) =>
    TextFormField(
      style: Theme.of(context).textTheme.bodyText1,
      validator: validate,
      onChanged: onchange,
      obscureText: isPassword,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          prefixIcon,
          color: iconColor,
        ),
        suffixIcon: InkWell(
          onTap: onTap,
          child: isPassword
              ? Icon(
                  Icons.visibility_off,
                  color: iconColor,
                )
              : Icon(
                  suffixIcon,
                  color: iconColor,
                ),
        ),
        labelText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      keyboardType: type,
      onTap: tap,
    );
