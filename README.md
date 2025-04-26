# ht_headlines_inmemory

> **Note:** This package is being archived. Please use the successor package [`ht-data-inmemory`](https://github.com/headlines-toolkit/ht-data-inmemory) instead.

This package provides an in-memory implementation of the `HtHeadlinesClient` interface. It's primarily intended for testing and development purposes, allowing you to simulate interactions with a headlines data source without needing a real database or network connection.

## Features

The **`HtInMemoryHeadlinesClient`** class provides the following features, mirroring the `HtHeadlinesClient` interface:

*   Create new headlines.
*   Retrieve headlines by ID.
*   Retrieve a list of headlines with optional filtering (category, source, event country) and pagination.
*   Update existing headlines.
*   Delete headlines.
*   Search headlines by title and description.

## Getting Started

This package is an in-memory implementation and does not require any external setup or dependencies beyond the `ht_headlines_client` package.  It's designed to be used as a drop-in replacement for other `HtHeadlinesClient` implementations during testing.

To use this package, add `ht_headlines_inmemory` as a dependency in your `pubspec.yaml` file.

```yaml
dependencies:
  ht_headlines_inmemory:
    git:
      url: https://github.com/headlines-toolkit/ht-headlines-inmemory.git
      ref: main
```

Then simply instantiate the `HtInMemoryHeadlinesClient`:

```dart
import 'package:ht_headlines_inmemory/ht_headlines_inmemory.dart';

final client = HtInMemoryHeadlinesClient(); // Use default mock headlines

// Or, initialize with your own list of headlines:
final myHeadlines = [/* ... your Headline objects ... */];
final customClient = HtInMemoryHeadlinesClient(initialHeadlines: myHeadlines);

```

## Usage

Here are some examples of how to use the `HtInMemoryHeadlinesClient`:

```dart
import 'package:ht_headlines_client/ht_headlines_client.dart';
import 'package:ht_headlines_inmemory/ht_headlines_inmemory.dart';

void main() async {
  final client = HtInMemoryHeadlinesClient();

  // Create a new headline
  final newHeadline = Headline(
    id: 'new-headline',
    title: 'My New Headline',
    description: 'This is a test headline.',
    source: 'My Source',
    categories: ['Test'],
  );
  final createdHeadline = await client.createHeadline(headline: newHeadline);
  print('Created headline: ${createdHeadline.title}');

  // Get a headline by ID
  final retrievedHeadline = await client.getHeadline(id: 'new-headline');
  print('Retrieved headline: ${retrievedHeadline?.title}');

  // Search for headlines
  final searchResults = await client.searchHeadlines(query: 'test');
  print('Search results: ${searchResults.map((h) => h.title).toList()}');

    // Get headlines with filters
  final filteredHeadlines = await client.getHeadlines(
    category: 'Technology',
    source: 'Tech News',
    limit: 10,
  );
  print('Filtered headlines: ${filteredHeadlines.length}');

  // Update a headline
    final updatedHeadlineData = createdHeadline.copyWith(title: 'Updated Headline Title');
    final updatedHeadline = await client.updateHeadline(headline: updatedHeadlineData);
    print('Updated headline title: ${updatedHeadline.title}');

  // Delete a headline
  await client.deleteHeadline(id: 'new-headline');
  print('Headline deleted');

    // Try to get a deleted headline (will throw exception)
  try {
    await client.getHeadline(id: 'new-headline');
  } on HeadlineNotFoundException catch (e) {
    print('Expected exception: ${e.message}');
  }
}

```
