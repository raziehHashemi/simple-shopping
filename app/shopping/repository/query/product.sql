-- name: CreateProduct :one
INSERT INTO product (
  type,
  name,
  color,
  count,
  price
) VALUES (
  $1, $2, $3, $4, $5
)
RETURNING *;

-- name: GetProductById :one
SELECT * FROM product
WHERE id = $1 LIMIT 1;

-- name: GetProductByProductname :many
SELECT * FROM product
WHERE name = $1
ORDER BY id;

-- name: GetProductByPrice :many
SELECT * FROM product
WHERE price = $1 
ORDER BY id;

-- name: ListProducts :many
SELECT * FROM product
ORDER BY id;

-- name: DeleteProductById :exec
DELETE FROM product
WHERE id = $1;
