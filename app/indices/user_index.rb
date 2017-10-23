ThinkingSphinx::Index.define :user, with: :active_record do
#field
  indexes user.email, sortable: true

  #attributes
  has id, created_at, updated_at
end