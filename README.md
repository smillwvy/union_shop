# Union Shop – Flutter Coursework Project

A multi-page, responsive Flutter front-end that mirrors a university-style online store. The app demonstrates page navigation, in-memory state (cart and personalisation forms), adaptive layouts, a functional search flow, and service pages including Print Shack personalisation.

## Key Features
- Home: hero banner plus featured product cards with navigation into collections.
- Clothing / Collections: “Winter Favourites” collection with filter/sort controls and a static adaptive GridView dataset (hoodies and tees).
- Sale Page: discounted items with old/new pricing in a responsive 2–3 column grid.
- Product Page (simple): image, title, pricing, color/size selectors, quantity picker, and add-to-cart using the shared cart model.
- Search System: search screen with input + submit; filters a predefined catalogue and renders results via reusable `ProductCard` widgets (navbar search icon opens this page).
- Shopping Cart System: global cart model; add/remove, quantity adjust, totals, and a checkout button that clears the cart and confirms.
- Print Shack – About: static informational page using the shared layout.
- Print Shack – Personalisation: dynamic form (one line = £3, two lines = £5), line-based fields, quantity selector, total recalculation, add-to-cart.
- Authentication UI: login and signup screens with form fields and navigation between them (UI only).
- Responsive Layout: shared `PageLayout` scaffold with navbar + footer; LayoutBuilder-driven breakpoints and adaptive grids for desktop and mobile widths.
- Navigation: working navbar links and dropdowns to all main routes; footer content with hours, info text, and newsletter input.

## Installation & Setup
Prerequisites: Flutter SDK, Git, any IDE.

```bash
git clone https://github.com/smillwvy/union_shop
cd union_shop
flutter pub get
flutter run
```

## Usage Instructions
- Browse the store from the homepage and use the navbar to jump to collections (Winter Favourites), sale, Print Shack, search, cart, and auth screens.
- View a product, pick color/size, adjust quantity, and add to the cart.
- Open the cart to change quantities, remove items, see totals, and run the checkout action (clears the cart and shows confirmation).
- Use the search page via the navbar icon: enter a query, submit, and see filtered catalogue results.
- Visit the Print Shack About page for service info.
- Use the personalisation flow: choose one or two lines, the form adapts, pricing updates (£3/£5), set quantity, and add to cart.
- Navigate between login and signup screens (UI only; no backend).

## Screenshots
A quick visual tour of the main flows (desktop captures). Screenshots now live in `assets/screenshots/` to keep them separate from product art.

<table>
  <tr>
    <td><img src="assets/screenshots/home_page_screenshot.png" alt="Home page" width="350"></td>
    <td><img src="assets/screenshots/collections_screenshot.png" alt="Collections page" width="350"></td>
  </tr>
  <tr>
    <td><img src="assets/screenshots/product_page_screenshot.png" alt="Product page" width="350"></td>
    <td><img src="assets/screenshots/cart_page_screenshot.png" alt="Cart page" width="350"></td>
  </tr>
  <tr>
    <td><img src="assets/screenshots/search_screenshot.png" alt="Search page" width="350"></td>
    <td><img src="assets/screenshots/personalisation_screenshot.png" alt="Print Shack personalisation page" width="350"></td>
  </tr>
</table>

## Project Structure
- `lib/main.dart` – App entry point, MaterialApp setup, and route map.
- `lib/layout/page_layout.dart` – Shared scaffold with navbar, footer, and scrollable shell.
- `lib/pages/` – All screens (home, collections, sale, product, cart, search, Print Shack about, personalisation, login, signup, about).
- `lib/widgets/` – Reusable UI pieces (`ProductCard`, `LabeledDropdown`, `QuantitySelector`).
- `lib/models/cart.dart` – In-memory cart model and cart item definition.
- `assets/images/` – Product and promo assets used in the UI.
- `assets/screenshots/` – README-only screenshots of core flows.

## Technologies Used
- Flutter and Dart (Material design widgets)
- Shared PageLayout scaffold with LayoutBuilder-based responsiveness
- Navigator 1.0 with named routes
- GridView/ListView-driven catalogue layouts

## Known Issues / Limitations
- Product data is static and local.
- No backend authentication or API integration.
- Cart state is in-memory only (not persisted).
- Checkout is a placeholder (no payments).
- Footer items are informational text (no functional links there).

## Author
Amaliia Poluian  
up2270789@myport.ac.uk
