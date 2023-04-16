from os import popen, getenv
import sys, psutil, time, requests
lat=0
lon=0
key=getenv('OWM_KEY')
URL = f'https://api.openweathermap.org/data/2.5/weather?lat={lat}&lon={lon}&appid={key}&units=metric'


def sec2time(sec):  #THANKS STACK OVERFLOW
    ''' Convert seconds to 'D days, HH:MM:SS.FFF' '''
    if hasattr(sec,'__len__'):
        return [sec2time(s) for s in sec]
    m, s = divmod(sec, 60)
    h, m = divmod(m, 60)
    d, h = divmod(h, 24)

    pattern = r'%01dh %01dm'
    if d == 0:
        return pattern % (h, m)
    return ('%d d, ' + pattern) % (d, h, m)

def cpu():
  return psutil.cpu_percent(interval=1)

def mem():
  tmp = popen("free --mega | grep -F \"Mem:\"").read().replace("Mem:", "").strip().split()
  used_per = round(int(tmp[1])/int(tmp[0]) * 100, 1)
  return used_per

def up():
  return sec2time(time.time() - psutil.boot_time())

def my_date():
  day = popen("date +%a").read().strip() + ", "
  date = popen("date +%d").read().strip() + " " + popen("date +%b").read().strip()

  return day + date


def get_weather(i=False):
  response = requests.get(URL)

  if response.status_code != 200:
    return "err"

  data = response.json()
  temp = f"{round(float(data['main']['temp']))}°C"
  icon = f"http://openweathermap.org/img/w/{data['weather'][0]['icon']}.png"

  if i:
    return icon

  return temp

def get_brightness(percent=False):
  brightness = popen("xrandr --verbose | awk '/ connected/ {seen = 1} seen {print}' | grep \"Brightness\"").read().replace("Brightness:", "").strip()
  return float(brightness) * 100 if percent else brightness

def set_bright(value):
  value = float(value) if float(value) <= 100 else 100 
  popen(f"xrandr --output HDMI-A-0 --brightness {value/100}")
  print(value/100)

def focused_win():
  t = popen("xdotool getwindowfocus getwindowname").read().strip()
  win = f"{t[:37]}..." if len(t) > 40 else "Desktop" if len(t)==0 else t
  return win


args=sys.argv
mode=args[1]
arg = args[2] if len(args) > 2 else 1

match mode:
  case "--cpu": print(cpu())
  case "--mem": print(mem())
  case "--up": print(up())
  case "--date": print(my_date())
  case "--weather": print(get_weather())
  case "--w_icon": print(get_weather(True))
  case "--brightness": print(get_brightness())
  case "--per-brightness": print(get_brightness(True))
  case "--set-bright": set_bright(arg)
  case "--win": print(focused_win())

