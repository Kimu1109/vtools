# VTools

Simple video editing commands

## Purpose

1. Quick and simple editing
2. Compress video
3. Share video with friends via Discord, Line, etc.

## Features

These scripts are designed to be used with pipes.
Example:

```bash
vtxt "This is title." 3 | vcat - "input.mp4" | vcoms - > output.mp4
```

Running the example, `output.mp4` will contain a title text for 3 seconds and the `input.mp4` video.

## Requirement

These scripts require [ffmpeg](https://ffmpeg.org/ffmpeg.html) and [ffprobe](https://ffmpeg.org/ffprobe.html).

## Functions

| File Name | Original Name            | Description                                       |
| --------- | ------------------------ | ------------------------------------------------- |
| vcat      | Video Concat             | Connecting Video 1 and Video 2                    |
| vcodec    | Video Codec              | Showing recommendation Video Codec                |
| vcomf     | Video Compression File   | Compress **FILE** to 10MB                         |
| vcoms     | Video Compression Stream | Compress **PIPE**                                 |
| vcut      | Video Cut                | Cutting Video                                     |
| vdsp      | Video Double Speed       | Doubling Video speed                              |
| vmp4      | Video .mp4               | Converting to a pipe-**incompatible** `.mp4` file |
| vstm      | Video Stream             | Converting to a pipe-compatible `mp4` file        |
| vtxt      | Video Text               | Generating and synthesizing subtitles or titles   |

## Examples

Cut 3 to 10 seconds from `2026-01-08 14-59-13.mp4` and save the video with the text "wtf" in the center as `clip.mp4`.

```bash
vcut '2026-01-08 14-59-13.mp4' 3 10 | vtxt "wtf" | vcoms - > clip.mp4
```
Extract the first 3 minutes of `game.mp4`, speed it up to 2x, add the subtitle "How to craft a sword", compress it, and save it as `how-to-craft-sword.mp4`.
```bash
vcut "game.mp4" 0 180 | vdsp - | vtxt "How to craft a sword" -s | vcoms - > "how-to-craft-sword.mp4"
```
Convert `.MTS` to `.mp4`
```bash
vmp4 "00001.MTS" -o "00001.mp4"
```

