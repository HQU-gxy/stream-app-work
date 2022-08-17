typedef VoidCallback = void Function();

class ControlObject {
  String picture;
  String name;
  VoidCallback onPressed = (){};

  ControlObject(this.picture, this.name);
}
