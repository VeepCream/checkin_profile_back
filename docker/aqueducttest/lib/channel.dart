import 'aqueducttest.dart';
import 'package:conduit/managed_auth.dart';
import 'controllers/CheckController.dart';
import 'controllers/CheckListController.dart';
import 'controllers/Register_controller.dart';

import 'models/User.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
class AqueducttestChannel extends ApplicationChannel {
  late ManagedContext context;

  late AuthServer authServer;

  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "postgres", "vee123456", "127.0.0.1", 65432, "checkin_profile");

    context = ManagedContext(dataModel, persistentStore);

    final delegate = ManagedAuthDelegate<User>(context);
    authServer = AuthServer(delegate);

  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    // Prefer to use `link` instead of `linkFunction`.
    // See: https://aqueduct.io/docs/http/request_controller/
    router.route("/example").linkFunction((request) async {
      return Response.ok({"key": "value"});
    });
    router.route("/check/[:typeCheck]").link(() => CheckController(context));
    router
        .route("/checkList/[:userId]")
        .link(() => CheckListController(context));

    router.route('/auth/token').link(() => AuthController(authServer));

    router
        .route('/register')
        .link(() => RegisterController(context, authServer));

    return router;
  }
}
