import start
import locations
import time
import pygame.mixer


pygame.mixer.init()
print("Welcome to Christian's Tumbleweed RPG" )
pygame.mixer.music.load('Porch Blues.wav')
pygame.mixer.music.play(loops=100)
char = start.Character()
char.stats()
l = locations.Town()
l.town01()
pygame.mixer.music.stop()
pygame.mixer.music.load(l.music)
pygame.mixer.music.play(loops=100)
game = True
while game:

    out = start.location_menu(char, l)
    if str(out) == 'end':
        pygame.mixer.music.stop()
        break
    elif out != None:
        l = out
        pygame.mixer.music.stop()
        pygame.mixer.music.load(l.music)
        pygame.mixer.music.play(loops=100)
pygame.mixer.music.stop()
pygame.mixer.music.load('Zombie Hoodoo.wav')
pygame.mixer.music.play()
date = time.strftime("%d_%m_%Y_") + time.strftime("%H_%M_%S")
with open('Graveyard\Here_lies_' + char.name.replace(' ', '_') + str(date) + '.txt', 'w') as f:
    f.write('Here lies ' + char.name + '\n')
    f.write('Time of Death ' + date + '\n')
    f.write("Here are your character's stats." + '\n')
    f.write(char.name + '\n')
    f.write('Gold: ' + str(char.gold) + '\n')
    f.write("Attack: " + str(char.attack) + '\n')
    f.write("Health: " + str(char.health) + '\n')
    f.write("Stealth: " + str(char.hiding) + '\n')
    f.write("Speed: " + str(char.speed) + '\n')
    f.write("Healing: " + str(char.healing) + '\n')
    f.write("Strength: " + str(char.strength) + '\n')
    f.write("Weapon: " + char.weapon.name + '\n')
    f.write("Armor: " + char.armor.name + '\n')
    f.write("Attack item: " + char.attackitem.name + '\n')
    f.write("Stealth item: " + char.stealthitem.name + '\n')
    f.write("Strength item: " + char.strengthitem.name + '\n')
    f.write("Speed item: " + char.speeditem.name + '\n')
    f.write("Healing Item: " + char.healitem.name + '\n')
# to keep the window open
input()
