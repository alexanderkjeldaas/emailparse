module Network.Mail.Parse (parseMessage) where

import Network.Mail.Parse.Types
import Network.Mail.Parse.Parsers.Message (messageParser)

import qualified Data.ByteString.Char8 as BSC
import Data.Attoparsec.ByteString
import Control.Monad (join)
import qualified Data.Text as T
import Data.Either.Combinators (mapLeft)

-- |Parses a single message of any mimetype
parseMessage :: BSC.ByteString -> Either ErrorMessage EmailMessage
parseMessage message =
  join . mapLeft T.pack $ parseOnly (messageParser Nothing Nothing) message
