package entity

import (
	"errors"
	"fmt"

	"github.com/asaskevich/govalidator"
)

func init() {
	govalidator.SetFieldsRequiredByDefault(true)
}

type RoomType string
type ChairType string

const (
	DEFAULT_ROOM RoomType = "DEFAULT_ROOM"
	VIP_ROOM     RoomType = "VIP_ROOM"
	PREMIUM_ROOM RoomType = "PREMIUM_ROOM"
	IMAX_ROOM    RoomType = "IMAX_ROOM"
	OTHER_ROOM   RoomType = "OTHER_ROOM"
)
const (
	DEFAULT_CHAIR    ChairType = "DEFAULT_CHAIR"
	SOFT_CHAIR       ChairType = "SOFT_CHAIR"
	ACCESSIBLE_CHAIR ChairType = "ACCESSIBLE_CHAIR"
	OTHER_CHAIR      ChairType = "OTHER_CHAIR"
)

type Chair struct {
	Identifier ChairType
	Available  bool
}

type Room struct {
	ID       string                       `valid:"uuidv4"`
	Capacity uint                         `valid:"-"`
	Type     RoomType                     `valid:"-"`
	Chairs   map[string]map[string]*Chair `valid:"-"`
	Movies   []*Movie                     `valid:"-"`
}

func NewRoom(id string, capacity uint, roomType RoomType, chairs map[string]map[string]*Chair, movies []*Movie) (*Room, error) {

	room := &Room{ID: id, Capacity: capacity, Type: roomType, Chairs: chairs, Movies: movies}

	err := room.valid()
	if err != nil {
		return nil, err
	}
	return room, nil
}

func (r *Room) ReserveChair(row string, column string) error {
	err := r.valid()
	if err != nil {
		return err
	}

	if val, ok := r.Chairs[row]; ok {
		if val, ok := val[column]; ok {
			if val.Available {
				val.Available = false
			} else {
				return errors.New("chair is not available")
			}
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
		fmt.Println("validation error: ", err.Error())
		return errors.New("invalid room data provided")
	}
	return nil
}
