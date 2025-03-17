import SwiftUI

struct TrainingView: View {
    
    @StateObject var viewModel: TrainingViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(viewModel.categories.indexedItems, id: \.offset) { _, item in
                    Button {
                        viewModel.openCategory(item)
                    } label: {
                        Text(item.title)
                            .multilineTextAlignment(.center)
                            .fontSystem(.accent)
                            .foregroundStyle(Color.tint)
                            .frame(maxWidth: .infinity, alignment: .center)
                            .frame(height: 160)
                            .background(
                                ZStack {
                                    Image("category\(item.categoryId)")
                                        .resizable()
                                        .scaledToFill()
                                        .opacity(0.2)
                                    Color.black.opacity(0.3)
                                }
                            )
                            .cornerRadius(.mainCornerRadius)
                            .overlay {
                                RoundedRectangle(cornerRadius: .mainCornerRadius)
                                    .inset(by: 1)
                                    .stroke(Color.tint, lineWidth: 2)
                            }
                    }
                }
            }
            .padding(12)
        }
        .navigationTitle("Training")
    }
}

struct TrainingView_Previews: PreviewProvider {
    
    static var previews: some View {
        TrainingView(
            viewModel: .init(
                router: Router(navigationService: NavigationService())
            )
        )
    }
}
