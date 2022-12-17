package entity

import (
	"errors"
	"time"

	"github.com/asaskevich/govalidator"
)

func init() {
	govalidator.SetFieldsRequiredByDefault(true)
}

type AvailableTime struct {
	StartTime time.Time
	EndTime   time.Time
}

func NewAvailableTime(startTime, endTime time.Time) (*AvailableTime, error) {
	availableTime := &AvailableTime{StartTime: startTime, EndTime: endTime}
	err := availableTime.valid()
	if err != nil {
		return nil, err
	}
	return availableTime, nil
}

func (a *AvailableTime) valid() error {
	_, err := govalidator.ValidateStruct(a)
	if err != nil {
		return errors.New("invalid time data provided")
	}
	return nil

}
