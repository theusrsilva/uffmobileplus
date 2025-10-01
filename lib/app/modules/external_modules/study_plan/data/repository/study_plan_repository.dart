import '../provider/study_plan_provider.dart';

class StudyPlanRepository {
  final StudyPlanProvider _studyPlanApi = StudyPlanProvider();

  StudyPlanRepository() ;

  getStudyPlan(bool isRefresh) {
    return _studyPlanApi.getStudyPlan(isRefresh);
  }

  Future<void> clear() async {
    await _studyPlanApi.clear();
  }
}