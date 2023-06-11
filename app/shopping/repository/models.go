// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.18.0

package repository

import (
	"database/sql"
	"time"
)

type Customer struct {
	ID       int64
	Username string
	// must be positive
	Balance  int64
	SignupAt time.Time
}

type Product struct {
	ID        int64
	Type      string
	Name      string
	Color     string
	Price     int64
	Count     int32
	CreatedAt sql.NullTime
}

type Purchase struct {
	ID         int64
	CustomerID int64
	ProductID  sql.NullInt64
	Count      int32
	SoldAt     time.Time
}

type Role struct {
	ID   int64
	Name string
}

type User struct {
	ID        int64
	Username  string
	Firstname string
	Lastname  string
	Password  string
	Email     string
	RoleID    string
}