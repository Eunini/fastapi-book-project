from fastapi import APIRouter, HTTPException
from api.routes import books
from .db import Book, db

api_router = APIRouter()
api_router.include_router(books.router, prefix="/books", tags=["books"])

# Initialize some sample books
sample_books = [
    Book(id=1, title="The Hobbit", author="J.R.R. Tolkien", 
         publication_year=1937, genre="Fantasy"),
]

# Adding the sample books to the database
for book in sample_books:
    db.add_book(book)

# Root route
@api_router.get("/", tags=["root"])
async def root():
    return {"message": "Welcome to the FastAPI Book API!"}

# Get a specific book by ID
@api_router.get("/books/{book_id}", tags=["books"])
async def get_book(book_id: int):
    book = db.get_book(book_id)
    if not book:
        raise HTTPException(status_code=404, detail="Book not found")
    return book

# Healthcheck route
@api_router.get("/healthcheck", tags=["health"])
async def healthcheck():
    return {"status": "ok"}

# Delete a specific book by ID
@api_router.delete("/books/{book_id}", status_code=204, tags=["books"])
async def delete_book(book_id: int):
    deleted = db.delete_book(book_id)
    if not deleted:
        raise HTTPException(status_code=404, detail="Book not found")
    return {"message": "Book deleted successfully"}
