extends Node

var _cash := 0:
	set(val):
		_cash = val

func increase_cash(increment:int):
	_cash+=increment

func decrease_cash(decrement:int):
	_cash-=decrement
func get_cash():
	return _cash
