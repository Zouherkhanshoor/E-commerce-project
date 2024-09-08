class AppLink {
  static const String server = "http://192.168.1.104/ecommerce";
  static const String imagestatic = "http://192.168.1.104/ecommerce/upload";
  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";
  static const String test = "$server/test.php";

  // =======================Auth======================= //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";

  // ===============================forgetpassword==================//

  static const String checkEmail = "$server/forgetpassword/checkemail.php";
  static const String resetPassword =
      "$server/forgetpassword/resetpassword.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycode.php";

  // ====================home

  static const String homepage = "$server/home.php";

  // ====================items
  static const String items = "$server/items/items.php";

  // ====================Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
}
