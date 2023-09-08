


// class DOBInfoValidator {
//   static String? validateFullName(String? value) {
//     final validCharacters = RegExp(r'^[a-zA-Z ]+$');
//     if(value.toString().trim().contains(' ') == false) {
//       return 'valid_full_name_qid'.tr().toString();
//     }else if(validCharacters.hasMatch(value!) == false){
//       return 'valid_full_name_qid'.tr().toString();
//     }else if(value.toString().trim().contains(' ')){
//       List nameArr = value.split(" ");
//       for (var i = 0; i < nameArr.length; i++) {
//         if(nameArr[i].length > 33){
//           return 'valid_full_name_qid'.tr().toString();
//         }
//       }
//       return null;
//     }else{
//       return null;
//     }
//   }
//
//   static String? validateFullNameArr(String? value) {
//     if(value.toString().trim().contains(' ') == false) {
//       return 'valid_full_name_qid'.tr().toString();
//     }else if(value.toString().trim().contains(' ')){
//       List nameArr = value!.split(" ");
//       for (var i = 0; i < nameArr.length; i++) {
//         if(nameArr[i].length > 33){
//           return 'valid_full_name_qid'.tr().toString();
//         }
//       }
//       return null;
//     }else{
//       return null;
//     }
//   }
//   static String? validateEmail(String? value) {
//     Pattern  pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
//     RegExp regex = RegExp(pattern as String);
//     if (!regex.hasMatch(value!) && value.toString().isNotEmpty){
//           return 'email_error'.tr().toString();
//     }else{
//          return null;
//     }
//   }
//
//
// }