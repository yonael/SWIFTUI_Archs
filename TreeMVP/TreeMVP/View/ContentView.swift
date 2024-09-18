import SwiftUI
import TreeServices

struct ContentView: View {
    @ObservedObject var viewModel: TreeViewModel
    
    var body: some View {
        NavigationView { () -> AnyView in
            switch viewModel.uiState {
            case .loading:
                return AnyView(ProgressView()
                    .navigationTitle("Trees Project"))
            case .error(let message):
                return AnyView(Text(message)
                    .navigationTitle("Trees Project"))
            case .loaded(let trees):
                return AnyView(List(trees, id: \.self) { tree in
                    NavigationLink {
                        TreeDetail(tree: tree)
                    } label: {
                        Text(tree.name ?? "No name")
                    }
                }
                    .navigationTitle("Trees Project")
                )
            }
        }
        .onAppear {
            Task {
                await viewModel.fetch()
            }
        }
    }
}
