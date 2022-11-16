require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:product) { create(:product) }
  describe 'GET #index' do
    let(:products) { create_list(:product, 3) }
    before { get :index }

    it 'populates an array of all products' do 
      expect(assigns(:products)).to match_array(products)
    end

    it 'render index view' do
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do    
    before { get :show, params: { id: product } }

    it 'assign the requested product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'render show view' do
      expect(response).to render_template :show
    end
  end

  describe 'GET #new' do
    before { get :new }

    it 'assign a new product to @product' do
      expect(assigns(:product)).to be_a_new(Product)
    end

    it 'render new view' do
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    let(:product) { create(:product) }
    before { get :edit, params: { id: product } }

    it 'assign the requested product to @product' do
      expect(assigns(:product)).to eq product
    end

    it 'render edit view' do
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid atributes' do
      it 'saves a new product in the database' do
        expect { post :create, params: { product: attributes_for(:product) } }.to change(Product, :count).by(1)
      end
      it 'redirects to show view' do
        post :create, params: { product: attributes_for(:product) }
        expect(response).to redirect_to assigns(:product)
      end
    end

    context 'with invalid atributes' do
      it 'does not save the product' do
        expect { post :create, params: { product: attributes_for(:product, :invalid) } }.to_not change(Product, :count)
      end
      it 're-renders new view' do
        expect { post :create, params: { product: attributes_for(:product, :invalid) } }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH #update' do
    context 'with valid atributes' do
      it 'assign the requested product to @product' do
        patch :update, params: { id: product, product: attributes_for(:product)}
        expect(assigns(:product)).to eq product
      end  
      it 'changes product attributes' do
        patch :update, params: { id: product, product: { name: 'new_name', comment: 'new_comment' } }
        product.reload

        expect(product.name).to eq 'new_name'
        expect(product.comment).to eq 'new_comment'
      end
      it 'redirects to ipdates product' do
        patch :update, params: { id: product, product: attributes_for(:product) }
        expect(response).to redirect_to product
      end
    end

    context 'with invalid atributes' do
      before { patch :update, params: { id: product, product: attributes_for(:product, :invalid) } }
      it 'does not change product' do        
        product.reload

        expect(product.name).to eq 'MyString'
        expect(product.comment).to eq 'MyString'
      end
      
      it 're-renders edit view' do
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the product' do
      expect { delete :destroy, params: { id: product } }.to change(Product, :count).by(-1)
    end

    it 'redirects to index view' do
      post :create, params: { product: attributes_for(:product) }
      expect(response).to redirect_to assigns(:product)
    end
  end


end
