import 'package:dartz/dartz.dart';

import '../entities/user_entity.dart';
import '../repository/register.dart';

class SaveUserRegisterUseCase {
  final RegisterRepository registerRepository;
  const SaveUserRegisterUseCase({required this.registerRepository});

  Future<Either<String, void>> call(UserEntity userEntity) async {
    return await registerRepository.saveUserRecord(userEntity);
  }
}