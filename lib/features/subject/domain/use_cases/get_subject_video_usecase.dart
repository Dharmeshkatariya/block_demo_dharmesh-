
import 'package:block_demo_dharmesh/features/subject/domain/repository/subject_repository.dart';
import 'package:block_demo_dharmesh/models/subject.dart';
import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failures.dart';

class GetSubjectVideoUseCase {
  final SubjectRepository subjectRepository;
  GetSubjectVideoUseCase({required this.subjectRepository});

  Future<Either<Failure, List<Subject>>> getSubjectVideo({int? standardId}) async {
    try {
      return await subjectRepository.getSubjectVideo(standardId:standardId );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

}