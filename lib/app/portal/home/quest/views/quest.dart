import 'package:empireone_mart/app/portal/home/quest/quest.dart';
import 'package:empireone_mart/app/portal/home/quest/views/score.dart';
import 'package:empireone_mart/main.dart';
import 'package:empireone_mart/repository/answer_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Quest extends StatefulWidget {
  final Map<String, dynamic> data;
  final type;
  Quest({super.key, required this.data, required this.type});

  @override
  State<Quest> createState() => _QuestState();
}

class _QuestState extends State<Quest> {
  int _currentPage = 0; // Track the current page index
  bool _isLoading = false; // Track loading state

  @override
  void initState() {
    super.initState();
    _currentPage = widget.data['answers'].length;

    // Ensure navigation to Score page if all questions are answered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.data['questions'].length == widget.data['answers'].length) {
        context.go('/score/${widget.data['id']}/${widget.type}');
      }
    });
  }

  void answerQuestion(BuildContext context, answer, questId) async {
    setState(() {
      _isLoading = true;
    });

    final prefs = await SharedPreferences.getInstance();
    String? studentId = prefs.getString('user_id');

    try {
      final response =
          await AnswerRepository().answerQuestion(answer, studentId, questId);
      print('Response: $response');

      setState(() {
        _isLoading = false;
        if (!response['isFinish'] &&
            _currentPage < widget.data['questions'].length - 1) {
          _currentPage++; // Move to the next question
        } else {
          context.go('/score/${widget.data['id']}/${widget.type}');
        }
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // Create a list of pages (one for each question)
    // print('dadakjldabody${widget.data['answers']}');
    final List<Widget> pages = widget.data['questions']
        .map<Widget>(
          (res) => Container(
            height: MediaQuery.of(context).size.height / 1.7,
            child: Questions(
              isLoading: _isLoading,
              data: res,
              submitVoid: (answer, questId) =>
                  answerQuestion(context, answer, questId),
            ),
          ),
        )
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Quest',
          style: const TextStyle(
            fontSize: 25,
            fontFamily: 'JollyFont',
            color: Colors.blue,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.blue,
            size: 40,
          ),
          onPressed: () {
            BackgroundMusicPlayer.playTapSound();
            context.pop(); // Navigate to the '/quest' route
          },
        ),
      ),
      body: Stack(
        children: [
          // Background GIF
          Positioned.fill(
            child: Image.asset(
              "assets/gif/board.gif",
              fit: BoxFit.cover,
            ),
          ),

          // Scrollable Content
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(30, 100, 30, 110),
                  child: SingleChildScrollView(
                    child: Card(
                      color: Colors.white,
                      child: IndexedStack(
                        index: _currentPage,
                        children: pages,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
