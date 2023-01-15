Stream<int> countDown(int duration) {
  return Stream.periodic(
    const Duration(seconds: 1),
    (count) => duration - count,
  ).take(duration);
}
