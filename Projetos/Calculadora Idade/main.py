from tkinter import *
from dateutil.relativedelta import relativedelta
from tkcalendar import DateEntry

# colors
col1 = "#3b3b3b"  # black/heavy
col2 = "#333333"  # black/light
col3 = "#FFFFFF"  # white
col4 = "#fcc058"  # orange

# creating window
window = Tk()
window.title('')
window.geometry('310x400')
window.configure(bg=col1)

# creating frames, labels and entry
upper_frame = Frame(window, width=310, height=140, pady=0, padx=0, relief='flat', bg=col2)
upper_frame.grid(row=0, column=0)

lower_frame = Frame(window, width=310, height=400, padx=0, pady=0, relief='flat', bg=col1)
lower_frame.grid(row=1, column=0, sticky=NW)

app_calculator = Label(upper_frame, text="AGE", width=25, height=1, padx=3, relief="flat", anchor="center",
                       font="Ivy 15 bold", bg=col2, fg=col4)
app_calculator.place(x=0, y=30)
app_age = Label(upper_frame, text="CALCULATOR", width=25, height=1, padx=3, relief="flat", anchor="center",
                font="Ivy 15 bold", bg=col2, fg=col4)
app_age.place(x=0, y=70)

label_initial_date = Label(lower_frame, text="Initial Date", height=1, pady=0, padx=0, relief="flat", anchor=NW,
                           font='Ivy 11', bg=col1, fg=col3)
label_initial_date.place(x=50, y=30)

cal_1 = DateEntry(lower_frame, width=13, backgrounds='darkblue', foreground='white', borderwidth=2,
                  date_pattern='dd/mm/yyy')
cal_1.place(x=170, y=30)

label_birth_day = Label(lower_frame, text="Birth Day", height=1, pady=0, padx=0, relief="flat", anchor=NW,
                        font="Ivy 11", bg=col1, fg=col3)
label_birth_day.place(x=50, y=70)

cal_2 = DateEntry(lower_frame, width=13, backgrounds='darkblue', foreground='white', borderwidth=2,
                  date_pattern='dd/mm/yyy')
cal_2.place(x=170, y=70)

app_1_year = Label(lower_frame, text='', height=1, padx=0, relief="flat", anchor="center", font="Ivy 25 bold",
                   bg=col1, fg=col3)
app_1_year.place(x=60, y=135)

app_year = Label(lower_frame, text='Years', height=1, padx=0, relief='flat', anchor="center", font="Ivy 11 bold",
                 bg=col1, fg=col3)
app_year.place(x=55, y=175)

app_2_month = Label(lower_frame, text='', height=1, padx=0, relief="flat", anchor="center", font="Ivy 25 bold",
                    bg=col1, fg=col3)
app_2_month.place(x=140, y=135)

app_month = Label(lower_frame, text='Months', height=1, padx=0, relief='flat', anchor="center", font="Ivy 11 bold",
                  bg=col1, fg=col3)
app_month.place(x=130, y=175)

app_3_day = Label(lower_frame, text="", height=1, padx=0, relief="flat", anchor="center", font='Ivy 25 bold',
                  bg=col1, fg=col3)
app_3_day.place(x=220, y=135)
app_day = Label(lower_frame, text="Days", height=1, padx=0, relief="flat", anchor="center", font='Ivy 11 bold',
                bg=col1, fg=col3)
app_day.place(x=220, y=175)


# defining function


def calc():
    initial = cal_1.get_date()
    final = cal_2.get_date()
    years = relativedelta(initial, final).years
    months = relativedelta(initial, final).months
    days = relativedelta(initial, final).days
    app_1_year['text'] = years
    app_2_month['text'] = months
    app_3_day['text'] = days
    

# Calculate Button
b_age = Button(lower_frame, command=calc, text="Calculate Age", width=20, height=1, bg=col1, fg=col3,
               font="Ivy 10 bold", relief="raised", overrelief='ridge')
b_age.place(x=60, y=225)

window.mainloop()
