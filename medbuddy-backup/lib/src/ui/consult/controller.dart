import 'package:get/get.dart';

//getx controller class for state management of chips

class Controller extends GetxController {
  var _selectedSpec = 0.obs;
  get selectedSpec => this._selectedSpec.value;
  set selectedSpec(index) => this._selectedSpec.value = index;
}