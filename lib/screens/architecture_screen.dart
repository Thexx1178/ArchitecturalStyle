import 'package:flutter/material.dart';

class ArchitectureStyle {
  final String name;
  final String brief;
  final List<String> hallmarks; // คุณลักษณะเด่น
  final String era;             // ยุค/ช่วงเวลา
  final List<String> keywords;  // คีย์เวิร์ดช่วยค้น

  ArchitectureStyle({
    required this.name,
    required this.brief,
    required this.hallmarks,
    required this.era,
    required this.keywords,
  });
}

// ─────────────────────────────────────────────────────────────────────────────
// ชุดข้อมูลสไตล์ยอดนิยม 10 แบบ (เพิ่ม/แก้ไขได้ตามต้องการ)
final List<ArchitectureStyle> kStyles = [
  ArchitectureStyle(
    name: 'Classical Architecture',
    brief: 'แบบกรีก–โรมัน เน้นเสาและสมมาตร เช่น Doric, Ionic, Corinthian',
    hallmarks: ['เสาและฐานเสา (Orders)', 'สัดส่วน–สมมาตร', 'หน้าบัน (Pediment)'],
    era: 'กรีก–โรมันโบราณ',
    keywords: ['Greek', 'Roman', 'Doric', 'Ionic', 'Corinthian', 'สมมาตร', 'เสา'],
  ),
  ArchitectureStyle(
    name: 'Romanesque',
    brief: 'โค้งครึ่งวงกลม ผนังหนาหนัก ช่องเปิดเล็ก ให้ความรู้สึกมั่นคง',
    hallmarks: ['โค้งครึ่งวงกลม', 'ผนังหนา', 'คูหา/ช่องเปิดเล็ก'],
    era: 'คริสต์ศตวรรษที่ 9–12 (ยุคกลางตอนต้น)',
    keywords: ['โค้งครึ่งวงกลม', 'หนา', 'คูหาเล็ก', 'ยุคกลาง'],
  ),
  ArchitectureStyle(
    name: 'Gothic',
    brief: 'โค้งแหลม หน้าต่างกระจกสีสูงชะลูด มี Flying Buttress',
    hallmarks: ['โค้งแหลม (Pointed Arch)', 'Flying Buttress', 'หน้าต่างกระจกสี'],
    era: 'คริสต์ศตวรรษที่ 12–16',
    keywords: ['Pointed Arch', 'Buttress', 'Cathedral', 'กระจกสี'],
  ),
  ArchitectureStyle(
    name: 'Renaissance',
    brief: 'คืนค่าสัดส่วนคลาสสิก เน้นสมมาตร โดม/เพดิเมนต์กลับมา',
    hallmarks: ['สัดส่วนคลาสสิก', 'สมมาตร', 'โดม', 'เพดิเมนต์'],
    era: 'ศตวรรษที่ 15–16 (อิตาลี–ยุโรป)',
    keywords: ['Humanism', 'สมมาตร', 'Dome', 'Classical Revival'],
  ),
  ArchitectureStyle(
    name: 'Baroque',
    brief: 'อลังการ โค้งไหลลื่น แสง–เงาดรามาติก',
    hallmarks: ['เส้นโค้งพลิ้ว', 'องค์ประกอบซ้อนชั้น', 'ลูกเล่นแสงเงา'],
    era: 'ปลายศตวรรษที่ 16–18',
    keywords: ['Drama', 'Curve', 'Grand', 'อลังการ'],
  ),
  ArchitectureStyle(
    name: 'Neoclassical',
    brief: 'เรียบ สุขุม ย้อนอ้างอิงกรีกโรมันแต่ลดลูกเล่น',
    hallmarks: ['ปริมาตรชัด', 'เสาเรียบ', 'หน้าบัน', 'จังหวะสม่ำเสมอ'],
    era: 'ปลายศตวรรษที่ 18–ต้น 19',
    keywords: ['Classical Revival', 'Simplify', 'Symmetry'],
  ),
  ArchitectureStyle(
    name: 'Modernism',
    brief: 'Form follows function ซื่อสัตย์ต่อวัสดุ เรียบ ไร้การประดับ',
    hallmarks: ['ระนาบเรียบ', 'กระจก–เหล็ก–คอนกรีต', 'ไม่มี Ornament'],
    era: 'ต้น–กลางศตวรรษที่ 20',
    keywords: ['Form follows function', 'Minimal', 'International'],
  ),
  ArchitectureStyle(
    name: 'International Style',
    brief: 'กล่องกระจก เส้นตรงเรียบ งานโครงสร้างชัด ใช้โมดูล',
    hallmarks: ['กริด', 'บานกระจกกว้าง', 'ผนังม่าน', 'โครงสร้างเหล็ก'],
    era: 'ทศวรรษ 1920s–1970s',
    keywords: ['Glass Box', 'Curtain Wall', 'Grid'],
  ),
  ArchitectureStyle(
    name: 'Brutalism',
    brief: 'คอนกรีตเปลือย มวลอาคารหนัก เข้มแข็ง ตรงไปตรงมา',
    hallmarks: ['คอนกรีตดิบ (béton brut)', 'บล็อกมวลใหญ่', 'รูปทรงชัด'],
    era: 'ทศวรรษ 1950s–1970s',
    keywords: ['Concrete', 'Raw', 'Mass', 'Monolithic'],
  ),
  ArchitectureStyle(
    name: 'Postmodern',
    brief: 'ย้อนแซวประวัติศาสตร์ ผสมสัญลักษณ์ สีสัน เล่นความหมาย',
    hallmarks: ['อ้างอิงอดีต', 'สี–ลวดลาย', 'สัญญะ–อารมณ์ขัน'],
    era: 'ทศวรรษ 1970s–1990s',
    keywords: ['Ornament returns', 'Symbol', 'Irony', 'Color'],
  ),
];
// ─────────────────────────────────────────────────────────────────────────────

