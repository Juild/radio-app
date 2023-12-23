import 'package:json_annotation/json_annotation.dart';
part 'radio.g.dart';

@JsonSerializable()
class AppRadio {
  final String name;
  final String url;
  @JsonKey(fromJson: _faviconFromJson)
  final String favicon;
  @JsonKey(fromJson: _tagsFromJson)
  final List<String> tags;
  AppRadio({
    required this.name,
    required this.url,
    required this.favicon,
    required this.tags,
  });
  factory AppRadio.fromJson(Map<String, dynamic> json) => _$AppRadioFromJson(json);

  Map<String, dynamic> toJson() => _$AppRadioToJson(this);

  static List<String> _tagsFromJson(String jsonTags) {
    // this is necessary to remove duplicates as the API returns a string with tags separated by spaces or , with duplicated elements without a predictable pattern
    final tags = jsonTags.split(' ').toSet().join(',').split(',').toSet().toList();
    return tags;
  }

  static String _faviconFromJson(String jsonFavicon) {
    if (jsonFavicon.startsWith(RegExp(r'http.*')) && jsonFavicon.contains(RegExp(r'\.(png|jpg|jpeg|svg)$'))) {
      return jsonFavicon;
    } else {
      return '';
    }
  }
}
