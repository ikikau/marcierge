#!/bin/bash

#  ログインユーザ
#-----------------------------------------------

# devise の認証情報を一元管理

# has_one :admin
# has_one :creator
rails g devise user


#  管理ユーザ
#-----------------------------------------------

# belongs_to :user
rails g admin \
  name:string \
  user_id:integer


#  クリエータ
#-----------------------------------------------

# リリース後、creator 自身がアカウントを作ったら
# アソシエーションで紐付けられるようにする

# belongs_to :user
# has_one :avator, class_name: '::Medium'
# has_many :events
rails g model creator \
  user_id:integer \
  name:string \
  profile:text \ # プロフィールページで表示される紹介文
  avator_id:integer


#  イベント
#-----------------------------------------------

# belongs_to :creator
# has_many :event_dates, dependent: :destroy
rails g model event \
  creator_id:integer \
  title:string \
  content:text \
  status:integer


#  イベントの開催日時
#-----------------------------------------------

# 連続しない複数の期間や日によって時間が異なる場合を考慮し
# has_many - belongs_to アソシエーションにしている

# belongs_to :event
rails g model event_date \
  event_id:integer \
  begin_at:datetime \
  end_at:datetime


#  メディア
#-----------------------------------------------

# 画像等のメディアはこのモデルで一元管理
rails g model medium

# paperclip を使う
rails g paperclip medium asset


#  ニュース
#-----------------------------------------------

rails g model information \
  title:string \
  content:text \
  status:integer


#  特集
#-----------------------------------------------

rails g model feature \
  title:string \
  content:text \
  status:integer


#  タグ
#-----------------------------------------------

rails g acts_as_taggable_on:migration

