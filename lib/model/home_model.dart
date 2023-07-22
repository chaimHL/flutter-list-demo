import 'dart:convert';

HomeListItem homeListItemFromJson(String str) =>
    HomeListItem.fromJson(json.decode(str));

String homeListItemToJson(HomeListItem data) => json.encode(data.toJson());

class HomeListItem {
  String? id;
  String? postTitle;
  DateTime? postDate;
  String? postAuthor;
  String? commentCount;
  String? selectedTime;
  String? columnPostPicture;
  String? isSelected;
  String? category;
  String? content;
  String? commentNum;
  int? readCount;
  String? postImage;
  bool? isJob;
  bool? isRmb;
  bool? colorTip;
  bool? isJb;
  String? username;
  String? nickname;
  String? userImg;
  bool? isOriginal;
  String? url;
  bool? paidRead;
  bool? vipRead;
  bool? isZone;
  String? zone;
  String? column;
  bool? myColumn;
  bool? vip;
  String? vipTime;

  HomeListItem({
    this.id,
    this.postTitle,
    this.postDate,
    this.postAuthor,
    this.commentCount,
    this.selectedTime,
    this.columnPostPicture,
    this.isSelected,
    this.category,
    this.content,
    this.commentNum,
    this.readCount,
    this.postImage,
    this.isJob,
    this.isRmb,
    this.colorTip,
    this.isJb,
    this.username,
    this.nickname,
    this.userImg,
    this.isOriginal,
    this.url,
    this.paidRead,
    this.vipRead,
    this.isZone,
    this.zone,
    this.column,
    this.myColumn,
    this.vip,
    this.vipTime,
  });

  factory HomeListItem.fromJson(Map<String, dynamic> json) => HomeListItem(
        id: json["ID"],
        postTitle: json["post_title"],
        postDate: json["post_date"] == null
            ? null
            : DateTime.parse(json["post_date"]),
        postAuthor: json["post_author"],
        commentCount: json["comment_count"],
        selectedTime: json["selected_time"],
        columnPostPicture: json["column_post_picture"],
        isSelected: json["is_selected"],
        category: json["category"],
        content: json["content"],
        commentNum: json["comment_num"],
        readCount: json["read_count"],
        postImage: json["post_image"],
        isJob: json["is_job"],
        isRmb: json["is_rmb"],
        colorTip: json["color_tip"],
        isJb: json["is_jb"],
        username: json["username"],
        nickname: json["nickname"],
        userImg: json["user_img"],
        isOriginal: json["is_original"],
        url: json["url"],
        paidRead: json["paid_read"],
        vipRead: json["vip_read"],
        isZone: json["is_zone"],
        zone: json["zone"],
        column: json["column"],
        myColumn: json["my_column"],
        vip: json["vip"],
        vipTime: json["vip_time"],
      );

  Map<String, dynamic> toJson() => {
        "ID": id,
        "post_title": postTitle,
        "post_date": postDate?.toIso8601String(),
        "post_author": postAuthor,
        "comment_count": commentCount,
        "selected_time": selectedTime,
        "column_post_picture": columnPostPicture,
        "is_selected": isSelected,
        "category": category,
        "content": content,
        "comment_num": commentNum,
        "read_count": readCount,
        "post_image": postImage,
        "is_job": isJob,
        "is_rmb": isRmb,
        "color_tip": colorTip,
        "is_jb": isJb,
        "username": username,
        "nickname": nickname,
        "user_img": userImg,
        "is_original": isOriginal,
        "url": url,
        "paid_read": paidRead,
        "vip_read": vipRead,
        "is_zone": isZone,
        "zone": zone,
        "column": column,
        "my_column": myColumn,
        "vip": vip,
        "vip_time": vipTime,
      };

  // 为了在打印时方便查看
  @override
  String toString() {
    return 'HomeListItem{id: $id, postTitle: $postTitle, postDate: $postDate, postAuthor: $postAuthor, commentCount: $commentCount, selectedTime: $selectedTime, columnPostPicture: $columnPostPicture, isSelected: $isSelected, category: $category, content: $content, commentNum: $commentNum, readCount: $readCount, postImage: $postImage, isJob: $isJob, isRmb: $isRmb, colorTip: $colorTip, isJb: $isJb, username: $username, nickname: $nickname, userImg: $userImg, isOriginal: $isOriginal, url: $url, paidRead: $paidRead, vipRead: $vipRead, isZone: $isZone, zone: $zone, column: $column, myColumn: $myColumn, vip: $vip, vipTime: $vipTime}';
  }
}
