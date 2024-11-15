import 'package:data_grab/core/json/json.dart';
import 'package:data_grab/modules/delivery/delivery.dart';
import 'package:data_grab/modules/delivery/dtos/save_family_request_dto.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';
import '../models/models.dart';

part 'delivery_controller.g.dart';

class DeliveryController = DeliveryControllerBase with _$DeliveryController;

abstract class DeliveryControllerBase with Store, ControllerLifeCycle {
  final DeliveryRepository _deliveryRepository;
  final UserStore _userStore = Modular.get<UserStore>();

  DeliveryControllerBase({required DeliveryRepository deliveryRepository})
      : _deliveryRepository = deliveryRepository;

  //id INTEGER
  // name TEXT
  // document TEXT
  // birth_day
  // nacinality TEXT
  // marital_status TEXT
  // race TEXT
  // contact TEXT
  // comunity TEXT

  @override
  void onInit([Map<String, dynamic>? params]) {
    loadRaces();
  }

  @observable
  ObservableList<OptionModel> races = ObservableList<OptionModel>();

  @observable
  ObservableList<DependentModel> dependents = ObservableList<DependentModel>();

  @observable
  TextEditingController dependentNameController = TextEditingController();

  @observable
  TextEditingController dependentDocumentController = TextEditingController();

  @observable
  TextEditingController dependentBirthDayController = TextEditingController();


  @observable
  OptionModel? dependentSex;

  @observable
  OptionModel? dependentNationality;

  @observable
  PageController pageController = PageController();

  @observable
  TextEditingController nameController = TextEditingController();

  @observable
  TextEditingController documentController = TextEditingController();

  @observable
  TextEditingController birthDayController = TextEditingController();

  @observable
  TextEditingController nationalityController = TextEditingController();

  @observable
  TextEditingController contactController = TextEditingController();

  @observable
  TextEditingController cepController = TextEditingController();

  @observable
  TextEditingController cityController = TextEditingController();

  @observable
  TextEditingController neighborhoodController = TextEditingController();

  @observable
  TextEditingController addressController = TextEditingController();

  @observable
  OptionModel? race;

  @action
  void setRace(OptionModel? value) {
    race = value;
  }

  @action
  void addDependent() {
    dependents.add(DependentModel(
      birthDay: dependentBirthDayController.text,
      community: dependentNationality!.name,
      document: dependentDocumentController.text,
      name: dependentNameController.text,
      sex: dependentSex!.name,
    ));
  }

  @action
  Future<void> saveFamily() async {

    SaveFamilyRequestDto saveFamilyRequestDto = SaveFamilyRequestDto(
      dependent: dependents,
      responsible: ResponsibleModel(
        birthday: birthDayController.text,
        city: cityController.text,
        community: nationalityController.text,
        document: documentController.text,
        name: nameController.text,
        neighbourhood: neighborhoodController.text,
        nationality: race!.name,
        street: addressController.text, zip: cepController.text,
      ),
    );
    var interviewer = {
      "interviewer_name": _userStore.userModel!.name,
      "interviewer_document": _userStore.userModel!.document,
    };


     await _deliveryRepository.saveFamily(interviewer).then((familyId) {

     },);

  }

  @action
  Future<void> getDependents() async {
    //var list = await _deliveryRepository.getDependents();
    //dependents.addAll(list);
  }

  @action
  Future<void> loadRaces() async {
    var list = RaceMap().data().map(
      (e) {
        return OptionModel(name: e['ethnicity'], id: e['id']);
      },
    );
    races.addAll(list);
  }
}
