ThinkingSphinx::Index.define :comment, with: :active_record do
#field
  indexes body
  indexes user.email, as: :author, sortable: true

  #attributes
  has created_at, updated_at
end