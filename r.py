from ruamel import yaml

yaml2 = yaml.YAML(typ='unsafe')

def yamlobj(cls):
    def constructor(loader, node):
        instance = cls.__new__(cls)
        yield instance
        state = loader.construct_mapping(node, deep=True)
        try:
            instance.__init__(**state)
        except TypeError as e:
            raise TypeError('cannot instiantie %r with %r'%(cls.__name__, state)) from e
    yaml2.register_class(cls)
    yaml.add_constructor('!%s'%cls.__name__, constructor)
    return cls

class OldClass:
    def __init__(self, z, y=3):
        self.z = z
        self.y = y

@yamlobj
class NewClass(OldClass):
    pass

@yamlobj
class Foo:
    def __init__(self, s:str, l:int=1) -> None:
        self.s = s
        self.l = l
        return

@yamlobj
class Boo:
    def __init__(self, foo: Foo=None, items=None, nc: NewClass=None) -> None:
        self.foo = foo
        self.items = items

@yamlobj
class Item:
    def __init__(self, name):
        self.name = name

b = yaml.load(open('x.yaml'), Loader=yaml.Loader)
#nc = NewClass(z=5,y=7)


if __name__ == '__main__':
    foo = Foo('xs')
    nc = NewClass(5)
    boo = Boo(nc)
