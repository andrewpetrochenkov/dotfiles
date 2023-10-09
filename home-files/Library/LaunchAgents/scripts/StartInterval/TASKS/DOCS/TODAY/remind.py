#!/usr/bin/env python
import growlnotify
import mac_say
import os
import task_categories

# StartInterval: 1200
# Exclude@array: games
# Exclude@array: workout


class Agent:

    @property
    def category(self):
        return task_categories.DOCS.TODAY

    def tasks(self):
        return self.category.tasks.filter(completed_at=None).all()

    def run(self):
        if "accepting" not in os.popen("pg_isready").read():
            return
        tasks = self.tasks()
        if not tasks:
            return
        mac_say.say("у вас есть задачи на сегодня", background=True)
        for task in tasks:
            title = "TODO: %s" % task.name
            f = task.path
            message = open(f).read() if os.path.exists(f) else ""
            growlnotify.notify(t=title, m=message, i=f)


if __name__ == "__main__":
    Agent().run()
