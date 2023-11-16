/// Watch the [authTokenProvider] to check if the user is logged in.
// ignore_for_file: prefer_typing_uninitialized_variables, constant_identifier_names

var authTokenProvider;
var email;

// Errors
const USER_INVALID_RESPONSE = 100;
const NO_INTERNET = 101;
const INVALID_FORMAT = 102;
const UNKNOWN_ERROR = 103;
