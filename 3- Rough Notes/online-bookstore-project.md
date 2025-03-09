# Online Bookstore: MERN Stack with SQL Server

## 1️⃣ Features & Functionalities

### User Authentication
- JWT-based authentication with refresh tokens
- Role-based access control (Admin/Customer)
- Email verification for new accounts
- Password reset functionality
- Session management with timeout

### Book Catalog
- Paginated book listing with sorting options
- Advanced search with autocomplete
- Filter by category, author, price range, rating
- Detailed book view with publisher information and sample content
- New arrivals and bestsellers sections

### Shopping Cart
- Real-time cart updates with persistent storage
- Quantity adjustments with stock validation
- Save for later functionality
- Cart summary with subtotal, tax, and shipping calculation
- Abandoned cart recovery (email reminders)

### Order Management
- Multi-step checkout process
- Order confirmation emails
- Order tracking for customers
- Order history with status updates
- Invoice generation (PDF)
- Return/exchange request system

### Payments
- Stripe/PayPal integration
- Secure payment processing
- Multiple payment methods
- Discount application at checkout
- Tax calculation based on location

### Book Reviews & Ratings
- Star rating system
- Text reviews with character limits
- Helpful/Not helpful voting on reviews
- Admin moderation queue for reviews
- Reply to reviews functionality

### Admin Dashboard
- Sales analytics with charts and reports
- Inventory management with low stock alerts
- User management and activity tracking
- Book catalog management
- Order processing workflow
- Review moderation interface

### Wishlist
- Add/remove books from wishlist
- Move from wishlist to cart
- Share wishlist via email/social media
- Notify when wishlist items go on sale

### Extra Features
- Personalized book recommendations
- Discount coupons and promotional codes
- Loyalty points system
- Newsletter subscription
- Dark/Light mode toggle
- Social media sharing
- Related books section

## 2️⃣ Database Schema (SQL Server)

