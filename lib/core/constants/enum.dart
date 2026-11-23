// ignore_for_file: constant_identifier_names

enum AuthTypeEnum { login, register }

enum UserTypeEnum { user, doctor }

enum GenderEnum { male, female }

enum VerifyTypeEnum { register, forgetPassord }

enum ProudctDetailsTypeEnum { details, related, rate }

/// The order lifecycle, exactly as the backend numbers it:
/// 1 pending → 3 accepted → 4 progress → 8 onTheWay → 7 completed,
/// with 5 rejected and 6 canceled branching off any of the earlier steps.
///
/// [onTheWay] carries the number 8 because it was added after the rest; the
/// numbers live in thousands of stored rows and are never renumbered.
enum OrderStatusEnum {
  pending,
  accepted,
  progress,
  onTheWay,
  completed,

  rejected,
  canceled,
}

extension OrderStatusEnumExt on OrderStatusEnum {
  /// Maps to the API status values (PENDING=1 … COMPLETED=7, ON_THE_WAY=8)
  int get apiValue {
    switch (this) {
      case OrderStatusEnum.pending:
        return 1;
      case OrderStatusEnum.accepted:
        return 3;
      case OrderStatusEnum.progress:
        return 4;
      case OrderStatusEnum.rejected:
        return 5;
      case OrderStatusEnum.canceled:
        return 6;
      case OrderStatusEnum.completed:
        return 7;
      case OrderStatusEnum.onTheWay:
        return 8;
    }
  }

  /// Returns the i18n key used for this status.
  String get translationKey {
    switch (this) {
      case OrderStatusEnum.pending:
        return 'pending';
      case OrderStatusEnum.accepted:
        return 'accepted';
      case OrderStatusEnum.progress:
        return 'progress';
      case OrderStatusEnum.onTheWay:
        return 'on_the_way';
      case OrderStatusEnum.rejected:
        return 'rejected';
      case OrderStatusEnum.canceled:
        return 'canceled';
      case OrderStatusEnum.completed:
        return 'completed';
    }
  }

  /// Whether this status means the order is still cancellable.
  bool get isCancellable =>
      this == OrderStatusEnum.accepted || this == OrderStatusEnum.pending;

  /// Whether this status represents a terminal failure.
  bool get isTerminated =>
      this == OrderStatusEnum.canceled || this == OrderStatusEnum.rejected;

  /// Parses whatever the API sends for a status — the numeric value ("8") or
  /// the constant name, case-insensitively. Falls back to
  /// [OrderStatusEnum.pending] for values this app doesn't know.
  static OrderStatusEnum fromString(String? s) {
    switch ((s ?? '').trim().toLowerCase()) {
      case '3':
      case 'accepted':
        return OrderStatusEnum.accepted;
      case '4':
      case 'progress':
      case 'in_progress':
      case 'started':
        return OrderStatusEnum.progress;
      case '8':
      case 'on_the_way':
      case 'on the way':
      case 'ontheway':
      case 'on_way':
      case 'on way':
        return OrderStatusEnum.onTheWay;
      case '5':
      case 'rejected':
        return OrderStatusEnum.rejected;
      case '6':
      case 'canceled':
      case 'cancelled':
        return OrderStatusEnum.canceled;
      case '7':
      case 'completed':
      case 'delivered':
        return OrderStatusEnum.completed;
      case '1':
      case 'pending':
      default:
        return OrderStatusEnum.pending;
    }
  }
}

/// The statuses bundled together under [OrderFilterEnum.ongoing] — everything
/// from placed to out-for-delivery.
const List<OrderStatusEnum> ongoingOrderStatuses = [
  OrderStatusEnum.pending,
  OrderStatusEnum.accepted,
  OrderStatusEnum.progress,
  OrderStatusEnum.onTheWay,
];

/// Filter chips on the orders screen. Distinct from [OrderStatusEnum] because
/// one chip can stand for several statuses at once.
enum OrderFilterEnum { ongoing, completed, rejected, canceled }

extension OrderFilterEnumExt on OrderFilterEnum {
  /// Comma separated API status values, e.g. `1,2,3,4,8` for [ongoing].
  String get apiValue {
    switch (this) {
      case OrderFilterEnum.ongoing:
        return ongoingOrderStatuses.map((s) => s.apiValue).join(',');
      case OrderFilterEnum.completed:
        return '${OrderStatusEnum.completed.apiValue}';
      case OrderFilterEnum.rejected:
        return '${OrderStatusEnum.rejected.apiValue}';
      case OrderFilterEnum.canceled:
        return '${OrderStatusEnum.canceled.apiValue}';
    }
  }

  /// Returns the i18n key used for this filter.
  String get translationKey {
    switch (this) {
      case OrderFilterEnum.ongoing:
        return 'ongoing';
      case OrderFilterEnum.completed:
        return 'completed';
      case OrderFilterEnum.rejected:
        return 'rejected';
      case OrderFilterEnum.canceled:
        return 'canceled';
    }
  }
}

/// The two tabs on the scheduled-orders list. A scheduler is either still
/// running or has been cancelled — there is nothing in between.
enum SchedulerFilterEnum { active, canceled }

extension SchedulerFilterEnumExt on SchedulerFilterEnum {
  /// The `active` flag the list endpoint filters on.
  int get apiValue => this == SchedulerFilterEnum.active ? 1 : 0;

