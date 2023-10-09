#!/usr/bin/env python
# -*- coding: utf-8 -*-
import growlnotify
import hwmonitor
import mac_say

# Disabled: True
# StartInterval: 120

"""
https://www.rabota.ru/soiskateljam/rights/temperatura_v_ofise.html
По закону при восьмичасовом рабочем дне
температура воздуха в офисном помещении должна составлять
23—25°С в теплое время года и 22—24°С в холодное
--------
ГОСТ Р 51617-2000. Жилищно-коммунальные услуги. Общие технические условия». Этот стандарт устанавливает допустимые значения температуры для жилых помещений в диапазоне плюс 18-25 градусов Цельсия в зависимости от вида комнаты
--------
p.s.: температура может прыгать +/- 1 градус
"""

MIN = 18
MAX = 26
SENSOR_DEVIATION = 0  # отклонение сенсора


class Agent:

    def get(self):
        return hwmonitor.sensor("air") + SENSOR_DEVIATION

    @property
    def image(self):
        if self.t < MIN:
            return "temperature-low.png"
        if self.t > MAX:
            return "temperature-high.png"

    def run(self):
        if not self.Disabled:
            self.t = hwmonitor.sensor("air") + SENSOR_DEVIATION
            if MIN <= self.t <= MAX:  # ok
                return
            self.growlnotify()
            self.say()

    def growlnotify(self):
        t = "Температура %s °" % self.t
        m = "Норма 18-25"
        growlnotify.notify(t=t, m=m, image=self.image)

    def say(self):
        say = "Температура в квартире - %s градусов" % self.t
        mac_say.say(say)


if __name__ == "__main__":
    Agent().run()
