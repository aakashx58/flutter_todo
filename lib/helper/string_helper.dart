class StringHelper {
  StringHelper._();
  static final StringHelper stringHelper = StringHelper._();

  factory StringHelper() {
    return stringHelper;
  }

  static const String todoApp = 'Todo App';
  static const String someThingWentWrong = 'Something Went Wrong';
  static const String all = 'All';
  static const String todo = 'Todo';
  static const String done = 'Done';
  static const String addTodo = 'Add Todo';
  static const String updateTodo = 'Update Todo';
}
