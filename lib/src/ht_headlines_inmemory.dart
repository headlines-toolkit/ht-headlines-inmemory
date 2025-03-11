import 'package:ht_headlines_client/ht_headlines_client.dart';
import 'package:ht_headlines_inmemory/src/mock_headlines.dart';

/// {@template in_memory_ht_headlines_client}
/// An in-memory implementation of the [HtHeadlinesClient] abstract class.
/// This implementation is useful for testing and development purposes.
/// {@endtemplate}
class InMemoryHtHeadlinesClient extends HtHeadlinesClient {
  /// {@macro in_memory_ht_headlines_client}
  InMemoryHtHeadlinesClient({List<Headline>? initialHeadlines})
    : _headlines = initialHeadlines ?? mockHeadlines;

  final List<Headline> _headlines;

  @override
  Future<Headline> createHeadline({required Headline headline}) async {
    if (_headlines.any((h) => h.id == headline.id)) {
      throw const HeadlineCreateException(
        'Headline with this ID already exists',
      );
    }
    _headlines.add(headline);
    return headline;
  }

  @override
  Future<void> deleteHeadline({required String id}) async {
    final headlineIndex = _headlines.indexWhere((h) => h.id == id);
    if (headlineIndex == -1) {
      throw HeadlineNotFoundException('Headline with id $id not found');
    }
    _headlines.removeAt(headlineIndex);
  }

  @override
  Future<Headline?> getHeadline({required String id}) async {
    try {
      return _headlines.firstWhere((h) => h.id == id);
    } catch (_) {
      throw HeadlineNotFoundException('Headline with id $id not found');
    }
  }

  @override
  Future<List<Headline>> getHeadlines({
    int? limit,
    String? startAfterId,
    String? category,
    String? source,
    String? eventCountry,
  }) async {
    var filteredHeadlines = List<Headline>.from(_headlines);

    // Apply filters
    if (category != null) {
      filteredHeadlines =
          filteredHeadlines
              .where((h) => h.categories?.contains(category) ?? false)
              .toList();
    }
    if (source != null) {
      filteredHeadlines =
          filteredHeadlines.where((h) => h.source == source).toList();
    }
    if (eventCountry != null) {
      filteredHeadlines =
          filteredHeadlines
              .where((h) => h.eventCountry == eventCountry)
              .toList();
    }

    // Handle pagination
    if (startAfterId != null) {
      final startIndex = filteredHeadlines.indexWhere(
        (h) => h.id == startAfterId,
      );
      if (startIndex != -1) {
        filteredHeadlines = filteredHeadlines.sublist(startIndex + 1);
      }
    }

    if (limit != null) {
      filteredHeadlines =
          filteredHeadlines.length > limit
              ? filteredHeadlines.sublist(0, limit)
              : filteredHeadlines;
    }

    return filteredHeadlines;
  }

  @override
  Future<List<Headline>> searchHeadlines({required String query}) async {
    final lowerCaseQuery = query.toLowerCase();
    return _headlines
        .where(
          (h) =>
              h.title.toLowerCase().contains(lowerCaseQuery) ||
              (h.description?.toLowerCase().contains(lowerCaseQuery) ?? false),
        )
        .toList();
  }

  @override
  Future<Headline> updateHeadline({required Headline headline}) async {
    final headlineIndex = _headlines.indexWhere((h) => h.id == headline.id);
    if (headlineIndex == -1) {
      throw HeadlineNotFoundException(
        'Headline with id ${headline.id} not found',
      );
    }
    _headlines[headlineIndex] = headline;
    return headline;
  }
}
