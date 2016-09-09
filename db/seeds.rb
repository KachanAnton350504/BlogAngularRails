# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do |i|
  rubric = Rubric.create(name: "Rubric ##{i}")
  user = User.create(email: "user#{i}@mail.ru", password: '12345678')

3.times do |j|  
  post = Post.create(title: "Post#{i}.#{j}", body: "<p>
    <h2>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis ut mi arcu. Sed eu mi a mi ultrices viverra. Mauris ut auctor justo. Aenean iaculis fermentum risus non tristique. Duis hendrerit, elit et feugiat posuere, diam magna rutrum nisl, ac iaculis enim sem quis ex. Maecenas in urna dapibus, volutpat libero vel, blandit dui. Vestibulum leo arcu, gravida dictum sagittis id, laoreet ac est. Maecenas semper turpis et diam fermentum dictum. Nam eu odio nec risus facilisis elementum. Vivamus facilisis tempus ex pulvinar convallis. Pellentesque sed neque quis nibh pretium tempus.
    </h2></p>
    <hr>
    <p>
    <br>Fusce euismod feugiat ex, placerat commodo lorem tincidunt sed. Donec consectetur metus in eros cursus imperdiet. Nam laoreet varius leo non ornare. Suspendisse at sapien porta, blandit felis vel, interdum dui. Curabitur eget nulla ultricies, ornare elit ut, tincidunt ex. Aliquam sit amet odio finibus, aliquet sem ut, consectetur augue. Morbi pharetra tempus massa, vel sagittis massa euismod non. Donec quis est finibus mi pellentesque facilisis. Ut suscipit molestie tellus at fringilla. Integer vitae pulvinar sem, non sodales lacus. Nunc suscipit dui vel nibh scelerisque ultricies. Vestibulum non ullamcorper sem. Etiam non leo non lorem pharetra pellentesque id tempor orci. Nulla facilisis a sem eget auctor.
    </p></br>
    <p>
    Proin a facilisis purus, quis rhoncus eros. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur et justo in lacus sollicitudin maximus. Fusce interdum at nibh eget tincidunt. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Praesent hendrerit porttitor libero, vitae pellentesque dui tincidunt facilisis. Phasellus vehicula magna metus, eu feugiat mi hendrerit nec. Nunc ac nibh ligula. Nulla facilisi. Curabitur eget mi viverra, imperdiet tellus non, rutrum dui.
    </p>
    <p>
    Cras tempor turpis elit, a varius enim consectetur in. Proin tortor arcu, sagittis ut mollis et, elementum non odio. Nam quis congue massa. Duis tempor at arcu quis euismod. Vestibulum quis dolor magna. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Proin laoreet ac neque et condimentum.
    </p>
    <p>
    Nunc egestas ex suscipit, tristique felis convallis, sagittis nisi. Ut consectetur eget odio vel tempor. Etiam iaculis, nunc at feugiat sagittis, quam risus pharetra dolor, quis varius augue dolor vel nulla. Cras in ipsum non risus ornare laoreet eu ut urna. Cras ac congue ligula, eu efficitur nibh. Fusce vel posuere elit, vel euismod sem. Maecenas interdum, ante pretium consectetur consectetur, ligula mi ornare turpis, vitae ornare lectus libero a urna.
    </p>")
  user.posts << post;
  rubric.posts << post
  10.times do |k| 
    comment = Comment.create(body: "#{i}.#{j}.#{k} This is good post!!!")
    user.comments << comment
    post.comments << comment
  end  
end
  
end



