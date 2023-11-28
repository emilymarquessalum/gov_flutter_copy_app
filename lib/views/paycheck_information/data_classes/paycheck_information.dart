




enum PaycheckInformationType {
  brute, liquid,  discount, all,

  /// ROI,
}

extension PaycheckInformationTypeExtension on PaycheckInformationType {
  isDerived() {
    return [
      PaycheckInformationType.liquid,
    ].contains(this);
  }
}

class PaycheckInformation {
  final String name;
  final double value;
  final PaycheckInformationType type;

  PaycheckInformation({required this.name, required this.value, required this.type});

  static PaycheckInformation fromJson(e) {
    return PaycheckInformation(
      name: e["name"],
      value: e["value"].toDouble(),
      type:  typeFromString(e["type"])
    );
  }

  static PaycheckInformationType typeFromString(String type) {

    return ({
      "gross": PaycheckInformationType.brute,
      "discounts": PaycheckInformationType.discount,
    }[type]) ?? PaycheckInformationType.all;
  }
}


extension PaymentInformationListExtension on List<PaycheckInformation> {

  double getSum() {
    if(isEmpty) return 0.0;
    return map((e) => e.value).reduce((value, element) => value + element);
  }


  List<PaycheckInformation> ofType(PaycheckInformationType type) {
    return where((element) => element.type == type).toList();
  }

}