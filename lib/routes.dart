import 'package:flutter_application_1/animation.dart';
import 'package:flutter_application_1/view/address/add.dart';
import 'package:flutter_application_1/view/address/adddetails.dart';
import 'package:flutter_application_1/view/address/view.dart';
import 'package:flutter_application_1/view/screen/cart.dart';
import 'package:flutter_application_1/view/screen/checkout.dart';
import 'package:flutter_application_1/view/screen/myfavorite.dart';
import 'package:flutter_application_1/view/screen/orders/pending.dart';
import 'package:get/get.dart';
import 'package:flutter_application_1/core/constant/routes.dart';
import 'package:flutter_application_1/core/middleware/mymiddleware.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/login.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/resetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/signup.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/success_resetpassword.dart';
import 'package:flutter_application_1/view/screen/auth/success_signup.dart';
import 'package:flutter_application_1/view/screen/auth/forgetpassword/verifycode.dart';
import 'package:flutter_application_1/view/screen/auth/verifycodesignup.dart';
import 'package:flutter_application_1/view/screen/homescreen.dart';
import 'package:flutter_application_1/view/screen/items.dart';
import 'package:flutter_application_1/view/screen/language.dart';
import 'package:flutter_application_1/view/screen/onboarding.dart';
import 'package:flutter_application_1/view/screen/productdetails.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(
      name: "/", page: () => const Language(), middlewares: [MyMiddleWare()]),
  GetPage(name: AppRoute.cart, page: () => const Cart()),
  // GetPage(name: "/", page: () => const AnimationTest()),
  GetPage(name: AppRoute.login, page: () => const Login()),
  GetPage(name: AppRoute.homepage, page: () => const HomeScreen()),
  GetPage(name: AppRoute.onboarding, page: () => const OnBoarding()),
  GetPage(
      name: AppRoute.verifyCodeSignUp, page: () => const VerifyCodeSignUp()),
  GetPage(name: AppRoute.signup, page: () => const SignUp()),
  GetPage(name: AppRoute.forgetPassword, page: () => const ForgetPassword()),
  GetPage(name: AppRoute.verfiyCode, page: () => const VerifyCode()),
  GetPage(name: AppRoute.resetPassword, page: () => const ResetPassword()),
  GetPage(name: AppRoute.successSignUp, page: () => const SuccessSignUp()),
  GetPage(
      name: AppRoute.successResetPassword,
      page: () => const SuccessResetPassword()),
  GetPage(name: AppRoute.items, page: () => const Items()),
  GetPage(name: AppRoute.productdetails, page: () => const ProductDetails()),
  GetPage(name: AppRoute.myFavorite, page: () => const MyFavorite()),
  // ==================address
  GetPage(name: AppRoute.addressview, page: () => const AddressView()),
  GetPage(name: AppRoute.addressadd, page: () => const AddressAdd()),
  GetPage(name: AppRoute.checkout, page: () => const CheckOut()),
  GetPage(name: AppRoute.orderspending, page: () => const OrdersPending()),
  GetPage(
      name: AppRoute.addressadddetails, page: () => const AddressAddDetails()),
];
