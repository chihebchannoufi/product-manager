# 🛒 Product Manager — CRUD Laravel + Vue 3 (Inertia)

Une application simple de gestion de produits (CRUD) construite avec **Laravel** pour le backend et **Vue 3 + Inertia.js + TypeScript** pour le frontend, avec des composants **shadcn-vue**.

## ✨ Fonctionnalités

- 📋 Lister tous les produits
- ➕ Ajouter un nouveau produit
- ✏️ Modifier un produit existant
- 🗑️ Supprimer un produit (avec confirmation)
- ✅ Messages de succès/erreur via flash messages
- 🎨 Interface avec composants réutilisables (Table, Button, Input, Label...)

## 🛠️ Stack technique

| Côté | Technologies |
|------|-------------|
| Backend | Laravel, Eloquent ORM |
| Frontend | Vue 3, TypeScript, Inertia.js |
| UI | shadcn-vue (Table, Button, Input, Label) |
| Style | Tailwind CSS |

## 🚀 Installation

1. **Cloner le projet**
   ```bash
   git clone https://github.com/chihebchannoufi/product-manager
   cd product-manager
   ```

2. **Installer les dépendances PHP**
   ```bash
   composer install
   ```

3. **Installer les dépendances JS**
   ```bash
   npm install
   ```

4. **Configurer l'environnement**
   ```bash
   cp .env.example .env
   php artisan key:generate
   ```
   Renseigner les identifiants de la base de données dans `.env`.

5. **Lancer les migrations**
   ```bash
   php artisan migrate
   ```

7. **Démarrer le serveur de développement**
   ```bash
   php artisan serve
   npm run dev
   ```
   ou bien :
   ```bash
   composer run dev
   ```

8. Ouvrir [http://localhost:8000/products](http://localhost:8000/products)

## 🧭 Routes principales

| Méthode | URI | Nom | Action | Description |
|---------|-----|-----|--------|-------------|
| GET | `/products` | `products.index` | `index` | Liste des produits |
| GET | `/products/create` | `products.create` | `create` | Formulaire de création |
| POST | `/products/store` | `products.store` | `store` | Enregistrer un produit |
| GET | `/products/{product}/edit` | `products.edit` | `edit` | Formulaire d'édition |
| PUT | `/products/{product}` | `products.update` | `update` | Mettre à jour un produit |
| DELETE | `/products/{product}` | `products.destroy` | `destroy` | Supprimer un produit |

## 🗃️ Modèle `Product`

Champs attendus (migration) :

| Champ | Type | Contraintes |
|-------|------|-------------|
| `name` | string | requis, max 255 |
| `price` | decimal/float | requis, numérique, min 0 |
| `description` | text | optionnel |

## 📄 Licence

Projet personnel à but pédagogique.
