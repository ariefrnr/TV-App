# AI Code Review Exercise (iOS)
```swift
class MovieViewModel: ObservableObject {
  var movies: [Movie] = []
  func loadMovies() {
    let data = try! Data(contentsOf: URL(string: "https://api.example.com/movies")!)
    movies = try! JSONDecoder().decode([Movie].self, from: data)
  }
}
```
## Problems
1. declaration of movies
```swift
var movies: [Movie] = []
```
Reason: Personally, I would change the declaration to private and use `init` to assign the initial value to the variable. This ensures that the view layer cannot manage the variable beyond read-only access.

2. Creating a function
```swift
func loadMovies() {}
```
Reason: Same as before, I will personally change it to private and create a new public function to access the `loadMovies` function. This new public function can also be used to manage the view state (such as loading, error, and loaded) to avoid repetitive code.

3. Declaration of API URL
```swift
let data = try! Data(contentsOf: URL(string: "https://api.example.com/movies")!)
```
Reason: Personally, I would move the API into a `.env` file or a configuration file to prevent public access. This is done to minimize security risks posed by hackers.
