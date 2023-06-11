-- name: CreateUser :one
INSERT INTO "user" (
  username,
  password,
  firstname,
  lastname,
  email,
  role_id
) VALUES (
  $1, $2, $3, $4, $5, $6
)
RETURNING *;

-- name: GetUserById :one
SELECT * FROM "user"
WHERE id = $1 LIMIT 1;

-- name: GetUserByUsername :one
SELECT * FROM "user"
WHERE username = $1 LIMIT 1;

-- name: GetUserByRoleId :many
SELECT * FROM "user"
WHERE role_id = $1 
ORDER BY username;

-- name: ListUsers :many
SELECT * FROM "user"
ORDER BY username;

-- name: DeleteUserById :exec
DELETE FROM "user"
WHERE id = $1;

-- name: DeleteUserByUsername :exec
DELETE FROM "user"
WHERE username = $1;


-- name: CreateCustomer :one
INSERT INTO customer (
  username,
  balance
) VALUES (
  $1, $2
)
RETURNING *;

-- name: GetCustomerById :one
SELECT * FROM customer
WHERE id = $1 LIMIT 1;

-- name: GetBalanceByUsername :one
SELECT * FROM customer
WHERE username = $1
LIMIT 1;

-- name: GetCustomerGreaterThan :many
SELECT * FROM customer
WHERE balance >= $1 
ORDER BY id;

-- name: GetCustomerLessThan :many
SELECT * FROM customer
WHERE balance < $1 
ORDER BY id;

-- name: ListCustomers :many
SELECT * FROM customer
ORDER BY id;

-- name: DeleteCustomerById :exec
DELETE FROM customer
WHERE id = $1;

-- name: DeleteCustomerByUsername :exec
DELETE FROM customer
WHERE username = $1;