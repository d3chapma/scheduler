require_relative 'factory'
require_relative '../domain/schedule'

describe Schedule do
  context "with 2 positions, 1 day, and 4 volunteers" do
    before(:each) do
      let(:days) {Factory.create(:day)}
      let(:postions) { Collection.new([:worship, :sound])}
      let(:volunteers) { Collection.new }
    end

    it 'should '
  end
end

# | Volunteers  | Worship   | Sound   |
# | M           |    Y      |   Y     |
# | D           |    Y      |         |
# | E           |           |   Y     |

# |             | Worship       | Sound       |
# | day1        | M:Y D:7 E:0   | M:4 D:0 E:Y |
# | day2        | M:4 D:Y E:0   | M:Y D:0 E:4 |
# | day3        | M:Y D:7 E:0   | M:4 D:0 E:Y |
