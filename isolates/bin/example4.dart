import 'dart:io';
import 'dart:isolate';
import 'dart:convert';

void main(List<String> args) async {
  final rp = ReceivePort();
  Isolate.spawn(
    _parseJsonIsolateEntry,
    rp.sendPort,
  );

  final todos = rp
      .takeWhile((element) => element is Iterable<Todo>)
      .cast<Iterable<Todo>>()
      .take(1);

  await for (final todos in todos) {
    for (final todo in todos.take(5)) {
      print(todo);
    }
  }
}

void _parseJsonIsolateEntry(SendPort sp) async {
  final client = HttpClient();
  final uri = Uri.parse('https://jsonplaceholder.typicode.com/todos/');

  final todos = await client
      .getUrl(uri)
      .then((req) => req.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((value) => jsonDecode(value) as List<dynamic>)
      .then((json) => json.map((map) => Todo.fromJson(map)));
  sp.send(todos);
}

class Todo {
  final int userid;
  final int id;
  final String title;
  final bool isCompleted;

  Todo({
    required this.userid,
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  Todo.fromJson(Map<String, dynamic> json)
    : userid = json['userId'],
      id = json['id'],
      title = json['title'],
      isCompleted = json['completed'];

  @override
  String toString() =>
      '{\nuserid : $userid,\nid: $id,\ntitle: $title,\nisCompleted: $isCompleted\n}';
}
