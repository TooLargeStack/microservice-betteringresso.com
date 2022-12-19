package usecase

import (
	"context"
	"ingresso_admin/internal"
	"ingresso_admin/internal/repository"

	"github.com/google/uuid"
)

type ReserveChairUsecase struct {
	querier repository.Querier
}

func NewReserveChairUsecase(querier repository.Querier) *ReserveChairUsecase {
	return &ReserveChairUsecase{
		querier: querier,
	}
}

func (r *ReserveChairUsecase) ReserveSeat(ctx context.Context, input internal.ReserveSeatInput) (internal.ReserveSeatOutput, error) {
	room, err := r.querier.GetRoom(ctx, uuid.NullUUID{
		UUID:  input.RoomID,
		Valid: true,
	})
	// TODO: Create custom errors
	if err != nil {
		return internal.ReserveSeatOutput{}, err
	}

	return internal.ReserveSeatOutput{}, nil
}
