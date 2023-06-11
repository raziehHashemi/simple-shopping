package product

import (
	"github.com/google/uuid"
)

type color string

var RED color = "red"
var BLUE color = "blue"
var YELLOW color = "yellow"
var BROWN color = "brown"

type Product struct {
	Id    uuid.UUID
	Name  string
	Color color
	count int64
	price int64
}

type ProductUsecase interface {
	Create(product Product) error
	List() ([]Product, error)
	Get(productId uuid.UUID) error
}

type ProductRepository interface {
	Add(product Product) error
	GetAll() error
	Get(productId uuid.UUID) error
}
