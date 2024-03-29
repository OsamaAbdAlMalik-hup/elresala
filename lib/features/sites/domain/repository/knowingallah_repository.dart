import 'package:dartz/dartz.dart';
import 'package:elresala/core/errors/failures.dart';
import 'package:elresala/features/sites/domain/entities/fixed_entities.dart';
import 'package:elresala/features/sites/domain/entities/knowingallah_entities.dart';


 abstract class KnowingAllahRepository {
   
  Future<Either<Failure,  List<FixedEntities>>> getBook();
   Future<Either<Failure, List<KnowingAllahEntity>>> getContent();
 
}