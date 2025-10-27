// lib/screens/transaction_list_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/transaction_provider.dart';   // ArchitectureProvider
import '../models/my_transaction.dart';           // ArchitectureEntity
import 'add_edit_screen.dart';
import 'webview_screen.dart';                     // ✅ เปิดค้นหาในแอป

class TransactionListScreen extends StatefulWidget {
  static const routeName = '/';
  const TransactionListScreen({super.key});

  @override
  State<TransactionListScreen> createState() => _TransactionListScreenState();
}

class _TransactionListScreenState extends State<TransactionListScreen> {
  String _query = '';

  // 🎯 Auto-detect Emoji จากชื่อ/คำอธิบาย/แท็ก (ไทย+อังกฤษ)
  String _emojiForStyle(ArchitectureEntity e) {
    final name = e.name.toLowerCase();
    final brief = e.brief.toLowerCase();
    final tags = e.tags.map((t) => t.toLowerCase()).join(' ');
    final text = '$name $brief $tags';

    bool has(Iterable<String> keys) =>
        keys.any((k) => text.contains(k.toLowerCase()));

    // — Classic families
    if (has(['classical', 'กรีก', 'โรมัน', 'doric', 'ionic', 'corinthian', 'orders', 'pediment', 'เสา', 'สมมาตร'])) {
      return '🏛️';
    }
    if (has(['romanesque', 'โรมานสก์', 'round arch', 'ผนังหนา'])) {
      return '🧱';
    }
    if (has(['gothic', 'โกธิค', 'pointed arch', 'buttress', 'flying buttress', 'stained glass'])) {
      return '⛪';
    }
    if (has(['renaissance', 'เรอเนสซองส์'])) {
      return '🎨';
    }
    if (has(['baroque', 'บาโรก', 'rococo', 'curve', 'โค้ง', 'drama', 'อลังการ'])) {
      return '🎭';
    }
    if (has(['neoclassical', 'นีโอคลาสสิก'])) {
      return '🏛️';
    }

    // — Modern families
    if (has(['international style', 'international', 'glass box', 'curtain wall', 'grid'])) {
      return '🏢';
    }
    if (has(['modernism', 'modern', 'minimal', 'form follows function', 'ไม่มี ornament', 'เรียบ'])) {
      return '🏙️';
    }
    if (has(['brutalism', 'บรูทัล', 'béton brut', 'คอนกรีต', 'concrete', 'มวลหนัก'])) {
      return '🧱';
    }
    if (has(['postmodern', 'post-modern', 'post modern', 'ย้อนแซว', 'ornament returns', 'irony', 'สีสัน'])) {
      return '🌈';
    }

    // — Contemporary / Thematic
    if (has(['deconstructivism', 'decon', 'ซ้อนบิด', 'แตกสลาย', 'ฉีกกรอบ'])) {
      return '🧩';
    }
    if (has(['parametric', 'พาราเมตริก'])) {
      return '🌀';
    }
    if (has(['futurism', 'futurist', 'อนาคต'])) {
      return '🚀';
    }
    if (has(['high-tech', 'high tech', 'ไฮเทค', 'exposed structure', 'โครงสร้างเปลือย'])) {
      return '🛠️';
    }
    if (has(['eco', 'green', 'sustainable', 'sustainability', 'biophilic', 'bio', 'ธรรมชาติ', 'สีเขียว', 'สิ่งแวดล้อม'])) {
      return '🌿';
    }
    if (has(['organic', 'ออร์แกนิก', 'wright', 'เกาส์'])) {
      return '🍃';
    }
    if (has(['digital', 'computational', 'algorithmic', 'ดิจิทัล'])) {
      return '💻';
    }
    if (has(['industrial', 'อุตสาหกรรม', 'factory'])) {
      return '🏭';
    }
    if (has(['vernacular', 'พื้นถิ่น', 'local'])) {
      return '🏠';
    }
    if (has(['japanese', 'ญี่ปุ่น', 'zen', 'wabi-sabi'])) {
      return '🏯';
    }
    if (has(['islamic', 'อิสลาม', 'mashrabiya', 'muqarnas'])) {
      return '🕌';
    }
    if (has(['byzantine', 'ไบแซนไทน์', 'mosaic', 'dome'])) {
      return '🛕';
    }

    // — Fallback
    return '🏗️';
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<ArchitectureProvider>();
    final all = provider.items;
    final items = all.where((e) {
      final q = _query.trim().toLowerCase();
      if (q.isEmpty) return true;
      return e.name.toLowerCase().contains(q)
          || e.era.toLowerCase().contains(q)
          || e.brief.toLowerCase().contains(q)
          || e.tags.any((t) => t.toLowerCase().contains(q));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏛️ Architectural Style'),
        actions: [
          if (_query.isNotEmpty)
            IconButton(
              tooltip: 'ล้างคำค้น',
              icon: const Icon(Icons.clear),
              onPressed: () => setState(() => _query = ''),
            ),
        ],
      ),
      body: Column(
        children: [
          // 🔎 ค้นหา
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา: ชื่อ / คีย์เวิร์ด / ยุค',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),

          // ตัวนับผลลัพธ์
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'พบ ${items.length} สไตล์',
                style: const TextStyle(fontSize: 12),
              ),
            ),
          ),

          // 🗂️ รายการการ์ด
          Expanded(
            child: items.isEmpty
                ? const Center(child: Text('ไม่พบข้อมูล'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: items.length,
                    itemBuilder: (context, i) {
                      final e = items[i];
                      final realIndex = all.indexOf(e);
                      if (realIndex < 0) return const SizedBox.shrink();

                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ExpansionTile(
                          leading: CircleAvatar(
                            backgroundColor: Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.08),
                            child: Text(
                              _emojiForStyle(e),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                          title: Text(
                            e.name,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(e.brief),
                          childrenPadding:
                              const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.timeline, size: 16),
                                const SizedBox(width: 6),
                                Text(
                                  e.era,
                                  style: const TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              children: e.tags
                                  .map((t) => Chip(
                                        label: Text(t),
                                        backgroundColor: Theme.of(context)
                                            .colorScheme
                                            .primary
                                            .withOpacity(0.1),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 12),

                            // ✅ ปุ่มไอคอนเท่านั้น (พอดีทุกหน้าจอ)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  tooltip: 'แก้ไข',
                                  icon: const Icon(Icons.edit_outlined,
                                      color: Colors.indigo),
                                  onPressed: () {
                                    Navigator.pushNamed(
                                      context,
                                      AddEditScreen.routeName,
                                      arguments: {
                                        'index': realIndex,
                                        'entity': e
                                      },
                                    );
                                  },
                                ),
                                IconButton(
                                  tooltip: 'ค้นหาใน ArchDaily',
                                  icon: const Icon(Icons.search,
                                      color: Colors.indigo),
                                  onPressed: () {
                                    final keyword =
                                        Uri.encodeComponent(e.name);
                                    final url =
                                        'https://www.archdaily.com/search/projects?q=$keyword';
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => WebViewScreen(
                                          title: e.name,
                                          url: url,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                IconButton(
                                  tooltip: 'ลบ',
                                  icon: const Icon(Icons.delete_outline,
                                      color: Colors.redAccent),
                                  onPressed: () {
                                    context
                                        .read<ArchitectureProvider>()
                                        .deleteEntityAt(realIndex);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),

      // ➕ เพิ่มสไตล์ใหม่
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () =>
            Navigator.pushNamed(context, AddEditScreen.routeName),
        icon: const Icon(Icons.add),
        label: const Text('เพิ่มสไตล์'),
      ),
    );
  }
}
