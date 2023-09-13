import 'package:flutter/material.dart';
import 'package:hng_stage_2/model/cv_model.dart';

class EditCvView extends StatefulWidget {
  final Function(CvModel) onSave;

  const EditCvView({super.key, required this.onSave});

  @override
  State<EditCvView> createState() => _EditCvViewState();
}

class _EditCvViewState extends State<EditCvView> {
  TextEditingController nameController = TextEditingController();
  TextEditingController slackHandleController = TextEditingController();
  TextEditingController githubHandleController = TextEditingController();
  TextEditingController briefController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(
        backgroundColor: Colors.teal.shade600,
        title: const Text("Edit CV"),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue.withOpacity(0.2),
                Colors.teal.withOpacity(0.3),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  AppTextField(
                    controller: nameController,
                    hint: "Full name",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: slackHandleController,
                    hint: "slack_handle",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: githubHandleController,
                    hint: "github_handle",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  AppTextField(
                    controller: briefController,
                    maxLines: 4,
                    hint: "brief info",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Spacer(),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 45,
                    color: Colors.teal.shade500,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () {
                      if (nameController.text.isNotEmpty &&
                          slackHandleController.text.isNotEmpty &&
                          githubHandleController.text.isNotEmpty &&
                          briefController.text.isNotEmpty) {
                        widget.onSave(
                          CvModel(
                            fullName: nameController.text,
                            slackHandle: slackHandleController.text,
                            githubHandle: githubHandleController.text,
                            breifInfo: briefController.text,
                          ),
                        );
                        Navigator.pop(context);
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Dialog(
                              child: SizedBox(
                                width: 120,
                                height: 50,
                                child: Center(
                                  child: Text(
                                    "Fields should not be empty",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.red),
                                  ),
                                ),
                              ),
                            );
                          },
                        );
                      }
                    },
                    child: const Text(
                      "Save CV",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AppTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final maxLines;
  const AppTextField({
    required this.hint,
    required this.controller,
    this.maxLines = 1,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        fillColor: Colors.white24,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.teal, width: 2),
        ),
      ),
    );
  }
}
