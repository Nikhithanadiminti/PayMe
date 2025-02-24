import 'package:get/get.dart';

import '../modules/Login/bindings/login_binding.dart';
import '../modules/Login/views/login_view.dart';
import '../modules/add_upi_id/bindings/add_upi_id_binding.dart';
import '../modules/add_upi_id/views/add_upi_id_view.dart';
import '../modules/additionalDetails/bindings/additional_details_binding.dart';
import '../modules/additionalDetails/views/additional_details_view.dart';
import '../modules/bills_and_recharges/bindings/bills_and_recharges_binding.dart';
import '../modules/bills_and_recharges/views/bills_and_recharges_view.dart';
import '../modules/book_a_cylinder/bindings/book_a_cylinder_binding.dart';
import '../modules/book_a_cylinder/views/book_a_cylinder_view.dart';
import '../modules/broadband_landline/bindings/broadband_landline_binding.dart';
import '../modules/broadband_landline/views/broadband_landline_view.dart';
import '../modules/cable_tv/bindings/cable_tv_binding.dart';
import '../modules/cable_tv/views/cable_tv_view.dart';
import '../modules/credit_card_repayment/bindings/credit_card_repayment_binding.dart';
import '../modules/credit_card_repayment/views/credit_card_repayment_view.dart';
import '../modules/dashboard/bindings/dashboard_binding.dart';
import '../modules/dashboard/views/dashboard_view.dart';
import '../modules/dth/bindings/dth_binding.dart';
import '../modules/dth/views/dth_view.dart';
import '../modules/electricity/bindings/electricity_binding.dart';
import '../modules/electricity/views/electricity_view.dart';
import '../modules/fastag_recharge/bindings/fastag_recharge_binding.dart';
import '../modules/fastag_recharge/views/fastag_recharge_view.dart';
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
import '../modules/postpaid/bindings/postpaid_binding.dart';
import '../modules/postpaid/views/postpaid_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/profileDetails/bindings/profile_details_binding.dart';
import '../modules/profileDetails/views/profile_details_view.dart';
import '../modules/profileEditDetails/bindings/profile_edit_details_binding.dart';
import '../modules/profileEditDetails/views/profile_edit_details_view.dart';
import '../modules/purchases/bindings/purchases_binding.dart';
import '../modules/purchases/views/purchases_view.dart';
import '../modules/qr_code_scanner/bindings/qr_code_scanner_binding.dart';
import '../modules/qr_code_scanner/views/qr_code_scanner_view.dart';
import '../modules/questionnaire/bindings/questionnaire_binding.dart';
import '../modules/questionnaire/views/questionnaire_view.dart';
import '../modules/rent/bindings/rent_binding.dart';
import '../modules/rent/views/rent_view.dart';
import '../modules/scanned_payment_details/bindings/scanned_payment_details_binding.dart';
import '../modules/scanned_payment_details/views/scanned_payment_details_view.dart';
import '../modules/to_mobile_no/bindings/to_mobile_no_binding.dart';
import '../modules/to_mobile_no/views/to_mobile_no_view.dart';
import '../modules/to_mobile_num_payment_details/bindings/to_mobile_num_payment_details_binding.dart';
import '../modules/to_mobile_num_payment_details/views/to_mobile_num_payment_details_view.dart';
import '../modules/transit_and_food/bindings/transit_and_food_binding.dart';
import '../modules/transit_and_food/views/transit_and_food_view.dart';
import '../modules/travel/bindings/travel_binding.dart';
import '../modules/travel/views/travel_view.dart';
import '../modules/water/bindings/water_binding.dart';
import '../modules/water/views/water_view.dart';

// import '../modules/piped_gas/bindings/piped_gas_binding.dart';
// import '../modules/piped_gas/views/piped_gas_view.dart';

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
    GetPage(
      name: _Paths.QUESTIONNAIRE,
      page: () => const QuestionnaireView(),
      binding: QuestionnaireBinding(),
    ),
    GetPage(
      name: _Paths.CREDIT_CARD_REPAYMENT,
      page: () => const CreditCardRepaymentView(),
      binding: CreditCardRepaymentBinding(),
    ),
    GetPage(
      name: _Paths.RENT,
      page: () => const RentView(),
      binding: RentBinding(),
    ),
    GetPage(
      name: _Paths.BILLS_AND_RECHARGES,
      page: () => const BillsAndRechargesView(),
      binding: BillsAndRechargesBinding(),
    ),
    GetPage(
      name: _Paths.PURCHASES,
      page: () => const PurchasesView(),
      binding: PurchasesBinding(),
    ),
    GetPage(
      name: _Paths.TRAVEL,
      page: () => const TravelView(),
      binding: TravelBinding(),
    ),
    GetPage(
      name: _Paths.TRANSIT_AND_FOOD,
      page: () => const TransitAndFoodView(),
      binding: TransitAndFoodBinding(),
    ),
    GetPage(
      name: _Paths.FASTAG_RECHARGE,
      page: () => const FastagRechargeView(),
      binding: FastagRechargeBinding(),
    ),
    GetPage(
      name: _Paths.SCANNED_PAYMENT_DETAILS,
      page: () => const ScannedPaymentDetailsView(
        contactName: '',
      ),
      binding: ScannedPaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.TO_MOBILE_NO,
      page: () => ToMobileNoView(),
      binding: ToMobileNoBinding(),
    ),
    GetPage(
      name: _Paths.TO_MOBILE_NUM_PAYMENT_DETAILS,
      page: () => const ToMobileNumPaymentDetailsView(
        contactName: '',
      ),
      binding: ToMobileNumPaymentDetailsBinding(),
    ),
    GetPage(
      name: _Paths.DTH,
      page: () => const DthView(),
      binding: DthBinding(),
    ),
    // GetPage(
    //   name: _Paths.PIPED_GAS,
    //   page: () => const PipedGasView(),
    //   binding: PipedGasBinding(),
    // ),
    GetPage(
      name: _Paths.CABLE_TV,
      page: () => const CableTvView(),
      binding: CableTvBinding(),
    ),
    GetPage(
      name: _Paths.BOOK_A_CYLINDER,
      page: () => const BookACylinderView(),
      binding: BookACylinderBinding(),
    ),
    GetPage(
      name: _Paths.BROADBAND_LANDLINE,
      page: () => BroadbandLandlineView(),
      binding: BroadbandLandlineBinding(),
    ),
    GetPage(
      name: _Paths.POSTPAID,
      page: () => const PostpaidView(),
      binding: PostpaidBinding(),
    ),
    GetPage(
      name: _Paths.WATER,
      page: () => WaterView(),
      binding: WaterBinding(),
    ),
    GetPage(
      name: _Paths.ELECTRICITY,
      page: () =>  ElectricityView(),
      binding: ElectricityBinding(),
    ),
  ];
}
