# godot-pixel-art-template
A Pixel Art Template for projects with godot 4.x


### Presets
This includes the following editor settings:
- for non-blurry asset imports: *General > Rendering > Textures > Canvas Textures > Default Texture Filter = Nearest*
- for pixel snapping: *General > Rendering > 2D > Snap > Snap 2D Transforms to Pixel*
- for pixel snapping: *General > Rendering > 2D > Snap > Snap 2D Vertices to Pixel*
- show pixel grid in 2D: Toggle Grid Snapping (Shift + G) and configure snapping options (three dots symbol to the right) 
- snap to pixel grid in 2D: Toggle Smart Snapping (Shift + S)

### Additional content
A simple Main Menu and Placeholder Scene for quick start into prototyping that can also easily be alterted. <br>
The Main Menu has three buttons: Game, Options and Quit, where the first two load the Placeholder 
Scene and the last quits the applications. <br>
The Placeholder Scene has a back button, that by default goes back to the Main Menu, however any 
scene can be specified in the exported variable <br>
<br>
An Autoload for global variables (path to scenes, ...) and utility functions (changing scenes safely, ...) <br>
A conductor scene for making rhithm games.

### Examples
In `examples` there are some pre-built example games to show some of the functionality in an in-game experience.
