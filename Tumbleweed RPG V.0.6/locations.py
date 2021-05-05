import start
import items
import pygame.mixer
import time

class Town:

    def __init__(self):
        self.name = ''
        self.blacksmith = False
        self.general_store = False
        self.train_station = False
        self.saloon = False
        self.sheriff = False
        self.doctor = False
        self.stable = False
        self.path1 = False
        self.path1name = ''
        self.path1lv = 1
        self.path2 = False
        self.path2name = ''
        self.path2lv = 1
        self.path3 = False
        self.path3_name = ''
        self.path3lv = 1
        self.path4 = False
        self.path4name = ''
        self.path4lv = 1
        self.path5 = False
        self.path5name = ''
        self.path5lv = 1
        self.con = False
        self.music = ''


    def town01(self):
        self.name = 'Silver Canyon Springs'
        self.blacksmith = False
        self.general_store = True
        self.genstore = General_Store()
        self.genstore.store01()
        self.sheriff = True
        self.t_sheriff = Sheriff()
        self.t_sheriff.sheriff01(self)
        self.doctor = True
        self.doc = Doctor()
        self.doc.doc01()
        self.train_station = True
        self.path1name = 'Silver Canyon [Lv: 1]'
        self.path1 = True
        self.path2name = "Gulliver's Gulch [Lv: 2]"
        self.path2 = True
        self.path2lv = 2
        self.music = 'Bama Country.wav'


    def town02(self):
        self.name = 'Millwater Ford'
        self.blacksmith = False
        self.general_store = True
        self.genstore = General_Store()
        self.genstore.store02()
        self.sheriff = True
        self.t_sheriff = Sheriff()
        self.t_sheriff.sheriff02(self)
        self.doctor = True
        self.doc = Doctor()
        self.doc.doc02()
        self.train_station = True
        self.path1name = 'The Ford [Lv: 1]'
        self.path1 = True
        self.path2name = "Crawdad Gully [Lv: 2]"
        self.path2 = True
        self.path2lv = 2
        self.music = 'Whiskey on the Mississippi.wav'


    def train(self):
        out = None
        self.trasta = TrainStation()
        if self.name == 'Silver Canyon Springs':
            out = self.trasta.Train01(self.con)
        elif self.name == 'Millwater Ford':
            out = self.trasta.Train02(self.con)
        return out


class Sheriff:

    def __init__(self):
        self.sheriff_name = ''
        self.town_name = ''
        self.bounty1 = ''
        self.bounty2 = ''
        self.bounty3 = ''
        self.bounty4 = ''
        self.bounty5 = ''


    def sheriff01(self, t):
        self.sheriff_name = 'Sheriff Smith'
        self.town_name = t
        self.bounty1 = start.ePicker(1)
        self.bounty2 = start.ePicker(1)
        self.bounty3 = start.ePicker(1)
        self.bounty4 = start.ePicker(1)
        self.bounty5 = start.ePicker(1)


    def sheriff02(self, t):
        self.sheriff_name = 'Sheriff Roggers'
        self.town_name = t
        self.bounty1 = start.ePicker(1)
        self.bounty2 = start.ePicker(1)
        self.bounty3 = start.ePicker(2)
        self.bounty4 = start.ePicker(2)
        self.bounty5 = start.ePicker(2)


    def sheriff_office(self, c):
        x = True
        pygame.mixer.music.stop()
        pygame.mixer.music.load('Porch Blues.wav')
        pygame.mixer.music.play(loops=100)
        while x:
            print('-' * 40)
            print(self.sheriff_name + '    Health:' + str(c.health) + '    Gold:' + str(c.gold))
            print('-' * 40)
            print('[1] ' + self.bounty1.name)
            print('[2] ' + self.bounty2.name)
            print('[3] ' + self.bounty3.name)
            print('[4] ' + self.bounty4.name)
            print('[5] ' + self.bounty5.name)
            print('-' * 40)
            print('[R] Return')
            action = input('>>>')
            out = None
            if action == '1':
                e = self.bounty1
                out = start.fight(c, e)
                self.bounty1 = start.ePicker(start.coin(1))
            elif action == '2':
                e = self.bounty2
                out = start.fight(c, e)
                self.bounty2 = start.ePicker(start.coin(1))
            elif action == '3':
                e = self.bounty3
                out = start.fight(c, e)
                self.bounty3 = start.ePicker(start.coin(1))
            elif action == '4':
                e = self.bounty4
                out = start.fight(c, e)
                self.bounty4 = start.ePicker(start.coin(1))
            elif action == '5':
                e = self.bounty5
                out = start.fight(c, e)
                self.bounty5 = start.ePicker(start.coin(1))
            elif action == 'r' or 'R':
                return
            if out == None:
                c.gold += int(action) * 15
                pygame.mixer.music.stop()
                pygame.mixer.music.load(self.town_name.music)
                pygame.mixer.music.play(loops=100)
            elif out == 'end':
                return 'end'


