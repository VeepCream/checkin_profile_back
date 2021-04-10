import '../aqueducttest.dart';

enum StatusCheck { Checkin, Checkout }

class CheckHistoryModel extends ManagedObject<_CheckHistoryModel>
    implements _CheckHistoryModel {}

@Table(name: "CheckHistoryTable")
class _CheckHistoryModel {
  @Column(primaryKey: true)
  int id;

  @Column(indexed: true)
  DateTime dateTime;
  String userId;
  String image;
  Document location;
  StatusCheck statusCheck;
}
