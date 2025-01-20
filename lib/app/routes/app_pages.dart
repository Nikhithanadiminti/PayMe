import 'package:get/get.dart';

import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/add_upi_id/bindings/add_upi_id_binding.dart';
import '../modules/add_upi_id/views/add_upi_id_view.dart';
import '../modules/additionalDetails/bindings/additional_details_binding.dart';
import '../modules/additionalDetails/views/additional_details_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/financialDetails/bindings/financial_details_binding.dart';
import '../modules/financialDetails/views/financial_details_view.dart';
import '../modules/footer/bindings/footer_binding.dart';
import '../modules/footer/views/footer_view.dart';
import '../modules/header/bindings/header_binding.dart';
import '../modules/header/views/header_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/otpVerification/bindings/otp_verification_binding.dart';
import '../modules/otpVerification/views/otp_verification_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profileDetails/bindings/profile_details_binding.dart';
import '../modules/profileDetails/views/profile_details_view.dart';
import '../modules/profileEditDetails/bindings/profile_edit_details_binding.dart';
import '../modules/profileEditDetails/views/profile_edit_details_view.dart';
import '../modules/qr_code_scanner/bindings/qr_code_scanner_binding.dart';
import '../modules/qr_code_scanner/views/qr_code_scanner_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => const OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_DETAILS,
      page: () => const ProfileDetailsView(),
      binding: ProfileDetailsBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE_EDIT_DETAILS,
      page: () => const ProfileEditDetailsView(),
      binding: ProfileEditDetailsBinding(),
    ),
    GetPage(
      name: _Paths.FINANCIAL_DETAILS,
      page: () => const FinancialDetailsView(),
      binding: FinancialDetailsBinding(),
    ),
    GetPage(
      name: _Paths.ADDITIONAL_DETAILS,
      page: () => const AdditionalDetailsView(),
      binding: AdditionalDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DASHBOARD,
      page: () => const DashboardView(),
      binding: DashboardBinding(),
    ),
    GetPage(
      name: _Paths.HEADER,
      page: () => const HeaderView(),
      binding: HeaderBinding(),
    ),
    GetPage(
      name: _Paths.FOOTER,
      page: () => const FooterView(),
      binding: FooterBinding(),
    ),
    GetPage(
      name: _Paths.FOOTER,
      page: () => const FooterView(),
      binding: FooterBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPI_ID,
      page: () => const AddUpiIdView(),
      binding: AddUpiIdBinding(),
    ),
    // GetPage(
    //   name: _Paths.QR_CODE_SCANNER,
    //   page: () => const QrCodeScannerView(),
    //   binding: QrCodeScannerBinding(),
    // ),
  ];
}