```sql
-- Users Table
CREATE TABLE Users (
    UserID INT IDENTITY(1,1) PRIMARY KEY,
    Username NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    PasswordHash NVARCHAR(128) NOT NULL,
    Salt NVARCHAR(50) NOT NULL,
    FirstName NVARCHAR(50),
    LastName NVARCHAR(50),
    Role NVARCHAR(20) DEFAULT 'customer' NOT NULL,
    PhoneNumber NVARCHAR(20),
    Address NVARCHAR(255),
    City NVARCHAR(50),
    State NVARCHAR(50),
    PostalCode NVARCHAR(20),
    Country NVARCHAR(50),
    CreatedAt DATETIME DEFAULT GETDATE(),
    LastLogin DATETIME,
    IsActive BIT DEFAULT 1,
    RefreshToken NVARCHAR(255),
    RefreshTokenExpiry DATETIME
);

-- Categories Table
CREATE TABLE Categories (
    CategoryID INT IDENTITY(1,1) PRIMARY KEY,
    CategoryName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500),
    ParentCategoryID INT,
    FOREIGN KEY (ParentCategoryID) REFERENCES Categories(CategoryID)
);

-- Authors Table
CREATE TABLE Authors (
    AuthorID INT IDENTITY(1,1) PRIMARY KEY,
    AuthorName NVARCHAR(100) NOT NULL,
    Biography NVARCHAR(MAX),
    ImageURL NVARCHAR(255)
);

-- Publishers Table
CREATE TABLE Publishers (
    PublisherID INT IDENTITY(1,1) PRIMARY KEY,
    PublisherName NVARCHAR(100) NOT NULL,
    Description NVARCHAR(500)
);

-- Books Table
CREATE TABLE Books (
    BookID INT IDENTITY(1,1) PRIMARY KEY,
    ISBN NVARCHAR(20) UNIQUE NOT NULL,
    Title NVARCHAR(255) NOT NULL,
    Description NVARCHAR(MAX),
    Price DECIMAL(10, 2) NOT NULL,
    DiscountedPrice DECIMAL(10, 2),
    PublisherID INT,
    PublicationDate DATE,
    Language NVARCHAR(50),
    PageCount INT,
    StockQuantity INT NOT NULL DEFAULT 0,
    Format NVARCHAR(50), -- Hardcover, Paperback, eBook, etc.
    ImageURL NVARCHAR(255),
    IsFeatured BIT DEFAULT 0,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (PublisherID) REFERENCES Publishers(PublisherID)
);

-- Book_Author (Many-to-Many relationship)
CREATE TABLE Book_Author (
    BookID INT NOT NULL,
    AuthorID INT NOT NULL,
    PRIMARY KEY (BookID, AuthorID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (AuthorID) REFERENCES Authors(AuthorID)
);

-- Book_Category (Many-to-Many relationship)
CREATE TABLE Book_Category (
    BookID INT NOT NULL,
    CategoryID INT NOT NULL,
    PRIMARY KEY (BookID, CategoryID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID) ON DELETE CASCADE,
    FOREIGN KEY (CategoryID) REFERENCES Categories(CategoryID)
);

-- Cart Table
CREATE TABLE Cart (
    CartID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    UpdatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- CartItems Table
CREATE TABLE CartItems (
    CartItemID INT IDENTITY(1,1) PRIMARY KEY,
    CartID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL DEFAULT 1,
    FOREIGN KEY (CartID) REFERENCES Cart(CartID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT UQ_CartItem UNIQUE (CartID, BookID)
);

-- Wishlist Table
CREATE TABLE Wishlist (
    WishlistID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    CreatedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (UserID) REFERENCES Users(UserID) ON DELETE CASCADE
);

-- WishlistItems Table
CREATE TABLE WishlistItems (
    WishlistItemID INT IDENTITY(1,1) PRIMARY KEY,
    WishlistID INT NOT NULL,
    BookID INT NOT NULL,
    AddedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (WishlistID) REFERENCES Wishlist(WishlistID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT UQ_WishlistItem UNIQUE (WishlistID, BookID)
);

-- Orders Table
CREATE TABLE Orders (
    OrderID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    OrderDate DATETIME DEFAULT GETDATE(),
    TotalAmount DECIMAL(10, 2) NOT NULL,
    ShippingFee DECIMAL(10, 2) DEFAULT 0,
    TaxAmount DECIMAL(10, 2) DEFAULT 0,
    DiscountAmount DECIMAL(10, 2) DEFAULT 0,
    GrandTotal DECIMAL(10, 2) NOT NULL,
    Status NVARCHAR(50) DEFAULT 'Pending', -- Pending, Processing, Shipped, Delivered, Cancelled
    PaymentMethod NVARCHAR(50),
    PaymentStatus NVARCHAR(50) DEFAULT 'Pending',
    ShippingAddress NVARCHAR(255),
    ShippingCity NVARCHAR(50),
    ShippingState NVARCHAR(50),
    ShippingPostalCode NVARCHAR(20),
    ShippingCountry NVARCHAR(50),
    TrackingNumber NVARCHAR(100),
    Notes NVARCHAR(500),
    FOREIGN KEY (UserID) REFERENCES Users(UserID)
);

-- OrderItems Table
CREATE TABLE OrderItems (
    OrderItemID INT IDENTITY(1,1) PRIMARY KEY,
    OrderID INT NOT NULL,
    BookID INT NOT NULL,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

-- Reviews Table
CREATE TABLE Reviews (
    ReviewID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT NOT NULL,
    BookID INT NOT NULL,
    Rating INT NOT NULL CHECK (Rating BETWEEN 1 AND 5),
    Comment NVARCHAR(1000),
    CreatedAt DATETIME DEFAULT GETDATE(),
    ModifiedAt DATETIME,
    IsApproved BIT DEFAULT 0,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    CONSTRAINT UQ_UserBookReview UNIQUE (UserID, BookID)
);

-- ReviewVotes Table
CREATE TABLE ReviewVotes (
    VoteID INT IDENTITY(1,1) PRIMARY KEY,
    ReviewID INT NOT NULL,
    UserID INT NOT NULL,
    IsHelpful BIT NOT NULL, -- 1 for helpful, 0 for not helpful
    VotedAt DATETIME DEFAULT GETDATE(),
    FOREIGN KEY (ReviewID) REFERENCES Reviews(ReviewID) ON DELETE CASCADE,
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    CONSTRAINT UQ_UserReviewVote UNIQUE (ReviewID, UserID)
);

-- Coupons Table
CREATE TABLE Coupons (
    CouponID INT IDENTITY(1,1) PRIMARY KEY,
    Code NVARCHAR(50) UNIQUE NOT NULL,
    Description NVARCHAR(255),
    DiscountType NVARCHAR(20) NOT NULL, -- Percentage, Fixed
    DiscountValue DECIMAL(10, 2) NOT NULL,
    MinimumOrderAmount DECIMAL(10, 2) DEFAULT 0,
    StartDate DATETIME NOT NULL,
    EndDate DATETIME NOT NULL,
    IsActive BIT DEFAULT 1,
    UsageLimit INT, -- Maximum number of times this coupon can be used
    UsageCount INT DEFAULT 0 -- Current usage count
);

-- User_Coupon (Many-to-Many relationship for tracking coupon usage per user)
CREATE TABLE User_Coupon (
    UserID INT NOT NULL,
    CouponID INT NOT NULL,
    UsedAt DATETIME DEFAULT GETDATE(),
    OrderID INT,
    PRIMARY KEY (UserID, CouponID, UsedAt),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (CouponID) REFERENCES Coupons(CouponID),
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

-- Create indexes for performance
CREATE INDEX IX_Books_Title ON Books(Title);
CREATE INDEX IX_Books_PublicationDate ON Books(PublicationDate);
CREATE INDEX IX_Books_Price ON Books(Price);
CREATE INDEX IX_Books_StockQuantity ON Books(StockQuantity);
CREATE INDEX IX_Orders_UserID ON Orders(UserID);
CREATE INDEX IX_Orders_Status ON Orders(Status);
CREATE INDEX IX_OrderItems_BookID ON OrderItems(BookID);
CREATE INDEX IX_Reviews_BookID ON Reviews(BookID);
CREATE INDEX IX_Reviews_Rating ON Reviews(Rating);
```

