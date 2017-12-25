# GUIDES
# Editing job config

## Why edit job configuration
Job configuration allow you to control hundreds of parameters, which cannot be changed with GUI. To edit job configuration, click on job status icon and scroll page down to config editor. You can change anything and add new configuration lines, but be aware that this can lead to errors, you will find them in MGen warnings log on job page.

## Configuration file syntax
Assign values to parameters:  
``` perl
some_parameter = 1
another_parameter = "ABC"
```

Start your comments with # sign:  
``` perl
# This whole line is just a comment  
some_parameter = 1 # This is a comment for this parameter
```

## What can I change in job configuration
1. Most simple and stable way is just to change values of parameters which already exist in your job config. We tried to put most important parameters in so that it is easy for you to change them. Read comments for each parameter:

``` perl
show_correct_hatch = 1 # Set to 1 to mark corrected notes with hatch  
```

2. If needed parameter is not in your config, go to default config of your MGen algorithm and see if there are parameters that you need (click "Example and include configs" button under job config, click your algorithm and go to include folder).

3. You can also look at example configs (click "Example and include configs" button under job config, click your MGen algorithm and choose any config file).

4. Also, you can change instrument parameters. For that you have to specify instrument and on next lines you can change its parameters. To find default values for parameters and know which parameters exist for each instrument, click "Instrument configs" button below job config, then click on needed instrument:

``` perl
Instrument Violin  
rnd_vel = 8 # Randomize note velocity not greater than this percent  
rnd_dyn = 8 # Randomize step dynamics not greater than this percent  
```

If there are multiple instruments of same type, specify particula instrument config after slash:

``` perl
Instrument "Trumpet/SM Trumpet"  
nonlegato_freq = 13 # Frequency (in percent) when legato can be replaced with non-legato by moving note end to the left  
nonlegato_minlen = 200 # Minimum note length (in ms) allowed to convert to nonlegato  
```

## Job config editor keyboard shortcuts
- Ctrl-F / Cmd-F  
Start searching  
- Ctrl-G / Cmd-G  
Find next  
- Shift-Ctrl-G / Shift-Cmd-G  
Find previous  
- Shift-Ctrl-F / Cmd-Option-F  
Replace  
- Shift-Ctrl-R / Shift-Cmd-Option-F  
Replace all  
- Alt-F  
Persistent search (dialog doesn't autoclose, enter to find next, Shift-Enter to find previous)  
- F11  
Toggle full screen  
- Esc  
Exit full screen  
