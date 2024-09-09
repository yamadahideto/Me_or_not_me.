class HomeController < ApplicationController
  def index
    session[:correct_count] = 0
    session[:current_stage] = 1
  end

  # ステージでの各ステータス設定
  def stage
    @stage = session[:current_stage]
    @duration = get_duration(@stage)
    @image = banana_image(@stage)
    @choices = get_choices(@stage)
  end

  # バナナの画像を管理
  def banana_image(stage)
    case stage
    when 1 then 'yellow_boy2.png'
    when 2 then 'yellow_boy3.png'
    when 3 then 'yellow_boy1.png'
    when 4 then 'yellow_boy3.png'
    when 5 then 'yellow_boy5.png'
    end
  end

  # 選択肢管理
  def get_choices(stage)
    case stage
      when 1 then ['俺', '俺以外']
      when 2 then ['俺', '俺以外']
      when 3 then ['俺', '俺以外']
      when 4 then ['俺', '俺以外']
      when 5 then ['俺', 'ひさじゅやないかい！']
    end
  end

  # 回答の正誤判定
  def answer
    case session[:current_stage]
      when 1 
        correct_answer = "俺以外"
        session[:correct_count] += 1 if correct_answer == params[:user_choice] 
      when 2
        correct_answer = "俺以外"
        session[:correct_count] += 1 if correct_answer == params[:user_choice] 
      when 3
        correct_answer = "俺"
        session[:correct_count] += 1 if correct_answer == params[:user_choice]
      when 4
        correct_answer = "俺以外"
        session[:correct_count] += 1 if correct_answer == params[:user_choice] 
      when 5
        correct_answer = "ひさじゅやないかい！"
        session[:correct_count] += 1 if correct_answer == params[:user_choice] 
    end
    if session[:current_stage] == 5
      redirect_to result_path
    else
      session[:current_stage] += 1
      redirect_to stage_path
    end
  end

  def get_duration(stage)
    case stage
      when 1 then 500
      when 2 then 400
      when 3 then 200
      when 4 then 100
      when 5 then 600
    end
  end

  def result
    if session[:correct_count] == 5
      @message = 'オーラの消し方ググっても出てこないんだけど誰か知ってる人いる？'
    elsif session[:correct_count] >= 3
      @message = 'あのねぇ、俺が酒弱いんじゃなくて酒が強過ぎるの俺は弱くないの俺も強いけど酒はもっと強いの'
    else
      @message = '俺来た道戻らないから、覚える必要ない。自分の来た道突き進むだけだから'
    end
    @result = session[:correct_count]
  end
end
