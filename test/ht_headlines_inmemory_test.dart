import 'package:ht_headlines_client/ht_headlines_client.dart';
import 'package:ht_headlines_inmemory/ht_headlines_inmemory.dart';
import 'package:ht_headlines_inmemory/src/mock_headlines.dart';
import 'package:test/test.dart';

void main() {
  group('InMemoryHtHeadlinesClient', () {
    late InMemoryHtHeadlinesClient client;

    setUp(() {
      client = InMemoryHtHeadlinesClient(initialHeadlines: mockHeadlines);
    });

    test('constructor initializes with provided headlines', () async {
      final customHeadlines = [
        const Headline(id: 'custom1', title: 'Custom Headline 1'),
        const Headline(id: 'custom2', title: 'Custom Headline 2'),
      ];
      final customClient = InMemoryHtHeadlinesClient(
        initialHeadlines: customHeadlines,
      );
      final headlines = await customClient.getHeadlines();
      expect(headlines, equals(customHeadlines));
    });

    test(
      'getHeadlines returns all headlines when no filters are applied',
      () async {
        final headlines = await client.getHeadlines();
        expect(headlines, equals(mockHeadlines));
      },
    );

    test(
      'getHeadlines returns filtered headlines when category filter is applied',
      () async {
        const category = 'Business';
        final headlines = await client.getHeadlines(category: category);
        expect(
          headlines,
          everyElement((Headline h) => h.categories!.contains(category)),
        );
      },
    );

    test(
      'getHeadlines returns filtered headlines when source filter is applied',
      () async {
        const source = 'Reuters';
        final headlines = await client.getHeadlines(source: source);
        expect(headlines, everyElement((Headline h) => h.source == source));
      },
    );

    test(
      'getHeadlines returns filtered headlines when eventCountry filter is applied',
      () async {
        const eventCountry = 'US';
        final headlines = await client.getHeadlines(eventCountry: eventCountry);
        expect(
          headlines,
          everyElement((Headline h) => h.eventCountry == eventCountry),
        );
      },
    );

    test(
      'getHeadlines returns limited headlines when limit is applied',
      () async {
        const limit = 5;
        final headlines = await client.getHeadlines(limit: limit);
        expect(headlines.length, limit);
      },
    );

    test(
      'getHeadlines returns headlines starting after the given ID when startAfterId is applied',
      () async {
        const startAfterId = '2';
        final headlines = await client.getHeadlines(startAfterId: startAfterId);
        final startIndex = mockHeadlines.indexWhere(
          (h) => h.id == startAfterId,
        );
        final expectedHeadlines = mockHeadlines.sublist(startIndex + 1);
        expect(headlines, equals(expectedHeadlines));
      },
    );

    test('getHeadlines returns limited and filtered headlines', () async {
      const limit = 5;
      const category = 'Business';
      final headlines = await client.getHeadlines(
        limit: limit,
        category: category,
      );
      expect(headlines.length, lessThanOrEqualTo(limit));
      expect(
        headlines,
        everyElement((Headline h) => h.categories!.contains(category)),
      );
    });

    test(
      'getHeadline returns the headline with the given ID when it exists',
      () async {
        const id = '1';
        final headline = await client.getHeadline(id: id);
        expect(headline, equals(mockHeadlines.firstWhere((h) => h.id == id)));
      },
    );

    test(
      'getHeadline throws a HeadlineNotFoundException when the headline with the given ID does not exist',
      () async {
        const id = 'non-existing-id';
        expect(
          () => client.getHeadline(id: id),
          throwsA(isA<HeadlineNotFoundException>()),
        );
      },
    );

    test('createHeadline creates a new headline', () async {
      const newHeadline = Headline(
        id: 'new-id',
        title: 'New Headline',
        description: 'New Description',
      );
      final createdHeadline = await client.createHeadline(
        headline: newHeadline,
      );
      expect(createdHeadline, equals(newHeadline));
      expect(await client.getHeadline(id: newHeadline.id), equals(newHeadline));
    });

    test(
      'createHeadline throws a HeadlineCreateException when a headline with the same ID already exists',
      () async {
        final existingHeadline = mockHeadlines[0];
        expect(
          () => client.createHeadline(headline: existingHeadline),
          throwsA(isA<HeadlineCreateException>()),
        );
      },
    );

    test('updateHeadline updates an existing headline', () async {
      final existingHeadline = mockHeadlines[0];
      final updatedHeadline = existingHeadline.copyWith(title: 'Updated Title');
      final result = await client.updateHeadline(headline: updatedHeadline);
      expect(result, equals(updatedHeadline));
      expect(
        await client.getHeadline(id: existingHeadline.id),
        equals(updatedHeadline),
      );
    });

    test(
      'updateHeadline throws a HeadlineNotFoundException when the headline with the given ID does not exist',
      () async {
        const nonExistingHeadline = Headline(
          id: 'non-existing-id',
          title: 'Non Existing Headline',
        );
        expect(
          () => client.updateHeadline(headline: nonExistingHeadline),
          throwsA(isA<HeadlineNotFoundException>()),
        );
      },
    );

    test('deleteHeadline deletes the headline with the given ID', () async {
      const id = '1';
      await client.deleteHeadline(id: id);
      expect(
        () => client.getHeadline(id: id),
        throwsA(isA<HeadlineNotFoundException>()),
      );
    });

    test(
      'deleteHeadline throws a HeadlineNotFoundException when the headline with the given ID does not exist',
      () async {
        const id = 'non-existing-id';
        expect(
          () => client.deleteHeadline(id: id),
          throwsA(isA<HeadlineNotFoundException>()),
        );
      },
    );

    test('searchHeadlines returns headlines that match the query', () async {
      const query = 'Global Markets';
      final headlines = await client.searchHeadlines(query: query);
      expect(
        headlines,
        everyElement(
          (Headline h) =>
              h.title.toLowerCase().contains(query.toLowerCase()) ||
              (h.description?.toLowerCase().contains(query.toLowerCase()) ??
                  false),
        ),
      );
    });

    test(
      'searchHeadlines returns an empty list when no headlines match the query',
      () async {
        const query = 'non-existing-query';
        final headlines = await client.searchHeadlines(query: query);
        expect(headlines, isEmpty);
      },
    );
  });
}
