class Project < ApplicationRecord
  validates :title, presence: true, uniqueness: {case_sensitive: false,
                                   message: 'must be unique'}
  def self.calculate_nbr_req(query)
      search(query).count
  end

  def self.search_pag(query, page_off)
      search(query).all.limit(NBR_LINE).offset(page_off)
  end

  def self.search(query)
      Request.where( ["name       LIKE ?","%#{query}%"] ).or(
      Request.where( ["email      LIKE ?","%#{query}%"] ).or(
      Request.where( ["department LIKE ?","%#{query}%"] ).or(
      Request.where( ["message    LIKE ?","%#{query}%"] )
      )))
  end

end
