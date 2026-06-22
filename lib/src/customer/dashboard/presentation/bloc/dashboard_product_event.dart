abstract class DashboardProductEvent {
  const DashboardProductEvent();
}

class DashboardProductLoad extends DashboardProductEvent {
  const DashboardProductLoad();
}

class DashboardProductSearchChanged extends DashboardProductEvent {
  final String query;
  const DashboardProductSearchChanged(this.query);
}
