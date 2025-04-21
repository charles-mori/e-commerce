# 🛍️ E-Commerce Database Design Project

## 🎯 Objective
This project demonstrates a fully designed relational database for an e-commerce platform. It includes an Entity-Relationship Diagram (ERD), a SQL schema, and sample data.

---

## 📐 ERD
The database schema is visualized in the ERD below:
📁 Check the [erd/](./erd/) folder for the full image.

---

## 🛠️ Technologies Used
- MySQL
- Draw.io (for ERD)
- GitHub (version control)

---

## 🗃️ Database Tables

| Table Name          | Description                                 |
|---------------------|---------------------------------------------|
| `brand`             | Stores brand info                           |
| `product_category`  | Classifies products                         |
| `product`           | Main product details                        |
| `product_image`     | Stores product images                       |
| `product_item`      | Individual items with variations            |
| `color`             | Available color options                     |
| `product_variation` | Links item to specific size and color       |
| `size_category`     | Groups sizes by category                    |
| `size_option`       | Specific sizes                              |
| `product_attribute` | Custom product attributes                   |
| `attribute_category`| Attribute grouping                          |
| `attribute_type`    | Type of attribute (text, number, boolean)   |

---

## 🔄 Data Flow
Each `product` can have multiple `product_item`s, which represent different combinations of attributes such as color and size. These variations are defined using `product_variation`. Custom details are stored in `product_attribute`.

📄 See more in [docs/data-flow.md](./docs/data-flow.md) _(optional)_.

---

## 📦 Sample Data
Sample data is included for all tables. You can run the script to populate your local MySQL database.

---

## 🚀 Getting Started

1. Clone this repository:
   ```bash
   git clone https://github.com/charles-mori/e-commerce
   cd e-commerce
