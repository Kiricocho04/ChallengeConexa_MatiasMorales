# ChallengeConexa
 ## Autor: Matias Nicolas Morales
 App creada como parte del challenge técnico para Conexa. Consiste en una aplicación de lectura de noticias y visualización de usuarios, utilizando SwiftUI y Google Maps.

 ## Arquitectura

Se implementó el patrón **MVVM (Model - View - ViewModel)**, separando claramente:
- `Model`: Representación de los datos (`Post`, `User`)
- `ViewModel`: Manejo de lógica y estado de cada pantalla.
- `View`: Interfaz visual conectada al ViewModel mediante `@StateObject`.

Esta estructura permite escalar, testear y mantener la app fácilmente.

## Networking

- Se utilizó una clase `APIService` que permite hacer peticiones genéricas usando `async/await` y `URLSession`.
- Los endpoints utilizados provienen de [JSONPlaceholder](https://jsonplaceholder.typicode.com/).

## Dependencias
- **Google Maps SDK** (agregado vía Swift Package Manager).

## Tests
- Se agregaron tests unitarios básicos para verificar la carga de datos desde la API en `PostsViewModel` y `UsersViewModel`.

 # Images
 ## News Screen (Home): 
 ![Simulator Screenshot - iPhone 16 Pro - 2025-04-14 at 10 59 37](https://github.com/user-attachments/assets/c078ecf9-6d49-42a0-9b06-9e14e7af6289)
## Details Screen:
![Simulator Screenshot - iPhone 16 Pro - 2025-04-14 at 10 59 45](https://github.com/user-attachments/assets/98f2e97e-01c1-4427-ab45-39600d26b526)
## Users Screen:
![Simulator Screenshot - iPhone 16 Pro - 2025-04-14 at 10 59 54](https://github.com/user-attachments/assets/fc6063a7-63a0-4589-99cd-6e8d840e5be0)
## Ubication Screen:
![Simulator Screenshot - iPhone 16 Pro - 2025-04-14 at 11 00 21](https://github.com/user-attachments/assets/d030ebc4-eda1-4b33-aefd-a12bb38280cc)

## Test:
<img width="1076" alt="Captura de pantalla 2025-04-14 a la(s) 11 23 47 a  m" src="https://github.com/user-attachments/assets/67b4bcc5-89d1-4089-aaac-cef775ad4e9f" />
<img width="1089" alt="Captura de pantalla 2025-04-14 a la(s) 11 22 39 a  m" src="https://github.com/user-attachments/assets/9473016a-fae4-4ab6-a804-f013318c30a1" />

