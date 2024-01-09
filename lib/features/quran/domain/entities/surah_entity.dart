import 'package:elresala/features/quran/domain/entities/ayah_entity.dart';

class Surah {
  final String name;
  final List<Ayah> ayat;

  const Surah({
    required this.name,
    required this.ayat,
  });
}
