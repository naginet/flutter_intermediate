import 'dart:async';
import 'dart:math' as math;

class Generator {
  var rand;
  var intStream;
  init(StreamController<int> stream) {
    rand = new math.Random();
    intStream = stream;
  }

  generate() {
    var data = rand.nextInt(100);
    print("generatorが$dataを作ったよ");
    intStream.sink.add(data);
  }
}

class Coordinator {
  var intStream;
  var strStream;
  init(StreamController<int> intStream, StreamController<String> strStream) {
    this.intStream = intStream;
    this.strStream = strStream;
  }

  coorinate() {
    intStream.stream.listen((data) async {
      String newData = data.toString();
      print("coordinatorが$dataから$newDataに変換したよ");
      strStream.sink.add(newData);
    });
  }
}

class Consumer {
  var strStream;
  init(StreamController<String> stream) {
    strStream = stream;
  }

  consume() {
    strStream.stream.listen((data) async {
      print("consumerが$dataを使ったよ");
    });
  }
}
