# frozen_string_literal: true

crumb :root do
  link 'Home', root_path
end

crumb :scores do
  link 'Scores', scores_path
  parent :root
end

crumb :new_score do
  link 'New', new_score_path
  parent :scores
end

crumb :show_score do |score|
  link score.wakeup_on, score
  parent :scores
end

crumb :edit_score do |score|
  link 'Edit', edit_score_path(score)
  parent :show_score, score
end

crumb :users do
  link 'Users', admin_users_path
  parent :root
end

crumb :new_user do
  link 'New', new_admin_user_path
  parent :users
end

crumb :show_user do |user|
  link user.name, [:admin, user]
  parent :users
end

crumb :edit_user do |user|
  link 'Edit', edit_admin_user_path(user)
  parent :show_user, user
end

crumb :me do
  link 'Me', me_path
  parent :root
end

crumb :edit_me do
  link 'Edit', me_edit_path
  parent :me
end

crumb :token do
  link 'API Token', me_token_path
  parent :edit_me
end
