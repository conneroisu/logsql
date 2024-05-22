package main

import (
	"database/sql"

	"github.com/go-jet/jet/v2/sqlite"
)

type AddressTable struct {
	sqlite.Table
	AddressID  sqlite.ColumnInteger
	Address    sqlite.ColumnString
	Address2   sqlite.ColumnString
	District   sqlite.ColumnString
	CityID     sqlite.ColumnInteger
	PostalCode sqlite.ColumnString
	Phone      sqlite.ColumnString
	LastUpdate sqlite.ColumnTimestamp
}

func main() {
	db, err := sql.Open("sqlite", ":memory:")
	if err != nil {
		panic(err)
	}
	defer db.Close()

	err = db.CreateTable(&AddressTable{})
	if err != nil {
		panic(err)
	}

	address := AddressTable{
		AddressID:  jet.IntegerColumn(1),
		Address:    jet.StringColumn("address"),
		Address2:   jet.StringColumn("address2"),
		District:   jet.StringColumn("district"),
		CityID:     jet.IntegerColumn(1),
		PostalCode: jet.StringColumn("postalcode"),
		Phone:      jet.StringColumn("phone"),
		LastUpdate: jet.TimestampColumn(jet.Now()),
	}

	err = db.Insert(&address)
	if err != nil {
		panic(err)
	}
}