## 3️⃣ API Endpoints (Node.js + Express)

### Authentication Endpoints

#### User Registration and Authentication
- `POST /api/auth/register` - Register a new user
- `POST /api/auth/login` - Authenticate user and return JWT
- `POST /api/auth/refresh-token` - Get a new access token using refresh token
- `POST /api/auth/logout` - Logout and invalidate tokens
- `POST /api/auth/forgot-password` - Request password reset
- `POST /api/auth/reset-password` - Reset password with token
- `GET /api/auth/verify-email/:token` - Verify email address

### User Endpoints

#### User Profile Management
- `GET /api/users/profile` - Get current user profile
- `PUT /api/users/profile` - Update user profile
- `PUT /api/users/change-password` - Change user password
- `GET /api/users/orders` - Get user's order history
- `DELETE /api/users/account` - Deactivate user account

### Book Endpoints

#### Book Catalog
- `GET /api/books` - Get all books (with pagination, filtering, sorting)
- `GET /api/books/featured` - Get featured books
- `GET /api/books/new-releases` - Get newly released books
- `GET /api/books/bestsellers` - Get bestselling books
- `GET /api/books/search` - Search books by title, author, etc.
- `GET /api/books/:id` - Get book details by ID
- `GET /api/books/:id/related` - Get related books

#### Categories
- `GET /api/categories` - Get all categories
- `GET /api/categories/:id` - Get category by ID
- `GET /api/categories/:id/books` - Get books in a specific category

#### Authors
- `GET /api/authors` - Get all authors
- `GET /api/authors/:id` - Get author details
- `GET /api/authors/:id/books` - Get books by a specific author

### Cart Endpoints

#### Shopping Cart
- `GET /api/cart` - Get current user's cart
- `POST /api/cart/items` - Add item to cart
- `PUT /api/cart/items/:itemId` - Update cart item quantity
- `DELETE /api/cart/items/:itemId` - Remove item from cart
- `DELETE /api/cart` - Clear entire cart
- `POST /api/cart/save-for-later/:itemId` - Move item to saved for later

