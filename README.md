# Example of using MVP architecture pattern with coordinator. 

First of all as we all know MVC is the recommended architectural pattern to create iOS applications where 
ViewController contains the View and updates the Model. This pattern has a lot of disadvantages such as 
Massive View Controller with about 1000+ lines of codes, lots of dependencies, difficult to unit test etc.
In general I try to use MVC only for building simpler iOS applications.
## MVP Advantages
- Model is a structure that manages the data. It’s not the data itself rather than it is responsible for making new 
entries in the database, reading or deleting entries in the database.
- View consists of both UIViews and UIViewController. UIViewController is main object in all iOS 
applications and all user interactions from the View gets passed on to the presenter.
- Presenter works with services, managers and passes processed data to the view.
## MVP Disadvantages
- We must create a lot of files such as UIViewController, presenter, builder witch assambly our scene, 
add dependencies between VC and presenter etc.
- We can't use stroryboards, all works with UI carried out through Xib.
- We must implement coordinators if we want to use NavigationController or TabBarController.
# To sum up
MVP allows us to carry over application logic in Presenter, ViewController is responsible for user actions and display UI.
And last I want you to show results of an extensive study done on CPU and Memory allocation of an app being made with design patterns such 
as MVC vs MVP vs MVVM:
![Image description](https://www.simform.com/wp-content/uploads/2018/01/cpu-usage-1-copy.png)
![Image description](https://www.simform.com/wp-content/uploads/2018/01/Memory-usage-1-Copy-1.png)
