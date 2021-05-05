import start


class Enemy001:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1)
        self.healing = start.D6(1) + 1
        self.speed = start.D6(1) + 1
        self.strength = start.D6(1) + 2
        self.name = 'Willie the kid'


class Enemy002:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1) - 2
        self.healing = start.D6(1) + 1
        self.speed = start.D6(1) + 2
        self.strength = start.D6(1) + 2
        self.name = 'Sysco Darline'


class Enemy003:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1) + 2
        self.healing = start.D6(1) + 1
        self.speed = start.D6(1) - 2
        self.strength = start.D6(1) + 2
        self.name = 'Rosco Darline'


class Enemy004:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1)
        self.healing = start.D6(1) + 2
        self.speed = start.D6(1) + 2
        self.strength = start.D6(1) + 1
        self.name = 'Snake Eyes Clark'
        # name by Jenifer Ulrich


class Enemy005:

    def __init__(self):
        self.attack = 10
        self.health = 50
        self.hiding = start.D6(1) + 4
        self.healing = start.D6(1) + 1
        self.speed = start.D6(1) + 3
        self.strength = start.D6(1) - 1
        self.name = 'Rattlesnake'


class Enemy006:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1)
        self.healing = start.D6(1) + 1
        self.speed = start.D6(1) + 1
        self.strength = start.D6(1) + 1
        self.name = 'Sleazy Pete'


class Enemy007:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1) - 3
        self.healing = start.D6(1) + 1
        self.speed = start.D6(1) + 4
        self.strength = start.D6(1) + 4
        self.name = 'Charging Bull'


class Enemy008:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1) + 2
        self.healing = start.D6(1) + 1
        self.speed = start.D6(1) + 3
        self.strength = start.D6(1) + 2
        self.name = 'Wild Coyote'


class Enemy009:

    def __init__(self):
        self.attack = 10
        self.health = 100
        self.hiding = start.D6(1) + 4
        self.healing = start.D6(1) + 2
        self.speed = start.D6(1) - 1
        self.strength = start.D6(1)
        self.name = 'Iris Darline'


class Enemy010:

    def __init__(self):
        self.attack = 15
        self.health = 130
        self.hiding = start.D6(1) - 2
        self.healing = start.D6(1) + 2
        self.speed = start.D6(1) + 4
        self.strength = start.D6(1) + 4
        self.name = 'Seymour Darline'


class Enemy011:

    def __init__(self):
        self.attack = 15
        self.health = 100
        self.hiding = start.D6(1) + 2
        self.healing = start.D6(1) + 2
        self.speed = start.D6(1) + 3
        self.strength = start.D6(1) + 2
        self.name = 'Eli Van Vleck'


class Enemy012:

    def __init__(self):
        self.attack = 20
        self.health = 150
        self.hiding = start.D6(1) -1
        self.healing = start.D6(1) -1
        self.speed = start.D6(1) -1
        self.strength = start.D6(1) -1
        self.name = 'Neil McMaster'


# Assorted names from
# http://www.mithrilandmages.com/utilities/Western.php