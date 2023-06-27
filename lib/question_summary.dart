import 'package:flutter/material.dart';

class QuestionSummary extends StatelessWidget {
  const QuestionSummary({
    super.key,
    required this.summary,
  });

  final List<Map<String, Object>> summary;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: summary.map((data) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        data['user-answer'] == data['correct-answer']
                            ? Colors.white
                            : Colors.grey,
                    foregroundColor: Colors.purple,
                    child: Text(
                      "${(data['question-index'] as int) + 1}",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            bottom: 18.0,
                            top: 3.0,
                          ),
                          child: Text(
                            data['question'] as String,
                            style: const TextStyle(
                              color: Colors.white60,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          margin: const EdgeInsets.only(bottom: 10.0),
                          color: data['user-answer'] == data['correct-answer']
                              ? Colors.white
                              : Colors.grey,
                          child: Text(
                            data['user-answer'] as String,
                            style: TextStyle(
                              color:
                                  data['user-answer'] == data['correct-answer']
                                      ? Colors.grey
                                      : Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            data['correct-answer'] as String,
                            style: const TextStyle(
                              color: Colors.white70,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
