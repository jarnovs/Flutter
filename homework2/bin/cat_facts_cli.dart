import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

List<String> likedFacts = [];

void main() async {
  print('🐱 Welcome to Cat Facts CLI!');

  while (true) {
    print('\nChoose language:');
    print('1. English');
    print('2. Spanish (try, but not work)');
    print('3. French (try, but not work)');
    stdout.write('Enter number or "exit": ');
    final input = stdin.readLineSync();

    if (input == 'exit') break;

    if (!['1', '2', '3'].contains(input)) {
      print('❌ Invalid input. Try again.');
      continue;
    }

    while (true) {
      final fact = await fetchCatFact();

      print('\nCat Fact: $fact');
      print('\nWhat would you like to do?');
      print('1. Like and get next fact');
      print('2. Skip to next fact');
      print('3. Show liked facts');
      print('4. Clear liked facts');
      print('5. Back to language menu / exit');

      stdout.write('Enter choice: ');
      final choice = stdin.readLineSync();

      switch (choice) {
        case '1':
          likedFacts.add(fact);
          continue;
        case '2':
          continue;
        case '3':
          print('\n❤️ Liked Cat Facts:');
          if (likedFacts.isEmpty) {
            print('(Empty)');
          } else {
            for (int i = 0; i < likedFacts.length; i++) {
              print('${i + 1}. ${likedFacts[i]}');
            }
          }
          break;
        case '4':
          likedFacts.clear();
          print('✅ List cleared.');
          break;
        case '5':
          break;
        default:
          print('❌ Invalid choice.');
      }

      if (choice == '5') break;
    }
  }

  print('\nGoodbye!');
}

Future<String> fetchCatFact() async {
  try {
    final response = await http.get(Uri.parse('https://catfact.ninja/fact'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      return json['fact'];
    } else {
      return 'Error: Unable to fetch fact.';
    }
  } catch (e) {
    return 'Exception: $e';
  }
}