### Wishlist Endpoints

#### Wishlist Management
- `GET /api/wishlist` - Get current user's wishlist
- `POST /api/wishlist/items` - Add item to wishlist
- `DELETE /api/wishlist/items/:itemId` - Remove item from wishlist
- `POST /api/wishlist/items/:itemId/move-to-cart` - Move item from wishlist to cart

### Order Endpoints

#### Order Management
- `POST /api/orders` - Create a new order
- `GET /api/orders` - Get all orders for current user
- `GET /api/orders/:id` - Get order details by ID
- `PUT /api/orders/:id/cancel` - Cancel an order
- `GET /api/orders/:id/invoice` - Generate order invoice
- `POST /api/orders/:id/return` - Request return for an order

#### Checkout
- `POST /api/checkout/validate` - Validate checkout information
- `POST /api/checkout/shipping-methods` - Get available shipping methods
- `POST /api/checkout/calculate-tax` - Calculate tax for order
- `POST /api/checkout/apply-coupon` - Apply coupon to order

### Payment Endpoints

#### Payment Processing
- `POST /api/payments/process` - Process payment
- `GET /api/payments/methods` - Get available payment methods
- `POST /api/payments/verify/:provider` - Verify payment from provider
- `GET /api/payments/status/:id` - Check payment status

### Review Endpoints

#### Book Reviews
- `GET /api/books/:id/reviews` - Get reviews for a book
- `POST /api/books/:id/reviews` - Add a review
- `PUT /api/reviews/:id` - Update a review
- `DELETE /api/reviews/:id` - Delete a review
- `POST /api/reviews/:id/vote` - Vote on review helpfulness

### Admin Endpoints

#### Admin User Management
- `GET /api/admin/users` - Get all users
- `GET /api/admin/users/:id` - Get user details
- `PUT /api/admin/users/:id` - Update user details
- `PUT /api/admin/users/:id/status` - Activate/deactivate user
- `DELETE /api/admin/users/:id` - Delete user

#### Admin Book Management
- `POST /api/admin/books` - Add a new book
- `PUT /api/admin/books/:id` - Update book details
- `DELETE /api/admin/books/:id` - Remove a book
- `PUT /api/admin/books/:id/stock` - Update book stock

#### Admin Category Management
- `POST /api/admin/categories` - Add a new category
- `PUT /api/admin/categories/:id` - Update category
- `DELETE /api/admin/categories/:id` - Delete category

#### Admin Author Management
- `POST /api/admin/authors` - Add a new author
- `PUT /api/admin/authors/:id` - Update author details
- `DELETE /api/admin/authors/:id` - Delete author

#### Admin Order Management
- `GET /api/admin/orders` - Get all orders
- `PUT /api/admin/orders/:id/status` - Update order status
- `POST /api/admin/orders/:id/tracking` - Add tracking information

#### Admin Review Management
- `GET /api/admin/reviews/pending` - Get pending reviews
- `PUT /api/admin/reviews/:id/approve` - Approve review
- `PUT /api/admin/reviews/:id/reject` - Reject review

#### Admin Dashboard
- `GET /api/admin/dashboard/sales` - Get sales statistics
- `GET /api/admin/dashboard/inventory` - Get inventory statistics
- `GET /api/admin/dashboard/users` - Get user statistics
- `GET /api/admin/dashboard/top-selling` - Get top-selling books

#### Admin Coupon Management
- `GET /api/admin/coupons` - Get all coupons
- `POST /api/admin/coupons` - Create a new coupon
- `PUT /api/admin/coupons/:id` - Update coupon
- `DELETE /api/admin/coupons/:id` - Delete coupon

## 4️⃣ Best Practices & Optimization

### Database Query Optimization

1. **Indexing Strategy**
   - Create indexes on frequently queried fields (ISBN, title, author, category)
   - Create composite indexes for common query combinations
   - Use covering indexes for queries that select only indexed columns
   - Monitor and maintain indexes regularly

