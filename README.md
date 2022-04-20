# ImageSliderSwiftUI

A description of this package.

Simple Image Slider for SwiftUI. It takes URLs as input and displays them as slider.

Sample Usage 

```swift

struct ContentView: View {
   var body: some View {
       VStack{
           ImageSlider(
                [   
                    "https://picsum.photos/id/500/414/283",
                    "https://picsum.photos/id/501/200/100",
                    "https://picsum.photos/id/502/200/283"
                ]
            )
       }
    }
}

```
