import 'dart:io';

import 'package:data_grab/modules/home/home.dart';
import 'package:excel/excel.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/core.dart';
import '../../delivery/models/responsible_model.dart';

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

  Future<void> exportResponsibleToExcel() async {
    // Recupera os dados da tabela responsible
    List<ResponsibleModel> responsibles =
        await _homeRepository.getCompleteDeliveries();

    var excel = Excel.createExcel();
    var sheet = excel['Responsáveis'];
    excel.delete("Sheet1");

    // Estilo do cabeçalho
    CellStyle headerStyle = CellStyle(
      backgroundColorHex: ExcelColor.white,
      bold: true,
      fontFamily: getFontFamily(FontFamily.Calibri),
    );

    // Cabeçalhos
    List<String> headers = [
      "ID",
      "Número de pessoas na residência", // <--- Alterado aqui
      "Nome do entrevistador",
      "Documento do entrevistador",
      "Nome",
      "Documento",
      "Data de nascimento",
      "Criado em",
      "Sexo",
      "Nacionalidade",
      "Comunidade",
      "CEP",
      "Cidade",
      "Bairro",
      "Rua",
      "Número"
    ];

    for (var col = 0; col < headers.length; col++) {
      var cell =
          sheet.cell(CellIndex.indexByColumnRow(columnIndex: col, rowIndex: 0));
      cell.value = TextCellValue(headers[col]);
      cell.cellStyle = headerStyle;
    }

    int currentRow = 1;

    for (var r in responsibles) {
      List<String?> rowValues = [
        r.id.toString(),
        r.personNumber,
        r.interviewerName,
        r.interviewerDocument,
        r.name,
        r.document,
        r.birthday,
        r.createdAt,
        r.sex,
        r.nationality,
        r.community,
        r.zip,
        r.city,
        r.neighbourhood,
        r.street,
        r.number
      ];

      for (var col = 0; col < rowValues.length; col++) {
        sheet
            .cell(CellIndex.indexByColumnRow(
                columnIndex: col, rowIndex: currentRow))
            .value = TextCellValue(rowValues[col] ?? 'N/I');
      }

      currentRow++;
    }

    // Salva o arquivo temporário
    Directory tempDir = await getTemporaryDirectory();
    String filePath =
        '${tempDir.path}/responsaveis_${DateFormat("yyyy-MM-dd_HH-mm-ss").format(DateTime.now())}.xlsx';
    File(filePath).writeAsBytesSync(excel.save()!);

    await OpenFilex.open(filePath);
  }

  @action
  Future<void> fetchDeliveries() async {
    isLoading = true;
    deliveries.clear();
    await _homeRepository.fetchDeliveries().then((value) {
      List<Delivery> filteredList = value.where((element) {
        var day = DateTime.now().day;
        var date = element.createdAt;
        return date?.day == DateTime.now().day;
      }).toList();
      deliveries.addAll(filteredList);
    });
    isLoading = false;
  }
}
