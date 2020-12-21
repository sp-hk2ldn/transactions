# transactions
Uses MVVM
* Tried to avoid 3rd party dependencies so had a bit of an issue figuring out how to do data binding effectively; settled on trying to learn Combine for the validation logic etc.
* As a result of this and starting to run out of time, the Transaction screen uses just the typical way of populating a tableview with almost no logic required in the VM.
* Also, I was trying to learn testing for combine and that's still very new to me so unfortunately the tests for the landing vm will be quite useless.

Improvements I would add if continuing:

* Improving the tests in general & learning how to test with combine
* Use combine for the whole thing (seems a bit cleaner than RxSwift & I didn't notice any retain cycles)
* The API code is ugly, I would probably make it much more generic and use Enums for the endpoints
* Improve the JSON decoding, I find the silent fail ?? + use default value error prone
* Make the UI not look horrible

