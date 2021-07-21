import '../aqueducttest.dart';

enum StatusCheck { Checkin, Checkout }

class CheckHistoryModel extends ManagedObject<_CheckHistoryModel>
    implements _CheckHistoryModel {}

@Table(name: "CheckHistoryTable")
class _CheckHistoryModel {
  @Column(primaryKey: true)
  late int id;

  @Column(indexed: true)
  late DateTime dateTime;
  late String userId;
  late String image;
  late Document location;
  late StatusCheck statusCheck;
}
