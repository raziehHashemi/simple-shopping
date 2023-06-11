-- name: GetRoleById :one
SELECT * FROM role
WHERE id = $1 LIMIT 1;

-- name: GetRoleByName :one
SELECT * FROM role
WHERE name = $1 LIMIT 1;

-- name: ListRoles :many
SELECT * FROM role
ORDER BY name;

-- name: CreateRole :one
INSERT INTO role (
  name
) VALUES (
  $1
)
RETURNING *;

-- name: DeleteRole :exec
DELETE FROM role
WHERE id = $1;