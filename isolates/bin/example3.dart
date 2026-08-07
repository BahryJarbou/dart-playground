import 'dart:isolate';
import 'dart:io';
import 'dart:convert';

void main(List<String> args) async {
  final responder = await Responder.create();
  do {
    stdout.write('Say something: ');
    final line = stdin.readLineSync(encoding: utf8);
    switch (line?.trim().toLowerCase()) {
      case null:
        continue;
      case 'exit':
        print('GoodBye!');
        exit(0);
      default:
        final msg = await responder.getMessage(line!);
        print(msg);
    }
  } while (true);
}

class Responder {
  final ReceivePort rp;
  final Stream<dynamic> broadcastRp;
  final SendPort communicatorSendPort;

  Responder({
    required this.rp,
    required this.broadcastRp,
    required this.communicatorSendPort,
  });

  static Future<Responder> create() async {
    final rp = ReceivePort();
    Isolate.spawn(
      _communicator,
      rp.sendPort,
    );

    final broadcastRp = rp.asBroadcastStream();
    final SendPort communicatorSendPort = await broadcastRp.take(1).first;

    return Responder(
      rp: rp,
      broadcastRp: broadcastRp,
      communicatorSendPort: communicatorSendPort,
    );
  }

  Future<String> getMessage(String forGreeting) async {
    communicatorSendPort.send(forGreeting);

    return broadcastRp
        .takeWhile((element) => element is String)
        .cast<String>()
        .first;
  }
}

void _communicator(SendPort sp) async {
  final rp = ReceivePort();
  sp.send(rp.sendPort);
  final messages = rp
      .takeWhile(((element) => element is String))
      .cast<String>();

  await for (final message in messages) {
    var answer = 'I have no response to that!';
    for (final entry in messagesAndResponses.entries) {
      if (entry.key.trim().toLowerCase() == message.trim().toLowerCase()) {
        answer = entry.value;
        break;
      }
    }
    sp.send(answer);
  }
}

const messagesAndResponses = {
  '': 'Ask me a question like "How are you?"',
  'Hello': 'Hi',
  'How are you?': 'Fine',
  'What are you doing?': 'Learning about Isolates in Dart!',
  'Are you having fun?': 'Yeah sure!',
};
