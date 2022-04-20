import SwiftUI
import SDWebImageSwiftUI


@available(iOS 13.0, *)
struct ImageSlider: View {
    
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
        @State private var selection = 0
        
        ///  images with these names are placed  in my assets
    let images:[String]
        

    
    var body: some View {
        
        VStack{
            
            //Color.black
            
            TabView(selection : $selection){
                
                ForEach(0..<images.count){ i in
                    
                    WebImage(url: URL(string : images[i]))
                        .resizable()
                        .ignoresSafeArea(.container, edges: .top)

                }
                
                
            }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .onReceive(timer, perform: { _ in
                    
                    withAnimation{
                        print("selection is",selection)
                        selection = selection < images.count ? selection + 1 : 0
                    }
                })
            
        }

        
    }
}