  /// Returns the i18n key used for this tab.
  String get translationKey =>
      this == SchedulerFilterEnum.active ? 'active' : 'canceled';
}

/// What the customer is complaining about. The API expects the numeric
/// [apiValue] (1=delivery delay … 5=other).
enum ComplaintTypeEnum {
  deliveryDelay,
  wrongProducts,
  priceMismatch,
  badBehavior,
  other,
}

extension ComplaintTypeEnumExt on ComplaintTypeEnum {
  int get apiValue {
    switch (this) {
      case ComplaintTypeEnum.deliveryDelay:
        return 1;
      case ComplaintTypeEnum.wrongProducts:
        return 2;
      case ComplaintTypeEnum.priceMismatch:
        return 3;
      case ComplaintTypeEnum.badBehavior:
        return 4;
      case ComplaintTypeEnum.other:
        return 5;
    }
  }

  String get translationKey {
    switch (this) {
      case ComplaintTypeEnum.deliveryDelay:
        return 'complaint_delivery_delay';
      case ComplaintTypeEnum.wrongProducts:
        return 'complaint_wrong_products';
      case ComplaintTypeEnum.priceMismatch:
        return 'complaint_price_mismatch';
      case ComplaintTypeEnum.badBehavior:
        return 'complaint_bad_behavior';
      case ComplaintTypeEnum.other:
        return 'complaint_other';
    }
  }

  /// Falls back to [ComplaintTypeEnum.other] for values this app doesn't know.
  static ComplaintTypeEnum fromApi(int? value) {
    switch (value) {
      case 1:
        return ComplaintTypeEnum.deliveryDelay;
      case 2:
        return ComplaintTypeEnum.wrongProducts;
      case 3:
        return ComplaintTypeEnum.priceMismatch;
      case 4:
        return ComplaintTypeEnum.badBehavior;
      default:
        return ComplaintTypeEnum.other;
    }
  }
}

/// Where the complaint stands with support: sent → read → replied.
enum ComplaintStatusEnum { sent, read, replied }

extension ComplaintStatusEnumExt on ComplaintStatusEnum {
  String get translationKey {
    switch (this) {
      case ComplaintStatusEnum.sent:
        return 'complaint_status_sent';
      case ComplaintStatusEnum.read:
        return 'complaint_status_read';
      case ComplaintStatusEnum.replied:
        return 'complaint_status_replied';
    }
  }

  /// Accepts both the numeric (1/2/3) and the textual status the API may send.
  /// Unknown values read as [ComplaintStatusEnum.sent] — the complaint reached
  /// us, we just can't say more about it.
  static ComplaintStatusEnum fromApi(String? value) {
    switch ((value ?? '').toLowerCase()) {
      case '2':
      case 'read':
      case 'seen':
      case 'opened':
        return ComplaintStatusEnum.read;
      case '3':
      case 'replied':
      case 'answered':
      case 'closed':
        return ComplaintStatusEnum.replied;
      default:
        return ComplaintStatusEnum.sent;
    }
  }
}

enum PaymentWayEnum { cash, ePayment }

enum PayWayEnum { once, recurring }

enum DaysEnum { saturday, sunday, monday, tuesday, wednesday, thursday, friday }

extension DaysEnumExt on DaysEnum {
  /// Maps to the API day_of_week values (SATURDAY=1 … FRIDAY=7)
  int get apiValue {
    switch (this) {
      case DaysEnum.saturday:
        return 1;
      case DaysEnum.sunday:
        return 2;
      case DaysEnum.monday:
        return 3;
      case DaysEnum.tuesday:
        return 4;
      case DaysEnum.wednesday:
        return 5;
      case DaysEnum.thursday:
        return 6;
      case DaysEnum.friday:
        return 7;
    }
  }

  /// Parses the API day_of_week value, null for anything unexpected.
  static DaysEnum? fromApi(int? value) {
    switch (value) {
      case 1:
        return DaysEnum.saturday;
      case 2:
        return DaysEnum.sunday;
      case 3:
        return DaysEnum.monday;
      case 4:
        return DaysEnum.tuesday;
      case 5:
        return DaysEnum.wednesday;
      case 6:
        return DaysEnum.thursday;
      case 7:
        return DaysEnum.friday;
      default:
        return null;
    }
  }
}

enum PolicyTypeEnum { use, privacy }

/// Who wrote a message in an order chat.
///
/// The role is frozen with the message: moving a driver, deleting their
/// account or promoting them must never rewrite who said what.
enum ChatRoleEnum { customer, driver, admin }

extension ChatRoleEnumExt on ChatRoleEnum {
  /// The i18n key naming this role, used when a message carries no sender
  /// name of its own.
  String get translationKey {
    switch (this) {
      case ChatRoleEnum.customer:
        return 'you';
      case ChatRoleEnum.driver:
        return 'driver';
      case ChatRoleEnum.admin:
        return 'admin';
    }
  }

  /// Reads the API's `role`. Anything unrecognised is treated as the
  /// dashboard, which is the only side that can write without being one of
  /// the two parties on the order.
  static ChatRoleEnum fromString(String? s) {
    switch ((s ?? '').trim().toLowerCase()) {
      case 'customer':
      case 'client':
        return ChatRoleEnum.customer;
      case 'driver':
      case 'captain':
        return ChatRoleEnum.driver;
      default:
        return ChatRoleEnum.admin;
    }
  }
}
