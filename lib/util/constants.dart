//Constants for the app
const int delayAfterTextInputInMs = 500;

//GIPHY configs
const String gifBaseURL = 'https://api.giphy.com/';
const String gifSearchURL = '${gifBaseURL}v1/gifs/search';
// Max is 50 for beta keys
const int objectLimit = 25;

//Response codes
const int userInvalidResponse = 100;
const int noInternetConnection = 101;
const int invalidFormat = 102;
const int unknownError = 103;
