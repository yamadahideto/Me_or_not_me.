class HomeController < ApplicationController

  def index
    current_stage = session[:current_stage] = null
  end

  def stage
    current_stage = session[:current_stage] ||= 2
    @stage = current_stage
    @image = banana_image(@stage)
    @choices = get_choices(@stage)
  end

  # バナナの画像を管理
  def banana_image(stage)
    case stage
    when 1 then 'banana.webp'
    when 2 then 'banana_2.webp'
    when 3 then 'banana.webp'
    when 4 then 'banana.webp'
    when 5 then 'banana.webp'
    end
  end

  # 選択肢管理
  def get_choices(stage)
    case stage
      when 1 then ['1', '2', '3', "4"]
      when 2 then ['2', '3', '4', "5"]
      when 3 then ['1', '2', '3', "4"]
      when 4 then ['1', '2', '3', "4"]
      when 5 then ['1', '2', "3", 'ひさじゅやないかい！']
    end
  end

  def answer(stage, user_choice)
    case stage
      when 1 
        correct_answer = 1
        correct_count = session[:correct_count] += 1 if correct_answer == user_choice 
      when 2
        correct_answer = 1
        correct_count = session[:correct_count] += 1 if correct_answer == user_choice 
      when 3
        correct_answer = 1
        correct_count = session[:correct_count] += 1 if correct_answer == user_choice
      when 4
        correct_answer = 1
        correct_count = session[:correct_count] += 1 if correct_answer == user_choice 
      when 5
        correct_answer = "ひさじゅ"
        correct_count = session[:correct_count] += 1 if correct_answer == user_choice 
    end
  end

  private

  # def banana_params
  #   params.require()
  # end
end