class ArchitectureScreen extends StatefulWidget {
  static const routeName = '/architecture';
  const ArchitectureScreen({super.key});

  @override
  State<ArchitectureScreen> createState() => _ArchitectureScreenState();
}

class _ArchitectureScreenState extends State<ArchitectureScreen> {
  String _query = '';

  @override
  Widget build(BuildContext context) {
    final filtered = kStyles.where((s) {
      final q = _query.trim().toLowerCase();
      if (q.isEmpty) return true;
      return s.name.toLowerCase().contains(q) ||
          s.brief.toLowerCase().contains(q) ||
          s.era.toLowerCase().contains(q) ||
          s.keywords.any((k) => k.toLowerCase().contains(q));
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('🏛️ รูปแบบสถาปัตยกรรมหลัก ๆ ที่นิยมจำแนกกัน'),
        centerTitle: true,
        actions: [
          if (_query.isNotEmpty)
            IconButton(
              tooltip: 'ล้างคำค้นหา',
              icon: const Icon(Icons.clear),
              onPressed: () => setState(() => _query = ''),
            ),
        ],
      ),
      body: Column(
        children: [
          // 🔎 กล่องค้นหา
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'ค้นหา: ชื่อสไตล์ / คีย์เวิร์ด / ยุคเวลา',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (v) => setState(() => _query = v),
            ),
          ),
          // 🗂️ รายการการ์ด
          Expanded(
            child: filtered.isEmpty
                ? const Center(child: Text('ไม่พบผลลัพธ์ที่ตรงกับคำค้นหา'))
                : ListView.builder(
                    padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                    itemCount: filtered.length,
                    itemBuilder: (context, i) {
                      final s = filtered[i];
                      return Card(
                        elevation: 3,
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 8),
                          leading: CircleAvatar(
                            child: Text(s.name.characters.first),
                          ),
                          title: Text(
                            s.name,
                            style:
                                const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(s.brief),
                          childrenPadding:
                              const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          children: [
                            Row(
                              children: [
                                const Icon(Icons.timeline, size: 16),
                                const SizedBox(width: 6),
                                Text(s.era,
                                    style: const TextStyle(
                                        fontStyle: FontStyle.italic)),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Align(
                              alignment: Alignment.centerLeft,
                              child: Text('คุณลักษณะเด่น',
                                  style:
                                      TextStyle(fontWeight: FontWeight.w600)),
                            ),
                            const SizedBox(height: 6),
                            for (final h in s.hallmarks)
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('•  '),
                                  Expanded(child: Text(h)),
                                ],
                              ),
                            const SizedBox(height: 10),
                            Wrap(
                              spacing: 8,
                              runSpacing: 4,
                              children: s.keywords
                                  .map((k) => Chip(
                                        label: Text(k),
                                        backgroundColor:
                                            Theme.of(context)
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.08),
                                      ))
                                  .toList(),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
