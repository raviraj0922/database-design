# Relationships
- Users to Orders: One-to-Many (One user can place many orders).
- Users to Reviews: One-to-Many (One user can write many reviews).
- Users to Cart: One-to-One (One user has one cart).
- Products to OrderDetails: One-to-Many (One product can appear in many order details).
- Products to Reviews: One-to-Many (One product can have many reviews).
- Products to Categories: Many-to-One (Many products belong to one category).
- Orders to OrderDetails: One-to-Many (One order can have many order details).
- Cart to CartItems: One-to-Many (One cart can have many cart items).

# Users (user_id, username, email, password_hash, full_name, address, phone_number, created_at)
    |
    +--< Orders (order_id, user_id, order_date, total, status)
        |
        +--< OrderDetails (order_detail_id, order_id, product_id, quantity, price)
            |
            +--< Products (product_id, name, description, price, stock, category_id, image_url, created_at)
                |
                +--< Categories (category_id, name, description)
    |
    +--< Reviews (review_id, product_id, user_id, rating, comment, created_at)
    |
    +--< Cart (cart_id, user_id, created_at)
        |
        +--< CartItems (cart_item_id, cart_id, product_id, quantity)
