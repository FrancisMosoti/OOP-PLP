import 'dart:io';

// Define an interface
abstract class Shape {
  double area();
}

// Define a class Rectangle that implements the Shape interface
class Rectangle implements Shape {
  double width;
  double height;

  Rectangle(this.width, this.height);

  @override
  double area() {
    return width * height;
  }
}

// Define a class Square that inherits from Rectangle and overrides the area method
class Square extends Rectangle {
  Square(double side) : super(side, side);

  @override
  double area() {
    return width * width;
  }
}

// Define a class to read data from a file and initialize objects
class ShapeReader {
  static List<Shape> readShapes(String filename) {
    List<Shape> shapes = [];
    File(filename).readAsLinesSync().forEach((line) {
      var shapeData = line.split(',');
      if (shapeData[0] == 'rectangle') {
        shapes.add(
            Rectangle(double.parse(shapeData[1]), double.parse(shapeData[2])));
      } else if (shapeData[0] == 'square') {
        shapes.add(Square(double.parse(shapeData[1])));
      }
    });
    return shapes;
  }
}

// Demonstrate the use of a loop
void main() {
  var shapes = ShapeReader.readShapes('shapes.txt');
  for (var shape in shapes) {
    print('Area of ${shape.runtimeType}: ${shape.area()}');
  }
}
