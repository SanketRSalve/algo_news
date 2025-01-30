class SavedNews {
  final String title;
  final String subhead;
  final String description;
  final String timeAgo;
  final DateTime savedAt;
  
  SavedNews({
    required this.title,
    required this.subhead,
    required this.description,
    required this.timeAgo,
    DateTime? savedAt,
  }) : savedAt = savedAt ?? DateTime.now();

  // Convert to JSON for storage
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'subhead': subhead,
      'description': description,
      'timeAgo': timeAgo,
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
      savedAt: DateTime.parse(json['savedAt']),
    );
  }
} 