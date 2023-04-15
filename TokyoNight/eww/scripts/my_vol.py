import os, sys

args=sys.argv
mode=args[1]

def get_percentage():
  percentage = str(os.popen('pamixer --get-volume-human').read()).strip().replace("%", "")
  if percentage == str("muted") : return "0"
  else: return percentage

def change():
  x=int(args[2])
  
  if x > 100: x=100
  if x < 0: x=0
  os.popen(f"amixer sset 'Master' {x}%")
  return x

def get_icon():
  percentage=int(get_percentage())
  if percentage == "muted":
    return ""
  else:
    if percentage > 50:
      icon=""
    elif percentage > 0:
      icon=""
    else:
      icon=""

    return icon

def mute():
  os.popen('pamixer -t')

match mode:
  case "get": print(get_percentage())
  case "set": print(change())
  case "icon": print(get_icon())
  case "mute": mute()
