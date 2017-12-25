# GUIDES
# Current limitations

## Current playback limitations
- For solo instruments, only one instrument of each type is allowed (e.g. do not use 2 trumpets in one MIDI file). This limitation should be removed soon and you will be able to add more instruments of same type.
- For solo instruments, track should not contain more than one concurrent voice (e.g. track with divisions or double stops is not allowed). This is because it is often difficult to separate voices when they start to overlap.
- System will not obey any technique or expression text. System will decide what articulations to use with internal rules. You can control these rules with parameters (see Edition job config). On the other hand, contemporary notation editors convert many expressions and marks into notes when exporting to MIDI (dynamics except dynamics pins inside long notes, staccato, legato, nonlegato, accent), so system will see and obey them. These are examples of techniques that are never obeyed: sfzp, con sordino...