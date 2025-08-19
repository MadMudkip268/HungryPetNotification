# HungryPetNotification

Simple Turtle WoW (1.18) addon to display a notification for a hunter's hungry pet.
First time LUA development, so others may do it better, but haven't found an existing addon that does something that simple.

## Commands

| Command  |  |
| ------------- |:-------------|
| /hpn     | List of commands |
| /hpn lock     | Locks the notification |
| /hpn unlock   | Unlock the notification for repositioning |
| /hpn reset    | Reset the position of the notification to center |

There is also the command
```
/hpn refresh
```
which forces an update of the notification. I used it during development, but shouldn't be necessary at all.

## Install

Download the ZIP here: https://github.com/MadMudkip268/HungryPetNotification/archive/refs/heads/main.zip
Rename the unzipped folder from ```HungryPetNotification-main``` to ```HungryPetNotification```

Copy it into your Turtle WoW folder just like other addons:
```
turtle-wow\Interface\AddOns\HungryPetNotification
```