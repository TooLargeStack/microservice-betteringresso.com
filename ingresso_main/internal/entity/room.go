package domain

import (
	"errors"

	"github.com/asaskevich/govalidator"
)

func init() {
	govalidator.SetFieldsRequiredByDefault(true)
}

type RoomType string

const (
	DEFAULT_ROOM RoomType = "DEFAULT_ROOM"
	VIP_ROOM     RoomType = "VIP_ROOM"
	PREMIUM_ROOM RoomType = "PREMIUM_ROOM"
	IMAX_ROOM    RoomType = "IMAX_ROOM"
	OTHER_ROOM   RoomType = "OTHER_ROOM"
)

type Room struct {
	Identifier     string
	Capacity       uint
	Type           RoomType
	AvailableTimes []*AvailableTime
	Chairs         map[string]map[string]Chair
}

func NewRoom(identifier string, capacity uint, roomType RoomType) (*Room, error) {

	room := &Room{Identifier: identifier, Capacity: capacity, Type: roomType}

	err := room.valid()
	if err != nil {
		return nil, err
	}
	return room, nil
}

func (r *Room) ReserveChair(row string, column string) error {
	if !r.IsChairAvailable(row, column) {
		return errors.New("chair is not available")
	}

	err := r.valid()
	if err != nil {
		return err
	}

	if val, ok := r.Chairs[row]; ok {
		if val, ok := val[column]; ok {
			val.Available = false
		}
	}
	return nil
}

func (r *Room) IsChairAvailable(row string, column string) bool {
	if val, ok := r.Chairs[row]; ok {
		if val, ok := val[column]; ok {
			return val.Available
		}
	}
	return false
}

func (r *Room) valid() error {
	_, err := govalidator.ValidateStruct(r)
	if err != nil {
		return errors.New("invalid room data provided")
	}
	return nil
}
