# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

def lorem_ipsum
  return "Lorem ipsum dolor sit amet, quot labores maiestatis vel in, te mucius animal aliquam sit. Sonet melius eum et. Vel ut vituperata argumentum, ut agam fuisset his, eu eum unum deseruisse contentiones. Vim suas deserunt et. Te eum odio audiam integre. In usu detracto sapientem, te magna epicuri nostrum ius.

    His purto eruditi cu, ex diam inani sadipscing vis. Te pri error melius lobortis, ea iisque gloriatur nec. Id his lorem tincidunt, ut per ridens referrentur intellegebat. Eum in atqui liberavisse, quo in errem legere. Cu erroribus expetendis scripserit nec, qui aeterno aliquip eu, vis ex aeque admodum.

    Ne nostrud patrioque pri, homero graece praesent sit eu, ex mea fuisset offendit. Ius meis ullum te, saepe iracundia abhorreant mea ei, pri id novum dissentiunt. Vel ut nisl indoctum. Ad appareat pertinacia nec. Quodsi sapientem ne sed. Mei ne justo postulant, sea agam graeci copiosae et.

    Mea ea detracto nominati eleifend, sea ea quas clita, cu commune sadipscing sed. At sea viris volutpat qualisque, constituam appellantur philosophia te eos. An audiam constituam instructior usu, latine accumsan ut nam, dolorum intellegat interpretaris his ut. Pri ad probatus constituam, esse sanctus mea et. Ei sea ferri possim maiestatis, errem corrumpit ad mei. Nec dicam nemore eu.

    Euismod sanctus vulputate eum ad. Mea harum dicant no, movet praesent nam ut. In munere integre constituto pro, pro eu harum dolores necessitatibus. An per nemore quaeque tibique. Ea nisl partem mollis eam, sit simul salutatus neglegentur ut. Vel vocibus vulputate te."
end

Login.create!({
  username: "taylor",
  password: "admin",
})

p = Post.create!({
  title: "This Is a Random Post, Right?",
  published: true,
  slug: "some-clever-post-slug",
  contents: lorem_ipsum,
})

Tagging.create!(
  post: p,
  tag: Tag.create!(name: "sometag"),
)
