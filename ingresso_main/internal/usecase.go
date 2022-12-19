package internal

import (
	"context"
	"time"

	"github.com/google/uuid"
)

type SeatInput struct {
	Row    string `json:"row"`
	Column string `json:"column"`
}

type ReserveSeatInput struct {
	MovieID   uuid.UUID
	RoomID    uuid.UUID
	StartTime time.Time
	Seat      SeatInput
}

// TODO: Generate a ticket
type ReserveSeatOutput struct {
}

type UseCase interface {
	ReserveSeat(ctx context.Context, input ReserveSeatInput) (ReserveSeatOutput, error)
}
