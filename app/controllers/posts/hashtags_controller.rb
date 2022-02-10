class Posts::HashtagsController < HashtagsController 
    before_action :set_tagable 
   
    def create
        # NOTIFY 
        super
    end
   
    private 
   
    def set_tagable
        @tagable = Post.find(params[:post_id])
    end
end 