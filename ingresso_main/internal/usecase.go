package internal

import "time"

type SeatInput struct {
	Row    string `json:"row"`
	Column string `json:"column"`
}

type ReserveSeatInput struct {
	MovieID   string
	RoomID    string
	StartTime time.Time
	Seat      SeatInput
}

// TODO: Generate a ticket
type ReserveSeatOutput struct {
}

type UseCase interface {
	ReserveSeat(input ReserveSeatInput) (ReserveSeatOutput, error)
}
