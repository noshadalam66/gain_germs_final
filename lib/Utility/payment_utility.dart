class PaymentUtility{

  String getProperMobileNo(String val){
    if (val.length <= 8)
    {
      return val;
    }
    else
      {
        String countryCode = val.substring(0,3);
        if (countryCode == '974')
          {
            return val
                .substring(val.length - 8,
                val.length);
          }
      }
    return "";
  }


}