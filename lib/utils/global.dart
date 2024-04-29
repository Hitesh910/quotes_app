import 'package:flutter/foundation.dart';
import 'package:quotes_app/model/category_model.dart';
import 'package:quotes_app/model/qoutes_model.dart';

List<CategoryModel> category = [
  CategoryModel("Happy",
      "https://knowledge.wharton.upenn.edu/wp-content/uploads/2016/01/compassion.jpg"),
  CategoryModel("Sucess",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-OxdCYLkYLZmuL7-WQ3Z9Y0g7KbDY-zR3h_TStcZx2A&s"),
  CategoryModel("Sad",
      "https://static.vecteezy.com/system/resources/thumbnails/032/169/261/small/depressed-sad-teenage-photo.jpg"),
  CategoryModel("Struggle",
      "https://t4.ftcdn.net/jpg/01/25/27/35/360_F_125273545_lPZlEKEjkGgBgJC8KIoUsNOEIdBKb8LD.jpg"),
  CategoryModel("Sucess",
      "https://i.pinimg.com/564x/3d/e6/bc/3de6bc3d48b599fe8d1aef9bb2795a4e.jpg"),
];

List<QoutesModel> happy = [
  QoutesModel("Ralph Waldo Emerson", "For every minute you are angry you lose sixty seconds of happiness."),
  QoutesModel('Robert A. Heinlein, Stranger in a Strange Land','Love is that condition in which the happiness of another person is essential to your own.'),
  QoutesModel('Chuck Palahniuk, Diary', 'It s so hard to forget pain, but it s even harder to remember sweetness. We have no scar to show for happiness. We learn so little from peace.'),
  QoutesModel('Ernest Hemingway, The Garden of Eden', 'Happiness in intelligent people is the rarest thing I know.')
];
List<QoutesModel> sucess = [
  QoutesModel("Michelangelo", "If people knew how hard I worked to get my mastery, it wouldn't seem so wonderful after all."),
    QoutesModel('Maya Angelou','Do the best you can until you know better. Then when you know better, do better.'),
  QoutesModel('Pele', 'Success is no accident. It is hard work, perseverance, learning, studying, sacrifice and most of all, love of what you are doing or learning to do.'),
  QoutesModel('Margaret Thatcher', 'I do not know anyone who has got to the top without hard work. That is the recipe. It will not always get you to the top, but should get you pretty near.')
];
List<QoutesModel> struggle = [
  QoutesModel("Thomas Mann, Essays of Three Decades", "A writer is someone for whom writing is more difficult than it is for other people."),
    QoutesModel('Joseph Conrad, Heart of Darkness','It was written I should be loyal to the nightmare of my choice.'),
  QoutesModel('Karl Marx, Eleven Theses on Feuerbach', 'The philosophers have only interpreted the world, in various ways. The point, however, is to change it.'),
  QoutesModel('Rosa Luxemburg', 'Those who do not move, do not notice their chains.')
];
