# uffmobileplus
Novo código do UFF Mobile Plus, versão 6.0.0

# uffmobileplus
Novo código do UFF Mobile Plus, versão 6.0.0

---

# 📐 Arquitetura Modular – Documentação

Arquitetura modular em Flutter com **GetX** para navegação, bindings. Estrutura escalável, com módulos internos/externos, camadas de dados e utilitários.

---

```
lib/
│
└── app/                       # Núcleo da aplicação
    │
    ├── data/                  # Dados gerais do app
    │   ├── providers/         # Providers de uso geral (API/Firebase/Hive)
    │   ├── repository/        # Repositories de uso geral
    │   ├── services/          # Services de uso geral (regras/BD/auth)
    │   └── model/             # Models/Entities gerais
    │
    ├── modules/               # Módulos da aplicação
    │   ├── internalmodules/   # Módulos internos
    │   └── externalmodules/   # Módulos externos
    │       └── restaurante/
    │           ├── bindings/      # Bindings → ligam dependências (GetX)
    │           ├── controller/    # Controllers → lógica da UI
    │           ├── ui/            # Interfaces gráficas (Widgets/Telas)
    │           ├── data/          # Dados específicos do módulo
    │           │   ├── providers/     # Providers do módulo
    │           │   ├── repository/    # Repository do módulo
    │           │   └── model/         # Models do módulo
    │           └── utils/         # Utils do módulo (pode conversar entre si e com todas classes do módulo)
    │
    ├── routes/                 # 🔀 Rotas do GetX (gerais)
    │   ├── app_pages.dart      # Lista de GetPages (rotas ↔ páginas)
    │   └── app_routes.dart     # Constantes de rotas
    │
    ├── utils/                  # Utils gerais (compartilhadas pelo app todo)
    │                           # ⚠️ Só podem importar outras utils gerais ou libs externas
    │
    ├── firebase/               # Configurações do Firebase (options, inicialização)
    │
    └── main.dart               # Arquivo principal da aplicação (entry point)

```

### Padrões de nomeação

* **Pastas/arquivos**: `snake_case` (ex.: `plano_de_estudos/`, `home_page.dart`).

---

## 🔄 Camadas e responsabilidades

* **Provider**: faz I/O de dados (GET/POST/PUT/DELETE) com API, Firebase, Hive etc.;
* **Repository**: **liga Providers aos Services**; centraliza chamadas; organiza dados.
* **Service**:  **autenticação**; 
* **Controller**: orquestra fluxo da tela, chama Services e prepara dados para a UI. regras de negócio; **lógica de BD**; **integra dados de outros módulos**;
* **UI (Page)**: exibição e interação do usuário.
* **Model**: modelo de dados
* **Utils**:

  * Cada módulo tem seu `utils/` (pode conversar com todo o módulo e outros utils de módulo).
  * `lib/app/utils/` são **utils gerais**: podem conversar entre si e com todas as classes, **mas só importam outros utils gerais ou bibliotecas**.

---

## ⚙️ Bindings (GetX DI)

* **Binding**: registra as “receitas” 📝
* **Primeira `Get.find()`**: dispara a criação 🚀
* **GetX**: resolve dependências automaticamente ⚙️
* **Ordem**: do mais baixo (**Provider**) ao mais alto (**Controller**) 📈

Exemplo (módulo Meals):

```dart
// lib/app/modules/externalmodules/restaurante/cardapio/meals/bindings/meal_binding.dart
class MealBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MealProvider());
    Get.lazyPut(() => MealRepository(Get.find()));
    Get.lazyPut(() => MealService(Get.find()));
    Get.lazyPut(() => MealController(Get.find()));
  }
}
```

---

## 🔀 Rotas (GetX)

### `app_routes.dart`

```dart
// lib/app/routes/app_routes.dart
abstract class AppRoutes {
  static const initial = '/';
  static const login = '/login';
  static const meals = '/meals';
  static const mealDetail = '/meals/detail'; // ex.: com parâmetro via arguments
}
```

### `app_pages.dart`

```dart
// lib/routes/app_pages.dart
import 'package:get/get.dart';
import 'app_routes.dart';

// imports de páginas e bindings
import 'package:app/modules/externalmodules/meals/ui/meal_page.dart';
import 'package:app/modules/externalmodules/meals/bindings/meal_binding.dart';
import 'package:app/modules/internalmodules/auth/ui/login_page.dart';
import 'package:app/modules/internalmodules/auth/bindings/login_binding.dart';
import 'package:app/modules/internalmodules/home/ui/home_page.dart';
import 'package:app/modules/internalmodules/home/bindings/home_binding.dart';

class AppPages {
  static final routes = <GetPage>[
    GetPage(
      name: AppRoutes.INITIAL,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    
    ),
    GetPage(
      name: AppRoutes.MEALS,
      page: () => const MealPage(),
      binding: MealBinding(),
      
    ),
  ];
}
```

### `main.dart` (uso)

```dart
void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: AppRoutes.INITAL,
    getPages: AppPages.routes,
  ));
}
```

---

## 🥗 Exemplo prático (Meals) – camadas essenciais

**Provider**

```dart
class MealProvider {
  Future<List<Map<String, dynamic>>> fetchMeals() async {
    final res = await http.get(Uri.parse('https://api.exemplo.com/meals'));
    if (res.statusCode != 200) throw Exception('Erro ao buscar refeições');
    return List<Map<String, dynamic>>.from(jsonDecode(res.body));
  }
}
```

**Repository**

```dart
class MealRepository {
  MealRepository(this._provider);
  final MealProvider _provider;

  Future<List<MealModel>> getMeals() async {
    final raw = await _provider.fetchMeals();
    return raw.map(MealModel.fromJson).toList();
  }
}
```

**Controller**

```dart
class MealController extends GetxController {
  MealController(this._service);
  final MealService _service;

  final meals = <MealModel>[].obs;
  final isLoading = false.obs;

  Future<void> fetchMeals() async {
    try {
      isLoading.value = true;
      meals.value = await _service.loadDinners();
    } catch (e) {
      Get.snackbar('Erro', e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
```

**UI**

```dart
class MealPage extends StatelessWidget {
  const MealPage({super.key});
  @override
  Widget build(BuildContext context) {
    final c = Get.find<MealController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Refeições')),
      body: Obx(() {
        if (c.isLoading.value) return const Center(child: CircularProgressIndicator());
        return ListView.builder(
          itemCount: c.meals.length,
          itemBuilder: (_, i) => ListTile(
            title: Text(c.meals[i].name),
            subtitle: Text(c.meals[i].type),
            onTap: () => Get.toNamed(AppRoutes.mealDetail, arguments: c.meals[i]),
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: c.fetchMeals,
        child: const Icon(Icons.restaurant),
      ),
    );
  }
}
```

**Model (geral)**

```dart
class MealModel {
  final String name;
  final String type;

  MealModel({required this.name, required this.type});

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      MealModel(name: json['name'], type: json['type']);
}
```

---

## 📊 Fluxo de comunicação

* **UI → Controller → Repository → Provider** (requisição)
* **Provider → Repository  → Controller → UI** (resposta)
* **Controller** podem integrar **outros módulos**; **Utils** (módulo/gerais) podem conversar conforme regras descritas.

<img width="1231" height="652" alt="modularização um+ drawio" src="https://github.com/user-attachments/assets/dd36904c-a516-4677-b530-602cfdb533eb" />

---



