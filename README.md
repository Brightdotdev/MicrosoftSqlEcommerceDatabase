# E-Commerce Platform Database

## Introduction
Welcome! This repository contains the SQL scripts and instructions to set up a complete e-commerce database system using Microsoft SQL Server. Built to manage an online store, this project includes tables for users, products, orders, and more, structured to ensure efficient data relationships and integrity through foreign key constraints. If you're working with SQL Server, this guide will help you get your database up and running smoothly.

## Project Overview
This e-commerce database project is designed to support a platform where users can browse products, add items to their cart, make purchases, leave reviews, and more. The database schema includes entities such as users, products, categories, orders, and payments, all organized in a way that ensures data consistency and supports various e-commerce operations.

## Key Features
* **Relational Structure**: Designed with foreign keys to ensure data integrity and accurate relationships
* **User-Centric**: Includes tables to manage users, orders, wishlists, and reviews
* **Product & Supplier Management**: Allows for the cataloging of products, categories, and supplier details
* **Order Processing**: Supports cart and order management, including itemized orders and shipments



## Getting Started

To get a copy of the project up and running on your local machine, follow these steps:

### 1. Clone the Repository

You can clone the repository to your local machine using this command in your terminal:

```bash
git clone https://github.com/Brightdotdev/MicrosoftSqlEcommerceDatabase.git
```

### 2. Download the Code

Alternatively, you can download the repository as a ZIP file:
1. Click on the "Code" button at the top right of this page
2. Select **Download ZIP**

Once downloaded or cloned, you can follow the setup instructions to get the database configured in your SQL Server environment.


## Project Setup
To set up and start using this database, follow these steps carefully:

1. **Create the Database**: Start by creating the database in your SQL Server environment
2. **Execute Relationships Query**: Run the relationships SQL script to set up all necessary foreign keys and constraints
3. **Data Insertion Order**:
   * Insert data into the **Users** table first(from the users file and so on for the rest) to ensure relationships are maintained
   * Insert data into the following tables simultaneously (simply by running their respective scripts):
     * `Address` 
     * `Category` 
     * `Product`
     * `Cart`
     * `CartItem`
     * `Orders`
     * `OrderItem`
     * `Payment`
     * `Review`
     * `Supplier`
     * `ProductSupplier`
     * `Shipment`
     * `Wishlist`
     * `WishlistItem`

## Important Note on Reserved Keywords
When writing queries, you may encounter reserved SQL keywords (e.g., "state") that might cause issues. If a column name appears in blue (indicating it's a reserved keyword), enclose it in square brackets `[ ]` (e.g., `[state]`). This clarifies to SQL Server that you're referencing a column, not the keyword itself.

## Example Usage
To insert initial data, execute the SQL script for each table in the order specified. You may run the scripts for tables that can be inserted simultaneously at once, ensuring all required foreign keys are in place beforehand.

## Contributing
If you'd like to contribute to this project or suggest improvements, feel free to fork the repository and open a pull request.

## License
This project is open-source and licensed under MIT License.
