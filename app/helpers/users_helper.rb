module UsersHelper

  def fu_robots(email)
    email =~ (/(.+)[@]/)
    $1
  end

end
