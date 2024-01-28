curl -X POST   http://10.107.66.96:80/order   -H 'Content-Type: application/json'   -d '{
    "order": {
        "book_name": "Harry Potter",
        "author": "J.K Rowling",
        "buyer": "Imam",
        "shipping_address": "Jl. Batik Kumeli no 50 Bandung"
    }
}'
