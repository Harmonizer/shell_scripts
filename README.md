Collection of shell scripts and other stuff i've made over the years.

motd.filler.sh --> Script generates custom welcome / motd message for my FreeBSD servers, displayed after initial login. It's not a real motd file though. Since it runs after the shell is run.. does the trick though.
Combination of printf formatting to create tables and a couple of color-set sequence definitions for those disco moments.

screen_adjust.sh --> Automatically adjusts your display to use settings based on actual active screens. Display settings are dynamically configured and adjusted. Settings are determined by checking the actual connected screens during startup. Meaning you will end up with the multi-monitor-based setup and optimized desktop just as desired.

remote_include.editor.sh --> 

mrktplaats.webscraper.sh --> Basic webscraper, needed some way to check out if this marketplace website user sold any new stuff. For general searches you can configure search update alerts, not when the search contains a specific user though. So thats why i had to make something myself. 

logout.sh --> Immediate logout of any session you're currently signed into. (I've made this script a long time ago, I used to experiment with different and more exotic desktop environment components like widget toolkits and tiling window managers a lot back then. Script was useful to escape my broken DE sessions.
