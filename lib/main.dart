import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:testtask/ColorModel.dart';

main() {
  runApp(ColorApp());
}

class ColorApp extends StatelessWidget {
  final Widget child;

  ColorApp({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorMainScreen(),
    );
  }
}

class ColorMainScreen extends StatelessWidget {
  final Color color;
  ColorMainScreen({this.color});

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ColorModel>(
      model: ColorModel(),
      child: ScopedModelDescendant(
          builder: (ctx, ch, ColorModel model) =>
              new ColorMainWidget(color: model.color)),
    );
  }
}

class ColorMainWidget extends StatelessWidget {
  final Color color;
  const ColorMainWidget({@required this.color});

  changeColor(context) {
    ScopedModel.of<ColorModel>(context, rebuildOnChange: true).randomColor();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        changeColor(context);
      },
      child: Container(
        color: this.color,
        child: Text(''),
      ),
    );
  }
}
