package domain

type ChairType string

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
