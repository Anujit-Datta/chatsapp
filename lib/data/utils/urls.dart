class Urls{
  static const String _baseUrl = "http://10.0.2.2:5000/api/v1/";

  //user:
  static const String login = "$_baseUrl/user/login";
  static const String register = "$_baseUrl/user/register";

  //chats:
  static const String getChats = "$_baseUrl/chat";
  static const String createChat = "$_baseUrl/chat/create";

  //messages:
}