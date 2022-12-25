package repository

import (
	"context"
	"testing"

	"github.com/google/uuid"
)

func Test_GetRoom(t *testing.T) {
	type args struct {
		ctx context.Context
		id  uuid.NullUUID
	}
}
