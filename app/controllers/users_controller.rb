class UsersController < ApplicationController

  def index

    if params.include?("limit") && params.include?("offset")
      limit_and_offset
    elsif params.include?("limit")
      limit
    elsif params.include?("offset")
      offset
    elsif params.include?("first_name")
      first_name
    elsif params.include?("delete")
      delete_user
    else
      print_all_users
    end
  end

  def delete_user
    user_id = User.find(params[:id])
    User.delete(params[:id])
    render text: "User #{user_id.id} has been deleted" , status: 200
  end

  def limit_and_offset
    limit_and_offset = User.all.limit(params[:limit]).offset(params[:offset])
    show = limit_and_offset.map do |user|
      "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
    end
    render text: show.join("---")
  end

  def print_all_users
    all_users = User.all
    string_users = all_users.map do |user|
      "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
      end
    render text: string_users.join("---"), status: 200
  end

  def first_name
    first_names = User.where("first_name LIKE ?", "#{params[:first_name]}%")
    sorter = first_names.map do |user|
      "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
    end
    render text: sorter.join("-------------")
    end

  def offset
    limit = User.all.offset(params[:offset])
    show = limit.map do |user|
      "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
    end
    render text: show.join(" ")
  end

  def limit
    limits = User.all.limit(params[:limit])
    show = limits.map do |user|
      "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
    end
    render text: show.join(" ")
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

