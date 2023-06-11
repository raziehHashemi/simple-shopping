-- name: CreatePurchase :one
INSERT INTO purchase (
  customer_id,
  product_id,
  count
) VALUES (
  $1, $2, $3
)
RETURNING *;

-- name: GetPurchaseById :one
SELECT * FROM purchase
WHERE id = $1 LIMIT 1;

-- name: GetPurchaseByProductId :many
SELECT * FROM purchase
WHERE product_id = $1
ORDER BY id;

-- name: GetPurchaseByCustomerId :many
SELECT * FROM purchase
WHERE customer_id = $1 
ORDER BY id;

-- name: ListPurchases :many
SELECT * FROM purchase
ORDER BY id;