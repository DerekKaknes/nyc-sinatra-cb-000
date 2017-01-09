class FiguresController < ApplicationController
  get '/figures' do
    @figures = Figure.all
    erb :'figures/index'
  end

  get '/figures/new' do
    @figure = Figure.new
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  post '/figures' do
    binding.pry
    figure = Figure.create(params[:figure])
    params[:figure][:title_ids].each do |tid|
      figure.titles << Title.find(tid)
    end
    if !params[:title].empty?
      figure.titles << Title.create(params[:title])
    end
    if !params[:landmark].empty?
      figure.landmarks << landmark.create(params[:landmark])
    end
  end
end
