class Appevent {}

class NumberIncrementEvent extends Appevent {
  final int value;
  NumberIncrementEvent(this.value);  
}
