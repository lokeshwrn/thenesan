module HomeHelper

  def page_properties_for(page)
    mapping={
        :index_page => {
            :carousel => true,
            :page_title => "Nesans Mining and Automation Pvt Ltd | Stone Crusher Plant, Crusher Machine, Vibrating Screen, Vibratory Feeder, Sand Making Machine",
            :page_name => "home",
        },
        :spares=>{
            :banner_img => "/image/1.jpg",
            :banner_content => "Excellence in Aggregate Equipment Design"
        },
        :showroom=>{
            :banner_img => "/image/1.jpg",
            :banner_content => "Excellence in Aggregate Equipment Design"
        },
        :about_us=>{
            :banner_img => "/image/5.jpg",
            :banner_content => "To Express To Engineer and To Execute"
        },
        :contact_us=>{
            :banner_img => "/image/3.jpg",
            :banner_content => "Get in Touch to get the ball Rolling",
            :disable => true,
            :page_name => "contact-us"
        },
        :products_listing=>{
            :banner_img => "/image/1.jpg",
            :banner_content => "Excellence in Aggregate Equipment Design"
        },
        :products=>{
            :banner_img => "/image/4.jpg"
        },
        :get_access_code=>{
            :header=> "Enter Access Code"
        }
    }

    mapping[page.to_sym]
  end
end
