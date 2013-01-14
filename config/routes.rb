TestTask::Application.routes.draw do
  resources :courses

  resources :students do
    member do
      post 'assign_grade'
      post 'assign_course'
    end
  end

  get 'transcript' => 'courses#transcript'

  root to: 'courses#index'
end
