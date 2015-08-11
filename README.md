## Networking with Swift and Alamofire

A nice simple iOS app which delivers a random Chuck Norris quote, fresh from the [Chuck Norris API](http://www.icndb.com/api/).

![screenshot](https://github.com/yvettecook/ChuckNorrisWithAlamoFire/blob/master/chuck_norris_win.png =300x)

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
Passing the callback:
```
getQuoteFromChuckNorrisAPI(onAPIResponse)
```
Using the callback:
```
quoteFromAPI = "Message to display"
onResponseCallback(quoteFromAPI)
```

Basically, you are giving a name (`onAPIResponse`) to a function (`self.lbWordsOfWisdom.text = quote`) which takes a string, and shoves it on the label.

You then pass the api function (`getQuoteFromChuckNorrisAPI`) the named function (`onAPIResponse`) as an argument.

The api function then uses Alamofire to get the JSON, pull out the joke as a string, and the passes it to your callback (`onAPIResponse`) to deal with.

#### Syncronous Requests

This might seem a bit over the top for a simple API. So what happens if you don't use a callback?

We don't have imagine this horrible dystopia. Check out the `syncronous-calls` branch of this project, and run it.

Chuck Norris says ... Nothing!

This happens because of race conditions. ln47, which should be returning the result of the API, is return an empty string. This is because whilst Alamofire is dutifully contacting the Chuck Norris database, your code has rushed on ahead to the next bit, return the value for `quoteFromAPI`. Check out the logging statements in the debugger to see this in action.


#### Disclaimer

This code is designed to keep things as simple as possible. Hopefully it succeeds, and hasn't melted your brain (sorry if it has). If you were doing this within a larger app you would need to considor:

* Error handling
* Extracting the API calls into a seperate class to conform to the MVC design model
