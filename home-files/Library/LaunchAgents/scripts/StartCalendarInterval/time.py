#!/usr/bin/env python
import datetime
import growlnotify
import mac_agents
import mac_say

NOW = datetime.datetime.now()
H = int(NOW.strftime('%H'))


class Agent(mac_agents.Agent):
    StartCalendarStartInterval = dict(Minute=0)

    @property
    def text(self):
        if H == 0:
            return "полночь"
        if H == 1:
            return "час ночи"
        if H < 6:
            return "%s часа ночи" % (H % 12)
        if H > 5 and H < 12:
            return "%s часов утра" % (H % 12)
        if H == 12:
            return "полдень"
        if H == 13:
            return "час дня"
        if H > 13 and H < 18:
            return "%s часа дня" % (H % 12)
        if H == 17:
            return "%s часов дня"
        if H > 17:
            return "%s часов вечера" % (H % 12)

    def growlnotify(self):
        growlnotify.notify(t=NOW.strftime('%H:%M'), image="time.png")

    def say(self):
        mac_say.say("Сейчас %s" % self.text)

    def run(self):
        self.growlnotify()
        self.say()


if __name__ == "__main__":
    Agent().run()
