November 9 
Created Question and Category model, 

Next will be to create associations:

Question:
belongs_to User
belongs_to Category

Category
has_many Questions

User:
has_many Questions