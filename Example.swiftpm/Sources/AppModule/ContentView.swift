import SwiftUI
import Branch

struct ContentView: View {
    var body: some View {
        VStack {
            Label("git-branch", systemImage: "arrow.triangle.branch")
                .foregroundColor(.accentColor)
            Text(Branch.currentName)
                .font(.largeTitle)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
