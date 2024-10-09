import 'package:data_grab/modules/home/home.dart';
import 'package:mobx/mobx.dart';

import '../../../core/core.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  final HomeRepository _homeRepository;

  HomeControllerBase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  ObservableList<Delivery> deliveries = ObservableList<Delivery>();

  @observable
  bool isLoading = false;

  @action
  Future<void> fetchDeliveries() async {
    isLoading = true;
    deliveries.clear();
    await _homeRepository.fetchDeliveries().then((value) {
      deliveries.addAll(value);
    });
    isLoading = false;
  }
}
