class Appstate {}

class InitialState extends Appstate {}

class UpdateState extends Appstate {
  final int nilai;
  UpdateState(this.nilai);
}