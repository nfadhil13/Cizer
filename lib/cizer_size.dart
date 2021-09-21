part of cizer;
extension CizerSize on num {

  double get h => Cizer.height * this  /  100;

  double get w => Cizer.width * this / 100;

  double get sp =>this * (Cizer.width / 3) / 100;

}