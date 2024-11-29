Relationships:
    A Customer can make many Bookings (one-to-many).
    A Booking consists of multiple Booking Details (one-to-many).
    A Booking corresponds to one Payment (one-to-one).
    A Movie can have many Showtimes (one-to-many).
    A Screen can host multiple Showtimes (one-to-many).
    A Ticket Type can be associated with many Booking Details (one-to-many).
    Staff members manage cinema operations but are not directly involved in bookings.

List of Tables:
    Customers
    Movies
    Screens
    Showtimes
    Bookings
    Tick Types
    Booking Details
    Payments
    Staff
    Sessions



1. Customers
This table stores information about the customers who book tickets.

    Column Name	    Data Type	    Description
    customer_id	    INT (PK)	    Unique identifier for each customer.
    first_name	    VARCHAR(100)	Customer's first name.
    last_name	    VARCHAR(100)	Customer's last name.
    email	        VARCHAR(255)	Customer's email address.
    phone	        VARCHAR(20)	    Customer's phone number.
    address	        TEXT	        Customer's address.
    date_of_birth	DATE	        Customer's date of birth.
    created_at	    TIMESTAMP	    Date when the customer account was created.

2. Movies
This table stores information about the movies being shown in the cinema.


    Column Name	    Data Type	    Description
    movie_id	    INT (PK)	    Unique identifier for each movie.
    title	        VARCHAR(255)	Title of the movie.
    genre	        VARCHAR(100)	Genre of the movie (e.g., Action, Comedy, Drama).
    director	    VARCHAR(255)	Director of the movie.
    release_year	INT	            Year the movie was released.
    rating	        VARCHAR(10)	    Movie rating (e.g., PG-13, R).
    description	    TEXT	        A brief description of the movie.
    duration	    INT	            Duration of the movie in minutes.
    language	    VARCHAR(50)	    Language in which the movie is shown.
    poster_image	VARCHAR(255)	URL or file path for the movie poster image.

3. Screens
This table stores information about the different cinema screens or auditoriums available.

    Column Name	        Data Type	    Description
    screen_id	        INT (PK)	    Unique identifier for each screen.
    screen_name	        VARCHAR(100)	Name of the screen (e.g., Screen 1, IMAX).
    seating_capacity	INT	            Total number of seats in the screen.
    is_3d	            BOOLEAN	        Indicates if the screen supports 3D movies.

4. Showtimes
This table stores the details of each movies screening time on different screens.

    Column Name	    Data Type	Description
    showtime_id	    INT (PK)	Unique identifier for each screening time.
    movie_id	    INT (FK)	Foreign key referencing movies.movie_id.
    screen_id	    INT (FK)	Foreign key referencing screens.screen_id.
    start_time	    TIMESTAMP	Date and time when the movie starts.
    end_time	    TIMESTAMP	Date and time when the movie ends.
    available_seats	INT	        Number of seats available for booking.

5. Bookings
This table stores information about ticket bookings made by customers.

    Column Name	    Data Type	Description
    booking_id	    INT (PK)	Unique identifier for each booking.
    customer_id	    INT (FK)	Foreign key referencing customers.customer_id.
    showtime_id	    INT (FK)	Foreign key referencing showtimes.showtime_id.
    booking_date	TIMESTAMP	Date and time when the booking was made.
    total_amount	DECIMAL(10, 2)	Total amount paid for the booking.
    booking_status	VARCHAR(20)	Status of the booking (e.g., Confirmed, Canceled).
    seats_booked	INT	        Number of seats booked.

6. Ticket Types
This table stores the different ticket categories (e.g., adult, child, senior).

    Column Name	    Data Type	Description
    ticket_type_id	INT (PK)	Unique identifier for each ticket type.
    name	        VARCHAR(50)	Name of the ticket type (e.g., Adult, Child).
    price	        DECIMAL(10, 2)	Price of the ticket type.

7. Booking Details
This table stores the details of individual tickets in a booking, including the type of ticket and seat allocation.

    Column Name	        Data Type	Description
    booking_detail_id	INT (PK)	Unique identifier for each booking detail entry.
    booking_id	        INT (FK)	Foreign key referencing bookings.booking_id.
    ticket_type_id	    INT (FK)	Foreign key referencing ticket_types.ticket_type_id.
    seat_number	        VARCHAR(10)	Seat number (e.g., A1, B2, etc.).

8. Payments
This table stores information about payments made by customers for their bookings.
    Column Name	        Data Type	Description
    payment_id	        INT (PK)	Unique identifier for each payment.
    booking_id	        INT (FK)	Foreign key referencing bookings.booking_id.
    payment_date	    TIMESTAMP	Date and time when the payment was made.
    amount_paid	        DECIMAL(10, 2)	Amount paid for the booking.
    payment_method	    VARCHAR(50)	Payment method (e.g., Credit Card, PayPal).
    payment_status	    VARCHAR(20)	Status of the payment (e.g., Completed, Pending).

9. Staff
This table stores information about staff members working at the cinema (e.g., managers, ticket agents).
    Column Name	    Data Type	Description
    staff_id	    INT (PK)	Unique identifier for each staff member.
    first_name	    VARCHAR(100)	Staffs first name.
    last_name	    VARCHAR(100)	Staffs last name.
    email	        VARCHAR(255)	Staffs email address.
    role	        VARCHAR(100)	Role of the staff member (e.g., Manager, Agent).
    password_hash	VARCHAR(255)	Hashed password for staff login.

10. Sessions
    Column Name	    Data Type	Description
    session_id	    INT (PK)	Unique identifier for each session.
    staff_id	    INT (FK)	Foreign key referencing staff.staff_id.
    session_token	VARCHAR(255)	Token used for session authentication.
    created_at	    TIMESTAMP	Timestamp when the session was created.
    expires_at	    TIMESTAMP	Timestamp when the session expires.