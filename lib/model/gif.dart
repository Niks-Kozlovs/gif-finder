// Generated using https://dart-quicktype.netlify.app/

List<Gif> gifFromJson(List<dynamic> value) => List<Gif>.from(value.map((x) => Gif.fromJson(x)));

class Gif {
    Gif({
        required this.type,
        required this.id,
        required this.url,
        required this.slug,
        required this.bitlyGifUrl,
        required this.bitlyUrl,
        required this.embedUrl,
        required this.username,
        required this.source,
        required this.title,
        required this.rating,
        required this.contentUrl,
        required this.sourceTld,
        required this.sourcePostUrl,
        required this.isSticker,
        required this.importDatetime,
        required this.trendingDatetime,
        required this.images,
        required this.analyticsResponsePayload,
        required this.analytics,
        required this.user,
    });

    final String? type;
    final String? id;
    final String? url;
    final String? slug;
    final String? bitlyGifUrl;
    final String? bitlyUrl;
    final String? embedUrl;
    final String? username;
    final String? source;
    final String? title;
    final String? rating;
    final String? contentUrl;
    final String? sourceTld;
    final String? sourcePostUrl;
    final int? isSticker;
    final DateTime? importDatetime;
    final String? trendingDatetime;
    final Images? images;
    final String? analyticsResponsePayload;
    final Analytics? analytics;
    final User? user;

    factory Gif.fromJson(Map<String, dynamic> json){
        return Gif(
        type: json["type"],
        id: json["id"],
        url: json["url"],
        slug: json["slug"],
        bitlyGifUrl: json["bitly_gif_url"],
        bitlyUrl: json["bitly_url"],
        embedUrl: json["embed_url"],
        username: json["username"],
        source: json["source"],
        title: json["title"],
        rating: json["rating"],
        contentUrl: json["content_url"],
        sourceTld: json["source_tld"],
        sourcePostUrl: json["source_post_url"],
        isSticker: json["is_sticker"],
        importDatetime: json["import_datetime"] == null ? null : DateTime.parse(json["import_datetime"]),
        trendingDatetime: json["trending_datetime"],
        images: json["images"] == null ? null : Images.fromJson(json["images"]),
        analyticsResponsePayload: json["analytics_response_payload"],
        analytics: json["analytics"] == null ? null : Analytics.fromJson(json["analytics"]),
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );
    }

}

class Analytics {
    Analytics({
        required this.onload,
        required this.onclick,
        required this.onsent,
    });

    final Onclick? onload;
    final Onclick? onclick;
    final Onclick? onsent;

    factory Analytics.fromJson(Map<String, dynamic> json){
        return Analytics(
        onload: json["onload"] == null ? null : Onclick.fromJson(json["onload"]),
        onclick: json["onclick"] == null ? null : Onclick.fromJson(json["onclick"]),
        onsent: json["onsent"] == null ? null : Onclick.fromJson(json["onsent"]),
    );
    }

}

class Onclick {
    Onclick({
        required this.url,
    });

    final String? url;

    factory Onclick.fromJson(Map<String, dynamic> json){
        return Onclick(
        url: json["url"],
    );
    }

}

class Images {
    Images({
        required this.original,
        required this.downsized,
        required this.downsizedLarge,
        required this.downsizedMedium,
        required this.downsizedSmall,
        required this.downsizedStill,
        required this.fixedHeight,
        required this.fixedHeightDownsampled,
        required this.fixedHeightSmall,
        required this.fixedHeightSmallStill,
        required this.fixedHeightStill,
        required this.fixedWidth,
        required this.fixedWidthDownsampled,
        required this.fixedWidthSmall,
        required this.fixedWidthSmallStill,
        required this.fixedWidthStill,
        required this.looping,
        required this.originalStill,
        required this.originalMp4,
        required this.preview,
        required this.previewGif,
        required this.previewWebp,
        required this.the480WStill,
        required this.hd,
    });

    final FixedHeight? original;
    final The480WStill? downsized;
    final The480WStill? downsizedLarge;
    final The480WStill? downsizedMedium;
    final DownsizedSmall? downsizedSmall;
    final The480WStill? downsizedStill;
    final FixedHeight? fixedHeight;
    final FixedHeight? fixedHeightDownsampled;
    final FixedHeight? fixedHeightSmall;
    final The480WStill? fixedHeightSmallStill;
    final The480WStill? fixedHeightStill;
    final FixedHeight? fixedWidth;
    final FixedHeight? fixedWidthDownsampled;
    final FixedHeight? fixedWidthSmall;
    final The480WStill? fixedWidthSmallStill;
    final The480WStill? fixedWidthStill;
    final Looping? looping;
    final The480WStill? originalStill;
    final DownsizedSmall? originalMp4;
    final DownsizedSmall? preview;
    final The480WStill? previewGif;
    final The480WStill? previewWebp;
    final The480WStill? the480WStill;
    final DownsizedSmall? hd;