class Doctor:

    def __init__(self):
        self.docname = ''
        self.price = 5
        self.healing = 10 + start.D6(3)


    def doc01(self):
        self.docname = 'Doc Mccoy'


    def doc02(self):
        self.docname = 'Doctor Guthridge'


    def doc_office(self, c):
        x = True
        pygame.mixer.music.stop()
        pygame.mixer.music.load('Five Card Shuffle.wav')
        pygame.mixer.music.play(loops=100)
        while x:
            print('-' * 40)
            print(self.docname + '    Health:' + str(c.health) + '    Gold:' + str(c.gold))
            print('-' * 40)
            print('[1] Basic healing: ' + str(self.price) + 'G')
            print('[2] Advanced healing: ' + str(2 * self.price) +'G')
            print('-' * 40)
            print('[R] Return')
            action = input('>>>')
            if action == '1':
                if c.health == c.maxhealth:
                    print("You are already in great shape you don't need to be healed")
                elif c.gold <= 5:
                    print('Not enough gold')
                else:
                    heal = self.healing
                    c.health += heal
                    c.gold -= self.price
                    print(self.docname + ' has healed ' + str(heal) + ' hitpoints')
                    if c.health > c.maxhealth:
                        c.health = c.maxhealth
            elif action == '2':
                if c.health == c.maxhealth:
                    print("You are already in great shape you don't need to be healed")
                elif c.gold <= 10:
                    print('Not enough gold')
                else:
                    heal = self.healing + self.healing
                    c.health += heal
                    c.gold -= self.price * 2
                    print(self.docname + ' has healed ' + str(heal) + ' hitpoints')
                    if c.health > c.maxhealth:
                        c.health = c.maxhealth
            elif action == 'r' or 'R':
                return
            else:
                print('Invalid input')


class General_Store:

    def __init__(self):
        self.name = ''
        self.item1 = ''
        self.item2 = ''
        self.item3 = ''
        self.item4 = ''
        self.markup = 0

    def store01(self):
        self.name = 'Papies General Store'
        self.g1 = items.Weapon()
        self.g1.gun_1()
        self.item1 = self.g1
        self.a2 = items.Armor()
        self.a2.armor01()
        self.item2 = self.a2
        self.i1 = items.Item()
        self.i1.Firstaid()
        self.item3 = self.i1
        self.i2 = items.Item()
        self.i2.Bullets01()
        self.item4 = self.i2

    def store02(self):
        self.name = 'The General Store of the Millwater'
        self.a1 = items.Armor()
        self.a1.armor02()
        self.item1 = self.a1
        self.g2 = items.Weapon()
        self.g2.gun_2()
        self.item2 = self.g2
        self.i2 = items.Item()
        self.i2.Camofloge()
        self.item3 = self.i2
        self.i3 = items.Item()
        self.i3.speedboost01()
        self.item4 = self.i3

    def generalStore(self, c):
        pygame.mixer.music.stop()
        pygame.mixer.music.load('Gold Rush.wav')
        pygame.mixer.music.play(loops=100)
        x = True
        while x:
            print('-' * 40)
            print(self.name + '    Health:' + str(c.health) + '    Gold:' + str(c.gold))
            print('-' * 40)
            print('[1] ' + self.item1.name + str(self.item1.price) + 'G')
            print('[2] ' + self.item2.name + str(self.item2.price) + 'G')
            print('[3] ' + self.item3.name + str(self.item3.price) + 'G')
            print('[4] ' + self.item4.name + str(self.item4.price) + 'G')
            print('-' * 40)
            print('R Return')
            action = input('>>>')
            if action == '1':
                if c.gold >= self.item1.price:
                    c.gold -= self.item1.price
                    self.item1.inventory(c)
                    c.redoStats()
                else:
                    print('You do not have enough gold for this item')
            elif action == '2':
                if c.gold >= self.item2.price:
                    c.gold -= self.item2.price
                    self.item2.inventory(c)
                    c.redoStats()
                else:
                    print('You do not have enough gold for this item')
            elif action == '3':
                if c.gold >= self.item3.price:
                    c.gold -= self.item3.price
                    self.item3.inventory(c)
                    c.redoStats()
                else:
                    print('You do not have enough gold for this item')
            elif action == '4':
                if c.gold >= self.item4.price:
                    c.gold -= self.item4.price
                    self.item4.inventory(c)
                    c.redoStats()
                else:
                    print('You do not have enough gold for this item')
            elif action == 'r' or action == 'R':
                return
            else:
                print('Invalid Imput')


class TrainStation:

    def __init__(self):
        self.name = ''
        self.stop1 = ''


    def Station01(self):
        self.name = 'Canyon Station'
        print('-' * 40)
        print(self.name)
        print('-' * 40)
        print('[1] ' + 'Millwater Ford')
        print('[R] Return')
        action = input('>>>')
        if action == '1':
            pygame.mixer.music.stop()
            self.stop1 = Town()
            self.stop1.town02()
            return self.stop1


    def Station02(self):
        self.name = 'Ford Stop'
        print('-' * 40)
        print(self.name)
        print('-' * 40)
        print('[1] ' + 'Silver Canyon Springs')
        print('[R] Return')
        action = input('>>>')
        if action == '1':
            pygame.mixer.music.stop()
            self.stop1 = Town()
            self.stop1.town01()
            return self.stop1


    def Train01(self, confirm):
        if confirm:
            out = self.Station01()
            self.con = False
            return out


    def Train02(self, confirm):
        if confirm:
            out = self.Station02()
            self.con = False
            return out

# sound effects from Sid Meier's Railroads
