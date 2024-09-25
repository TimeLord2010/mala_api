class PatientThrottle {
  /// Array of tuples consisting on the time the operation was initialized and
  /// the patient name.
  ///
  /// The patient name was choosen due to the only thing that is present on all
  /// patients, even before inserting it on the disk.
  final List<(DateTime, String)> _operations = [];

  Duration ttl = Duration(seconds: 3);

  /// Registers the given patient name as being processed.
  ///
  /// If the name is still registered and valid before this method is called,
  /// then this method returns false and the name is not saved.
  ///
  /// This method will also remove invalid names from the list.
  bool start(String name) {
    _clean();

    if (_isProcessing(name)) {
      return false;
    }

    _operations.add((DateTime.now(), name));

    return true;
  }

  /// Removes expired names.
  void _clean() {
    var now = DateTime.now();
    for (int i = 0; i < _operations.length; i++) {
      var (creation, name) = _operations[i];
      var timePassed = now.difference(creation);
      if (timePassed > ttl) {
        _operations.removeAt(i--);
      } else {
        break;
      }
    }
  }

  /// Checks if the name is being processed.
  ///
  /// This method should be called after [_clean].
  bool _isProcessing(String name) {
    for (var (_, savedName) in _operations) {
      if (name == savedName) return true;
    }
    return false;
  }
}
