extends Node

var _cash := 0.00:
	set(val):
		_cash = val

func increase_cash(increment:float):
	_cash+=increment

func decrease_cash(decrement:float):
	_cash-=decrement
func get_cash():
	return _cash
