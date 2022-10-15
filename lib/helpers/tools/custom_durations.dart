class CustomDuration extends Duration {
  CustomDuration({
    super.days = 0,
    super.hours = 0,
    super.minutes = 0,
    super.seconds = 0,
    super.milliseconds = 0,
    super.microseconds = 0,
  });

  static final CustomDuration low = CustomDuration(microseconds: 350);
  static final CustomDuration low2 = CustomDuration(microseconds: 500);
}
