import 'dart:io';

import 'package:data_grab/modules/home/home.dart';
import 'package:data_grab/modules/home/models/person_model.dart';
import 'package:excel/excel.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
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

  Future<void> exportAllDeliveryDataToExcel() async {
    // Criação do arquivo Excel

    var deliveries = await _homeRepository.getCompleteDeliveries();

    var excel = Excel.createExcel();
    var sheet = excel['Entregas'];
    excel.delete("Sheet1");

    // Estilização para cabeçalho
    CellStyle headerStyle = CellStyle(
      backgroundColorHex: ExcelColor.white,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    // Adiciona o cabeçalho
    List<String> headers = [
      "cpf titular",
      "nome",
      "documento",
      "data de nascimento",
      "sexo",
      "nacionalidade",
      "parentesco",
      "comunidade",
      "cep",
      "cidade",
      "bairro",
      "rua",
      "numero",
      "nome do entrevistador",
      "documento do entrevistador",
      "data de criação"
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
    for (DeliveryExportModel delivery in deliveries) {
      for (PersonModel child in delivery.children) {
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 0, rowIndex: currentRow))
            .value = TextCellValue(delivery.children.firstWhere((element) {
              return element.isParent == 1;
            },).document ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 1, rowIndex: currentRow))
            .value = TextCellValue(child.name ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 2, rowIndex: currentRow))
            .value = TextCellValue(child.document ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 3, rowIndex: currentRow))
            .value = TextCellValue(child.birthday ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 4, rowIndex: currentRow))
            .value = TextCellValue(child.sex ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 5, rowIndex: currentRow))
            .value = TextCellValue(child.nationality ?? 'N/I');
        sheet
                .cell(CellIndex.indexByColumnRow(
                    columnIndex: 6, rowIndex: currentRow))
                .value =
            TextCellValue(child.isParent == 1 ? "Responsável" : "Dependente");
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 7, rowIndex: currentRow))
            .value = TextCellValue(child.community ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 8, rowIndex: currentRow))
            .value = TextCellValue(child.zip ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 9, rowIndex: currentRow))
            .value = TextCellValue(child.city ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 10, rowIndex: currentRow))
            .value = TextCellValue(child.neighborhood ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 11, rowIndex: currentRow))
            .value = TextCellValue(child.street ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 12, rowIndex: currentRow))
            .value = TextCellValue(child.number ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 13, rowIndex: currentRow))
            .value = TextCellValue(delivery.interviewerName ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 14, rowIndex: currentRow))
            .value = TextCellValue(delivery.interviewerDocument ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 15, rowIndex: currentRow))
            .value = TextCellValue(delivery.createdAt ?? 'N/I');
        currentRow++;
      }
    }

    // Salva o arquivo temporário
    Directory tempDir = await getTemporaryDirectory();
    String filePath =
        '${tempDir.path}/${Modular.get<UserStore>().userModel?.name}${DateFormat("yyyy-MM-dd_HH-mm-ss").format(DateTime.now())}.xlsx';
    File(filePath).writeAsBytesSync(excel.save()!);

    await OpenFilex.open(filePath);
  }

  Future<void> exportFilteredDeliveryDataToExcel() async {
    // Criação do arquivo Excel

    var deliveries = await _homeRepository.getCompleteDeliveries();

    var excel = Excel.createExcel();
    var sheet = excel['Entregas'];
    excel.delete("Sheet1");

    // Estilização para cabeçalho
    CellStyle headerStyle = CellStyle(
      backgroundColorHex: ExcelColor.white,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    // Adiciona o cabeçalho
    List<String> headers = [
      "cpf titular",
      "nome",
      "documento",
      "data de nascimento",
      "sexo",
      "nacionalidade",
      "parentesco",
      "comunidade",
      "cep",
      "cidade",
      "bairro",
      "rua",
      "numero",
      "nome do entrevistador",
      "documento do entrevistador",
      "data de criação"
    ];

    for (var col = 0; col < headers.length; col++) {
      var cell =
          sheet.cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0));
      cell.value = TextCellValue(headers[col]);
      cell.cellStyle = headerStyle;
    }

    // Adiciona os dados
    int currentRow = 1;

    var filteredDeliveries = deliveries.where(
      (element) {
        var day = DateTime.now().day;
        var date = DateTime.parse(element.createdAt!);
        return date.day == DateTime.now().day;
      },
    ).toList();

    // Itera sobre as entregas e preenche os dados
    for (DeliveryExportModel delivery in filteredDeliveries) {
      for (PersonModel child in delivery.children) {
        sheet
            .cell(CellIndex.indexByColumnRow(
            columnIndex: 0, rowIndex: currentRow))
            .value = TextCellValue(delivery.children.firstWhere((element) {
          return element.isParent == 1;
        },).document ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 1, rowIndex: currentRow))
            .value = TextCellValue(child.name ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 2, rowIndex: currentRow))
            .value = TextCellValue(child.document ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 3, rowIndex: currentRow))
            .value = TextCellValue(child.birthday ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 4, rowIndex: currentRow))
            .value = TextCellValue(child.sex ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 5, rowIndex: currentRow))
            .value = TextCellValue(child.nationality ?? 'N/I');
        sheet
                .cell(CellIndex.indexByColumnRow(
                    columnIndex: 6, rowIndex: currentRow))
                .value =
            TextCellValue(child.isParent == 1 ? "Responsável" : "Dependente");
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 7, rowIndex: currentRow))
            .value = TextCellValue(child.community ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 8, rowIndex: currentRow))
            .value = TextCellValue(child.zip ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 9, rowIndex: currentRow))
            .value = TextCellValue(child.city ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 10, rowIndex: currentRow))
            .value = TextCellValue(child.neighborhood ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 11, rowIndex: currentRow))
            .value = TextCellValue(child.street ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 12, rowIndex: currentRow))
            .value = TextCellValue(child.number ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 13, rowIndex: currentRow))
            .value = TextCellValue(delivery.interviewerName ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 14, rowIndex: currentRow))
            .value = TextCellValue(delivery.interviewerDocument ?? 'N/I');
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: 15, rowIndex: currentRow))
            .value = TextCellValue(delivery.createdAt ?? 'N/I');
        currentRow++;
      }
    }

    // Salva o arquivo temporário
    Directory tempDir = await getTemporaryDirectory();
    String filePath =
        '${tempDir.path}/${Modular.get<UserStore>().userModel?.name}${DateFormat("yyyy-MM-dd_HH-mm-ss").format(DateTime.now())}.xlsx';
    File(filePath).writeAsBytesSync(excel.save()!);

    await OpenFilex.open(filePath);
  }

  @action
  Future<void> fetchDeliveries() async {
    isLoading = true;
    deliveries.clear();
    await _homeRepository.fetchDeliveries().then((value) {
      List<Delivery>filteredList = value.where((element) {
        var day = DateTime.now().day;
        var date = element.createdAt;
        return date?.day == DateTime.now().day;
      }).toList();
      deliveries.addAll(filteredList);
    });
    isLoading = false;
  }
}