    factory Images.fromJson(Map<String, dynamic> json){
        return Images(
        original: json["original"] == null ? null : FixedHeight.fromJson(json["original"]),
        downsized: json["downsized"] == null ? null : The480WStill.fromJson(json["downsized"]),
        downsizedLarge: json["downsized_large"] == null ? null : The480WStill.fromJson(json["downsized_large"]),
        downsizedMedium: json["downsized_medium"] == null ? null : The480WStill.fromJson(json["downsized_medium"]),
        downsizedSmall: json["downsized_small"] == null ? null : DownsizedSmall.fromJson(json["downsized_small"]),
        downsizedStill: json["downsized_still"] == null ? null : The480WStill.fromJson(json["downsized_still"]),
        fixedHeight: json["fixed_height"] == null ? null : FixedHeight.fromJson(json["fixed_height"]),
        fixedHeightDownsampled: json["fixed_height_downsampled"] == null ? null : FixedHeight.fromJson(json["fixed_height_downsampled"]),
        fixedHeightSmall: json["fixed_height_small"] == null ? null : FixedHeight.fromJson(json["fixed_height_small"]),
        fixedHeightSmallStill: json["fixed_height_small_still"] == null ? null : The480WStill.fromJson(json["fixed_height_small_still"]),
        fixedHeightStill: json["fixed_height_still"] == null ? null : The480WStill.fromJson(json["fixed_height_still"]),
        fixedWidth: json["fixed_width"] == null ? null : FixedHeight.fromJson(json["fixed_width"]),
        fixedWidthDownsampled: json["fixed_width_downsampled"] == null ? null : FixedHeight.fromJson(json["fixed_width_downsampled"]),
        fixedWidthSmall: json["fixed_width_small"] == null ? null : FixedHeight.fromJson(json["fixed_width_small"]),
        fixedWidthSmallStill: json["fixed_width_small_still"] == null ? null : The480WStill.fromJson(json["fixed_width_small_still"]),
        fixedWidthStill: json["fixed_width_still"] == null ? null : The480WStill.fromJson(json["fixed_width_still"]),
        looping: json["looping"] == null ? null : Looping.fromJson(json["looping"]),
        originalStill: json["original_still"] == null ? null : The480WStill.fromJson(json["original_still"]),
        originalMp4: json["original_mp4"] == null ? null : DownsizedSmall.fromJson(json["original_mp4"]),
        preview: json["preview"] == null ? null : DownsizedSmall.fromJson(json["preview"]),
        previewGif: json["preview_gif"] == null ? null : The480WStill.fromJson(json["preview_gif"]),
        previewWebp: json["preview_webp"] == null ? null : The480WStill.fromJson(json["preview_webp"]),
        the480WStill: json["480w_still"] == null ? null : The480WStill.fromJson(json["480w_still"]),
        hd: json["hd"] == null ? null : DownsizedSmall.fromJson(json["hd"]),
    );
    }

}

class The480WStill {
    The480WStill({
        required this.height,
        required this.width,
        required this.size,
        required this.url,
    });

    final String? height;
    final String? width;
    final String? size;
    final String? url;

    factory The480WStill.fromJson(Map<String, dynamic> json){
        return The480WStill(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
    );
    }

}

class DownsizedSmall {
    DownsizedSmall({
        required this.height,
        required this.width,
        required this.mp4Size,
        required this.mp4,
    });

    final String? height;
    final String? width;
    final String? mp4Size;
    final String? mp4;

    factory DownsizedSmall.fromJson(Map<String, dynamic> json){
        return DownsizedSmall(
        height: json["height"],
        width: json["width"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
    );
    }

}

class FixedHeight {
    FixedHeight({
        required this.height,
        required this.width,
        required this.size,
        required this.url,
        required this.mp4Size,
        required this.mp4,
        required this.webpSize,
        required this.webp,
        required this.frames,
        required this.hash,
    });

    final String? height;
    final String? width;
    final String? size;
    final String? url;
    final String? mp4Size;
    final String? mp4;
    final String? webpSize;
    final String? webp;
    final String? frames;
    final String? hash;

    factory FixedHeight.fromJson(Map<String, dynamic> json){
        return FixedHeight(
        height: json["height"],
        width: json["width"],
        size: json["size"],
        url: json["url"],
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
        webpSize: json["webp_size"],
        webp: json["webp"],
        frames: json["frames"],
        hash: json["hash"],
    );
    }

}

class Looping {
    Looping({
        required this.mp4Size,
        required this.mp4,
    });

    final String? mp4Size;
    final String? mp4;

    factory Looping.fromJson(Map<String, dynamic> json){
        return Looping(
        mp4Size: json["mp4_size"],
        mp4: json["mp4"],
    );
    }

}

class User {
    User({
        required this.avatarUrl,
        required this.bannerImage,
        required this.bannerUrl,
        required this.profileUrl,
        required this.username,
        required this.displayName,
        required this.description,
        required this.instagramUrl,
        required this.websiteUrl,
        required this.isVerified,
    });

    final String? avatarUrl;
    final String? bannerImage;
    final String? bannerUrl;
    final String? profileUrl;
    final String? username;
    final String? displayName;
    final String? description;
    final String? instagramUrl;
    final String? websiteUrl;
    final bool? isVerified;

    factory User.fromJson(Map<String, dynamic> json){
        return User(
        avatarUrl: json["avatar_url"],
        bannerImage: json["banner_image"],
        bannerUrl: json["banner_url"],
        profileUrl: json["profile_url"],
        username: json["username"],
        displayName: json["display_name"],
        description: json["description"],
        instagramUrl: json["instagram_url"],
        websiteUrl: json["website_url"],
        isVerified: json["is_verified"],
    );
    }

}
