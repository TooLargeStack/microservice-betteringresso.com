package entity

import (
	"testing"
	"time"

	"github.com/google/uuid"
	"github.com/stretchr/testify/require"
)

func Test_CreatingANewRoomSuccessfully(t *testing.T) {
	id := uuid.New().String()
	availableTimes := []*AvailableTime{
		{
			StartTime: time.Now(),
			EndTime:   time.Now().Add(time.Hour),
		},
		{
			StartTime: time.Now().Add(time.Hour),
			EndTime:   time.Now().Add(time.Hour * 2),
		},
	}
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

	room, err := NewRoom(id, 100, DEFAULT_ROOM, availableTimes, chairs)
	require.Nil(t, err)
	require.Equal(t, id, room.ID)
	require.Equal(t, uint(100), room.Capacity)
	require.Equal(t, DEFAULT_ROOM, room.Type)
}

func Test_CreatingANewRoomWithInvalidID(t *testing.T) {
	id := "1"
	availableTimes := []*AvailableTime{
		{
			StartTime: time.Now(),
			EndTime:   time.Now().Add(time.Hour),
		},
		{
			StartTime: time.Now().Add(time.Hour),
			EndTime:   time.Now().Add(time.Hour * 2),
		},
	}
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

	room, err := NewRoom(id, 100, DEFAULT_ROOM, availableTimes, chairs)
	require.NotNil(t, err)
	require.Nil(t, room)
	require.Equal(t, "invalid room data provided", err.Error())
}

func Test_CreatingANewRoomWithNotEnoughCapacity(t *testing.T) {
	id := uuid.New().String()
	availableTimes := []*AvailableTime{
		{
			StartTime: time.Now(),
			EndTime:   time.Now().Add(time.Hour),
		},
		{
			StartTime: time.Now().Add(time.Hour),
			EndTime:   time.Now().Add(time.Hour * 2),
		},
	}
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

	room, err := NewRoom(id, 100, DEFAULT_ROOM, availableTimes, chairs)
	require.NotNil(t, room)
	require.Nil(t, err)

	err = room.ReserveChair("1", "A")
	require.NotNil(t, err)
	require.Equal(t, "chair is not available", err.Error())
}

func Test_IsChairAvailable(t *testing.T) {
	id := uuid.New().String()
	availableTimes := []*AvailableTime{
		{
			StartTime: time.Now(),
			EndTime:   time.Now().Add(time.Hour),
		},
		{
			StartTime: time.Now().Add(time.Hour),
			EndTime:   time.Now().Add(time.Hour * 2),
		},
	}
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

	room, err := NewRoom(id, 100, DEFAULT_ROOM, availableTimes, chairs)
	require.NotNil(t, room)
	require.Nil(t, err)

	available := room.IsChairAvailable("1", "A")
	require.True(t, available)

	err = room.ReserveChair("1", "A")
	require.NoError(t, err)
	available = room.IsChairAvailable("1", "A")
	require.False(t, available)
}
