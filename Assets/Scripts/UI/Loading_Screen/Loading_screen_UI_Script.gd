extends CanvasLayer

signal loading_screen_has_full_coverage

@onready var animationPlayer : AnimationPlayer = $AnimationPlayer
@onready var progressBar : ProgressBar =$Background/ProgressBar
@onready var loading_text : Label=$Loading
func _update_progress_bar(new_value : float) -> void:
	progressBar.set_value_no_signal(new_value*100)
	
func _Start_outro_animation()-> void:
	await Signal(animationPlayer,"animation_finished")
	animationPlayer.play("end_load")
	await Signal(animationPlayer,"animation_finished")
	self.queue_free()
