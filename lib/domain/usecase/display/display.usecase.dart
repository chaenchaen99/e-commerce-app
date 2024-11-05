import 'package:injectable/injectable.dart';

import '../../repository/display.repository.dart';
import '../base/usecase.dart';

//(DisplayUsecase)는 일반적인 유스케이스 실행 컨트롤러로,
//다양한 유스케이스에 DisplayRepository를 주입하고 실행하는 역할을 한다.
@singleton
class DisplayUsecase {
  final DisplayRepository _displayReposioty;

  DisplayUsecase(this._displayReposioty);

  Future execute<T>({required Usecase usecase}) async {
    return await usecase(_displayReposioty);
  }
}
