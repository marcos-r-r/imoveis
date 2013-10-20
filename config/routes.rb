Imovel::Application.routes.draw do
  resources :empresas

  resources :usuarios
  resources :usuario_sessions
  resources :empreendimentos
  resources :pavimentos
  resources :espacos
  resources :clientes
  resources :historico_de_contatos
  resources :vaga_associadas
	resources :simulacaos
	resources :estatisticas


  match 'login' => 'usuario_sessions#new', :as => :login
  match 'logout' => 'usuario_sessions#destroy', :as => :logout
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
     match 'espacos/popula_pavimento_por_empreendimento_criacao' => 'espacos#popula_pavimento_por_empreendimento_criacao'
     match 'espacos/popula_pavimento_por_empreendimento' => 'espacos#popula_pavimento_por_empreendimento'
     match 'empresas/atualiza_empresa' => 'empresas#atualiza_empresa'
     match 'pavimentos/pavimentos_empreendimento' => 'pavimentos#pavimentos_empreendimento'
     match 'pavimentos/outra_session' => 'pavimentos#outra_session'
     match 'espacos/popula_lista_por_pavimento' => 'espacos#popula_lista_por_pavimento'
     match 'vaga_associadas/destroy' => 'vaga_associadas#destroy'
     match '/show' => 'historico_de_contatos#show'
     match '/adiciona_vaga' => 'historico_de_contatos#adiciona_vaga'
	 match '/remove_vaga' => 'historico_de_contatos#remove_vaga'
	 match '/alterar_status' => 'historico_de_contatos#alterar_status'
	 match 'clientes/seleciona_negociacao' => 'clientes#seleciona_negociacao'
	 match '/simulador' => 'historico_de_contatos#simulador'
   match '/export_pedido' => 'historico_de_contatos#export_selected'
	 match '/edit' => 'historico_de_contatos#edit'
	 match 'estatisticas/escolhe_usuario' => 'estatisticas#escolhe_usuario'
	 match 'estatisticas/escolhe_datas' => 'estatisticas#escolhe_datas'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => 'espacos#dashboard'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
