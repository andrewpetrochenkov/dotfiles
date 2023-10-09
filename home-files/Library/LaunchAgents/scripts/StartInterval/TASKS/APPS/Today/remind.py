#!/usr/bin/env python
import growlnotify
import mac_say
import task_categories
from task.models import Task

# StartInterval: 1200
# Exclude@array: games
# Exclude@array: workout


def gettasks(category):
    return Task.objects.filter(category=category, todo=True).all()


class Agent:
    category = task_categories.APPS.TODAY

    def run(self):
        tasks = gettasks(self.category)
        if not tasks:
            return
        mac_say.say("у вас есть задачи на сегодня", background=True)
        for task in tasks:
            title = "TODO: %s" % task.name
            message = ""
            # image = task.image
            image = None
            growlnotify.notify(t=title, m=message, image=image)


if __name__ == "__main__":
    Agent().run()
