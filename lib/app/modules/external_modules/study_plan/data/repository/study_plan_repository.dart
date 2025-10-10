import '../provider/study_plan_provider.dart';

class StudyPlanRepository {
  final StudyPlanProvider _studyPlanApi = StudyPlanProvider();

  getStudyPlan(bool isRefresh) {
    return _studyPlanApi.getStudyPlan(isRefresh);
  }
}