include_recipe "app_redmine::default"

app = node["app"]["redmine"]

package "imagemagick"
package "libmagickwand-dev"

rack_app app["domain"] do

    target_path        app['target_path']
    action             :deploy
    owner              app['user']
    group              app['group']
    timeout            "600"

    repo_url           app["repo_url"]
    repo_type          app["repo_type"]
    revision           app["revision"]
    purge_target_path  'yes'
    notifies          :restart, 'service[nginx]'

end

template "#{app['target_path']}/config/database.yml" do

    source      'database.yml.erb'
    cookbook    "app_redmine"
    user        app["user"]
    group       app["group"]
    variables   ({
        :app => app,
    })

end
bash 'bundle_install' do

   user 	app['user']
   group       	app["group"]
   cwd  	app['target_path']
   code        'bundle install --path vendor/bundle --binstubs'

end

bash 'generate_secret_token_redmine' do
   user		app['user']
   group       	app["group"]
   cwd 		app['target_path']
   code        'bundle exec rake generate_secret_token'
end

