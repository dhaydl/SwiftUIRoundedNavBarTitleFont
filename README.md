# SwiftUIRoundedNavBarTitleFont

SwiftUIRoundedNavBarTitleFont is a Swift package that provides a view modifier for giving a SwiftUI view a navigation title with the SF rounded font. It is compatible with iOS 16 and up and macOS 13 and up.

## Installation

1. In Xcode, open the File menu and click 'Add Package Dependencies…'.
2. Enter the URL of this repository (`https://github.com/dhaydl/SwiftUIRoundedNavBarTitleFont`) in the search field.
3. Click Add Package and use the 'Up to Next Major Version' dependency rule.
4. Now you can import the package in your project.

## Usage

Apply the `roundedNavigationTitle` view modifier to set the navigation title for a SwiftUI view. It can be as easy as:

```swift
import SwiftUI
import SwiftUIRoundedNavBarTitleFont

struct ExampleView: View {
    var body: some View {
        NavigationStack {
            List(parks) { park in
                NavigationLink(park.name, value: park)
            }
            .navigationDestination(for: Park.self) { park in
                ParkDetails(park: park)
            }
            .roundedNavigationTitle("Parks")
        }
    }
}
```

## Configuration

The appearance of a navigation title can also be tweaked. To do so, give the view modifier an instance of `NavigationTitleConfiguration`, like:

```swift
import SwiftUI
import SwiftUIRoundedNavBarTitleFont

struct ExampleView: View {
    var body: some View {
        NavigationStack {
            List(parks) { park in
                NavigationLink(park.name, value: park)
            }
            .navigationDestination(for: Park.self) { park in
                ParkDetails(park: park)
            }
            .roundedNavigationTitle(
                "Parks",
                configuration: NavigationTitleConfiguration(
                    foregroundColor: .color(Color.green)
                )
            )
        }
    }
}
```

`NavigationTitleConfiguration` currently only accepts one parameter, `foregroundColor`, to give the navigation title a specific font color. You can either pass `.color(_)` with a SwiftUI `Color` or `.nativeColor(_)` with a `UIColor` or `NSColor`.

A configuration can also be provided globally by donating it to SwiftUI's environment. Keep in mind that every other passed configuration will be ignored then (which might change depending on practicality). It works like this:

```swift
import SwiftUI
import SwiftUIRoundedNavBarTitleFont

struct MyAwesomeApp: App {
    var body: some View {
        WindowGroup {
            ContentView()
            .environment(
                \.globalNavigationTitleConfiguration,
                NavigationTitleConfiguration(
                    foregroundColor: .color(Color.green)
                )
            )
        }
    }
}
```

## License

SwiftUIRoundedNavBarTitleFont is available under the MIT license.

```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS
FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR
COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER
IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```
