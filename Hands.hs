module Hands
  ( Hand
  -- Handのコンストラクタはエクスポートしない。
  , toHand, fromHand
  ) where

import Cards
import Data.List

-- 型をうまく使えていないバージョン
-- decision :: [Card] -> Maybe [Card]
-- decision l =
--   if length l == 5
--     then Just $ sort l
--     else Nothing

-- Handのコンストラクタをエクスポートしないことで、
-- Handが「カードが5枚であること」や「ソートされていること」を
-- 保証する型となる
newtype Hand = Hand { fromHand :: [Card] } deriving (Show, Eq, Ord)

toHand :: [Card] -> Maybe Hand
toHand l =
  if length l == 5
    then Just $ Hand (sort l)
    else Nothing

-- pokerHand :: Hand -> PokerHand
-- そのハンドを構成する最強のカードも返す
pokerHand :: Hand -> (PokerHand, Card)
pokerHand = undefined

data PokerHand
  = HighCards --ブタ
  | OnePair --ワンペア
  | TwoPair --ツーペア
  | ThreeOfAKind --スリーカード
  | Straight -- ストレート
  | Flush --フラッシュ
  | FullHouse --フルハウス
  | FourOfAKind --フォーカード
  | StraightFlush --ストレートフラッシュ
  deriving (Show, Read, Eq, Ord, Enum)

-- まだpokerHandの実装には入らない。
-- 実装はボトムアップに、小さなところから。

-- 引数がワンペアだったら`Just (OnePair, 最強カード)`という値を、
-- そうでない場合は`Nothing`を返す。
onePair :: Hand -> Maybe (PokerHand, Card)
onePair = undefined

twoPair :: Hand -> Maybe (PokerHand, Card)
twoPair = undefined

threeOfAKind :: Hand -> Maybe (PokerHand, Card)
threeOfAKind = undefined

straight :: Hand -> Maybe (PokerHand, Card)
straight = undefined

flush :: Hand -> Maybe (PokerHand, Card)
flush = undefined

fullHouse :: Hand -> Maybe (PokerHand, Card)
fullHouse = undefined

fourOfAKind :: Hand -> Maybe (PokerHand, Card)
fourOfAKind = undefined

straightFlush :: Hand -> Maybe (PokerHand, Card)
straightFlush = undefined
