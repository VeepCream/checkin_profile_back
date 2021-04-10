import 'package:aqueducttest/aqueducttest.dart';
import 'package:aqueducttest/models/CheckHistoryModel.dart';

class CheckListController extends ResourceController {
  final ManagedContext context;

  CheckListController(this.context);

  @Operation.get('userId')
  Future<Response> checkType(@Bind.path('userId') String userId) async {
    final checkHistoryQuery = Query<CheckHistoryModel>(context)
      ..where((h) => h.userId).equalTo(userId);
    final checkHistorys = await checkHistoryQuery.fetch();

    return Response.ok(checkHistorys);
  }
}
