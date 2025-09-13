class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # ActiveHash 用の拡張を追加
  extend ActiveHash::Associations::ActiveRecordExtensions
end
