#!/usr/bin/env python
import os
import task_categories

# StartInterval: 60


class Agent:
    @property
    def category(self):
        return task_categories.DOCS.TODAY

    def delete(self):
        self.category.tasks.all().delete()

    def save(self):
        for f in self.category.getclass()().files():
            name = f.split("/")[-1].replace(".txt", "")
            self.category.add(name=name, path=f)

    def run(self):
        if "accepting" not in os.popen("pg_isready").read():
            return
        self.delete()
        self.save()


if __name__ == "__main__":
    Agent().run()
