class ForumsController < InheritedResources::Base
  before_action :login_required
  before_action :role_required

  #before_action :set_forum,       only: [ :edit, :update, :destroy ]
  #before_action :owner_required, only: [ :edit, :update, :destroy ]

  private

    def set_forum
      @forum = Forum.find params[:id]
      for_ownership_check(@forum)
    end

    def forum_params
      params.require(:forum).permit(:title, :content)
    end
end
