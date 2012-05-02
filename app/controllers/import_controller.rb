class ImportController < ApplicationController

  def faces
    import_faces
    redirect_to members_path    
  end

  def connections
    import_connections
    redirect_to members_path    
  end

  def posts
    import_posts
    redirect_to members_path    
  end
  
end