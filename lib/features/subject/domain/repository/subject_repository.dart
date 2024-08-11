import 'package:fpdart/fpdart.dart';
import '../../../../core/errors/failures.dart';
import '../../../../models/subject.dart';

abstract class SubjectRepository {
  Future<Either<Failure, List<Subject>>> getSubjectBook({int? standardId}) ;
  Future<Either<Failure, List<Subject>>> getSubjectVideo({int? standardId}) ;
}