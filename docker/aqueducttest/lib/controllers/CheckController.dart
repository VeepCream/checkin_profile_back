import 'package:aqueducttest/aqueducttest.dart';
import 'package:aqueducttest/models/CheckHistoryModel.dart';

class CheckController extends ResourceController {
  final ManagedContext context;

  CheckController(this.context);

  final _heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

  @Operation.post('typeCheck')
  Future<Response> checkType(
      @Bind.path('typeCheck')
          String typeCheck,
      @Bind.body(ignore: ["id"])
          CheckHistoryModel inputCheckHistoryModel) async {
    StatusCheck type = StatusCheck.Checkin;
    if (typeCheck.toUpperCase() == "CHECKOUT") {
      type = StatusCheck.Checkout;
    }

    // StatusCheck type =
    //     StatusCheck.values.firstWhere((e) => e.toString() == typeCheck);

    //final Map<String, dynamic> body = await request.body.decode();
    //
    //

    inputCheckHistoryModel.dateTime = DateTime.now();
    inputCheckHistoryModel.statusCheck = type;
    inputCheckHistoryModel.userId = "veee";

    print(inputCheckHistoryModel.asMap().toString());
    final query = Query<CheckHistoryModel>(context)
      ..values = inputCheckHistoryModel;

    final insertedCheckHistoryModel = await query.insert();

    return Response.ok(insertedCheckHistoryModel);
  }
}
