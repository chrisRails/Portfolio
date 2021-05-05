import start


class Armor:

    def __init__(self):
        self.name = ''
        self.healthmod = 0
        self.speedmod = 0
        self.stealthmod = 0
        self.price = 0


    def armor01(self):
        self.name = 'Leather Armor '
        self.healthmod = 30
        self.speedmod = -1
        self.stealthmod = 2
        self.price = 30


    def armor02(self):
        self.name = 'Iron Plating '
        self.healthmod = 50
        self.stealthmod = 4
        self.speedmod = -3
        self.price = 50


class Weapon:

    def __init__(self):
        self.name = ''
        self.speedmod = 0
        self.stealthmod = 0
        self.attackmod = 0
        self.price = 0


    def gun_1(self):
        self.name = 'Revolver 1  '
        self.speedmod = 2
        self.attackmod = 5
        self.price = 25


    def gun_2(self):
        self.name = 'Rifle 1  '
        self.speedmod = -4
        self.attackmod = 10
        self.stealthmod = -2
        self.price = 35


    def sell_item(self, c):
        price = c.weapon.price
        c.gold += int(price / 2)
        c.thing = self


    def inventory(self, c):
        if c.weapon == c.blankweapon:
            c.weapon = self
        else:
            self.sell_item(c)


class Item:

    def __init__(self):
        self.name = ''
        self.type = ''
        self.healthmod = 0
        self.stealthmod = 0
        self.attackmod = 0
        self.strengthmod = 0
        self.speedmod = 0
        self.price = 0


    def Bullets01(self):
        self.name = 'Bullets +1 '
        self.type = 'attackitem'
        self.attackmod = 4
        self.price = 20


    def Bullets02(self):
        self.name = 'Bullets +2 '
        self.type = 'attackitem'
        self.attackmod = 8
        self.price = 35


    def Firstaid(self):
        self.name = 'Medical Kit '
        self.type = 'healthitem'
        self.healthmod = 5
        self.price = 20


    def Camofloge(self):
        self.name = 'Camofloge '
        self.type = 'stealthitem'
        self.stealthmod = 3
        self.price = 20


    def speedboost01(self):
        self.name = 'Gun Oil '
        self.type = 'speeditem'
        self.speedmod = 3
        self.price = 20


    def sell_item(self, c, item):
        price = item.price
        c.gold += int(price / 2)
        c.thing = self


    def inventory(self, c):
        if self.type == 'healthitem':
            if c.healitem == c.blankitem:
                c.healitem = self
            else:
                self.sell_item(c, c.healitem)
        elif self.type == 'stealthitem':
            if c.stealthitem == c.blankitem:
                c.stealthitem = self
            else:
                self.sell_item(c, c.stealthitem)
        elif self.type == 'strengthitem':
            if c.strengthitem == c.blankitem:
                c.strengthitem = self
            else:
                self.sell_item(c, c.strengthitem)
        elif self.type == 'attackitem':
            if c.attackitem == c.blankitem:
                c.attackitem = self
            else:
                self.sell_item(c, c.attackitem)
        elif self.type == 'speeditem':
            if c.speeditem == c.blankitem:
                c.speeditem = self
            else:
                self.sell_item(c, c.speeditem)
