class ArchitectureEntity {
  final String name;
  final String era;
  final String brief;
  final List<String> tags;

  const ArchitectureEntity({
    required this.name,
    required this.era,
    required this.brief,
    required this.tags,
  });

  ArchitectureEntity copyWith({
    String? name,
    String? era,
    String? brief,
    List<String>? tags,
  }) {
    return ArchitectureEntity(
      name: name ?? this.name,
      era: era ?? this.era,
      brief: brief ?? this.brief,
      tags: tags ?? List<String>.from(this.tags),
    );
  }
}

const List<ArchitectureEntity> kSeedEntities = [
  ArchitectureEntity(
    name: 'Classical Architecture',
    era: 'กรีก–โรมันโบราณ',
    brief: 'เน้นเสาและสมมาตร เช่น Doric, Ionic, Corinthian',
    tags: ['เสา', 'สมมาตร', 'Pediment', 'Orders'],
  ),
  ArchitectureEntity(
    name: 'Romanesque',
    era: 'คริสต์ศตวรรษที่ 9–12',
    brief: 'โค้งครึ่งวงกลม ผนังหนา คูหาเล็ก โทนมั่นคง',
    tags: ['Round Arch', 'ผนังหนา', 'ช่องเปิดเล็ก'],
  ),
  ArchitectureEntity(
    name: 'Gothic',
    era: 'คริสต์ศตวรรษที่ 12–16',
    brief: 'โค้งแหลม หน้าต่างกระจกสี สูงชะลูด มี Flying Buttress',
    tags: ['Pointed Arch', 'Buttress', 'Stained Glass'],
  ),
  ArchitectureEntity(
    name: 'Renaissance',
    era: 'ศตวรรษที่ 15–16',
    brief: 'คืนค่าสัดส่วนคลาสสิก สมมาตร โดม–เพดิเมนต์กลับมา',
    tags: ['Classical Proportion', 'Symmetry', 'Dome'],
  ),
  ArchitectureEntity(
    name: 'Baroque',
    era: 'ปลายศตวรรษที่ 16–18',
    brief: 'อลังการ โค้งไหลลื่น เล่นแสง–เงาดรามาติก',
    tags: ['Curve', 'Drama', 'Grand'],
  ),
  ArchitectureEntity(
    name: 'Neoclassical',
    era: 'ปลายศตวรรษที่ 18–ต้น 19',
    brief: 'เรียบ สุขุม อ้างอิงคลาสสิก ลดลูกเล่น',
    tags: ['Order', 'Pediment', 'Symmetry'],
  ),
  ArchitectureEntity(
    name: 'Modernism',
    era: 'ต้น–กลางศตวรรษที่ 20',
    brief: 'Form follows function ซื่อสัตย์ต่อวัสดุ เรียบ ไม่มี Ornament',
    tags: ['Minimal', 'Concrete/Steel/Glass'],
  ),
  ArchitectureEntity(
    name: 'International Style',
    era: '1920s–1970s',
    brief: 'กล่องกระจก เส้นตรงเรียบ กริดชัด ใช้ผนังม่าน',
    tags: ['Glass Box', 'Grid', 'Curtain Wall'],
  ),
  ArchitectureEntity(
    name: 'Brutalism',
    era: '1950s–1970s',
    brief: 'คอนกรีตเปลือย มวลหนัก รูปทรงดิบชัด',
    tags: ['Concrete', 'Raw', 'Mass'],
  ),
  ArchitectureEntity(
    name: 'Postmodern',
    era: '1970s–1990s',
    brief: 'ย้อนแซวประวัติศาสตร์ ผสมสัญลักษณ์ สีสัน',
    tags: ['Symbol', 'Color', 'Ornament Returns'],
  ),
];
