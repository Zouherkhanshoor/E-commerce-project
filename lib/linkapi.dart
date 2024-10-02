class AppLink {
  static const String server = "http://192.168.1.100/ecommerce";
  static const String imagestatic = "http://192.168.1.100/ecommerce/upload";
  static const String imageCategories = "$imagestatic/categories";
  static const String imageItems = "$imagestatic/items";
  static const String test = "$server/test.php";

  // =======================Auth======================= //

  static const String signUp = "$server/auth/signup.php";
  static const String login = "$server/auth/login.php";
  static const String verifyCodeSignUp = "$server/auth/verifycode.php";
  static const String resend = "$server/auth/resend.php";

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
  static const String searchitems = "$server/items/search.php";

  // ====================Favorite

  static const String favoriteAdd = "$server/favorite/add.php";
  static const String favoriteRemove = "$server/favorite/remove.php";
  static const String favoriteView = "$server/favorite/view.php";
  static const String favoriteDelete =
      "$server/favorite/deletefromfavorite.php";

  // ====================Cart
  static const String cartview = "$server/cart/view.php";
  static const String cartadd = "$server/cart/add.php";
  static const String cartdelete = "$server/cart/delete.php";
  static const String cartgetcountitems = "$server/cart/getcountitems.php";

  // ====================Address

  static const String addressView = "$server/address/view.php";
  static const String addressAdd = "$server/address/add.php";
  static const String addressEdit = "$server/address/edit.php";
  static const String addressDelete = "$server/address/delete.php";

  // ==================coupon

  static const String checkcoupon = "$server/coupon/checkcoupon.php";
}
