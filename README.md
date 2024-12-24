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

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Android Studio or Visual Studio Code: [Install Android Studio](https://developer.android.com/studio) or [Install Visual Studio Code](https://code.visualstudio.com/)

### Installation

1. **Clone the repository**:

    ```sh
    git clone https://github.com/yourusername/shoee.git
    cd shoee
    ```

2. **Install dependencies**:

    ```sh
    flutter pub get
    ```

3. **Run the app**:

    ```sh
    flutter run
    ```

## Project Structure
shoee/ ├── android/ # Android-specific files ├── ios/ # iOS-specific files ├── lib/ # Main Flutter application code │ ├── pages/ # Application pages │ │ ├── cart_provider.dart │ │ ├── cartpage.dart │ │ ├── product_card.dart │ │ ├── product_details_page.dart │ │ ├── product_list.dart │ │ ├── shoe_filter.dart │ ├── main.dart # Main entry point of the application ├── assets/ # Assets such as images and fonts ├── build/ # Generated files ├── pubspec.yaml # Project dependencies and metadata └── README.md # Project README file


## Key Files

- **main.dart**: The main entry point of the application.
- **product_list.dart**: Displays the list of products with search and filter functionality.
- **product_details_page.dart**: Displays detailed information about a product.
- **cart_provider.dart**: Manages the state of the shopping cart.
- **cartpage.dart**: Displays the products added to the cart.
- **shoe_filter.dart**: Widget for filtering products by company.

## Build and Release

### Android

1. **Build the APK**:

    ```sh
    flutter build apk --release --split-per-abi
    ```

2. **Rename the APK files** (optional):

    Create a script named `rename_apks.sh` and run it after building the APKs.

    ```sh
    #!/bin/bash

    # Define the output directory
    OUTPUT_DIR="build/app/outputs/flutter-apk"

    # Rename the APK files
    mv "$OUTPUT_DIR/app-armeabi-v7a-release.apk" "$OUTPUT_DIR/app-release-armeabi-v7a.apk"
    mv "$OUTPUT_DIR/app-arm64-v8a-release.apk" "$OUTPUT_DIR/app-release-arm64-v8a.apk"
    mv "$OUTPUT_DIR/app-x86_64-release.apk" "$OUTPUT_DIR/app-release-x86_64.apk"

    echo "APK files renamed successfully."
    ```

    Make the script executable:

    ```sh
    chmod +x rename_apks.sh
    ./rename_apks.sh
    ```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request for any improvements or bug fixes.

## License

This project is licensed under the MIT License. See the LICENSE file for details.