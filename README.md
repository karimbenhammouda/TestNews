# TestNews

This is a project that allows you to consume a web service to display a list of news, consult the details of each news and check the source of the latter.

This project contains 3 screens: 
- news list screen to display the news list returns by the web service.
- screen that allows you to display the details of the news.
- a screen that allows you to display the news source in web view.

version xcode 16.2
language: Swift 
architecture: MVVM

This project is made with:
- Storyboard
- view in xib
- cell collection view in xib
- Package Dependencies
- Localizable 

The project is broken down into three main parts:
- Service: This part represents the network part to consume web services.
- Models: represents the data returned by the web service.
- News: it presents all the screen part of the application.

API used in this application: https://newsapi.org/docs, This API uses an API Key, 
This API can take into consideration several criteria to retrieve data.
example: country, category, language, sortBy
recognized problem with this API: you can't search for data just with the language and API doesn't respond if the result is very large.


  

  
