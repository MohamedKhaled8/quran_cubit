import 'package:hive/hive.dart';
import 'package:quran/data/models/ayat.dart';

class BookmarksDataProvider {
  static final cache = Hive.box('data');

  static Future<List<Ayat?>?> fetch() async {
    try {
      List? bookmarks = await cache.get('bookmarks');
      if (bookmarks == null) {
        bookmarks = <Ayat?>[];
        await cache.put('bookmarks', bookmarks);
      }

      final List<Ayat?> cachedBookmarks = List.from(bookmarks);
      return cachedBookmarks;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<Ayat?>?> addBookmark(Ayat? chapter) async {
    try {
      List? bookmarks = await cache.get('bookmarks');
      if (bookmarks == null) {
        bookmarks = <Ayat?>[];
        await cache.put('bookmarks', bookmarks);
      }

      final List<Ayat?> updatedBookmarks = List.from(bookmarks);
      updatedBookmarks.add(chapter);

      await cache.put('bookmarks', updatedBookmarks);
      return updatedBookmarks;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<List<Ayat?>?> removeBookmark(Ayat? chapter) async {
    try {
      List bookmarks = await cache.get('bookmarks');

      final List<Ayat?> updatedBookmarks = List.from(bookmarks);
      updatedBookmarks.remove(chapter);

      await cache.put('bookmarks', updatedBookmarks);
      return updatedBookmarks;
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }

  static Future<bool?> checkBookmarked(Ayat? chapter) async {
    try {
      List bookmarks = await cache.get('bookmarks');

      final List<Ayat?> updatedBookmarks = List.from(bookmarks);
      return updatedBookmarks.contains(chapter);
    } catch (e) {
      throw Exception("Internal Server Error");
    }
  }
}
