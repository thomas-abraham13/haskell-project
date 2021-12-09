# haskell-project
During this project your group will implement a stack-based Haskell app for harvesting information from the Web and saving it on a database. Make sure you are using stack to create, build and run your project. Please use "haskell-project" for the Haskell stack project name. The app should also give the users the ability to query the data on the database. The main tasks can be summarised as follows:

    Choose a website which contains some data of interest. This could be anything you like, e.g. football scores, weather or crime data, house prices, news items, movie details, etc.
    Write one module that defines the Haskell data types you are using (Types.hs), another defines a function for downloading the document (HTML, CSV, XML or JSON) from the web (Fetch.hs), and another module that parses the downloaded data into the given Haskell datatype (Parse.hs).
    Write a module (Database.hs) that creates DB tables, saves/retrieves data from/to a database using again the appropriate Haskell data types.
    Your parsing module (Parse.hs) should also provide a function that generates a JSON representation of your Haskell data and writes to a file.
    From the Main.hs a user should be able to (interactively) create and initialise an sqlite database, download data and save to database, run queries on the database.
    Comment your code using haddock notation so that haddock documentation can be automatically generated for your app.
    Come up with an extra challenging feature related to your project and implement that feature (required for full marks).
    Write a 1-2 page(s) report explaining what your app does, how to run it, and justify any design choices you have had to make. If you have implemented an extra feature, explain what that feature is, and why it was challenging to implement.

Extra modules: For this project you will be using extra Haskell modules for database access and HTTP requests. You should manage your project’s dependencies with the stack tool, using one of the latest LTS available (lts-18-15). Use sqlite-simple for database access and http-conduit for HTTP requests. If you are fetching JSON data then you can also use the aeson library for parsing. Make sure that you are using an sqlite database (do not use MySQL or Postgres) as this needs to be a self-contained app so we can test.

Ways of Obtaining Online Data: There are two basic ways of harvesting data from the Internet:

    A program downloads an HTML file and parses the contents of that html for relevant information. This assumes that the structure of the HTML will be fixed. If that’s not the case your program might eventually fail to work.
    It might be that the information required is already available in a structured way as a CSV, JSON or XML file. Such data might be obtained either directly from a permanent link, or more commonly it will be available through a Web API (such as a REST API). Some examples of websites that provide APIs: Amazon, Twitter, RottenTomatoes, last.fm.

The Report: Write a 1-2 page(s) report explaining how to compile / run / use your application. Add report as a pdf document at top level of your stack project. Give details of what Web source you are using, and how you are extracting the information. Describe any extra features that you have chosen to implement that you think goes beyond what has been asked.
