import 'package:ht_headlines_client/ht_headlines_client.dart';

/// A list of mock headlines for testing and development.
final List<Headline> mockHeadlines = [
  for (int i = 1; i <= 40; i++)
    Headline(
      id: '$i',
      title: _generateTitle(i),
      description: _generateDescription(i),
      publishedAt: DateTime(2024, 1, i % 31 + 1), // Distribute dates
      source: _generateSource(i),
      categories: [_generateCategory(i)],
      eventCountry: _generateCountry(i),
    ),
];

String _generateTitle(int i) {
  final titles = [
    'Global Markets React to Central Bank Announcement',
    'New Study Reveals Surprising Health Benefits of Coffee',
    'Tech Giant Unveils Revolutionary New Smartphone',
    'Political Tensions Rise in Eastern Europe',
    'Scientists Discover New Species in Amazon Rainforest',
    'Economic Growth Exceeds Expectations in Q3',
    'Major Airline Announces Expansion Plans',
    'Cybersecurity Threats on the Rise, Experts Warn',
    'Breakthrough in Renewable Energy Technology',
    'Local Community Celebrates Annual Festival',
    'World Leaders Gather for Climate Summit',
    'Innovation Drives Growth in Emerging Markets',
    'New Research Challenges Conventional Wisdom',
    'Historic Landmark Restored to Former Glory',
    'Changing Weather Patterns Impact Agriculture',
    'Debate Intensifies Over Proposed Legislation',
    'Arts and Culture Flourish in Urban Centers',
    'Advances in Medical Research Offer Hope',
    'Education Reform Sparks National Discussion',
    'Sports Team Achieves Unprecedented Victory',
  ];
  return titles[i % titles.length];
}

String _generateDescription(int i) {
  final descriptions = [
    'A detailed look at the recent market fluctuations and their potential impact.',
    'Researchers have found a link between moderate coffee consumption and improved cardiovascular health.',
    'The new device boasts a groundbreaking camera system and unparalleled processing power.',
    'Concerns grow as diplomatic efforts fail to resolve the ongoing conflict.',
    'The discovery highlights the incredible biodiversity of the region.',
    'Strong consumer spending and increased exports contributed to the positive results.',
    'The airline plans to add several new international routes.',
    'Businesses and individuals are urged to take precautions to protect their data.',
    'The new technology promises to significantly increase the efficiency of solar power.',
    'Thousands of residents and visitors enjoyed the festivities.',
    'Discussions focus on reducing carbon emissions and promoting sustainable practices.',
    'Technological advancements are creating new opportunities for businesses and entrepreneurs.',
    'The findings could have significant implications for future research.',
    'The restoration project took several years and involved skilled artisans from around the world.',
    'Farmers are adapting to the challenges posed by unpredictable rainfall and extreme temperatures.',
    'Supporters and opponents of the bill express strong opinions.',
    'Museums, theaters, and galleries are attracting large audiences.',
    'The research offers new hope for patients with previously untreatable conditions.',
    'The proposed changes aim to improve student outcomes and address inequalities.',
    "The team's victory was a historic moment for the sport.",
  ];
  return descriptions[i % descriptions.length];
}

String _generateSource(int i) {
  final sources = [
    'Reuters',
    'Associated Press',
    'BBC News',
    'CNN',
    'The New York Times',
  ];
  return sources[i % sources.length];
}

String _generateCategory(int i) {
  final categories = [
    'Business',
    'Health',
    'Technology',
    'Politics',
    'Science',
    'World',
    'Finance',
    'Travel',
    'Culture',
  ];
  return categories[i % categories.length];
}

String _generateCountry(int i) {
  final countries = [
    'US',
    'UK',
    'CA',
    'AU',
    'DE',
    'FR',
    'JP',
    'CN',
    'IN',
    'BR',
  ];
  return countries[i % countries.length];
}
