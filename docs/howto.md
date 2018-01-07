# GUIDES
# 2. How to

## How to render MP3 with best quality
- Default instrument is piano. For example, you can specify instrument only for the first tracks - then piano will be used for all other tracks in your MIDI file.
- Most instruments are solo (except piano). You can assign multiple MIDI tracks to one solo instrument, but if multiple tracks try to play to same solo instrument at the same time, you will probably get bad results.
- You can tweak a lot of performance parameters for each instrument, e.g. to use less glissando articulations, to make automatic crescendo faster, to decrease randomization, to make legato transitions shorter. Later I will update this document and show you how to do this.
- If you choose to export MP3 with stems, you will find separate file for each stem in job folder. Click job status icon, then "Browse results, configs and logs".
- If results of your processing were deleted due to expiration, you can rerun jobs again. Also, you can increase expiration period for each upload.
- If you have DAW and the same virtual instruments installed, you can download "prepared" MIDI, import it into DAW and tweak notes, velocities and CCs. Click job status icon, then "Browse results, configs and logs", download \*.midi file.
- All continuous control (CC) events in your uploaded MIDI file are ignored. System uses only notes and their velocities to build new continuous controls for dynamics, vibrato intensity, vibrato speed.
- To get best results, make sure that you have a pause at the beginning of your initial MIDI file. At least 0.5 seconds (1 measure) is enough. Some virtual instruments require moving note start to the left to compensate for slow attack and ensure that rhythm between virtual instruments is consistent. If you do not have a starting pause, algorithm will not be able to move first note start to the left.
