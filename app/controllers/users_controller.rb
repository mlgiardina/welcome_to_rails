class UsersController < ApplicationController

  def index
    all_users = User.all
    string_users = all_users.map do |user|
      "(#{user.id}) #{user.first_name} #{user.last_name}, age: #{user.age}"
    end
    render text: string_users.join(" ")
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

