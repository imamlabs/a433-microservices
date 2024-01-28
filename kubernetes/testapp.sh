curl -X POST   http://192.168.49.2:32585 -H 'Content-Type: application/json'   -d '{
    "order": {
        "book_name": "Harry Potter",
        "author": "J.K Rowling",
        "buyer": "Fikri Helmi Setiawan",
        "shipping_address": "Jl. Batik Kumeli no 50 Bandung"
    }
}'
