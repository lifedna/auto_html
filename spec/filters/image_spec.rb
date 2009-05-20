require File.dirname(__FILE__) + '/../spec_helper'

describe AutoHtml do
  it 'should transform URL to HTML image' do

    auto_html('http://rors.org/images/rails.png') { image }.should == 
      '<img src="http://rors.org/images/rails.png" alt=""/>'

    auto_html('http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg') { image }.should == 
      '<img src="http://farm4.static.flickr.com/3459/3270173112_5099d3d730.jpg" alt=""/>'

    auto_html('http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gift-phusion-passenger-220/') { image }.should_not == 
      '<img src="http://blog.phusion.nl/2009/04/16/phusions-one-year-anniversary-gif" alt=""/>'
      
    auto_html('http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG') { image }.should == 
      '<img src="http://www.lockhartfineart.com/images/Rio_Grande_Frost.JPG" alt=""/>'

    auto_html('http://1.bp.blogspot.com/_Mj2OYyOJbIY/SfmcOSE8npI/AAAAAAAAIlo/Fr8f4opuSN4/s1600-h/_inglish-725743.jpg') { image }.should == 
      '<img src="http://1.bp.blogspot.com/_Mj2OYyOJbIY/SfmcOSE8npI/AAAAAAAAIlo/Fr8f4opuSN4/s1600-h/_inglish-725743.jpg" alt=""/>'

    auto_html('http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0') { image }.should == 
      '<img src="http://farm4.static.flickr.com/3664/3512431377_71b8d002ef.jpg?v=0" alt=""/>'

    auto_html('Do you like this logo http://rors.org/images/rails.png? Yeah?') { image }.should == 
      'Do you like this logo <img src="http://rors.org/images/rails.png" alt=""/>? Yeah?'

  end
end