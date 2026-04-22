import 'package:sequest_app/models/topics.dart';

final baseTopics = [
  // --- ПОЧАТКОВА ШКОЛА (1-4 КЛАСИ) ---
  Topic(title: 'Лічба. Числа 1-10. Склад числа', topic: Topics.math, clas: 1),
  Topic(title: 'Додавання та віднімання в межах 10', topic: Topics.math, clas: 1),
  Topic(title: 'Ознаки предметів. Геометричні фігури', topic: Topics.math, clas: 1),
  Topic(title: 'Числа 11-100. Величини', topic: Topics.math, clas: 1),

  Topic(title: 'Додавання та віднімання з переходом через розряд', topic: Topics.math, clas: 2),
  Topic(title: 'Множення та ділення. Таблиця множення', topic: Topics.math, clas: 2),
  Topic(title: 'Вирази з дужками. Порядок дій', topic: Topics.math, clas: 2),
  Topic(title: 'Метрична система мір. Час', topic: Topics.math, clas: 2),

  Topic(title: 'Нумерація трицифрових чисел', topic: Topics.math, clas: 3),
  Topic(title: 'Письмове додавання та віднімання (в стовпчик)', topic: Topics.math, clas: 3),
  Topic(title: 'Позатабличне множення та ділення', topic: Topics.math, clas: 3),
  Topic(title: 'Рівняння. Знаходження невідомого компонента', topic: Topics.math, clas: 3),
  Topic(title: 'Частини цілого. Одиниці маси', topic: Topics.math, clas: 3),

  Topic(title: 'Багатоцифрові числа. Читання та запис', topic: Topics.math, clas: 4),
  Topic(title: 'Дії над багатоцифровими числами', topic: Topics.math, clas: 4),
  Topic(title: 'Швидкість, час, відстань. Прості задачі', topic: Topics.math, clas: 4),
  Topic(title: 'Площа фігури. Периметр прямокутника', topic: Topics.math, clas: 4),
  Topic(title: 'Геометричні тіла: куб, куля, піраміда', topic: Topics.math, clas: 4),

  // --- СЕРЕДНЯ ШКОЛА (5-6 КЛАСИ) ---
  Topic(title: 'Натуральні числа. Порівняння та округлення', topic: Topics.math, clas: 5),
  Topic(title: 'Додавання та віднімання натуральних чисел', topic: Topics.math, clas: 5),
  Topic(title: 'Множення та ділення натуральних чисел', topic: Topics.math, clas: 5),
  Topic(title: 'Десяткові дроби та дії з ними', topic: Topics.math, clas: 5),
  Topic(title: 'Відсотки. Знаходження відсотка від числа', topic: Topics.math, clas: 5),
  Topic(title: 'Кут. Види кутів. Вимірювання кутів', topic: Topics.math, clas: 5),

  Topic(title: 'Подільність натуральних чисел. Ознаки подільності', topic: Topics.math, clas: 6),
  Topic(title: 'НСД та НСК чисел', topic: Topics.math, clas: 6),
  Topic(title: 'Звичайні дроби та дії з ними', topic: Topics.math, clas: 6),
  Topic(title: 'Відношення та пропорції. Пряма залежність', topic: Topics.math, clas: 6),
  Topic(title: 'Раціональні числа. Модуль числа', topic: Topics.math, clas: 6),
  Topic(title: 'Додавання та віднімання раціональних чисел', topic: Topics.math, clas: 6),
  Topic(title: 'Множення та ділення раціональних чисел', topic: Topics.math, clas: 6),
  Topic(title: 'Коло. Круг. Стовпчасті діаграми', topic: Topics.math, clas: 6),

  // --- 7 КЛАС ---
  Topic(title: 'Лінійні рівняння з однією змінною', topic: Topics.algebra, clas: 7),
  Topic(title: 'Степінь з натуральним показником', topic: Topics.algebra, clas: 7),
  Topic(title: 'Одночлени та многочлени. Дії з ними', topic: Topics.algebra, clas: 7),
  Topic(title: 'Формули скороченого множення', topic: Topics.algebra, clas: 7),
  Topic(title: 'Системи лінійних рівнянь', topic: Topics.algebra, clas: 7),
  Topic(title: 'Точки, прямі, промені. Суміжні кути', topic: Topics.geometry, clas: 7),
  Topic(title: 'Трикутники. Ознаки рівності трикутників', topic: Topics.geometry, clas: 7),
  Topic(title: 'Коло. Геометричні побудови циркулем', topic: Topics.geometry, clas: 7),

  // --- 8 КЛАС ---
  Topic(title: 'Раціональні дроби та вирази', topic: Topics.algebra, clas: 8),
  Topic(title: 'Квадратні корені. Дійсні числа', topic: Topics.algebra, clas: 8),
  Topic(title: 'Квадратні рівняння. Теорема Вієта', topic: Topics.algebra, clas: 8),
  Topic(title: 'Квадратний тричлен', topic: Topics.algebra, clas: 8),
  Topic(title: 'Чотирикутники (паралелограм, ромб, трапеція)', topic: Topics.geometry, clas: 8),
  Topic(title: 'Теорема Фалеса. Подібність трикутників', topic: Topics.geometry, clas: 8),
  Topic(title: 'Теорема Піфагора', topic: Topics.geometry, clas: 8),
  Topic(title: 'Площі многокутників', topic: Topics.geometry, clas: 8),

  // --- 9 КЛАС ---
  Topic(title: 'Числові нерівності та їх властивості', topic: Topics.algebra, clas: 9),
  Topic(title: 'Системи нерівностей з однією змінною', topic: Topics.algebra, clas: 9),
  Topic(title: 'Функції. Квадратична функція та її графік', topic: Topics.algebra, clas: 9),
  Topic(title: 'Арифметична та геометрична прогресії', topic: Topics.algebra, clas: 9),
  Topic(title: 'Елементи статистики та ймовірності', topic: Topics.algebra, clas: 9),
  Topic(title: 'Розв’язування довільних трикутників', topic: Topics.geometry, clas: 9),
  Topic(title: 'Правильні многокутники. Довжина кола', topic: Topics.geometry, clas: 9),
  Topic(title: 'Вектори на площині. Координати вектора', topic: Topics.geometry, clas: 9),
  Topic(title: 'Геометричні перетворення (симетрія, поворот)', topic: Topics.geometry, clas: 9),

  // --- СТАРША ШКОЛА (10-11 КЛАСИ) ---
  Topic(title: 'Корінь n-го степеня. Степінь з рац. показником', topic: Topics.algebra, clas: 10),
  Topic(title: 'Тригонометричні функції та їх властивості', topic: Topics.algebra, clas: 10),
  Topic(title: 'Тригонометричні рівняння та нерівності', topic: Topics.algebra, clas: 10),
  Topic(title: 'Похідна функції та її застосування', topic: Topics.algebra, clas: 10),
  Topic(title: 'Аксіоми стереометрії. Паралельність у просторі', topic: Topics.geometry, clas: 10),
  Topic(title: 'Перпендикулярність прямої та площини', topic: Topics.geometry, clas: 10),
  Topic(title: 'Двогранні кути. Відстані у просторі', topic: Topics.geometry, clas: 10),

  Topic(title: 'Показникова та логарифмічна функції', topic: Topics.algebra, clas: 11),
  Topic(title: 'Показникові та логарифмічні рівняння', topic: Topics.algebra, clas: 11),
  Topic(title: 'Первісна та інтеграл', topic: Topics.algebra, clas: 11),
  Topic(title: 'Комбінаторика. Теорія ймовірностей', topic: Topics.algebra, clas: 11),
  Topic(title: 'Многогранники (призма, піраміда)', topic: Topics.geometry, clas: 11),
  Topic(title: 'Тіла обертання (циліндр, конус, куля)', topic: Topics.geometry, clas: 11),
  Topic(title: 'Об’єми та площі поверхонь просторових тіл', topic: Topics.geometry, clas: 11),
  Topic(title: 'Вектори та координати у просторі', topic: Topics.geometry, clas: 11),
];