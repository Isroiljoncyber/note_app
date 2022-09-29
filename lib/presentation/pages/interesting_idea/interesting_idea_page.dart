import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:note_app/config/constants/hive_boxes.dart';
import 'package:note_app/core/domain/entities/enums.dart';
import 'package:note_app/core/utils/hive_util.dart';
import 'package:note_app/data/models/interesting_idea_model.dart';
import 'package:note_app/presentation/components/bottom_task_bar.dart';
import 'package:note_app/presentation/components/custom_app_bar.dart';
import 'package:note_app/presentation/components/note_text_field.dart';
import 'package:note_app/presentation/pages/interesting_idea/bloc/add_interesting_idea_cubit.dart';

import '../../../config/constants/app_colors.dart';
import '../../components/title_text_field.dart';

class InterestingIdeaPage extends StatefulWidget {
  const InterestingIdeaPage({Key? key}) : super(key: key);

  @override
  State<InterestingIdeaPage> createState() => _InterestingIdeaPageState();
}

class _InterestingIdeaPageState extends State<InterestingIdeaPage>
    with HiveUtil {
  late final TextEditingController titleEditingController;
  late final TextEditingController noteEditingController;
  DateFormat dateFormat = DateFormat("dd/MM/yyyy HH:mm");

  @override
  void initState() {
    titleEditingController = TextEditingController();
    noteEditingController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.neutralColor.white,
      appBar: CustomAppBar(
        onBackTap: () async {
          addBox<InterestingIdeaModel>(
            interestingBox,
            InterestingIdeaModel(
              noteType: NoteType.interesting.toString(),
              title: titleEditingController.text.toString(),
              noteBody: noteEditingController.text.toString(),
              isFinished: false,
              itemColor: 1,
              labels: ["important", "should be done this week"],
              lastEditedTime: dateFormat.format(DateTime.now()),
              remindedTime: dateFormat.format(DateTime.now()),
            ),
          );
          context.read<AddInterestingIdeaCubit>().addNewItemToTheList(
                InterestingIdeaModel(
                  noteType: NoteType.interesting.toString(),
                  title: titleEditingController.text.toString(),
                  noteBody: noteEditingController.text.toString(),
                  isFinished: false,
                  itemColor: 1,
                  labels: ["important", "should be done this week"],
                  lastEditedTime: dateFormat.format(DateTime.now()),
                  remindedTime: dateFormat.format(DateTime.now()),
                ),
              );
          Navigator.pop(context);
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: ListView(
                physics: const BouncingScrollPhysics(),
                children: [
                  TitleTextField(
                    titleHint: "Title Here",
                    textEditingController: titleEditingController,
                  ),
                  NoteTextField(textEditingController: noteEditingController),
                ],
              ),
            ),
          ),
          BottomTaskBar(context: context),
        ],
      ),
    );
  }
}
