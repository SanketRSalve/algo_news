import 'dart:convert';
import 'package:algo_news/features/bookmarks/models/saved_news.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BookmarkRepository {
  static const String _storageKey = 'saved_news';
  late SharedPreferences _prefs;

  BookmarkRepository._();

  static Future<BookmarkRepository> create() async {
    final repository = BookmarkRepository._();
    await repository.init();
    return repository;
  }

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  Future<List<SavedNews>> getAllSavedNews() async {
    final String? jsonString = _prefs.getString(_storageKey);
    if (jsonString == null) return [];

    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => SavedNews.fromJson(json)).toList();
  }

  Future<void> saveNews(SavedNews news) async {
    final currentNews = await getAllSavedNews();
    currentNews.add(news);

    final jsonList = currentNews.map((news) => news.toJson()).toList();
    await _prefs.setString(_storageKey, json.encode(jsonList));
  }

  Future<void> removeNews(String title) async {
    final currentNews = await getAllSavedNews();
    currentNews.removeWhere((news) => news.title == title);

    final jsonList = currentNews.map((news) => news.toJson()).toList();
    await _prefs.setString(_storageKey, json.encode(jsonList));
  }

  Future<bool> isNewsSaved(String title) async {
    final currentNews = await getAllSavedNews();
    return currentNews.any((news) => news.title == title);
  }
}
