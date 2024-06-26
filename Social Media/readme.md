# Relationships
- Users to Posts: One-to-Many (One user can have many posts).
- Users to Comments: One-to-Many (One user can make many comments).
- Users to Likes: One-to-Many (One user can like many posts).
- Users to Friends: Many-to-Many (Users can have many friends).
- Users to Messages: Many-to-Many (Users can send messages to many users).
- Users to Notifications: One-to-Many (One user can have many notifications).


# Users (user_id, username, email, password_hash, full_name, bio, profile_picture_url, created_at)
<p>    |</p>
<p>    +--< Posts (post_id, user_id, content, image_url, created_at) </p>
<p>    | </p>
<p>    +--< Comments (comment_id, post_id, user_id, content, created_at) </p>
<p>    | </p>
<p>    +--< Likes (like_id, post_id, user_id, created_at) </p>
<p>    | </p>
<p>    +--< Friends (user_id, friend_id, created_at) </p>
<p>    | </p>
<p>    +--< Messages (message_id, sender_id, receiver_id, content, created_at) </p>
<p>    | </p>
<p>    +--< Notifications (notification_id, user_id, type, reference_id, is_read, created_at) </p>
