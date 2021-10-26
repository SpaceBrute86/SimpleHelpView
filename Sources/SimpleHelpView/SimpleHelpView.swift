import SwiftUI

private var idCounter:Int = 0
private func uniqueID()->Int { idCounter += 1; return idCounter }

public struct HelpContent:Identifiable{
    public var id:String = ""
    var contents:[HelpContent] = []

    ///Must be a string or an array
    public init(jsonObject:Any){
        if let str = jsonObject as? String {
            id = str;contents = []
        } else if var array = jsonObject as? [AnyObject] {
            id = array.removeFirst() as? String ?? "@Array \(uniqueID()), \(array.count) objects"
            contents = array.map{  HelpContent(jsonObject: $0) }
        }
    }
    public init(bundleResource:String){
        do{
            guard let url =  Bundle.main.url(forResource: bundleResource, withExtension: "json") else { throw CocoaError(.fileReadCorruptFile) }
            let data = try Data(contentsOf: url)
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions(rawValue: 0))
            self.init(jsonObject:jsonObject)
        } catch let error { self.init(jsonObject: error.localizedDescription)}
    }
}

@available(iOS 14.0, macOS 11.0, *)
public struct SimpleHelpView: View {
    public var content:HelpContent
    var level:Int = 0
    
    public init(content:HelpContent){self.content = content}
    public init(bundleResource resource:String){
        self.init(content: HelpContent(bundleResource: resource) )
    }
    
    
    public var body: some View{
        let title = content.id.first == "@" ? "" : content.id
        let contentView = ForEach(content.contents){ obj in
            SimpleHelpView(content: obj, level:level+1)
        }
        if content.contents.isEmpty { Text(title) }
        else if level == 0 { List{ contentView }.navigationTitle(title) }
        else if level % 2 == 1 {
            Section(content:{ contentView },header:{Text(title)})
        }
        else if level % 2 == 0 {
            NavigationLink.init(title, destination: { List{ contentView }.navigationTitle(title) })
        }
    }
}
