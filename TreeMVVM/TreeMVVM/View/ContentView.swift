import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: ContentViewModel
        
    var body: some View {
        NavigationStack {
            List(viewModel.trees, id: \.self) { tree in
                NavigationLink {
                    TreeDetail(tree: tree)
                } label: {
                    Text(tree.name ?? "No name")
                }
            }
            .navigationTitle("Trees Project")
        }
        .onAppear {
            Task {
                await viewModel.fetch()
            }
        }
    }
}
