from .version import ELECTRUM_VERSION
from .util import format_satoshis, print_msg, print_error, set_verbosity
from .wallet import Wallet
from .storage import WalletStorage
from .coinchooser import COIN_CHOOSERS
from .network import Network, pick_random_server
from .interface import Interface
from .simple_config import SimpleConfig, get_config, set_config
from . import bitcoin
from . import transaction
from . import daemon
from .transaction import Transaction
from .plugin import BasePlugin
from .commands import Commands, known_commands


__version__ = ELECTRUM_VERSION

# This trick allows accessing electrum_nmc from import statements as electrum,
# so we can avoid merge conflicts while also avoiding namespace collisions with
# upstream.
import electrum_nmc
import sys
sys.modules['electrum'] = electrum_nmc
