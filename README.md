# Shoee

Shoee is a Flutter-based e-commerce application that allows users to browse and purchase products. The app includes features such as product search, filtering by company, and adding products to the cart.

## Features

- **Product Listing**: Browse a list of available products.

- **Search**: Search for products by name.

- **Filter**: Filter products by company.

- **Product Details**: View detailed information about a product.

- **Add to Cart**: Add products to the shopping cart.

- **Remove from Cart**: Remove products from the shopping cart.

## Getting Started

### Prerequisites

- **Flutter SDK**: [Install Flutter](https://flutter.dev/docs/get-started/install)

- **Android Studio** or **Visual Studio Code**: [Install Android Studio](https://developer.android.com/studio) or [Install Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**:

```sh

git clone https://github.com/vijay4dev/ecomapp_project.git

```

2. **Navigate to the project directory**:

```sh

cd ecomapp_project

```

3. **Get the dependencies**:

```sh

flutter pub get

```

### Running the App

1. **Run the app**:

```sh

flutter run

```

## Project Structure

shoee/ ├── android/ # Android-specific files ├── ios/ # iOS-specific files ├── lib/ # Main Flutter application code │ ├── pages/ # Application pages │ │ ├── cart_provider.dart # Manages cart state │ │ ├── cartpage.dart # Displays the shopping cart │ │ ├── product_card.dart # Displays individual product cards │ │ ├── product_details_page.dart # Displays detailed product information │ │ ├── product_list.dart # Displays list of products with search/filter │ │ ├── shoe_filter.dart # Filter widget to filter products by company │ ├── main.dart # Main entry point of the application ├── assets/ # Assets such as images and fonts ├── build/ # Generated files ├── pubspec.yaml # Project dependencies and metadata └── README.md # Project README file


## Key Files

- **main.dart**: The main entry point of the application.

- **product_list.dart**: Displays the list of products with search and filter functionality.

- **product_details_page.dart**: Displays detailed information about a product.

- **cart_provider.dart**: Manages the state of the shopping cart.

- **cartpage.dart**: Displays the products added to the cart.

- **shoe_filter.dart**: Widget for filtering products by company.

## Build and Release

### Android

**Build the APK**:

```sh

flutter  build  apk  --release  --split-per-abi

```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

👍 it's my first flutter app so please gove your feedbacks to add more