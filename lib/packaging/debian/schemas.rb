require 'open3'

require 'casing'
require 'configure'; Configure.activate
require 'schema'
require 'transform'

require 'packaging/debian/schemas/sha256'

require 'packaging/debian/schemas/rfc822'
require 'packaging/debian/schemas/rfc822/patterns'
require 'packaging/debian/schemas/rfc822/single_paragraph'

require 'packaging/debian/schemas/package/attributes'
require 'packaging/debian/schemas/package'
require 'packaging/debian/schemas/package/transform'
require 'packaging/debian/schemas/package/read'

require 'packaging/debian/schemas/package_index'
require 'packaging/debian/schemas/package_index/assertions'
require 'packaging/debian/schemas/package_index/entry'
require 'packaging/debian/schemas/package_index/transform'

require 'packaging/debian/schemas/release'
require 'packaging/debian/schemas/release/transform'
