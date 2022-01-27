CREATE TABLE "Users" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "first_name" varchar,
  "last_name" varchar,
  "email" varchar,
  "bio" varchar,
  "username" varchar,
  "password" varchar,
  "profile_image_url" varchar,
  "created_on" date,
  "active" bit
);

CREATE TABLE "DemotionQueue" (
  "action" varchar,
  "admin_id" INTEGER,
  "approver_one_id" INTEGER,
  FOREIGN KEY(`admin_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`approver_one_id`) REFERENCES `Users`(`id`),
  PRIMARY KEY (action, admin_id, approver_one_id)
);


CREATE TABLE "Subscriptions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "follower_id" INTEGER,
  "author_id" INTEGER,
  "created_on" date,
  FOREIGN KEY(`follower_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`author_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE "Posts" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "category_id" INTEGER,
  "title" varchar,
  "publication_date" date,
  "image_url" varchar,
  "content" varchar,
  "approved" bit
);

CREATE TABLE "Comments" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "post_id" INTEGER,
  "author_id" INTEGER,
  "content" varchar,
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
  FOREIGN KEY(`author_id`) REFERENCES `Users`(`id`)
);

CREATE TABLE "Reactions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar,
  "image_url" varchar
);

CREATE TABLE "PostReactions" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "user_id" INTEGER,
  "reaction_id" INTEGER,
  "post_id" INTEGER,
  FOREIGN KEY(`user_id`) REFERENCES `Users`(`id`),
  FOREIGN KEY(`reaction_id`) REFERENCES `Reactions`(`id`),
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`)
);

CREATE TABLE "Tags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar
);

CREATE TABLE "PostTags" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "post_id" INTEGER,
  "tag_id" INTEGER,
  FOREIGN KEY(`post_id`) REFERENCES `Posts`(`id`),
  FOREIGN KEY(`tag_id`) REFERENCES `Tags`(`id`)
);

CREATE TABLE "Categories" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "label" varchar
);

INSERT INTO Categories ('label') VALUES ('News');
INSERT INTO Tags ('label') VALUES ('JavaScript');
INSERT INTO Reactions ('label', 'image_url') VALUES ('happy', 'https://pngtree.com/so/happy');

INSERT INTO `Posts` VALUES (null, 1, 1, "Unicorn", "Wed Sep 15 2021 10:11:33", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F71j7ymp1flL._AC_SL1500_.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.com%2FStokes-Design-Unicorn-Mythical-Fantasy%2Fdp%2FB00R9GAYR2&tbnid=QIkM9yv7gXzn-M&vet=12ahUKEwj0kNq_ts31AhWBl1MKHRaHDAkQMygAegUIARCzAg..i&docid=tRvpST1XCJlonM&w=1186&h=1500&q=black%20unicorn&ved=2ahUKEwj0kNq_ts31AhWBl1MKHRaHDAkQMygAegUIARCzAg", "Unicorns are amazing! They are definitely real!", 1);
INSERT INTO `Posts` VALUES (null, 1, 1, "Unicorn", "Wed Sep 25 2021 10:11:33", "https://www.google.com/imgres?imgurl=https%3A%2F%2Fm.media-amazon.com%2Fimages%2FI%2F71j7ymp1flL._AC_SL1500_.jpg&imgrefurl=https%3A%2F%2Fwww.amazon.com%2FStokes-Design-Unicorn-Mythical-Fantasy%2Fdp%2FB00R9GAYR2&tbnid=QIkM9yv7gXzn-M&vet=12ahUKEwj0kNq_ts31AhWBl1MKHRaHDAkQMygAegUIARCzAg..i&docid=tRvpST1XCJlonM&w=1186&h=1500&q=black%20unicorn&ved=2ahUKEwj0kNq_ts31AhWBl1MKHRaHDAkQMygAegUIARCzAg", "Unicorns are still amazing! They are definitely real! I can't wait to find one and befriend it! ", 1);

DELETE FROM POSTS
WHERE id BETWEEN 245 and 276;

Select * from posts;
INSERT INTO `Users` VALUES (null, "Andy", "Eilers", "andy@email.com", "Grumpy Old Man", "Bearded Wonder", "Bearded", "https://res.cloudinary.com/dlanffhtr/image/upload/v1641314191/Screen_Shot_2022-01-04_at_10.35.55_AM_gypbud.png", "Wed Sep 25 2021 10:11:33", true);

SELECT
  p.id,
  p.user_id,
  p.category_id,
  p.title,
  p.publication_date,
  p.image_url,
  p.content,
  p.approved,
  u.first_name user_first_name,
  u.last_name user_last_name,
  c.label category_label
FROM Posts p
JOIN Users u
  ON u.id = p.user_id
JOIN Categories c
  ON c.id = p.category_id