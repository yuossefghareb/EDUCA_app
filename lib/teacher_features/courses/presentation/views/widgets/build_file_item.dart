import 'package:field_training_app/Core/utils/styles.dart';
import 'package:field_training_app/teacher_features/courses/data/models/file_model.dart';

import 'package:flutter/material.dart';

class BuildFileItem extends StatelessWidget {
  const BuildFileItem({super.key, required this.file});

  final FileModel file;

  @override
  Widget build(BuildContext context) {
    // final kb = file.size / 1024;
    // final mb = kb / 1024;
    // final fileSize = mb >= 1 ? mb.toStringAsFixed(2) : kb.toStringAsFixed(2);
    // final extension = file.extension ?? "none";
    // final color = getColor(extension);

    return InkWell(
      onTap: () {
        //  OpenFile.open(file.path!);
      },
      child: Container(
        padding: const EdgeInsets.all(10),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                file.fileName!.substring(file.fileName!.length - 3),
                style: Styles.textStyle18.copyWith(color: Colors.white),
              ),
            ),
          ),
          const SizedBox(
            height: 7,
          ),
          Text(
            file.fileName ?? "none",
            style: Styles.textStyle16.copyWith(color: Colors.black),
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            "1034KB",
            style: Styles.textStyle14.copyWith(color: Colors.grey),
            overflow: TextOverflow.ellipsis,
          )
        ]),
      ),
    );
  }

  getColor(String extension) {
    return extension == "pdf" ? Colors.red : Colors.blue;
  }
}
