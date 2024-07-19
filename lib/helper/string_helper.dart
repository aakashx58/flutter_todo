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
  static const String pleaseCheckInternet =
      'Please check your internet connection';
  static const String noTodoFound = 'No Todo Found';
  static const String successfull = 'Successfull';
  static const String addedSuccessfully = 'Added Successfully';
  static const String updatedSuccessfully = 'Updated Successfully';
  static const String deletedSuccessfully = 'Deleted Successfully';
  static const String pleaseEnterTitle = 'Please Enter Title';
  static const String pleaseEnterDescription = 'Please Enter Description';
}
