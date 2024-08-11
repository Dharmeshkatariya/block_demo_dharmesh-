import 'package:block_demo_dharmesh/core/errors/failures.dart';
import 'package:block_demo_dharmesh/models/subject.dart';
import 'package:fpdart/src/either.dart';
import '../../domain/repository/subject_repository.dart';
import '../data_source/remote/subject_network_db.dart';

class SubjectRepoImpl implements SubjectRepository {
  final SubjectNetworkDb subjectNetworkDb;

  SubjectRepoImpl({required this.subjectNetworkDb});

  @override
  Future<Either<Failure, List<Subject>>> getSubjectBook(
      {int? standardId}) async {
    return await subjectNetworkDb.getSubjectBook(standardId: standardId);
  }

  @override
  Future<Either<Failure, List<Subject>>> getSubjectVideo(
      {int? standardId}) async {
    return await subjectNetworkDb.getSubjectVideo(standardId: standardId);
  }
}
