import SwiftUI
import SDWebImageSwiftUI


public struct ImageSlider: View {
    
    public let timer = Timer.publish(every: 3, on: .main, in: .common).autoconnect()
        @State private var selection = 0
        
        ///  images with these names are placed  in my assets
    let images:[String]
        

    public init(_ images:[String]){
        
        self.images = images
    }
    
    public var body: some View {
        
        VStack{
            
            //Color.black
            
            TabView(selection : $selection){
                
                ForEach(0..<images.count){ i in
                    
                    WebImage(url: URL(string : images[i]))
                        .resizable()
                        .placeholder(Image("100-64").resizable())
                        .ignoresSafeArea(.container, edges: .top)
                        
                }
                
                
            }.tabViewStyle(PageTabViewStyle())
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                .onReceive(timer, perform: { _ in
                    
                    withAnimation{
                        selection = selection < images.count ? selection + 1 : 0
                    }
                })
            
        }

        
    }
}
