import 'package:aqueducttest/aqueducttest.dart';

class CheckAllController extends Controller {
  final ManagedContext context;

  CheckAllController(this.context);
  final _heroes = [
    {'id': 11, 'name': 'Mr. Nice'},
    {'id': 12, 'name': 'Narco'},
    {'id': 13, 'name': 'Bombasto'},
    {'id': 14, 'name': 'Celeritas'},
    {'id': 15, 'name': 'Magneta'},
  ];

  @override
  FutureOr<RequestOrResponse> handle(Request request) {
    // TODO: implement handle
    throw Response.ok(_heroes);
  }
}
