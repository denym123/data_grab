import 'dart:io';

import 'package:data_grab/modules/home/home.dart';
import 'package:excel/excel.dart';
import 'package:mobx/mobx.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/core.dart';
import '../models/delivery_export_model.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store, ControllerLifeCycle {
  final HomeRepository _homeRepository;

  HomeControllerBase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  @override
  void onInit([Map<String, dynamic>? params]) {
    fetchDeliveries();
  }

  ObservableList<Delivery> deliveries = ObservableList<Delivery>();

  @observable
  bool isLoading = false;

  Future<void> exportDeliveryDataToExcel() async {
    // Criação do arquivo Excel

    var deliveries = await _homeRepository.getCompleteDeliveries();

    var excel = Excel.createExcel();
    var sheet = excel['Deliveries'];

    // Estilização para cabeçalho
    CellStyle headerStyle = CellStyle(
      backgroundColorHex: ExcelColor.white,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    // Adiciona o cabeçalho
    List<String> headers = [
      "familia id",
      "nome",
      "documento",
      "data de nascimento",
      "sexo",
      "parentesco",
      "etnia",
      "comunidade",
      "cep",
      "cidade",
      "bairro",
      "rua"
    ];

    for (var col = 0; col < headers.length; col++) {
      var cell =
          sheet.cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0));
      cell.value = TextCellValue(headers[col]);
      cell.cellStyle = headerStyle;
    }

    // Adiciona os dados
    int currentRow = 1;

    // Itera sobre as entregas e preenche os dados
    for (var delivery in deliveries) {
      for (var child in delivery.children) {
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 0, rowIndex: currentRow))
            .value = TextCellValue(delivery.familyId.toString());
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 1, rowIndex: currentRow))
            .value = TextCellValue(child.name ?? '');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 2, rowIndex: currentRow))
            .value = TextCellValue(child.document ?? '');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 3, rowIndex: currentRow))
            .value = TextCellValue(child.sex ?? '');
        sheet
                .cell(CellIndex.indexByColumnRow(
                    columnIndex: 4, rowIndex: currentRow))
                .value =
            TextCellValue(child.isParent == 1 ? "Responsável" : "Dependente");
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 5, rowIndex: currentRow))
            .value = TextCellValue(child.community ?? '');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 7, rowIndex: currentRow))
            .value = TextCellValue(child.zip ?? '');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 8, rowIndex: currentRow))
            .value = TextCellValue(child.city ?? '');
        sheet
            .cell(CellIndex.indexByColumnRow(
            columnIndex: 8, rowIndex: currentRow))
            .value = TextCellValue(child.street ?? '');

        currentRow++;
      }
    }

    // Salva o arquivo temporário
    Directory tempDir = await getTemporaryDirectory();
    String filePath = '${tempDir.path}/deliveries_data.xlsx';
    File(filePath).writeAsBytesSync(excel.save()!);

    await OpenFilex.open(filePath);
  }

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
