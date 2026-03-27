
# ArticleNest – Final Project Phase 2

##  Live Application URL
https://article-nest-zige-88ac64646918.herokuapp.com

##  API Base URL
https://article-nest-zige-88ac64646918.herokuapp.com/api

---

##  Description
ArticleNest is a Ruby on Rails blog web application that allows users to:
- Sign up and log in (Devise authentication)
- Create, edit, and delete posts
- Add comments to posts
- Assign tags to posts
- Upload images (Active Storage)
- Interact via both web interface and RESTful API

---

##  Test Account
Email: phase2new@example.com
Password: phase2new


---

##  Main Features

### Authentication
- Devise-based user authentication (web)
- Token-based authentication (API)

### Posts & Content
- Full CRUD for posts
- Comments system
- Tagging system (many-to-many)
- Image upload support

### Profiles
- One-to-one user profile
- Editable profile information

---

##  API Overview

### Public Endpoints
- GET /api/posts
- GET /api/posts/:id

### Protected Endpoints
- POST /api/posts
- PATCH /api/posts/:id
- DELETE /api/posts/:id

---

##  Setup Instructions (Local)

```bash
bundle install
bin/rails db:migrate
bin/rails db:seed
bin/rails server
