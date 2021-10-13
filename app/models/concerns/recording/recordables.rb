module Recording::Recordables 
	extend ActiveSupport::Concern

	included do 
		RECORDABLE_TYPES = %w[ Todo Todolist ]
		
		delegated_type :recordable, types: RECORDABLE_TYPES, dependent: :destroy
		accepts_nested_attributes_for :recordable

		belongs_to :parent, class_name: 'Recording', touch: true, optional: true, inverse_of: :children
		has_many :children, class_name: 'Recording', foreign_key: :parent_id, dependent: :destroy, inverse_of: :parent

		RECORDABLE_TYPES.each do |type|
    	has_many type.tableize.to_sym, through: :children, source: :recordable, source_type: type
    	scope type.tableize.to_sym, -> { where(recordable_type: type) }
  	end
	end
end
