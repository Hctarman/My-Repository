import time
import webbrowser
breaks = 1
break_count = 0
print("Program initiated on " +time.ctime())
while(break_count < breaks):
    time.sleep(5)
    webbrowser.open("https://www.youtube.com/watch?v=7Wy3_Thlybw")
    break_count = break_count + 1
