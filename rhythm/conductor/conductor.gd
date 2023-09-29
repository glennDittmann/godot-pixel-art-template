extends AudioStreamPlayer
## A conductor for rhythm games.
## Keeps the music and gameplay in sync.
##
## Many thanks to LegionGames (https://github.com/LegionGames/Conductor-Example/)
## Related topics in the godot docs: https://docs.godotengine.org/en/stable/tutorials/audio/sync_with_audio.html

## The Beats Per Minute of the associated audio file
@export var bpm := 100
## The number of notes of the associated audio file
@export var notes := 4

## Emits the current position in beats on every physics process (when playing) 
signal beat(position)
## Emits the current position in beats on every physics process (when playing) 
signal note(position)

# Tracking the beat and song position (in ?)
var song_pos_in_secs := 0.0
var song_pos_in_beats := 1
var secs_per_beat := 60.0 / bpm
var last_reported_beat := 0
var beats_before_start := 0
var current_note := 1

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if playing:
		song_pos_in_secs = get_playback_position() + AudioServer.get_time_since_last_mix() - AudioServer.get_output_latency()
		song_pos_in_beats = int(floor(song_pos_in_secs / secs_per_beat)) + beats_before_start
		_report_beat()

## Plays the song with offset, e.g. to wait on level load
func play_with_beat_offset(offset: int):
	beats_before_start = offset
	$StartTimer.wait_time = secs_per_beat
	$StartTimer.start()

## Plays the song from the given starting beat plus the offset 
func play_from_beat(starting_beat: int, offset: int):
	play()
	seek(secs_per_beat * starting_beat)
	beats_before_start = offset
	current_note = starting_beat % notes

func _report_beat():
	if last_reported_beat < song_pos_in_beats:
		if current_note > notes:
			current_note = 1
		emit_signal("beat", song_pos_in_beats)
		emit_signal("note", current_note)
		last_reported_beat = song_pos_in_beats
		current_note += 1


func _on_start_timer_timeout():
	song_pos_in_beats += 1
	if song_pos_in_beats < beats_before_start - 1:
		$StartTimer.start()
	elif song_pos_in_beats == beats_before_start - 1:
		$StartTimer.wait_time -= (AudioServer.get_time_to_next_mix() + AudioServer.get_output_latency())
		$StartTimer.start()
	else:
		play()
		$StartTimer.stop()
	_report_beat()
