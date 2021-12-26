abstract class CounterStates {}

class CounterInitialState extends CounterStates {}

class CounterMinusState extends CounterStates
{
  late final int counter;

  CounterMinusState(this.counter);
}

class CounterPlusState extends CounterStates
{
  late final int counter;

  CounterPlusState(this.counter);
}