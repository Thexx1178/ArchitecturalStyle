import 'package:flutter/foundation.dart';
import '../models/my_transaction.dart';

class ArchitectureProvider with ChangeNotifier {
  final List<ArchitectureEntity> _items = [...kSeedEntities];

  List<ArchitectureEntity> get items => List.unmodifiable(_items);

  void addEntity(ArchitectureEntity e) {
    _items.insert(0, e);
    notifyListeners();
  }

  void updateEntity(int index, ArchitectureEntity e) {
    if (index < 0 || index >= _items.length) return;
    _items[index] = e;
    notifyListeners();
  }

  void deleteEntityAt(int index) {
    if (index < 0 || index >= _items.length) return;
    _items.removeAt(index);
    notifyListeners();
  }
}
