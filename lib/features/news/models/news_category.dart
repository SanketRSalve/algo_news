enum NewsCategory {
  all('All'),
  business('Business'),
  entertainment('Entertainment'),
  general('General'),
  health('Health'),
  science('Science'),
  sports('Sports'),
  technology('Technology');

  final String title;
  const NewsCategory(this.title);
}
