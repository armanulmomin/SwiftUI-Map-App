# SwiftUI Map App

A sleek and modern Map-based iOS application built using **SwiftUI** and the **MVVM** architecture. This app displays specific locations on a map, each with a custom **name**, **description**, and **image**, and allows users to **view**, **choose**, and **update** locations interactively.

## ✨ Features

- 🗺️ **MapKit integration** with interactive map view
- 📍 Custom map annotations with:
  - Title (name)
  - Description
  - Image preview
- 🧭 **Choose and update location** functionality
- 🏗️ **MVVM Architecture** for clean separation of concerns
- 🧩 Custom **data model** using Swift structs
- 🔁 Property wrappers (`@State`, `@Binding`, `@Published`, `@EnvironmentObject`) for reactive UI
- 🌗 Full **Dark Mode** support
- 📱 **iPad and Landscape** orientation compatible
- 🎯 Built with scalability and performance in mind

## 🧱 Architecture

This app follows the **Model-View-ViewModel (MVVM)** design pattern:

- **Model**: Defines the data structure for each location
- **ViewModel**: Manages logic, state, and data binding
- **View**: SwiftUI views reactively bound to ViewModel

