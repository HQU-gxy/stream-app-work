extension Popable on List<String> {
  String pop() {
    final val = first;
    removeAt(0);
    return val;
  }
}

bool numToBool(int n) {
  return n >= 1;
}

int boolToNum(bool b) => b ? 1 : 0;

// https://stackoverflow.com/questions/37798397/create-a-list-from-0-to-n
List<int> range(int a, {int? stop, int? step}) {
  int start;

  if (stop == null) {
    start = 0;
    stop = a;
  } else {
    start = a;
  }

  if (step == 0)
    throw Exception("Step cannot be 0");

  if (step == null) {
    start < stop
        ? step = 1    // walk forwards
        : step = -1;
  }  // walk backwards

  // return [] if step is in wrong direction
  return start < stop == step > 0
      ? List<int>.generate(((start-stop)/step).abs().ceil(), (int i) => start + (i * step!))
      : [];
}
