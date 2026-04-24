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
          Topic(title: 'Числа 11-100. Величини'),
        ],
      ),
    ],
  ),
  // 2 КЛАС
  SchoolClass(
    clasNumber: 2,
    disciplines: [
      Discipline(
        type: DisciplineType.math,
        title: 'Математика',
        topics: [
          Topic(
            title:
                'Додавання та віднімання з переходом через розряд',
          ),
          Topic(title: 'Множення та ділення. Табличне множення'),
          Topic(title: 'Робота з виразами та дужками'),
        ],
      ),
    ],
  ),
  // 3 КЛАС
  SchoolClass(
    clasNumber: 3,
    disciplines: [
      Discipline(
        type: DisciplineType.math,
        title: 'Математика',
        topics: [
          Topic(title: 'Тисяча. Нумерація трицифрових чисел'),
          Topic(title: 'Позатабличне множення та ділення'),
          Topic(title: 'Частини цілого. Дроби з чисельником 1'),
        ],
      ),
    ],
  ),
  // 4 КЛАС
  SchoolClass(
    clasNumber: 4,
    disciplines: [
      Discipline(
        type: DisciplineType.math,
        title: 'Математика',
        topics: [
          Topic(title: 'Багатоцифрові числа. Дії в межах мільйона'),
          Topic(title: 'Швидкість, час, відстань'),
          Topic(title: 'Площа фігури. Одиниці вимірювання площі'),
        ],
      ),
    ],
  ),
  // 5 КЛАС
  SchoolClass(
    clasNumber: 5,
    disciplines: [
      Discipline(
        type: DisciplineType.math,
        title: 'Математика',
        topics: [
          Topic(title: 'Натуральні числа та дії з ними'),
          Topic(title: 'Звичайні дроби з однаковими знаменниками'),
          Topic(title: 'Десяткові дроби та дії з ними'),
          Topic(title: 'Відсотки. Середнє арифметичне'),
        ],
      ),
    ],
  ),
  // 6 КЛАС
  SchoolClass(
    clasNumber: 6,
    disciplines: [
      Discipline(
        type: DisciplineType.math,
        title: 'Математика',
        topics: [
          Topic(
            title:
                'Подільність натуральних чисел. Ознаки подільності',
          ),
          Topic(title: 'Відношення та пропорції'),
          Topic(
            title: 'Додатні та від’ємні числа. Координатна пряма',
          ),
          Topic(title: 'Раціональні числа та дії з ними'),
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
          Topic(title: 'Одночлени та многочлени'),
          Topic(title: 'Формули скороченого множення'),
          Topic(title: 'Функції. Лінійна функція'),
        ],
      ),
      Discipline(
        type: DisciplineType.geometry,
        title: 'Геометрія',
        topics: [
          Topic(title: 'Елементарні геометричні фігури'),
          Topic(title: 'Трикутники. Ознаки рівності трикутників'),
          Topic(title: 'Паралельні прямі. Сума кутів трикутника'),
        ],
      ),
    ],
  ),
  // 8 КЛАС
  SchoolClass(
    clasNumber: 8,
    disciplines: [
      Discipline(
        type: DisciplineType.algebra,
        title: 'Алгебра',
        topics: [
          Topic(title: 'Раціональні вирази та дроби'),
          Topic(title: 'Квадратні корені. Дійсні числа'),
          Topic(title: 'Квадратні рівняння. Теорема Вієта'),
        ],
      ),
      Discipline(
        type: DisciplineType.geometry,
        title: 'Геометрія',
        topics: [
          Topic(title: 'Чотирикутники та їх властивості'),
          Topic(title: 'Подібність трикутників'),
          Topic(title: 'Теорема Піфагора'),
          Topic(title: 'Площі многокутників'),
        ],
      ),
    ],
  ),
  // 9 КЛАС
  SchoolClass(
    clasNumber: 9,
    disciplines: [
      Discipline(
        type: DisciplineType.algebra,
        title: 'Алгебра',
        topics: [
          Topic(title: 'Нерівності. Числові проміжки'),
          Topic(title: 'Квадратична функція'),
          Topic(
            title:
                'Числові послідовності. Арифметична та геометрична прогресії',
          ),
          Topic(
            title: 'Основи комбінаторики та теорії ймовірностей',
          ),
        ],
      ),
      Discipline(
        type: DisciplineType.geometry,
        title: 'Геометрія',
        topics: [
          Topic(title: 'Метод координат на площині'),
          Topic(title: 'Вектори на площині'),
          Topic(
            title: 'Геометричні перетворення (симетрія, поворот)',
          ),
          Topic(
            title:
                'Правильні многокутники. Довжина кола та площа круга',
          ),
        ],
      ),
    ],
  ),
  // 10 КЛАС
  SchoolClass(
    clasNumber: 10,
    disciplines: [
      Discipline(
        type: DisciplineType.algebra,
        title: 'Алгебра',
        topics: [
          Topic(title: 'Функції, їх властивості та графіки'),
          Topic(title: 'Тригонометричні функції та рівняння'),
          Topic(title: 'Похідна та її застосування'),
        ],
      ),
      Discipline(
        type: DisciplineType.geometry,
        title: 'Геометрія',
        topics: [
          Topic(title: 'Вступ до стереометрії. Аксіоми'),
          Topic(title: 'Паралельність прямих і площин у просторі'),
          Topic(
            title:
                'Перпендикулярність у просторі. Кути та відстані',
          ),
        ],
      ),
    ],
  ),
  // 11 КЛАС
  SchoolClass(
    clasNumber: 11,
    disciplines: [
      Discipline(
        type: DisciplineType.algebra,
        title: 'Алгебра',
        topics: [
          Topic(title: 'Показникова та логарифмічна функції'),
          Topic(title: 'Інтеграл та його застосування'),
          Topic(
            title: 'Елементи теорії ймовірностей та статистики',
          ),
        ],
      ),
      Discipline(
        type: DisciplineType.geometry,
        title: 'Геометрія',
        topics: [
          Topic(title: 'Многогранники (призма, піраміда)'),
          Topic(title: 'Тіла обертання (циліндр, конус, куля)'),
          Topic(
            title: 'Об’єми та площі поверхонь геометричних тіл',
          ),
          Topic(title: 'Вектори та координати у просторі'),
        ],
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
