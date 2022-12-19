// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.16.0

package repository

import (
	"context"

	"github.com/google/uuid"
)

type Querier interface {
	GetRoom(ctx context.Context, id uuid.NullUUID) (Room, error)
	UpdateRoomSeats(ctx context.Context, arg UpdateRoomSeatsParams) error
}

var _ Querier = (*Queries)(nil)
