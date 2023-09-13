import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hng_stage_2/model/cv_model.dart';
import 'package:hng_stage_2/views/edit_cv_view.dart';

class CvView extends StatefulWidget {
  const CvView({super.key});

  @override
  State<CvView> createState() => _CvViewState();
}

class _CvViewState extends State<CvView> {
  CvModel cvModel = CvModel(
    fullName: "Samuel Adeujimi",
    slackHandle: "samshot_01",
    githubHandle: "sam-shot",
    breifInfo:
        "I'm a 🔥 Flutter developer 💻 with a passion for building beautiful, intuitive, and high-performing mobile apps 📱. I've been working with Flutter for the past few months 🕰️, and I'm always eager to learn more 🧠 and stay up-to-date with the latest developments in the Flutter community 🌀.In my spare time 🕙, you can find me tinkering with new Flutter features 🔧, contributing to open-source projects 🤝, or sharing my knowledge with the community through blog posts 📝 and talks 🗣️.I'm always looking for new opportunities to collaborate 🤝 and work on exciting projects 🚀. If you have an idea for a Flutter app or just want to chat about mobile development, feel free to reach out to me 💬.",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
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
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Text(
                            "Name: ",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            cvModel.fullName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 25),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Slack handle: ",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            cvModel.slackHandle,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Github handle: ",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          Text(
                            cvModel.githubHandle,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 20),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                    child: Container(
                      color: Colors.black38,
                      width: double.infinity,
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cvModel.breifInfo,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          MaterialButton(
                            minWidth: double.infinity,
                            height: 45,
                            color: Colors.teal.shade500,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () {
                              Navigator.push(context, CupertinoPageRoute(
                                builder: (context) {
                                  return EditCvView(
                                    onSave: (editedData) {
                                      setState(() {
                                        cvModel = editedData;
                                      });
                                    },
                                  );
                                },
                              ));
                            },
                            child: const Text(
                              "Edit CV",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
