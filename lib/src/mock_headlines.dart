import 'package:ht_headlines_client/ht_headlines_client.dart';

/// A list of mock sources for testing and development.
final List<String> sources = ['Reuters', 'Associated Press', 'BBC News'];

/// A list of mock categories for testing and development.
final List<String> categories = ['Business', 'Technology', 'World'];

/// A list of mock eventCountries for testing and development.
final List<String> eventCountries = ['USA', 'UK', 'China'];

/// A list of mock headlines for testing and development.
final List<Headline> mockHeadlines = [
  Headline(
    id: '1',
    title: 'Stock Market Sees Volatility After Rate Hike',
    description:
        "Investors react to the central bank's decision to raise interest rates.",
    publishedAt: DateTime(2024),
    source: sources[0],
    categories: [categories[0]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '2',
    title: 'New Research Links Diet to Brain Health',
    description:
        'A study finds a connection between specific foods and cognitive function.',
    publishedAt: DateTime(2024, 1, 2),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[1],
  ),
  Headline(
    id: '3',
    title: 'Tech Company Announces Major Layoffs',
    description:
        'The company cites restructuring efforts as the reason for the job cuts.',
    publishedAt: DateTime(2024, 1, 3),
    source: sources[2],
    categories: [categories[2]],
    eventCountry: eventCountries[2],
  ),
  Headline(
    id: '4',
    title: 'Political Tensions Escalate in Region',
    description:
        'Diplomatic efforts are underway to de-escalate the growing conflict.',
    publishedAt: DateTime(2024, 1, 4),
    source: sources[0],
    categories: [categories[1]],
    eventCountry: eventCountries[2],
  ),
  Headline(
    id: '5',
    title: 'Scientists Discover New Exoplanet',
    description:
        'The newly discovered planet is located in a potentially habitable zone.',
    publishedAt: DateTime(2024, 1, 5),
    source: sources[1],
    categories: [categories[2]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '6',
    title: 'Economic Growth Slows in Second Quarter',
    description:
        'Analysts point to several factors contributing to the slowdown.',
    publishedAt: DateTime(2024, 1, 6),
    source: sources[2],
    categories: [categories[0]],
    eventCountry: eventCountries[1],
  ),
  Headline(
    id: '7',
    title: 'Airline Announces New Routes to Asia',
    description:
        'The expansion aims to meet growing demand for travel to the region.',
    publishedAt: DateTime(2024, 1, 7),
    source: sources[0],
    categories: [categories[0]],
    eventCountry: eventCountries[1],
  ),
  Headline(
    id: '8',
    title: 'Cybersecurity Firm Detects Major Breach',
    description: "Millions of users' data may have been compromised.",
    publishedAt: DateTime(2024, 1, 8),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[2],
  ),
  Headline(
    id: '9',
    title: 'New Energy Policy Faces Opposition',
    description: 'Critics argue the policy will harm the economy.',
    publishedAt: DateTime(2024, 1, 9),
    source: sources[2],
    categories: [categories[2]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '10',
    title: 'Local Festival Attracts Record Crowds',
    description:
        'The annual event featured music, food, and cultural performances.',
    publishedAt: DateTime(2024, 1, 10),
    source: sources[0],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '11',
    title: "China's Economy Shows Signs of Recovery",
    description: 'Manufacturing activity rebounds after recent slowdown.',
    publishedAt: DateTime(2024, 1, 11),
    source: sources[2],
    categories: [categories[0]],
    eventCountry: eventCountries[2],
  ),
  Headline(
    id: '12',
    title: 'Apple Unveils New Augmented Reality Headset',
    description:
        'The device is expected to revolutionize the way people interact with technology.',
    publishedAt: DateTime(2024, 1, 12),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '13',
    title: 'Brexit Negotiations Reach Critical Stage',
    description: 'The UK and EU are working to finalize a trade agreement.',
    publishedAt: DateTime(2024, 1, 13),
    source: sources[0],
    categories: [categories[2]],
    eventCountry: eventCountries[1],
  ),
  Headline(
    id: '14',
    title: 'US Federal Reserve Considers Interest Rate Cut',
    description: 'The move is intended to stimulate economic growth.',
    publishedAt: DateTime(2024, 1, 14),
    source: sources[0],
    categories: [categories[0]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '15',
    title: 'Microsoft Announces New Cloud Computing Services',
    description:
        'The services are designed to help businesses scale their operations.',
    publishedAt: DateTime(2024, 1, 15),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '16',
    title: 'Global Leaders Discuss Climate Change at Summit',
    description: 'Countries pledge to reduce carbon emissions.',
    publishedAt: DateTime(2024, 1, 16),
    source: sources[2],
    categories: [categories[2]],
    eventCountry: eventCountries[1],
  ),
  Headline(
    id: '17',
    title: 'Tesla Reports Record Profits',
    description: 'The electric car maker continues to see strong demand.',
    publishedAt: DateTime(2024, 1, 17),
    source: sources[0],
    categories: [categories[0]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '18',
    title: 'Google Launches New AI-Powered Search Features',
    description:
        'The features are designed to provide more relevant search results.',
    publishedAt: DateTime(2024, 1, 18),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '19',
    title: 'Tensions Rise in South China Sea',
    description: 'Regional powers increase military presence.',
    publishedAt: DateTime(2024, 1, 19),
    source: sources[2],
    categories: [categories[2]],
    eventCountry: eventCountries[2],
  ),
  Headline(
    id: '20',
    title: 'SpaceX Launches New Mission to Mars',
    description:
        'The mission aims to search for signs of past life on the planet.',
    publishedAt: DateTime(2024, 1, 20),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '21',
    title: 'UK Government Announces New Economic Plan',
    description: 'The plan aims to boost growth and create jobs.',
    publishedAt: DateTime(2024, 1, 21),
    source: sources[0],
    categories: [categories[0]],
    eventCountry: eventCountries[1],
  ),
  Headline(
    id: '22',
    title: 'New Study Shows Benefits of Artificial Intelligence in Healthcare',
    description:
        'AI is being used to improve diagnosis and treatment of diseases.',
    publishedAt: DateTime(2024, 1, 22),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '23',
    title: 'China Launches New Satellite',
    description: 'The satellite will be used for communication and navigation.',
    publishedAt: DateTime(2024, 1, 23),
    source: sources[2],
    categories: [categories[1]],
    eventCountry: eventCountries[2],
  ),
  Headline(
    id: '24',
    title: 'US Companies Report Strong Earnings',
    description:
        'The results exceed expectations, boosting investor confidence.',
    publishedAt: DateTime(2024, 1, 24),
    source: sources[0],
    categories: [categories[0]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '25',
    title: 'New Technology Promises to Revolutionize Transportation',
    description:
        'Self-driving cars and high-speed trains are changing the way people travel.',
    publishedAt: DateTime(2024, 1, 25),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '26',
    title: 'Global Trade Talks Stall',
    description:
        'Disagreements over tariffs and trade barriers remain unresolved.',
    publishedAt: DateTime(2024, 1, 26),
    source: sources[2],
    categories: [categories[2]],
    eventCountry: eventCountries[2],
  ),
  Headline(
    id: '27',
    title: 'New Electric Vehicle Breaks Sales Records',
    description:
        'Consumers are embracing the latest model from a leading automaker.',
    publishedAt: DateTime(2024, 1, 27),
    source: sources[0],
    categories: [categories[0]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '28',
    title: 'Social Media Platform Faces Scrutiny Over Data Privacy',
    description:
        "Regulators are investigating the company's handling of user data.",
    publishedAt: DateTime(2024, 1, 28),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
  Headline(
    id: '29',
    title: 'International Efforts to Combat Poverty Gain Momentum',
    description:
        'Organizations and governments are working together to address global poverty.',
    publishedAt: DateTime(2024, 1, 29),
    source: sources[2],
    categories: [categories[2]],
    eventCountry: eventCountries[1],
  ),
  Headline(
    id: '30',
    title: 'NASA Announces Plans for New Space Telescope',
    description:
        'The telescope will be used to study distant galaxies and exoplanets.',
    publishedAt: DateTime(2024, 1, 30),
    source: sources[1],
    categories: [categories[1]],
    eventCountry: eventCountries[0],
  ),
];
