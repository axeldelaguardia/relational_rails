require 'rails_helper'

describe Pet, type: :model do
	it {should belong_to :dog_groomer}

end