2. **Query Optimization Techniques**
   - Use parameterized queries to avoid SQL injection and improve caching
   - Implement paging for large result sets (OFFSET/FETCH)
   - Use column-specific queries instead of SELECT *
   - Employ proper JOIN techniques (avoid unnecessary CROSS JOINs)

3. **Data Access Patterns**
   - Implement caching for frequently accessed, rarely changed data
   - Use stored procedures for complex operations
   - Implement connection pooling
   - Consider read replicas for heavy read operations

### Image Storage Approach

**Recommendation: Store URLs, not binary data**

- **Use cloud storage solutions** (AWS S3, Azure Blob Storage, Cloudinary) to store book images and thumbnails
- Store only the URLs in the database (`ImageURL` column in Books table)
- Benefits:
  - Reduced database size and backup times
  - Better scalability and performance
  - CDN integration for faster global delivery
  - Easier image manipulation (resizing, optimization)
  - Reduced database I/O and memory usage

### Authentication Implementation

1. **Password Security**
   - Hash passwords using bcrypt with appropriate salt rounds (10+)
   - Store salt separately and use unique salts per user
   - Never store plaintext passwords

2. **JWT Implementation**
   - Use short-lived access tokens (15-30 minutes)
   - Implement refresh tokens with longer expiration
   - Store refresh tokens in database for invalidation
   - Include proper claims (exp, iat, sub, etc.)

3. **Security Measures**
   - Implement rate limiting on authentication endpoints
   - Use HTTPS for all API communications
   - Add CSRF protection for browser clients
   - Implement proper logout (invalidate tokens)
   - Use HTTP-only, secure cookies if possible

### Project Structure for Scalability

```
/bookstore-api
├── /src
│   ├── /config         # Configuration files
│   ├── /controllers    # Route controllers
│   ├── /middleware     # Custom middleware
│   ├── /models         # Data models
│   ├── /routes         # API routes
│   ├── /services       # Business logic
│   ├── /utils          # Utility functions
│   ├── /validators     # Input validation
│   └── server.js       # Entry point
├── /tests              # Unit and integration tests
├── .env.example        # Environment variables example
└── package.json        # Dependencies
```

**Key Scalability Patterns:**
- Separation of concerns (controllers, services, data access)
- Dependency injection for better testability
- Modular architecture for independent scaling
- Middleware for cross-cutting concerns

### Real-World Improvements

1. **Performance Enhancements**
   - Implement Redis for caching (categories, bestsellers, new releases)
   - Use server-side rendering or static generation for SEO
   - Implement content delivery network (CDN) for static assets
   - Database denormalization for read-heavy operations

2. **Advanced Features**
   - Implement Elasticsearch for advanced search functionality
   - Add recommendation engine based on purchase history
   - Enable real-time inventory updates (WebSockets)
   - Implement A/B testing for UI elements

3. **Monitoring & Maintenance**
   - Set up application performance monitoring (APM)
   - Implement centralized logging
   - Set up database performance monitoring
   - Create automated backup strategies

4. **Business Enhancements**
   - Implement analytics to track user behavior
   - Add email marketing integration
   - Enable social login (OAuth)
   - Integrate with book publisher APIs for automatic catalog updates

5. **Security Enhancements**
   - Implement input validation for all API endpoints
   - Add data sanitization to prevent XSS attacks
   - Set up regular security audits
   - Implement IP-based anomaly detection

## Getting Started

1. **Database Setup:**
   - Create SQL Server database using the provided schema
   - Populate initial data (categories, sample books)

2. **Backend Development:**
   - Set up Node.js + Express.js project
   - Implement authentication with JWT
   - Create API endpoints following RESTful principles
   - Connect to SQL Server using Sequelize ORM or node-mssql

3. **Frontend Development:**
   - Create React app with component-based architecture
   - Implement Redux for state management
   - Create responsive UI with CSS frameworks (Bootstrap/Material-UI)
   - Develop reusable components for books, cart, checkout

4. **Testing & Deployment:**
   - Write unit and integration tests
   - Set up CI/CD pipeline
   - Deploy to production environment
   - Monitor performance and user feedback
