package usecase

import (
	"ingresso_admin/internal"
)

type ReserveChairUsecase struct {
}

func NewReserveChairUsecase() *ReserveChairUsecase {
	return &ReserveChairUsecase{}
}

func (ReserveChairUsecase) ReserveSeat(input internal.ReserveSeatInput) (internal.ReserveSeatOutput, error) {
	// TODO: change room capacity to be dynamic selected
	return internal.ReserveSeatOutput{}, nil
}
