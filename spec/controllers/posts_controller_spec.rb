# spec/controllers/posts_controller_spec.rb
require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @posts' do
      post = FactoryBot.create(:post)
      get :index
      expect(assigns(:posts)).to eq([post])
    end
  end

end

# spec/controllers/posts_controller_spec.rb
# ... (require 'rails_helper' at the top)

RSpec.describe PostsController, type: :controller do
    # ... (other describe blocks)
  
    describe 'GET #show' do
      it 'renders the show template' do
        post = FactoryBot.create(:post)
        get :show, params: { id: post.id }
        expect(response).to render_template(:show)
      end
  
      it 'assigns @post' do
        post = FactoryBot.create(:post)
        get :show, params: { id: post.id }
        expect(assigns(:post)).to eq(post)
      end
    end
  
    # Other test cases...
  end

  # spec/controllers/posts_controller_spec.rb
# ... (require 'rails_helper' at the top)

RSpec.describe PostsController, type: :controller do
    # ... (other describe blocks)
  
    describe 'GET #new' do
      it 'renders the new template' do
        get :new
        expect(response).to render_template(:new)
      end
  
      it 'assigns a new post' do
        get :new
        expect(assigns(:post)).to be_a_new(Post)
      end
    end
  
    describe 'POST #create' do
      context 'with valid parameters' do
        it 'creates a new post' do
          post_params = FactoryBot.attributes_for(:post)
          expect { post :create, params: { post: post_params } }.to change(Post, :count).by(1)
        end
  
        it 'redirects to the created post' do
          post_params = FactoryBot.attributes_for(:post)
          post :create, params: { post: post_params }
          expect(response).to redirect_to(Post.last)
        end
      end
  
      context 'with invalid parameters' do
        it 'does not create a new post' do
          expect { post :create, params: { post: { name: nil } } }.to_not change(Post, :count)
        end
  
        it 're-renders the new template' do
          post :create, params: { post: { name: nil } }
          expect(response).to render_template(:new)
        end
      end
    end
  
    # Other test cases...
  end

  
  # spec/controllers/posts_controller_spec.rb
# ... (require 'rails_helper' at the top)

RSpec.describe PostsController, type: :controller do
    # ... (other describe blocks)
  
    describe 'GET #edit' do
      it 'renders the edit template' do
        post = FactoryBot.create(:post)
        get :edit, params: { id: post.id }
        expect(response).to render_template(:edit)
      end
  
      it 'assigns the requested post' do
        post = FactoryBot.create(:post)
        get :edit, params: { id: post.id }
        expect(assigns(:post)).to eq(post)
      end
    end
  
    describe 'PATCH #update' do
      let(:post) { FactoryBot.create(:post) }
  
      context 'with valid parameters' do
        it 'updates the post' do
          patch :update, params: { id: post.id, post: { name: 'New Name' } }
          post.reload
          expect(post.name).to eq('New Name')
        end
  
        it 'redirects to the updated post' do
          patch :update, params: { id: post.id, post: { name: 'New Name' } }
          expect(response).to redirect_to(post)
        end
      end
  
      context 'with invalid parameters' do
        it 'does not update the post' do
          original_name = post.name
          patch :update, params: { id: post.id, post: { name: nil } }
          post.reload
          expect(post.name).to eq(original_name)
        end
  
        it 're-renders the edit template' do
          patch :update, params: { id: post.id, post: { name: nil } }
          expect(response).to render_template(:edit)
        end
      end
    end
  
    # Other test cases...
  end

  
  # spec/controllers/posts_controller_spec.rb
# ... (require 'rails_helper' at the top)

RSpec.describe PostsController, type: :controller do
    # ... (other describe blocks)
  
    describe 'DELETE #destroy' do
      let!(:post) { FactoryBot.create(:post) }
  
      it 'destroys the post' do
        expect { delete :destroy, params: { id: post.id } }.to change(Post, :count).by(-1)
      end
  
      it 'redirects to the posts list' do
        delete :destroy, params: { id: post.id }
        expect(response).to redirect_to(posts_url)
      end
    end
  
    # Other test cases...
  end
  