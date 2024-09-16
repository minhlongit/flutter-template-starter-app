import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  int _currentIndex = 0;
  int _currentAuthIndex = 0;
  int _currentDashboardIndex = 0;
  int _currentCalendarIndex = 0;
  int _currentTodoIndex = 0;
  int _currentNotificationsIndex = 0;
  int _currentInboxIndex = 0;
  int get currentIndex => _currentIndex;
  int get currentAuthIndex => _currentAuthIndex;
  int get currentDashboardIndex => _currentDashboardIndex;
  int get currentCalendarIndex => _currentCalendarIndex;
  int get currentTodoIndex => _currentTodoIndex;
  int get currentNotificationsIndex => _currentNotificationsIndex;
  int get currentInboxIndex => _currentInboxIndex;

  void setIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setAuthIndex(int index) {
    _currentAuthIndex = index;
    notifyListeners();
  }

  void setDashboardIndex(int index) {
    _currentDashboardIndex = index;
    notifyListeners();
  }

  void setCalendarIndex(int index) {
    _currentCalendarIndex = index;
    notifyListeners();
  }

  void setTodoIndex(int index) {
    _currentTodoIndex = index;
    notifyListeners();
  }

  void setNotificationsIndex(int index) {
    _currentNotificationsIndex = index;
    notifyListeners();
  }

  void setInboxIndex(int index) {
    _currentInboxIndex = index;
    notifyListeners();
  }
}
