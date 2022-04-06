import 'dart:convert';

import 'package:ota/network/api/api_constant.dart';
import 'package:ota/network/api/ota_api.dart';
import 'package:ota/network/response/article_response/article_response.dart';
import 'package:ota/network/response/article_response/read_article_response.dart';
import 'package:ota/network/response/banner_response/banner_response.dart';
import 'package:http/http.dart' as http;
import 'package:ota/network/response/light_novle_response/light_novel_response.dart';
import 'package:ota/network/response/light_novle_response/read_light_novel.dart';
import 'package:ota/network/response/light_novle_response/read_light_novel_content.dart';
import 'package:ota/network/response/manga_response/manga_response.dart';
import 'package:ota/network/response/manga_response/read_chapter_manga_response.dart';
import 'package:ota/network/response/manga_response/read_manga_content_response.dart';

class OTAApiImpl extends OTAApi {
  @override
  Future<BannerResponse> getBanner() async {
    var url = Uri.https(baseAPI, bannerEndPoint);
    var response = await http.get(url);
    return Future.value(
        BannerResponse.bannerFromResponse(json.decode(response.body)));
  }

  @override
  Future<MangaResponse> getManga() async {
    var url = Uri.https(baseAPI, mangaEndPoint);
    var response = await http.get(url);
    return Future.value(
        MangaResponse.mangaFromResponse(json.decode(response.body)));
  }

  @override
  Future<LightNovelResponse> getLightNovel() async {
    var url = Uri.https(baseAPI, lightNovelEndPoint);
    var response = await http.get(url);
    return Future.value(
        LightNovelResponse.lightNovelFromResponse(json.decode(response.body)));
  }

  @override
  Future<ArticleResponse> getArticle() async {
    var url = Uri.https(baseAPI, articleEndPoint);
    var response = await http.get(url);
    return Future.value(
        ArticleResponse.articleFromResponse(json.decode(response.body)));
  }

  @override
  Future<MangaResponse> searchManga(String searchKeyWork) async {
    Map<String, String> queryParameters = {
      queryParamsSearch: searchKeyWork,
    };
    var url = Uri.https(baseAPI, searchMangaEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(
        MangaResponse.mangaFromResponse(json.decode(response.body)));
  }

  @override
  Future<LightNovelResponse> searchLightNovel(String searchKeyWork) async {
    Map<String, String> queryParameters = {
      queryParamsSearch: searchKeyWork,
    };
    var url = Uri.https(baseAPI, searchLightNovelEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(
        LightNovelResponse.lightNovelFromResponse(json.decode(response.body)));
  }

  @override
  Future<ArticleResponse> searchArticle(String searchKeyWork) async {
    Map<String, String> queryParameters = {
      queryParamsSearch: searchKeyWork,
    };
    var url = Uri.https(baseAPI, searchArticelEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(
        ArticleResponse.articleFromResponse(json.decode(response.body)));
  }

  @override
  Future<ReadChapterMangaResponse> readChapterManga(String mangaID) async {
    Map<String, String> queryParameters = {
      queryParamsMangaID: mangaID,
    };
    var url = Uri.https(baseAPI, readChapterMangaEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(ReadChapterMangaResponse.readChapterMangaFromResponse(
        json.decode(response.body)));
  }

  @override
  Future<ReadLightNovelResponse> readLightNovel(String lightNovelID) async {
    Map<String, String> queryParameters = {
      queryParamsLightNovelID: lightNovelID,
    };
    var url = Uri.https(baseAPI, readLightNovelEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(ReadLightNovelResponse.readLightNovelFromResponse(
        json.decode(response.body)));
  }

  @override
  Future<ReadArticleResponse> readArticle(String aricleID) async {
    Map<String, String> queryParameters = {
      queryParamsArtID: aricleID,
    };
    var url = Uri.https(baseAPI, readArticleEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(ReadArticleResponse.readArticleFromResponse(
        json.decode(response.body)));
  }

  @override
  Future<ReadLightNovelContentResponse> readLightNovelContent(
      String chptID) async {
    Map<String, String> queryParameters = {
      queryParamsChptID: chptID,
    };
    var url =
        Uri.https(baseAPI, readLightNovelContentEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(
        ReadLightNovelContentResponse.readLightNovelContentFromResponse(
            json.decode(response.body)));
  }

  @override
  Future<ReadMangaContentResponse> readMangaContent(String chptID) async {
    Map<String, String> queryParameters = {
      queryParamsChptID: chptID,
    };
    var url = Uri.https(baseAPI, readMangaContentEndPoint, queryParameters);
    var response = await http.get(url);
    return Future.value(ReadMangaContentResponse.readMangaContentFromResponse(
        json.decode(response.body)));
  }
}
