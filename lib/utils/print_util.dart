void printResponse(String key, String value, bool isError){
  if(!isError) {
    print("\x1B[34m$key api response:\x1B[34m \x1B[32m$value\x1B[0m");
  } else {
    print("\x1B[31m$key api error: $value\x1B[0m");
  }
}