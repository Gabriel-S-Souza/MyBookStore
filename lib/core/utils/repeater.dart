void repeater(
  Function function,
  int numberOfTimes,
) {
  for (int i = 0; i < numberOfTimes; i++) {
    function();
  }
}
