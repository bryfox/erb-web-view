require 'rubygems'
require 'erb'
require 'faster_csv'
require 'json'
require 'bluecloth'
require 'rio'
require 'sprockets'
Dir.glob("#{File.expand_path(File.dirname(__FILE__))}/../lib/*.rb").sort.each { |f| require f }

include ERB::Util
include ErbRendering
include ViewHelpers

# Build config
COMPRESS_ASSETS = true

# File locations
ROOT_DIR = "#{File.expand_path(File.dirname(__FILE__))}/../"
ASSETS_DIR = "#{ROOT_DIR}/assets"
VIEWS_DIR = "#{ROOT_DIR}/views"
PUBLIC_DIR = "#{ROOT_DIR}/public"
PATH_TO_TEMPLATE = "#{VIEWS_DIR}/index.html.erb"
OUTPUT_DIR = "#{ROOT_DIR}/public/"
