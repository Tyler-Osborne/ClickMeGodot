extends Node

# Price = BaseCost × Multiplier^Owned

const MULTIPLIER : float = 1.06
var currentPoints : int = 0
var ownedClickers : int = 1
var ownedAutos: int = 0
var multiThreshold = [50, 100, 200, 300, 400, 500, 600, 700, 800, 900, 1000]