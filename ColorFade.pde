class ColorFade {
  color c1, c2, c;
  int start, duration;
  ColorFade(color _c1, color _c2, int _start, int _duration){
    c = _c1;
    c1 = _c1;
    c2 = _c2;
    start = _start;
    duration = _duration;
  }
  void set(color _c2){
    set(c, _c2, millis(), duration);
  }
  void set(color _c2, int _duration){
    set(c, _c2, millis(), _duration);
  }
  void set(color _c2, int _start, int _duration){
    set(c, _c2, _start, _duration);
  }
  void set(color _c1, color _c2, int _start, int _duration){
    c1 = _c1;
    c2 = _c2;
    start = _start;
    duration = _duration;
  }
  void update(){
    println(c1, c2, map(millis(), start, start+duration, 0.0, 1.0));
    c = lerpColor( c1, c2, map(millis(), start, start+duration, 0.0, 1.0));
  }
  color c(){
    this.update();
    return c;
  }
  String text(){
    String[] str = {
      str((int)red(fc.c)),
      str((int)green(fc.c)),
      str((int)blue(fc.c))
    };
    return join(str, ',');
  }
}
