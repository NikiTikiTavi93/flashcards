bash 'setup_pg_roles' do
  user 'postgres'
  code <<-EOC
  psql -c "CREATE ROLE #{node['postgresql']['user']['name']} LOGIN PASSWORD \'#{node['postgresql']['user']['password']}\';" postgres || true
  psql -c "ALTER ROLE #{node['postgresql']['user']['name']} WITH CREATEDB;" postgres || true
  EOC
end
