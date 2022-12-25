package repository

import (
	"database/sql"
	"os"
	"testing"
)

var testQueries *Queries
var testDB *sql.DB
var dsn string = "postgresql://postgres:postgres@localhost:5432/ingresso_main?sslmode=disable"

func TestMain(m *testing.M) {
	var err error
	testDB, err := sql.Open("postgres", dsn)

	if err != nil {
		panic(err)
	}

	if err = testDB.Ping(); err != nil {
		panic(err)
	}

	testQueries = new(Queries)

	os.Exit(m.Run())
}
