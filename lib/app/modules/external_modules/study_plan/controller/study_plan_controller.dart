import 'package:get/get.dart';
import 'package:uffmobileplus/app/data/models/study_plan_model.dart';
import 'package:uffmobileplus/app/data/providers/firebase/firebase_analytics_service.dart';
import 'package:uffmobileplus/app/data/repositories/study_plan_repository.dart';
import 'package:uffmobileplus/app/data/repositories/user_repository.dart';
import '../../util/ui_components/custom_alert_dialog.dart';

class StudyPlanController extends GetxController {
  final FirebaseAnalyticsService firebaseAnalyticsService = Get.find();

  void goDocStudyPlan() {
    /* Get.toNamed(Routes.WEB_VIEW, arguments: {
      'url': '',
      'title': 'study_plan'.tr,
    });*/
    customAlertDialog(Get.context!, title: 'page_under_development'.tr).show();
  }

  final StudyPlanRepository _studyPlanRepository = StudyPlanRepository();
  final UserRepository userRepository = Get.find<UserRepository>();
  StudyPlanModel? studyPlanModel;
  List<String> weekDays = [
    'Monday'.tr,
    'Tuesday'.tr,
    'Wednesday'.tr,
    'Thursday'.tr,
    'Friday'.tr,
    'Saturday'.tr
  ];
  int dayIndex = 0;
  List<Map<String, dynamic>> studyPlanList = [];
  bool isLoading = true;

  @override
  void onInit() {
    fetchStudyPlan(false);
    firebaseAnalyticsService.logScreen(
        "study_plan", "study_plan", userRepository.getCurrentProfile().name);
    super.onInit();
  }

  void fetchStudyPlan(bool isRefresh) async {
    String m = userRepository.getRegistration();
    studyPlanModel = await _studyPlanRepository.getStudyPlan(m, isRefresh);
    if (studyPlanModel != null) {
      studyPlanList = [];
      dayIndex = 0;
      fillStudyPlanList(studyPlanModel!.plan!.dias!.segunda!);
      fillStudyPlanList(studyPlanModel!.plan!.dias!.terca!);
      fillStudyPlanList(studyPlanModel!.plan!.dias!.quarta!);
      fillStudyPlanList(studyPlanModel!.plan!.dias!.quinta!);
      fillStudyPlanList(studyPlanModel!.plan!.dias!.sexta!);
      fillStudyPlanList(studyPlanModel!.plan!.dias!.sabado!);
    }
    //debugPrint("studyPlan: ${studyPlanModel!.plan!.dias!.segunda!.disciplinas![0].nome}");
    isLoading = false;
    update();
  }

  fillStudyPlanList(Day day) {
    if (day.disciplinas!.isNotEmpty) {
      studyPlanList
          .add({'day': weekDays[dayIndex], 'subjects': day.disciplinas});
      dayIndex++;
    } else {
      dayIndex++;
    }
  }
}
