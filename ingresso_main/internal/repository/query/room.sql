-- name: GetRoom :one
SELECT * FROM rooms 
WHERE id = $1 LIMIT 1;

-- name: UpdateRoomSeats :exec
UPDATE rooms SET seats = $2 WHERE id = $1;