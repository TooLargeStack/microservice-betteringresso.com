package entity

import (
	"errors"

	"github.com/asaskevich/govalidator"
)

func init() {
	govalidator.SetFieldsRequiredByDefault(true)
}

type MovieGender string

const (
	ACTION    MovieGender = "ACTION"
	ADVENTURE MovieGender = "ADVENTURE"
	ANIMATION MovieGender = "ANIMATION"
	BIOGRAPHY MovieGender = "BIOGRAPHY"
	COMEDY    MovieGender = "COMEDY"
	CRIME     MovieGender = "CRIME"
	DRAMA     MovieGender = "DRAMA"
	FAMILY    MovieGender = "FAMILY"
	FANTASY   MovieGender = "FANTASY"
	HISTORY   MovieGender = "HISTORY"
	HORROR    MovieGender = "HORROR"
	MUSICAL   MovieGender = "MUSICAL"
	MYSTERY   MovieGender = "MYSTERY"
	ROMANCE   MovieGender = "ROMANCE"
)

type Movie struct {
	ID          string      `valid:"uuidv4"`
	Title       string      `valid:"-"`
	ReleaseYear uint        `valid:"-"`
	Minutes     uint        `valid:"-"`
	Genre       MovieGender `valid:"-"`
	Synopsis    string      `valid:"-"`
}

func NewMovie(id string, title string, releaseYear uint, minutes uint, genre MovieGender, synopsis string) (*Movie, error) {

	movie := &Movie{ID: id, Title: title, ReleaseYear: releaseYear, Minutes: minutes, Genre: genre, Synopsis: synopsis}

	err := movie.valid()
	if err != nil {
		return nil, err
	}

	return movie, nil
}

func (m *Movie) valid() error {
	_, err := govalidator.ValidateStruct(m)
	if err != nil {
		return errors.New("invalid movie data provided")
	}
	return nil
}
