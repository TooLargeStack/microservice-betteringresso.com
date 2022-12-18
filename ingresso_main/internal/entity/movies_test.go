package entity

import (
	"testing"

	"github.com/google/uuid"
	"github.com/stretchr/testify/require"
)

func Test_CreatingNewMovieSuccessfully(t *testing.T) {
	// Arrange
	var id = uuid.New().String()
	var title = "The Shawshank Redemption"
	var releaseYear uint = 1994
	var minutes uint = 142
	var genre = ACTION
	var synopsis = "Two imprisoned"

	// Act
	movie, err := NewMovie(id, title, releaseYear, minutes, genre, synopsis)

	// Assert
	require.NoError(t, err)
	require.NotNil(t, movie)
	require.Equal(t, id, movie.ID)
	require.Equal(t, title, movie.Title)
	require.Equal(t, releaseYear, movie.ReleaseYear)
	require.Equal(t, minutes, movie.Minutes)
	require.Equal(t, genre, movie.Genre)
	require.Equal(t, synopsis, movie.Synopsis)
}

func Test_CreatingNewMovieWithInvalidIdentifier(t *testing.T) {
	// Arrange
	var id = "1"
	var title = "The Shawshank Redemption"
	var releaseYear uint = 1994
	var minutes uint = 142
	var genre = ACTION
	var synopsis = "Two imprisoned"

	// Act
	movie, err := NewMovie(id, title, releaseYear, minutes, genre, synopsis)

	// Assert
	require.Nil(t, movie)
	require.NotNil(t, err)
	require.Equal(t, "invalid movie data provided", err.Error())
}
