import '../models/meta.dart';

abstract class MetaDto<L> {

  final Meta meta;
  final List<L> list;
  MetaDto({required this.meta, required this.list});

}