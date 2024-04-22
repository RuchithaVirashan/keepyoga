class ValidateService {
  String? isEmptyField(String value, String feild) {
    if (value.isEmpty) {
      return 'Required';
    } else {
      return null;
    }
  }

  String? isEmptyFieldWithLength(String value, String feild) {
    if (value.isEmpty) {
      return 'Required';
    } else if (value.length < 10) {
      return '$feild must be at least 10 characters long';
    } else if (value.length > 500) {
      return "$feild must be less than 500 characters long";
    } else {
      return null;
    }
  }

  String? validatePrice(String value) {
    if (value.isEmpty) {
      return 'Required';
    }

    final RegExp priceRegex = RegExp(r'^\d+(\.\d{1,2})?$');
    if (!priceRegex.hasMatch(value)) {
      return 'Price must be a whole number with up to two decimal places';
    }

    return null;
  }

  String? validateDiscount(String value) {
  if (value.isEmpty) {
    return 'Required';
  }

  final RegExp discountRegex = RegExp(r'^\d+(\.\d{1,2})?$');
  if (!discountRegex.hasMatch(value)) {
    return 'Discount must be a number with up to two decimal places';
  }

  double discountValue = double.parse(value);
  if (discountValue < 0 || discountValue > 100) {
    return 'Discount must be between 0 and 100';
  }

  return null;
}

}
