import 'package:get/get.dart';
import 'package:uffmobileplus/app/data/services/external_study_plan_service.dart';
import 'package:uffmobileplus/app/modules/external_modules/study_plan/controller/study_plan_controller.dart';
import 'package:uffmobileplus/app/modules/internal_modules/user/controller/user_data_controller.dart';

class StudyPlanBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExternalStudyPlanService>(() => ExternalStudyPlanService());
    Get.lazyPut<StudyPlanController>(() => StudyPlanController());
  }
}