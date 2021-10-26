import SwiftUI

private var id:Int = 0
func uniqueID()->Int { id += 1; return id }

struct HelpContent:Identifiable{
    var id:String = ""
    var contents:[HelpContent] = []

    init(jsonObject:Any){
        if let str = jsonObject as? String {
            id = str;contents = []
        } else if var array = jsonObject as? [AnyObject] {
            id = array.removeFirst() as? String ?? "@Array \(uniqueID()), \(array.count) objects"
            contents = array.map{  HelpContent(jsonObject: $0) }
        }
    }
    init(bundleResource:String){
        do{
            guard let url =  Bundle.main.url(forResource: bundleResource, withExtension: "json") else { throw CocoaError(.fileReadCorruptFile) }
            let data = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
            self.init(jsonObject:jsonObject)
        } catch let error { self.init(jsonObject: error.localizedDescription)}
    }
}

@available(iOS 14, macOS 11.0, *)
struct JSONHelpView: View {
    var content:HelpContent
    var level:Int = 0
    
    var body: some View{
        let title = content.id.first == "@" ? "" : content.id
        let contentView = ForEach(content.contents){ obj in
            JSONHelpView(content: obj, level:level+1)
        }
        if content.contents.isEmpty { Text(title) }
        else if level == 0 { List{ contentView }.navigationTitle(title) }
        else if level % 2 == 1 {
            Section(content.id.first == "@" ? "" : content.id){ contentView }
        }
        else if level % 2 == 0 {
            NavigationLink.init(title, destination: { List{ contentView }.navigationTitle(title) })
        }
    }
}
