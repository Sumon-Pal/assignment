/*
Question
You are given a list of students. Each student has a name and a list of scores.
Your task is to:
Calculate the average score of each student (rounded to 2 decimal places).
Store the results in a map, where the student’s name is the key and their average score is the value.
Sort the map in descending order of average scores and print the final sorted result.

Sample Input:
[
{"name": "Alice", "scores": [85, 90, 78]},
{"name": "Bob", "scores": [88, 76, 95]},
{"name": "Charlie", "scores": [90, 92, 85]}
];

Output:
{
"Charlie": 89.0,
"Bob": 86.33,
"Alice": 84.33
}
*/
void main() {
  List<Map<String, dynamic>> students = [
    {"name": "Alice", "scores": [85, 90, 78]},
    {"name": "Bob", "scores": [88, 76, 95]},
    {"name": "Charlie", "scores": [90, 92, 85]},
  ];

  Map<String, double> averageScores = calculateAverageScores(students);
  print(averageScores);
}

Map<String, double> calculateAverageScores(List<Map<String, dynamic>> students) {
  Map<String, double> averageScores = {};

  for (var student in students) {
    String name = student["name"];
    List<int> scores = List<int>.from(student["scores"]);

    double average = scores.reduce((a, b) => a + b) / scores.length;
    averageScores[name] = double.parse(average.toStringAsFixed(2));
  }

  var sortedEntries = averageScores.entries.toList()
    ..sort((a, b) => b.value.compareTo(a.value));

  return Map.fromEntries(sortedEntries);
}
