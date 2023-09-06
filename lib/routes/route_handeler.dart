
enum RouteData {
  /// For routes for which we want to show unkown page that are not being parsed
  unkownRoute,

  /// For routes that are parsed but not data is found for them eg. /user/?userName=abc and abc doesnt exist
  notFound,

  splash,
  login,
  home,
  register,
  dashboard,
  faq,
  lottery,
  referrals,
  roll,
  deposit,
  smart_contract,
  user_level,
  withdraw,
  term_and_condition,
  privacy_policy
}
