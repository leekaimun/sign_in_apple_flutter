# sign_in_apple_flutter

Flutter app to run on Android to implement sign_in_with_apple package. The purpose is to test the php backend server implementation. php backend server is hosted in aws where the api can be reached via a https url configured with Cloudflare. This api link is the redirect url input to the sign_in_with_apple package; that is, Apple will redirect it's web view after the user has successfully login and approve the authentication.
After the php code has run, a redirect will be sent to the web view after which control will return back to the flutter app.
