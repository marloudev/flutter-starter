import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:flutter/material.dart';

class Questions extends StatefulWidget {
  final data; // The type of 'data' can be any dynamic type.
  final submitVoid;
  final isLoading;
  Questions(
      {super.key,
      required this.data,
      required this.submitVoid,
      required this.isLoading});

  @override
  State<Questions> createState() => _QuestionsState();
}

class _QuestionsState extends State<Questions> {
  // Track the current page index
// Track loading state
  @override
  Widget build(BuildContext context) {
    // Print the data to check the output
    print('datadatadatassss${widget.data}');

    // Check if the data has the expected structure and display it accordingly
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Card(
              color: Colors.blue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                child: Text(
                  widget.data['question'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            widget.data['file'] != null && widget.data['file'].isNotEmpty
                ? Image.network(
                    widget.data['file'],
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child; // The image has finished loading, return the child widget (the image)
                      }
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          Icons.error_outline,
                          size: 50,
                          color: Colors.red,
                        ), // Display error icon if the image fails to load
                      );
                    },
                  )
                : Container(),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              if (widget.data['exam_type'] == 'True Or False')
                TrueOrFalse(
                    data: widget.data,
                    submitVoid: widget.submitVoid,
                    isLoading: widget.isLoading),
              if (widget.data['exam_type'] == 'Fill In The Blank')
                FillInTheBlank(
                    data: widget.data,
                    submitVoid: widget.submitVoid,
                    isLoading: widget.isLoading),
              if (widget.data['exam_type'] == 'Multiple Choice')
                MultipleChoice(
                    data: widget.data,
                    submitVoid: widget.submitVoid,
                    isLoading: widget.isLoading),
              if (widget.data['exam_type'] == 'Matching')
                Matching(
                    data: widget.data,
                    submitVoid: widget.submitVoid,
                    isLoading: widget.isLoading),
              if (widget.data['exam_type'] == 'Identification')
                Identification(
                    data: widget.data,
                    submitVoid: widget.submitVoid,
                    isLoading: widget.isLoading),
            ],
          ),
        ),
      ],
    );
  }
}
