package entity

import (
	"time"

	"github.com/asaskevich/govalidator"
)

func init() {
	govalidator.SetFieldsRequiredByDefault(true)
}

type AvailableTime struct {
	StartTime time.Time `valid:"-"`
	EndTime   time.Time `valid:"-"`
}
