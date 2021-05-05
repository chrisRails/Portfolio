import random
import stats
import locations
import items
import pygame.mixer
import os


def coin(num):
    total = 0
    for x in range(num):
        total += int(random.randint(1, 2))
    return total


def D4(num):
    total = 0
    for x in range(num):
        total += int(random.randint(1, 4))
    return total


def D6(num):
    total = 0
    for x in range(num):
        total += int(random.randint(1, 6))
    return total


def D10(num):
    total = 0
    for x in range(num):
        total += int(random.randint(1, 10))
    return total


def D20(num):
    total = 0
    for x in range(num):
        total += int(random.randint(1, 20))
    return total


def ePicker(rank):
    d6roll = D6(1)
    if rank == 1:
        if d6roll == 1:
            e = stats.Enemy001()
        elif d6roll == 2:
            e = stats.Enemy002()
        elif d6roll == 3:
            e = stats.Enemy003()
        elif d6roll == 4:
            e = stats.Enemy004()
        elif d6roll == 5:
            e = stats.Enemy005()
        elif d6roll == 6:
            e = stats.Enemy006()
    if rank == 2:
        if d6roll == 1:
            e = stats.Enemy012()
        elif d6roll == 2:
            e = stats.Enemy007()
        elif d6roll == 3:
            e = stats.Enemy008()
        elif d6roll == 4:
            e = stats.Enemy009()
        elif d6roll == 5:
            e = stats.Enemy010()
        elif d6roll == 6:
            e = stats.Enemy011()

    return e


class Character:

    def __init__(self):
        # base stats
        self.baseattack = 10
        self.basehealth = 100
        self.basehiding = D6(1) + 3
        self.basespeed = D6(1) + 4
        self.basehealing = D6(1) + 3
        self.basestrength = D6(1) + 4
        self.name = input("What is your Character's name? \n >>>")

        # blank items
        self.blankitem = items.Item()
        self.blankweapon = items.Weapon()
        self.blankarmor = items.Armor()

        # inventory
        self.gold = 10
        self.weapon = self.blankweapon
        self.armor = self.blankarmor
        self.healitem = self.blankitem
        self.stealthitem = self.blankitem
        self.strengthitem = self.blankitem
        self.speeditem = self.blankitem
        self.attackitem = self.blankitem

        # fighting stats
        self.maxhealth = 100 + self.armor.healthmod
        self.health = 100
        self.attack = 10 + self.weapon.attackmod + self.attackitem.attackmod
        self.speed = self.basespeed + self.speeditem.speedmod + self.weapon.speedmod + self.armor.speedmod
        self.hiding = self.basehiding + self.stealthitem.stealthmod + self.weapon.stealthmod + self.armor.stealthmod
        self.healing = self.basehealing + self.healitem.healthmod
        self.strength = self.basestrength + self.strengthitem.strengthmod


    def stats(self):
        print("Here are your character's stats.")
        print(self.name)
        print('Gold: ' + str(self.gold))
        print("Attack: " + str(self.attack))
        print("Health: " + str(self.health))
        print("Stealth: " + str(self.hiding))
        print("Speed: " + str(self.speed))
        print("Healing: " + str(self.healing))
        print("Strength: " + str(self.strength))
        print("Weapon: " + self.weapon.name)
        print("Armor: " + self.armor.name)
        print("Attack item: " + self.attackitem.name)
        print("Stealth item: " + self.stealthitem.name)
        print("Strength item: " + self.strengthitem.name)
        print("Speed item: " + self.speeditem.name)
        print("Healing Item: " + self.healitem.name)


    def redoStats(self):
        self.maxhealth = 100 + self.armor.healthmod
        self.attack = 10 + self.weapon.attackmod + self.attackitem.attackmod
        self.speed = self.basespeed + self.speeditem.speedmod + self.weapon.speedmod + self.armor.speedmod
        self.hiding = self.basehiding + self.stealthitem.stealthmod + self.weapon.stealthmod + self.armor.stealthmod
        self.healing = self.basehealing
        self.strength = self.basestrength + self.strengthitem.strengthmod


def healthStats(e, c):
    print('Enemy Health ' + str(e.health))
    print('Your Health ' + str(c.health))


def dual(c, e):
    print('-' * 40)
    print(e.name)
    print(healthStats(e, c))
    print('[1] Attack')
    print('[2] Heal')
    print('[3] Hide')
    print('[4] Run')
    print('-' * 40)


def attack(attacker, defender):
    atk = attacker.attack + D6(1)
    atkSpeed = attacker.speed
    defHealth = defender.health
    defStealth = defender.hiding
    d2roll = D10(1) + D4(1)
    d2roll2 = D10(1) + D4(1)
    if d2roll <= defStealth:
        atk = atk/2
        print(defender.name + ' ducks')
    if d2roll2 <= atkSpeed:
        atk = atk * 2
        print(attacker.name + ' does a double attack')
    defHealth = defHealth - atk
    defender.health = defHealth
    print(attacker.name + ' does ' + str(atk) + ' to ' + defender.name)


def heal(c):
    healing = c.healing * 3
    c.health += healing
    if c.health > c.maxhealth:
        c.health = 100
    print('You have healed ' + str(healing) + ' hitpoints')


