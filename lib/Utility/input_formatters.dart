import 'package:flutter/services.dart';

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    bool isGoingForward = false;
    if ((oldValue.text.replaceAll("/", "")).length < newValue.text.length) {
      isGoingForward = true;
    }

    /*var buffer = new StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }*/

    var buffer = StringBuffer();
    var newValueStr = newText.toString().replaceAll("/", "");
    for (int i = 0; i < newValueStr.length; i++) {
      if (i == 0) {
        buffer.write(newValueStr[i]);
      } else if (i == 1) {
        buffer.write(newValueStr[i]);
        if (isGoingForward) {
          buffer.write("/");
        } else {
          if (newText.length == 3 || newText.length == 4) {
            buffer.write("/");
          }
        }
      } else {
        buffer.write(newValueStr[i]);
      }

      /*var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }*/
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

class VisaCardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    bool isGoingForward = false;
    if ((oldValue.text.replaceAll("-", "")).length < newValue.text.length) {
      isGoingForward = true;
    }

    /*var buffer = new StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }*/

    var buffer = StringBuffer();
    var newValueStr = newText.toString().replaceAll("-", "");
    for (int i = 0; i < newValueStr.length; i++) {
      if (i == 0) {
        buffer.write(newValueStr[i]);
      } else if (i == 3) {
        buffer.write(newValueStr[i]);
        if (isGoingForward) {
          buffer.write("-");
        } else {
          if (newText.length == 5 || newText.length == 6) {
            buffer.write("-");
          }
        }
      } else {
        buffer.write(newValueStr[i]);
      }

      /*var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }*/
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}

/*class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = new StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 4 == 0 && nonZeroIndex != text.length) {
        buffer.write('  '); // Add double spaces.
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: new TextSelection.collapsed(offset: string.length));
  }
}*/

class CardNumberInputFormatter extends TextInputFormatter {
  static var originalValue = StringBuffer();

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    //
    if (oldValue.text.length == newValue.text.length) {
      return newValue;
    }

    bool isGoingForward = false;
    if (oldValue.text.length < newValue.text.length) {
      isGoingForward = true;
    }

    var newValueText = newValue.text.replaceAll("  ", "");
    var oldValueText = oldValue.text.replaceAll("  ", "");
    if (isGoingForward) {
      //var diffText = newValueText.replaceAll(oldValueText, "");
      var diffText = "";
      if (oldValueText.isEmpty) {
        diffText = newValueText;
      } else {
        diffText = newValueText.substring(oldValueText.length);
      }
      if (isNumeric(diffText)) {
        originalValue.write(diffText);
      } else {
        return oldValue;
      }
    } else {
      var oldOriginalText = originalValue.toString();
      var oldStringBuffer = StringBuffer();
      for (int i = 0; i < oldOriginalText.length - 1; i++) {
        oldStringBuffer.write(oldOriginalText[i]);
      }
      originalValue = oldStringBuffer;
    }
    var text = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    var buffer = StringBuffer();
    if (isGoingForward) {
      var newText = text.replaceAll("  ", "");
      for (int i = 0; i < newText.length; i++) {
        if (i > 3 && i <= 7) {
          buffer.write(newText[i]);
        } else if (i > 7 && i <= 11) {
          buffer.write(newText[i]);
        } else {
          buffer.write(newText[i]);
        }
        //buffer.write(newText[i]);
        if (i == 3 || i == 7 || i == 11) {
          buffer.write('  ');
        }
      }
    } else {
      var newText = text.trimRight();
      for (int i = 0; i < newText.length; i++) {
        buffer.write(newText[i]);
      }
    }
    var string = buffer.toString();

    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
