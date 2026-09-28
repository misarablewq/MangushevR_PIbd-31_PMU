// ignore_for_file: avoid_print

enum HomeworkStatus {
  notDone,
  done,
}

extension HomeworkStatusText on HomeworkStatus {
  String get text {
    if (this == HomeworkStatus.done) {
      return 'Выполнено';
    }

    return 'Не выполнено';
  }
}

class Homework {
  final String subject;
  final String task;
  HomeworkStatus status;

  Homework(
      this.subject,
      this.task, {
        this.status = HomeworkStatus.notDone,
      });

  void complete() {
    status = HomeworkStatus.done;
  }

  void showInfo() {
    print('$subject: $task — ${status.text}');
  }
}

class Storage<T> {
  final List<T> items = [];

  void add(T item) {
    items.add(item);
  }
}

Future<List<Homework>> loadHomework() async {
  print('Загрузка домашних заданий.');

  await Future.delayed(const Duration(seconds: 1));

  return [
    Homework(
      'Мобильная разработка',
      'Выполнить лабораторную работу №2',
    ),
    Homework(
      'Базы данных',
      'Повторить команды SQL',
    ),
    Homework(
      'Английский язык',
      'Выучить новые слова',
    ),
  ];
}

Future<void> main() async {
  final storage = Storage<Homework>();

  final homeworkList = await loadHomework();

  for (final homework in homeworkList) {
    storage.add(homework);
  }

  storage.items[0].complete();

  print('\nВсе домашние задания:');

  for (final homework in storage.items) {
    homework.showInfo();
  }

  final completedHomework = storage.items
      .where((homework) => homework.status == HomeworkStatus.done)
      .toList();

  print('\nКоличество выполненных заданий: '
      '${completedHomework.length}');
}