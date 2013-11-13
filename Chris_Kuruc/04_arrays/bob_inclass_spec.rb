require 'minitest/autorun'
require_relative 'bob_inclass'

describe Bob do

  let(:teenager) { Bob.new }

  it "responds with something" do
    assert_equal 'Whatever.', teenager.hey('Tom-ay-to, tom-aaaah-to.')
  end

  it "responds to shouting" do
    assert_equal 'Woah, chill out!', teenager.hey('WATCH OUT!')
  end

  it "responds to questions" do
    assert_equal 'Sure.', teenager.hey('Does this cryogenic chamber make me look fat?')
  end

  it "responds to a question with numbers in it" do
    assert_equal 'Sure.', teenager.hey('You are, what, like 15?')
  end

  it "responds to being screamed at" do
    assert_equal 'Whatever.', teenager.hey("Let's go make out behind the gym!")
  end

  it "supports using acronyms" do
    assert_equal 'Whatever.', teenager.hey("It's OK if you don't want to go to the DMV.")
  end

  it "responds to forceful questions" do
    assert_equal 'Woah, chill out!', teenager.hey('WHAT THE HELL WERE YOU THINKING?')
  end

  it "responds to shouting with numbers" do
    assert_equal 'Woah, chill out!', teenager.hey('1, 2, 3 GO!')
  end

  it "responds to shouting with special characters" do
    assert_equal 'Woah, chill out!', teenager.hey('ZOMG THE %^*@#$(*^ ZOMBIES ARE COMING!!11!!1!')
  end

  it "responds to shouting with no exclamation points" do
    assert_equal 'Woah, chill out!', teenager.hey('I HATE YOU')
  end

  it "responds to statements containing a question mark" do
    assert_equal 'Whatever.', teenager.hey('Ending with ? means a question.')
  end

  it "supports rambling" do 
    assert_equal 'Sure.', teenager.hey("Wait! Hang on. Are you going to be OK?")
  end

  it "responds to silence" do
    assert_equal 'Fine. Be that way!', teenager.hey('')
  end

  it "responds to prolonged silence" do
    assert_equal 'Fine. Be that way!', teenager.hey('    ')
  end

  it "supports multiline messages" do
    assert_equal 'Whatever.', teenager.hey(%{
Does this cryogenic chamber make me look fat?
no})
  end

  ################################################################
  ###############___##############################################
  ############# |  _ \############################################
  ############# | |_) | ___  _ __  _   _ ___ #####################
  ############# |  _ < / _ \| '_ \| | | / __|#####################
  ############# | |_) | (_) | | | | |_| \__ \#####################
  ############# |____/ \___/|_| |_|\__,_|___/#####################
  ################################################################
  ################################################################


  it "responds to only numbers" do
    assert_equal 'Whatever.', teenager.hey('1, 2, 3')
  end

  it "responds to questions with only numbers" do
    assert_equal 'Sure.', teenager.hey('4?')
  end
end
