import 'package:flutter/material.dart';

class CatCard extends StatelessWidget {
  const new({super.key, required this.name, required this.imagePath});
  final String? name;
  final String imagePath;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        width: 120,
        height: 50,
        child: Text(
          name!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
