class UsersController < ApplicationController

  def index
    if params.include?("limit") && params.include?("offset")
      limit_and_offset = User.all.limit(params[:limit]).offset(params[:offset])
      show = limit_and_offset.map do |user|
        "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
      end
      render text: show.join("---")

    elsif params.include?("limit")
      limit = User.all.limit(params[:limit])
      show = limit.map do |user|
        "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
      end
      render text: show.join(" ")

    elsif params.include?("offset")
      limit = User.all.offset(params[:offset])
      show = limit.map do |user|
        "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
      end
      render text: show.join(" ")

    elsif params.include?("first_name")
      first_names = User.where("first_name LIKE ?", "#{params[:first_name]}%")
      sorter = first_names.map do |user|
        "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
      end
      render text: sorter.join("-------------")
    else
      all_users = User.all
      string_users = all_users.map do |user|
        "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
      end
      render text: string_users.join("---"), status: 200
    end
  end


  def show
    if User.exists?(params[:id])
      user = User.find(params[:id])
      render text: "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
    else
      render text: "User Not Found", status: 404
    end
  end
end

