## Networking with Swift and Alamofire

A nice simple iOS app which delivers a random Chuck Norris quote, fresh from the [Chuck Norris API](http://www.icndb.com/api/).

### To use

1. Clone this repo
2. Change into the project directory
3. `$ sudo gem install cocoapods`
4. `$ pod install`
5. `$ open BasicNetworkingAlamoFire.xcworkspace`
6. In Xcode, click Play to build to your device or simulator.


### Some notes on the code

All the code you want to be looking at is in the ViewController.swift file.

The most confusing part of this code might be the callbacks.

What is a callback?  
>"In computer programming, a callback is a piece of executable code that is passed as an argument to other code, which is expected to call back (execute) the argument at some convenient time."

In Swift this looks like this:

Defining the callback:
```
let onAPIResponse : (String) -> Void = {
    (quote : String) in
        self.lbWordsOfWisdom.text = quote
  }
```
Using the callback:
```
getQuoteFromChuckNorrisAPI(onAPIResponse)
```

Basically, you are giving a name (`onAPIResponse`) to a function (`self.lbWordsOfWisdom.text = quote`) which returns takes a string, and shoves it on the label.

You then pass the api function (`getQuoteFromChuckNorrisAPI`) the named function (`onAPIResponse`) as an argument.

The api function then uses Alamofire to get the JSON, pull out the joke as a string, and the passes it to your callback (`onAPIResponse`) to deal with.

#### Asyncronous Requests


#### Callbacks


#### Disclaimer

This code is designed to keep things as simple as possible. If you were doing this within a larger app you would need to considor:

* Error handling
* Extracting the API calls into a seperate class to conform to the MVC design model
