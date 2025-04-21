# SQL schema creation (copied from the previous execution)
-- Table: brand
CREATE TABLE brand (
    brand_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT
);

-- Table: product_category
CREATE TABLE product_category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT
);

-- Table: product
CREATE TABLE product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    brand_id INT,
    category_id INT,
    base_price DECIMAL(10, 2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
    FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Table: product_image
CREATE TABLE product_image (
    image_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    image_url TEXT,
    alt_text VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: product_item
CREATE TABLE product_item (
    item_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    sku VARCHAR(100) UNIQUE,
    price DECIMAL(10, 2),
    stock_quantity INT,
    FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Table: color
CREATE TABLE color (
    color_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    hex_value VARCHAR(7)
);

-- Table: size_category
CREATE TABLE size_category (
    size_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Table: size_option
CREATE TABLE size_option (
    size_id INT PRIMARY KEY AUTO_INCREMENT,
    size_category_id INT,
    label VARCHAR(10),
    FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Table: product_variation
CREATE TABLE product_variation (
    variation_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    color_id INT,
    size_id INT,
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (color_id) REFERENCES color(color_id),
    FOREIGN KEY (size_id) REFERENCES size_option(size_id)
);

-- Table: attribute_category
CREATE TABLE attribute_category (
    attribute_category_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

-- Table: attribute_type
CREATE TABLE attribute_type (
    attribute_type_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50)
);

-- Table: product_attribute
CREATE TABLE product_attribute (
    attribute_id INT PRIMARY KEY AUTO_INCREMENT,
    item_id INT,
    attribute_type_id INT,
    attribute_category_id INT,
    value VARCHAR(255),
    FOREIGN KEY (item_id) REFERENCES product_item(item_id),
    FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id),
    FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id)
);

# Sample data for each table
-- Sample data for brand
INSERT INTO brand (name, description) VALUES 
('Nike', 'Popular sportswear brand'),
('Samsung', 'Electronics and gadgets');

-- Sample data for product_category
INSERT INTO product_category (name, description) VALUES 
('Clothing', 'All clothing products'),
('Electronics', 'Electronic devices and gadgets');

-- Sample data for product
INSERT INTO product (name, brand_id, category_id, base_price) VALUES 
('Running Shoes', 1, 1, 120.00),
('Smartphone', 2, 2, 699.99);

-- Sample data for product_image
INSERT INTO product_image (product_id, image_url, alt_text) VALUES 
(1, 'https://example.com/images/shoes.jpg', 'Running Shoes Image'),
(2, 'https://example.com/images/phone.jpg', 'Smartphone Image');

-- Sample data for product_item
INSERT INTO product_item (product_id, sku, price, stock_quantity) VALUES 
(1, 'SHOE123', 120.00, 50),
(2, 'PHONE123', 699.99, 30);

-- Sample data for color
INSERT INTO color (name, hex_value) VALUES 
('Red', '#FF0000'),
('Black', '#000000');

-- Sample data for size_category
INSERT INTO size_category (name) VALUES 
('Clothing Sizes'),
('Phone Sizes');

-- Sample data for size_option
INSERT INTO size_option (size_category_id, label) VALUES 
(1, 'M'),
(1, 'L'),
(2, '6.5in');

-- Sample data for product_variation
INSERT INTO product_variation (item_id, color_id, size_id) VALUES 
(1, 1, 1),
(2, 2, 3);

-- Sample data for attribute_category
INSERT INTO attribute_category (name) VALUES 
('Physical'),
('Technical');

-- Sample data for attribute_type
INSERT INTO attribute_type (name) VALUES 
('text'),
('number');

-- Sample data for product_attribute
INSERT INTO product_attribute (item_id, attribute_type_id, attribute_category_id, value) VALUES 
(1, 1, 1, 'Mesh material'),
(2, 2, 2, '128');