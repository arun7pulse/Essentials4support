# -*- coding: utf-8 -*-
"""
Spyder Editor

This is a temporary script file.
"""

def get_event_date(event) :
    return event.date

def current_users(events):
    events.sort(key=get_event_date)
    machines ={}
    for event in events:
        if event.machine not in machines:
            machines[event.machine] = set()
        if event.type == 'login':
            machines[event.machine].add(event.user)
        elif event.type =='logout':
            machines[event.machine].remove(event.user)
    return machines

def generate_report(machines):
    for machine, users in machines.items():
        if len(users) > 0:
            userlist = ",".join(users)
            print("{}:{}".format(machine,userlist))
            