
node 'web1', 'web2' {
   #class { 'web': }
   include 'node_exporter::install'
   include 'web::nginx'   
}
   
node 'loadbalancer' {
   #class { 'haproxy': }
   include 'haproxy::install'  
   include 'prometheus::install' 
   include 'alertmanager::install'    
  }
  
  
