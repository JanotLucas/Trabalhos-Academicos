# importing tkinter
from tkinter import *


# cores
col1 = "#3b3b3b"  # black
col2 = "#feffff"  # white
col3 = "#38576b"  # blue
col4 = "#ECEFF1"  # grey
col5 = "#FFAB40"  # orange

# creating window
window = Tk()
window.title("Calculator")
window.geometry("240x300")
window.config(bg=col1)

# creating frames
frame_display = Frame(window, width=240, height=50, bg=col3)
frame_display.grid(row=0, column=0)

frame_body = Frame(window, width=240, height=250)
frame_body.grid(row=1, column=0)

# all_values variable
all_values = ''


# creating function
def val_input(val):
    global all_values
    all_values += val
    # Setting value on display
    val_str.set(all_values)



def calc(val):
    try:
        global all_values
        result = eval(val)
        if len(str(result)) <= 16:
            val_str.set(result)
            all_values = ''
        else:
            result = "{:e}".format(result)
            val_str.set(result)
            all_values = ''

    except SyntaxError:
        all_values = ''
        result = 'ERROR'
        val_str.set(result)
    except ZeroDivisionError:
        all_values = ''
        result = 'ERROR'
        val_str.set(result)


def clear_input():
    global all_values
    all_values = ''
    val_str.set(all_values)


# creating label
val_str = StringVar()
app_label = Label(frame_display, textvariable=val_str, width=16, height=2, padx=7, relief=FLAT, anchor="e",
                  justify=RIGHT,
                  fg=col2, font='Ivy 18', bg=col3)
app_label.place(x=0, y=0)

# creating bottoms
b_1 = Button(frame_body, command=clear_input, text="C", width=11, height=2, bg=col4, font='Ivy 13 bold',
             relief=RAISED, overrelief=RIDGE)
b_1.place(x=0, y=0)

b_2 = Button(frame_body, command=lambda: val_input("%"), text="%", width=5, height=2, bg=col4, font='Ivy 13 bold',
             relief=RAISED, overrelief=RIDGE)
b_2.place(x=120, y=0)

b_3 = Button(frame_body, command=lambda: val_input("/"), text="/", width=5, height=2, bg=col5, fg=col2,
             font='Ivy 13 bold', relief=RAISED, overrelief=RIDGE)
b_3.place(x=180, y=0)

b_4 = Button(frame_body, command=lambda: val_input("7"), text="7", width=5, height=2, bg=col4, font='Ivy 13 bold',
             relief=RAISED, overrelief=RIDGE)
b_4.place(x=0, y=51)

b_5 = Button(frame_body, command=lambda: val_input("8"), text="8", width=5, height=2, bg=col4, font='Ivy 13 bold',
             relief=RAISED, overrelief=RIDGE)
b_5.place(x=60, y=51)

b_6 = Button(frame_body, command=lambda: val_input("9"), text="9", width=5, height=2, bg=col4, font='Ivy 13 bold',
             relief=RAISED, overrelief=RIDGE)
b_6.place(x=120, y=51)

b_7 = Button(frame_body, command=lambda: val_input("*"), text="*", width=5, height=2, bg=col5, fg=col2,
             font='Ivy 13 bold', relief=RAISED, overrelief=RIDGE)
b_7.place(x=180, y=51)

b_8 = Button(frame_body, command=lambda: val_input("4"), text="4", width=5, height=2, bg=col4, font='Ivy 13 bold',
             relief=RAISED, overrelief=RIDGE)
b_8.place(x=0, y=102)

b_9 = Button(frame_body, command=lambda: val_input("5"), text="5", width=5, height=2, bg=col4, font='Ivy 13 bold',
             relief=RAISED, overrelief=RIDGE)
b_9.place(x=60, y=102)

b_10 = Button(frame_body, command=lambda: val_input("6"), text="6", width=5, height=2, bg=col4, font='Ivy 13 bold',
              relief=RAISED, overrelief=RIDGE)
b_10.place(x=120, y=102)

b_11 = Button(frame_body, command=lambda: val_input("-"), text="-", width=5, height=2, bg=col5, fg=col2,
              font='Ivy 13 bold', relief=RAISED, overrelief=RIDGE)
b_11.place(x=180, y=102)

b_12 = Button(frame_body, command=lambda: val_input("1"), text="1", width=5, height=2, bg=col4, font='Ivy 13 bold',
              relief=RAISED, overrelief=RIDGE)
b_12.place(x=0, y=153)

b_13 = Button(frame_body, command=lambda: val_input("2"), text="2", width=5, height=2, bg=col4, font='Ivy 13 bold',
              relief=RAISED, overrelief=RIDGE)
b_13.place(x=60, y=153)

b_14 = Button(frame_body, command=lambda: val_input("3"), text="3", width=5, height=2, bg=col4, font='Ivy 13 bold',
              relief=RAISED, overrelief=RIDGE)
b_14.place(x=120, y=153)

b_15 = Button(frame_body, command=lambda: val_input("+"), text="+", width=5, height=2, bg=col5, fg=col2,
              font='Ivy 13 bold', relief=RAISED, overrelief=RIDGE)
b_15.place(x=180, y=153)

b_16 = Button(frame_body, command=lambda: val_input("0"), text="0", width=11, height=2, bg=col4, font='Ivy 13 bold',
              relief=RAISED, overrelief=RIDGE)
b_16.place(x=0, y=204)

b_17 = Button(frame_body, command=lambda: val_input("."), text=".", width=5, height=2, bg=col4, font='Ivy 13 bold',
              relief=RAISED, overrelief=RIDGE)
b_17.place(x=120, y=204)

b_18 = Button(frame_body, command=lambda: calc(all_values), text="=", width=5, height=2, bg=col5, fg=col2,
              font='Ivy 13 bold', relief=RAISED, overrelief=RIDGE)
b_18.place(x=180, y=204)

window.mainloop()
