import 'package:block_demo_dharmesh/core/errors/failures.dart';
import 'package:block_demo_dharmesh/features/subject/data/data_source/remote/subject_network_db.dart';
import 'package:block_demo_dharmesh/models/subject.dart';
import 'package:fpdart/src/either.dart';

import '../../../../../core/api_providers/api_service.dart';

class SubjectNetworkDbImpl implements SubjectNetworkDb {
  @override
  Future<Either<Failure, List<Subject>>> getSubjectBook(
      {int? standardId}) async {
    final standard = await API.getSubjectApi(standardId: standardId);
    return standard.fold(
      (failure) => Left(Failure(message: failure)),
      (userDetailsResModel) => Right(userDetailsResModel),
    );
  }

  @override
  Future<Either<Failure, List<Subject>>> getSubjectVideo(
      {int? standardId}) async {
    final standard = await API.getSubjectApi(standardId: standardId);
    return standard.fold(
      (failure) => Left(Failure(message: failure)),
      (userDetailsResModel) => Right(userDetailsResModel),
    );
  }
}
