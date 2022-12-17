package usecase

import (
	"ingresso_admin/internal"
	"ingresso_admin/internal/entity"
)

type ReserveChairUsecase struct {
}

func NewReserveChairUsecase() *ReserveChairUsecase {
	return &ReserveChairUsecase{}
}

func (ReserveChairUsecase) ReserveSeat(input internal.ReserveSeatInput) (internal.ReserveSeatOutput, error) {
	// TODO: change room capacity to be dynamic selected
	room, err := entity.NewRoom(input.RoomID, 100, entity.DEFAULT_ROOM)
	if err != nil {
		return internal.ReserveSeatOutput{}, err
	}

	room.ReserveChair(input.Seat.Row, input.Seat.Column)

	return internal.ReserveSeatOutput{}, nil
}
