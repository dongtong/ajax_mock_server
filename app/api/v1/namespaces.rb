#encoding: utf-8
require 'rack/contrib'
require 'uri'
module V1
	class Namespaces < Grape::API
    use Rack::JSONP
    format :json

		resources :namespaces do
			desc "获取所有命名空间"
			get '/' do
				mock_url = URI.unescape(params['mockUrl'])
				mock_host = mock_url.split('?')[0]
				begin
					status 200
					result = nil
					ns = Namespace.where("url_address like ?", "%#{mock_host}%").first
					puts "-------ns-----#{ns.inspect}"
					if ns.nil?
						{code: "0000", message: "请求地址不存在"}
					else
						state_code = StateCode.where("namespace_id=? and actived = ?", ns.id.to_s, true)
						if state_code.empty?
							{code: "0000", message: "请求URL状态不存在"}
						else
							JSON.parse(state_code.first.code_res_json)
						end
					end
				rescue => ex
					puts "--------#{ex.inspect}"
					status 500
					error!({code: "1000", message: "系统异常!"})
				end
			end

			desc "获取所有待办事项[带有分页]"
			get '/page/:page' do
				begin
					namespaces = Todo.paginate(per_page: 20, page: params[:page]).map do |namespace|
						{
							id: namespace.id,
							content: namespace.content
						}
					end
					status 200
					{data: namespaces, totalPage: (Todo.count / 20.0).ceil}
				rescue => ex
					puts "--------#{ex.inspect}"
					status 500
					error!({code: "1000", message: "系统异常!"})
				end
			end

			desc "创建待办事项"
			post '/' do
				namespace = Todo.new(content: params[:content])
				if namespace.save
					{success: true}
				else
					status 500
					{success: false}
				end
			end

			desc "更新待办事项"
			patch '/:id' do
				namespace = Todo.find(params[:id])
				if namespace.update_attributes({content: params[:content]})
					{success: true, id: namespace.id, content: namespace.content}
				else
					status 500
					{success: false}
				end
			end

			desc "删除待办事项"
			delete '/:id' do
				namespace = Todo.find(params[:id])
				if namespace.destroy
					{success: true}
				else
					status 500
					{success: false}
				end
			end

      desc "JSONP GET"
      get '/:id/update' do
        namespace = Todo.find(params[:id])
				if namespace.update_attributes({content: params[:content]})
					{success: true, id: namespace.id, content: namespace.content}
				else
					status 500
					{success: false}
				end
      end

      desc "JSONP DELETE"
      get '/:id/delete' do
        namespace = Todo.find(params[:id])
				if namespace.destroy
					{success: true}
				else
					status 500
					{success: false}
				end
      end

      desc "JSONP POST"
      get '/add' do
        namespace = Todo.new(content: params[:content])
				if namespace.save
					{success: true, id: namespace.id, content: namespace.content}
				else
					status 500
					{success: false}
				end
      end

		end

	end
end
