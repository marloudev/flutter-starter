import 'package:flutter/material.dart';

class RewardsIdSection extends StatefulWidget {
  const RewardsIdSection({super.key});

  @override
  State<RewardsIdSection> createState() => _RewardsIdSectionState();
}

class _RewardsIdSectionState extends State<RewardsIdSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          child: Image.asset('assets/images/logo.png'),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'STARBUCKS GIFT CERTIFICATE',
          style: TextStyle(
            color: Colors.blue,
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
         const SizedBox(
          height: 20,
        ),
         const Text(
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum",
        ),
      ],
    );
  }
}
