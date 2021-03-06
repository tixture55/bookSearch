module ApplicationHelper

  def div_tag_if(condition, content_or_options_with_block = nil, options = nil, escape = true, &block)
    # condition が trueの場合だけ、content_tagメソッドでdivタグを作成する
    # falseの場合は、何も作成しない
    if condition
      content_tag("div", content_or_options_with_block, options, escape, &block)
    end
  end
  def add_star
    image_tag("star.jpg", :size => "22x22", :alt => "アイコン")
  end
end
