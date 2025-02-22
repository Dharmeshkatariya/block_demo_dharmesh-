class AppRegex {
  const AppRegex._();

  /// Forbidden file name characters.
  static RegExp forbiddenFileNameCharacterRegex = RegExp(r'[\\\/\:\*\?\"\<\>\|]');

  /// Forbidden name characters.
  static RegExp forbiddenNameCharacterRegExp = RegExp(r'[\{\}\(\)\[\]\/\\\<\>\&\*\|\=\?\:\;\,\$\#\^\~\!\%\@\+]');

  /// Forbidden email characters.
  static RegExp forbiddenEmailCharacterRegExp = RegExp(r'[\{\}\[\]\\\/\<\>\&\*\|\=\?\:\;\,\$\#\^\~\!\%\+]');

  /// Required special characters for password change.
  static RegExp requiredPasswordSpecialCharacterRegExp = RegExp(r'[\{\}\[\]\\\/\<\>\!\@\#\$\%\^\&\*\(\)\,\.\?\:\|]');

  /// Numeric RegExp (0-9).
  static RegExp numericCharacterRegExp = RegExp(r'[0-9]');

  /// Uppercase Character RegExp (A-Z).
  static RegExp uppercaseCharacterRegExp = RegExp(r'[A-Z]');

  /// Lowercase Character RegExp (a-z).
  static RegExp lowercaseCharacterRegExp = RegExp(r'[a-z]');

  /// Case Insensitive Character RegExp (A-Z a-z).
  static RegExp caseInsensitiveCharacter = RegExp(r'[A-Za-z]');

  /// Alpha Numeric RegExp (A-Z a-z 0-9).
  static RegExp alphaNumericRegExp = RegExp(r'[A-Za-z0-9]');

  /// Embedded Youtube Link RegExp.
  static final RegExp embeddedYouTubeVideoLinkRegExp = RegExp(r'youtube\.com\/embed\/[a-zA-Z0-9_-]{11}');

  /// Normal Youtube Link RegExp.
  static final RegExp normalYouTubeVideoLinkRegExp = RegExp(r'youtube\.com\/watch\?v=[a-zA-Z0-9_-]{11}');

  /// Sharing Youtube Link RegExp.
  static final RegExp sharingYouTubeVideoLinkRegExp = RegExp(r'youtu.be\/[a-zA-Z0-9_-]{11}');

  /// Embedded Vimeo Link RegExp.
  static final RegExp embeddedVimeoVideoLinkRegExp = RegExp(r'player\.vimeo\.com\/video\/\d+');

  /// Normal Vimeo Link RegExp.
  static final RegExp normalVimeoVideoLinkRegExp = RegExp(r'vimeo\.com\/\d+');

  /// Embedded DailyMotion Link RegExp.
  static final RegExp embeddedDailyMotionVideoLinkRegExp = RegExp(r'dailymotion\.com\/embed\/video\/[a-zA-Z0-9]+');

  /// Normal DailyMotion Link RegExp.
  static final RegExp normalDailyMotionVideoLinkRegExp = RegExp(r'dailymotion\.com\/video\/[a-zA-Z0-9]+');

  /// Sharing DailyMotion Link RegExp.
  static final RegExp sharingDailyMotionVideoLinkRegExp = RegExp(r'dai.ly\/[a-zA-Z0-9]+');

  /// Phone Number Validation RegExp (10-15 digits, allows spaces, dashes, and parentheses)
  static RegExp phoneNumberRegExp = RegExp(r'^\+?[\d\s\-\(\)]{10,15}$');

  /// Hexadecimal Color Code Validation RegExp
  static RegExp hexColorRegExp = RegExp(r'^#?([a-fA-F0-9]{6}|[a-fA-F0-9]{3})$');

  /// URL Validation RegExp
  static RegExp urlRegExp = RegExp(r'^(https?:\/\/)?([a-zA-Z0-9\-.]+)\.([a-zA-Z]{2,})(\/[a-zA-Z0-9\-.]*)*\/?$');

  /// IP Address Validation RegExp
  static RegExp ipAddressRegExp = RegExp(r'^(?:[0-9]{1,3}\.){3}[0-9]{1,3}$');

  /// HTML Tag Validation RegExp
  static RegExp htmlTagRegExp = RegExp(r'<\/?[a-z][\s\S]*>');

  /// Date (YYYY-MM-DD) Validation RegExp
  static RegExp dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');

  /// Email Validation RegExp.
  static RegExp emailValidationRegExp = RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');

  /// Strong Password Validation RegExp.
  /// At least 8 characters, at least one uppercase letter, one lowercase letter, one number, and one special character.
  static RegExp strongPasswordRegExp = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\{\}\[\]\\\/\<\>\!\@\#\$\%\^\&\*\(\)\,\.\?\:\|])[A-Za-z\d\{\}\[\]\\\/\<\>\!\@\#\$\%\^\&\*\(\)\,\.\?\:\|]{8,}$');
}
