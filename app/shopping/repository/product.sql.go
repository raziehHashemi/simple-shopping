// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0
// source: product.sql

package repository

import (
	"context"
)

const createProduct = `-- name: CreateProduct :one
INSERT INTO product (
  type,
  name,
  color,
  count,
  price
) VALUES (
  $1, $2, $3, $4, $5
)
RETURNING id, type, name, color, price, count, created_at
`

type CreateProductParams struct {
	Type  string
	Name  string
	Color string
	Count int32
	Price int64
}

func (q *Queries) CreateProduct(ctx context.Context, arg CreateProductParams) (Product, error) {
	row := q.db.QueryRowContext(ctx, createProduct,
		arg.Type,
		arg.Name,
		arg.Color,
		arg.Count,
		arg.Price,
	)
	var i Product
	err := row.Scan(
		&i.ID,
		&i.Type,
		&i.Name,
		&i.Color,
		&i.Price,
		&i.Count,
		&i.CreatedAt,
	)
	return i, err
}

const deleteProductById = `-- name: DeleteProductById :exec
DELETE FROM product
WHERE id = $1
`

func (q *Queries) DeleteProductById(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteProductById, id)
	return err
}

const getProductById = `-- name: GetProductById :one
SELECT id, type, name, color, price, count, created_at FROM product
WHERE id = $1 LIMIT 1
`

func (q *Queries) GetProductById(ctx context.Context, id int64) (Product, error) {
	row := q.db.QueryRowContext(ctx, getProductById, id)
	var i Product
	err := row.Scan(
		&i.ID,
		&i.Type,
		&i.Name,
		&i.Color,
		&i.Price,
		&i.Count,
		&i.CreatedAt,
	)
	return i, err
}

const getProductByPrice = `-- name: GetProductByPrice :many
SELECT id, type, name, color, price, count, created_at FROM product
WHERE price = $1 
ORDER BY id
`

func (q *Queries) GetProductByPrice(ctx context.Context, price int64) ([]Product, error) {
	rows, err := q.db.QueryContext(ctx, getProductByPrice, price)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Product
	for rows.Next() {
		var i Product
		if err := rows.Scan(
			&i.ID,
			&i.Type,
			&i.Name,
			&i.Color,
			&i.Price,
			&i.Count,
			&i.CreatedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const getProductByProductname = `-- name: GetProductByProductname :many
SELECT id, type, name, color, price, count, created_at FROM product
WHERE name = $1
ORDER BY id
`

func (q *Queries) GetProductByProductname(ctx context.Context, name string) ([]Product, error) {
	rows, err := q.db.QueryContext(ctx, getProductByProductname, name)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Product
	for rows.Next() {
		var i Product
		if err := rows.Scan(
			&i.ID,
			&i.Type,
			&i.Name,
			&i.Color,
			&i.Price,
			&i.Count,
			&i.CreatedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}

const listProducts = `-- name: ListProducts :many
SELECT id, type, name, color, price, count, created_at FROM product
ORDER BY id
`

func (q *Queries) ListProducts(ctx context.Context) ([]Product, error) {
	rows, err := q.db.QueryContext(ctx, listProducts)
	if err != nil {
		return nil, err
	}
	defer rows.Close()
	var items []Product
	for rows.Next() {
		var i Product
		if err := rows.Scan(
			&i.ID,
			&i.Type,
			&i.Name,
			&i.Color,
			&i.Price,
			&i.Count,
			&i.CreatedAt,
		); err != nil {
			return nil, err
		}
		items = append(items, i)
	}
	if err := rows.Close(); err != nil {
		return nil, err
	}
	if err := rows.Err(); err != nil {
		return nil, err
	}
	return items, nil
}
