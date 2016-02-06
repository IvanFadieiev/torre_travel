RailsAdmin.config do |config|
  config.authorize_with do
    redirect_to main_app.root_path unless signed_in?
  end
  config.model 'User' do
    visible false
  end
  config.main_app_name = ["Torre-Travel"]
  config.actions do
    dashboard 
    # do
      # i18n_key :ru
    # end                   # mandatory
    index                         # mandatory
    new
    export
    bulk_delete
    show
    edit
    delete
    # show_in_app

    ## With an audit adapter, you can add:
    # history_index
    # history_show
  end
end
