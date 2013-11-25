#!/bin/bash


rails g model event \
  name:string \
  creator_id:integer \

rails g model creator \
  name:string \
  profile:text \
  avatar_file_name:string \
  avatar_content_type:string \
  avatar_file_size:integer \
  avatar_updated_at:datetime

rails g model information \
  title:string \
  content:text



