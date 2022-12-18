package entity

import (
	"testing"

	"github.com/google/uuid"
	"github.com/stretchr/testify/require"
)

func Test_CreatingANewRoomSuccessfully(t *testing.T) {
	id := uuid.New().String()
	chairs := map[string]map[string]*Chair{
		"1": {
			"A": {
				Available: true,
			},
			"B": {
				Available: true,
			},
		},
		"2": {
			"A": {
				Available: true,
			},
			"B": {
				Available: true,
			},
		},
	}
	movies := []*Movie{
		{
			ID:          uuid.New().String(),
			Title:       "The Shawshank Redemption",
			ReleaseYear: 1994,
			Minutes:     142,
			Genre:       "Drama",
			Synopsis:    "Two imprisoned",
		},
		{
			ID:          uuid.New().String(),
			Title:       "The Godfather",
			ReleaseYear: 1972,
			Minutes:     175,
			Genre:       "Crime",
			Synopsis:    "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
		},
	}

	room, err := NewRoom(id, 100, DEFAULT_ROOM, chairs, movies)
	require.Nil(t, err)
	require.Equal(t, id, room.ID)
	require.Equal(t, uint(100), room.Capacity)
	require.Equal(t, DEFAULT_ROOM, room.Type)
	require.Equal(t, chairs, room.Chairs)
	require.Equal(t, movies, room.Movies)
}

func Test_CreatingANewRoomWithInvalidID(t *testing.T) {
	id := "1"
	chairs := map[string]map[string]*Chair{
		"1": {
			"A": {
				Available: true,
			},
			"B": {
				Available: true,
			},
		},
		"2": {
			"A": {
				Available: true,
			},
			"B": {
				Available: true,
			},
		},
	}
	movies := []*Movie{
		{
			ID:          uuid.New().String(),
			Title:       "The Shawshank Redemption",
			ReleaseYear: 1994,
			Minutes:     142,
			Genre:       "Drama",
			Synopsis:    "Two imprisoned",
		},
		{
			ID:          uuid.New().String(),
			Title:       "The Godfather",
			ReleaseYear: 1972,
			Minutes:     175,
			Genre:       "Crime",
			Synopsis:    "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
		},
	}

	room, err := NewRoom(id, 100, DEFAULT_ROOM, chairs, movies)
	require.NotNil(t, err)
	require.Nil(t, room)
	require.Equal(t, "invalid room data provided", err.Error())
}

func Test_CreatingANewRoomWithNotEnoughCapacity(t *testing.T) {
	id := uuid.New().String()
	chairs := map[string]map[string]*Chair{
		"1": {
			"A": {
				Available: false,
			},
			"B": {
				Available: false,
			},
		},
		"2": {
			"A": {
				Available: false,
			},
			"B": {
				Available: false,
			},
		},
	}
	movies := []*Movie{
		{
			ID:          uuid.New().String(),
			Title:       "The Shawshank Redemption",
			ReleaseYear: 1994,
			Minutes:     142,
			Genre:       "Drama",
			Synopsis:    "Two imprisoned",
		},
		{
			ID:          uuid.New().String(),
			Title:       "The Godfather",
			ReleaseYear: 1972,
			Minutes:     175,
			Genre:       "Crime",
			Synopsis:    "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
		},
	}

	room, err := NewRoom(id, 100, DEFAULT_ROOM, chairs, movies)
	require.NotNil(t, room)
	require.Nil(t, err)

	err = room.ReserveChair("1", "A")
	require.NotNil(t, err)
	require.Equal(t, "chair is not available", err.Error())
}

func Test_IsChairAvailable(t *testing.T) {
	id := uuid.New().String()
	chairs := map[string]map[string]*Chair{
		"1": {
			"A": {
				Available: true,
			},
			"B": {
				Available: true,
			},
		},
		"2": {
			"A": {
				Available: true,
			},
			"B": {
				Available: true,
			},
		},
	}
	movies := []*Movie{
		{
			ID:          uuid.New().String(),
			Title:       "The Shawshank Redemption",
			ReleaseYear: 1994,
			Minutes:     142,
			Genre:       "Drama",
			Synopsis:    "Two imprisoned",
		},
		{
			ID:          uuid.New().String(),
			Title:       "The Godfather",
			ReleaseYear: 1972,
			Minutes:     175,
			Genre:       "Crime",
			Synopsis:    "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.",
		},
	}

	room, err := NewRoom(id, 100, DEFAULT_ROOM, chairs, movies)
	require.NotNil(t, room)
	require.Nil(t, err)

	available := room.IsChairAvailable("1", "A")
	require.True(t, available)

	err = room.ReserveChair("1", "A")
	require.NoError(t, err)
	available = room.IsChairAvailable("1", "A")
	require.False(t, available)
}
