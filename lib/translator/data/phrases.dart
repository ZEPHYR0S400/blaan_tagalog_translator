import 'package:blaan_traslator/translator/models/phrase.dart';

const List<String> phraseCategories = <String>[
  'All',
  'Greetings',
  'Basic Needs',
  'Questions',
  'Numbers',
  'Common',
];

const List<Phrase> phrases = <Phrase>[
  // Greetings
  Phrase(
    category: 'Greetings',
    word: 'Fye flafus',
    pronunciation: 'fye-fla-fus',
    translation: 'Magandang umaga',
  ),
  Phrase(
    category: 'Greetings',
    word: 'Fye kifu',
    pronunciation: 'fye-ki-fu',
    translation: 'Magandang gabi',
  ),
  Phrase(
    category: 'Greetings',
    word: 'Kumusta ge?',
    pronunciation: 'ku-mus-ta ge',
    translation: 'Kumusta ka?',
  ),

  // Basic Needs
  Phrase(
    category: 'Basic Needs',
    word: 'Kmaan',
    pronunciation: 'kma-an',
    translation: 'Kumain',
  ),
  Phrase(
    category: 'Basic Needs',
    word: 'Minum',
    pronunciation: 'mi-num',
    translation: 'Uminom',
  ),

  // Questions
  Phrase(
    category: 'Questions',
    word: 'Galo?',
    pronunciation: 'ga-lo',
    translation: 'Saan?',
  ),
  Phrase(
    category: 'Questions',
    word: 'Sintan?',
    pronunciation: 'sin-tan',
    translation: 'Kailan?',
  ),
];
