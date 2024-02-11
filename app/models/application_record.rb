/
Class Application Record
Abstract class inheriting ActiveRecord
Child classes will generate a database table with the name of their class
*/

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
end