def fightmusic():
    choice = D4(1)
    if choice == 1:
        m = 'Cyborg Ninja.wav'
    elif choice == 2:
        m = 'Darkling.wav'
    elif choice == 3:
        m = 'Mega Hyper Ultrastorm.wav'
    else:
        m = 'Rhinoceros.wav'
    return m


def fight(c, e):
    l = True
    fmusic = fightmusic()
    pygame.mixer.music.stop()
    pygame.mixer.music.load(fmusic)
    pygame.mixer.music.play(loops=100)
    while l:
        dual(c, e)
        action = int(input('>>>'))
        if action == 1:
            attack(c, e)
            attack(e, c)
        elif action == 2:
            heal(c)
            attack(e, c)
        elif action == 3:
            print('You duck behind a barrel for a moment')
            objectbonus = D6(1) + 1
            c.hiding += objectbonus
            attack(c, e)
            attack(e, c)
            c.hiding -= objectbonus
        elif action == 4:
            return 'ran'
        if c.health <= 0:
            print('You died \n Better luck next time')
            return 'end'
        if e.health <= 0:
            print('You win')
            c.gold += D6(5)
            return


def menu(c):
    print('_' * 40)
    print('Your Health: ' + str(c.health) + '   Your Gold: ' + str(c.gold))
    print('[1] Attack')
    print('[2] Heal')
    print('[E] Exit \n')
    choice = input('>>>')
    if int(choice) == 1:
        e = ePicker(1)
        outcome = fight(c, e)
        if str(outcome) == 'end':
            return 'end'
        else:
            return
    elif int(choice) == 2:
        if c.health >= 100:
            print('You are already at the max health')
            return
        if c.gold >= 5:
            if c.health <= 100:
                c.health += D6(4) + c.healing
                if c.health > 100:
                    c.health = 100
            c.gold -= 5
        elif c.gold < 5:
            print('You do not have enough gold')

        return
    elif choice == 'e' or 'E':
        return 'end'


def location_menu(c, l):
    uv = os.system('cls')
    print('-' * 40)
    print(l.name + '    Health:' + str(c.health) + '    Gold:' + str(c.gold))
    print('-' * 40)
    # the grand path pyramid
    if l.path1 == True:
        print('[1] ' + l.path1name)
        if l.path2 == True:
            print('[2] ' + l.path2name)
            if l.path3 == True:
                print('[3] ' + l.path3name)
                if l.path4 == True:
                    print('[4] ' + l.path4name)
                    if l.path5 == True:
                        print('[5] ' + l.path5name)
                    else:
                        print('\n')
                else:
                    print('\n\n')
            else:
                print('\n\n\n')
        else:
            print('\n\n\n\n')
    else:
        print('\n\n\n\n\n')
    print('-' * 40)
    if l.blacksmith:
        print('[B] Blacksmith')
    if l.general_store:
        print('[G] General Store')
    if l.sheriff:
        print('[J] Sheriff')
    if l.doctor:
        print('[D] Doctor')
    if l.saloon:
        print('[S] Saloon')
    if l.stable:
        print('[H] Stable')
    if l.train_station:
        print('[T] Train Station')
    print('-' * 40)
    print('[C] Stats')
    print('[Q] Quit')
    action = input('>>>')
    out = None
    if action == 'J' or action == 'j':
        if l.sheriff:
            sh = l.t_sheriff
            out = sh.sheriff_office(c)
    elif action == 'D' or action == 'd':
        if l.doctor:
            doc = l.doc
            doc.doc_office(c)
            pygame.mixer.music.stop()
            pygame.mixer.music.load(l.music)
            pygame.mixer.music.play(loops=100)
    elif action == 'G' or action == 'g':
        if l.general_store:
            gs = l.genstore
            gs.generalStore(c)
            pygame.mixer.music.stop()
            pygame.mixer.music.load(l.music)
            pygame.mixer.music.play(loops=100)
    elif action == 'T' or action == 't':
        if l.train_station == True:
            l.con = True
            out = l.train()
            if out != None:
                return out
    elif action == 'c' or action == 'C':
        print(c.stats())
    elif action == 'q' or action == 'Q':
        return 'end'
    elif action == '1':
        if l.path1:
            e = ePicker(l.path1lv)
    elif action == '2':
        if l.path2:
            e = ePicker(l.path2lv)
    elif action == '3':
        if l.path3:
            e = ePicker(l.path3lv)
    elif action == '4':
        if l.path4:
            e = ePicker(l.path4lv)
    elif action == '5':
        if l.path5:
            e = ePicker(l.path5lv)
    else:
        print('Invalid input')
    if action == '1' or action == '2' or action == '3' or action == '4' or action == '5':
        try:
            out = fight(c, e)
        except:
            print('Invalid input')
        pygame.mixer.music.stop()
        pygame.mixer.music.load(l.music)
        pygame.mixer.music.play(loops=100)
    if out == 'end':
        return 'end'
    return


'''
"Five Card Shuffle" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
"Gold Rush" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
"Hammock Fight" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
"Zombie Hoodoo" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
"Whiskey on the Mississippi" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
"Bama Country" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
"Porch Blues" Kevin MacLeod (incompetech.com)
Licensed under Creative Commons: By Attribution 3.0 License
http://creativecommons.org/licenses/by/3.0/
'''