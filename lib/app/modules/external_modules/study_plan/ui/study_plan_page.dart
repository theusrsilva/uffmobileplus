import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_tab_view/infinite_scroll_tab_view.dart';
import 'package:uffmobileplus/app/modules/external_modules/study_plan/data/models/discipline_model.dart';
import 'package:uffmobileplus/app/modules/external_modules/study_plan/data/models/weekday_model.dart';
import '../../../../utils/color_pallete.dart';
import '../../../../utils/ui_components/custom_progress_display.dart';
import '../controller/study_plan_controller.dart';

class StudyPlanPage extends StatelessWidget {
  const StudyPlanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StudyPlanController>(
      init: StudyPlanController(),
      builder: (controller) => Scaffold(
        backgroundColor: Colors.blueAccent,
        appBar: AppBar(
          centerTitle: true,
          elevation: 8,
          foregroundColor: Colors.white,
          title: const Text("Plano de Estudos"),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(10)),
          ),
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: AppColors.appBarTopGradient(),
            ),
          ),
        ),
        body: Container(
            decoration: BoxDecoration(
              gradient: AppColors.darkBlueToBlackGradient(),
            ),
            child: controller.isLoading
                ? Center(child: CustomProgressDisplay())
                : (controller.studyPlan?.plan == null
                ? Center(child: Text('no_study_plan_info'.tr))
                : _tabViewWidget(controller.getStudyPlan()))),
        floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.darkBlue(),
          child: const Icon(Icons.refresh, color: Colors.white,),
          onPressed: () => controller.refreshStudyPlan(),
        ),
      )
    );
  }

  _tabViewWidget(studyPlan) {
    return InfiniteScrollTabView(
      backgroundColor: Colors.white,
      contentLength: studyPlan.length,
      indicatorColor: AppColors.mediumBlue(),
      separator: BorderSide(color: AppColors.darkBlue(), width: 1.0),
      tabBuilder: (index, isSelected) {
        WeekDay day = studyPlan.keys.elementAt(index);
        return Text(
          dataToString(day),
          style: isSelected
              ? TextStyle(color: AppColors.mediumBlue())
              : const TextStyle()
        );
      },
      pageBuilder: (context, index, _) {
        return Padding(
          padding: const EdgeInsets.all(12.0),
          child: SizedBox.expand(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: AppColors.darkBlueToBlackGradient(),
              ),
              child: ListView.separated(
                separatorBuilder: (___,__) => Divider(thickness: 2.0, color: AppColors.darkBlue(),),
                itemCount: studyPlan.values.elementAt(index).length,
                shrinkWrap: true,
                itemBuilder: (context, innerIndex) {
                  Discipline subject = studyPlan.values.elementAt(index)[innerIndex];
                  return Column(
                    children: [
                      Text(subject.title ?? "", style: TextStyle(color: Colors.white)),
                      Row(children: [Text('class_code'.tr, style: TextStyle(color: Colors.white)), Text(': ${subject.codClass}', style: TextStyle(color: Colors.white))]),
                      Row(children: [Text('subject_code'.tr, style: TextStyle(color: Colors.white)), Text(': ${subject.cod}', style: TextStyle(color: Colors.white))]),
                      Row(children: [Text('time'.tr, style: TextStyle(color: Colors.white)),
                        Text(': ${subject.startTime} às ${subject.endTime}', style: TextStyle(color: Colors.white))]),
                      Row(children: [const Text('Status', style: TextStyle(color: Colors.white)), Text(': ${subject.status}', style: TextStyle(color: Colors.white))]),
                    ],
                  );
                },
              ),
            ),
          ),
        );
      }
    );
  }
}
