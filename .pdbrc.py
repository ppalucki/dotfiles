# https://pypi.org/project/pdbpp/#description

# To customize pdb++, you can put a file named .pdbrc.py in your home directory. The file must contain a class named Config inheriting from pdb.DefaultConfig and override the desired values.
# The following is a list of the options you can customize, together with their default value:

import pdb
class Config(pdb.DefaultConfig):
    sticky_by_default = True
