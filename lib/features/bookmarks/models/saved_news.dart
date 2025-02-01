class SavedNews {
  final String title;
  final String subhead;
  final String description;
  final String timeAgo;
  final String? imageUrl;
  final String? sourceUrl;
  final String? sourceName;
  final DateTime savedAt;
  
  SavedNews({
    required this.title,
    required this.subhead,
    required this.description,
    required this.timeAgo,
    this.imageUrl,
    this.sourceUrl,
    this.sourceName,
    DateTime? savedAt,
  }) : savedAt = savedAt ?? DateTime.now();

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subhead': subhead,
      'description': description,
      'timeAgo': timeAgo,
      'imageUrl': imageUrl,
      'sourceUrl': sourceUrl,
      'sourceName': sourceName,
      'savedAt': savedAt.toIso8601String(),
    };
  }

  // Create from JSON when reading from storage
  factory SavedNews.fromJson(Map<String, dynamic> json) {
    return SavedNews(
      title: json['title'],
      subhead: json['subhead'],
      description: json['description'],
      timeAgo: json['timeAgo'],
      imageUrl: json['imageUrl'],
      sourceUrl: json['sourceUrl'],
      sourceName: json['sourceName'],
      savedAt: DateTime.parse(json['savedAt']),
    );
  }
} 