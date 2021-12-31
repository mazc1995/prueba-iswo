json.extract! document, :id, :name, :workflow_state, :code, :date, :category, :document_type_id, :created_at, :updated_at
json.url document_url(document, format: :json)
