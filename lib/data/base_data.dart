import 'package:sequest_app/models/topics.dart';

final List<SchoolClass> schoolProgram = [
  // 1 КЛАС
  SchoolClass(
    clasNumber: 1,
    disciplines: [
      Discipline(
        type: DisciplineType.math,
        title: 'Математика',
        topics: [
          Topic(title: 'Лічба. Числа 1-10. Склад числа'),
          Topic(title: 'Додавання та віднімання в межах 10'),
        ],
      ),
    ],
  ),

  // 7 КЛАС
  SchoolClass(
    clasNumber: 7,
    disciplines: [
      Discipline(
        type: DisciplineType.algebra,
        title: 'Алгебра',
        topics: [
          Topic(title: 'Лінійні рівняння з однією змінною'),
          Topic(title: 'Формули скороченого множення'),
        ],
      ),
      Discipline(
        type: DisciplineType.geometry,
        title: 'Геометрія',
        topics: [Topic(title: 'Трикутники. Ознаки рівності')],
      ),
    ],
  ),
];

final List<String> baseHobbyList = [
  'Малювання',
  'Фотографія',
  'Програмування',
  'Гра на музичних інструментах',
  'Вивчення мов',
  'Читання',
  '3D-моделювання',
  'Йога',
  'Біг',
  'Кулінарія',
  'Садівництво',
  'Настільні ігри',
  'Шахи',
  'Відеомонтаж',
  'Хайкінг',
  'Складання LEGO',
  'Кіберспорт',
  'Медитація',
  'Фітнес',
  'Волонтерство',
];
