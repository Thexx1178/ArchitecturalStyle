import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/my_transaction.dart';
import '../providers/transaction_provider.dart';

class AddEditScreen extends StatefulWidget {
  static const routeName = '/add-edit';
  const AddEditScreen({super.key});

  @override
  State<AddEditScreen> createState() => _AddEditScreenState();
}

class _AddEditScreenState extends State<AddEditScreen> {
  final _name = TextEditingController();
  final _era = TextEditingController();
  final _brief = TextEditingController();
  final _tag = TextEditingController();
  final List<String> _tags = [];

  void _save({int? index}) {
    if (_name.text.isEmpty || _era.text.isEmpty || _brief.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('กรอกข้อมูลให้ครบก่อนนะ')),
      );
      return;
    }

    final entity = ArchitectureEntity(
      name: _name.text.trim(),
      era: _era.text.trim(),
      brief: _brief.text.trim(),
      tags: List<String>.from(_tags),
    );

    final provider = context.read<ArchitectureProvider>();
    if (index == null) {
      provider.addEntity(entity);
    } else {
      provider.updateEntity(index, entity);
    }

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    if (args != null && _name.text.isEmpty) {
      final e = args['entity'] as ArchitectureEntity;
      _name.text = e.name;
      _era.text = e.era;
      _brief.text = e.brief;
      _tags.addAll(e.tags);
    }

    final isEdit = args != null;

    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? 'แก้ไขสไตล์' : 'เพิ่มสไตล์')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          TextField(controller: _name, decoration: const InputDecoration(labelText: 'ชื่อสไตล์')),
          const SizedBox(height: 10),
          TextField(controller: _era, decoration: const InputDecoration(labelText: 'ยุค/ช่วงเวลา')),
          const SizedBox(height: 10),
          TextField(controller: _brief, decoration: const InputDecoration(labelText: 'คำอธิบาย')),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(controller: _tag, decoration: const InputDecoration(labelText: 'เพิ่มแท็ก')),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  if (_tag.text.trim().isNotEmpty) {
                    setState(() => _tags.add(_tag.text.trim()));
                    _tag.clear();
                  }
                },
              )
            ],
          ),
          Wrap(
            spacing: 8,
            children: _tags
                .map((t) => InputChip(
                      label: Text(t),
                      onDeleted: () => setState(() => _tags.remove(t)),
                    ))
                .toList(),
          ),
          const SizedBox(height: 20),
          FilledButton.icon(
            onPressed: () => _save(index: args?['index']),
            icon: const Icon(Icons.save),
            label: Text(isEdit ? 'อัปเดต' : 'บันทึก'),
          )
        ],
      ),
    );
  }
}
