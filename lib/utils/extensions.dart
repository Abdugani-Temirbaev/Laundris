extension EnumValue on Enum {
  String rawValue() {
    return toString().split('.').last;
  }
}
