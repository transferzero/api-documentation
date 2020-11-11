#!/usr/bin/env ruby
require 'fileutils'


def parse_data(prefix, data)
  json = +""
  code = {
    csharp: +"",
    vb: +"",
    java: +"",
    js: +"",
    php: +"",
    ruby: +""
  }

  state = :none
  name = nil
  klass = nil
  has_var = false

  data.each do |d|
    case d
    when "JSON_START"
      state = :json
    when "JSON_END"
      state = :none
    when "CODE_START"
      state = :code
    when "CODE_END"
      state = :none
    when /^COMMENT (.*)/
      code[:csharp] << "// #{$1}\n"
      code[:vb] << "' #{$1}\n"
      code[:java] << "// #{$1}\n"
      code[:js] << "// #{$1}\n"
      code[:php] << "// #{$1}\n"
      code[:ruby] << "# #{$1}\n"
    when /CREATE_START (.*) (.*)/
      name = $1
      klass = $2
      code[:csharp] << "#{klass} #{name} = new #{klass}(\n"
      code[:vb] << "Dim #{name} as #{klass} = New #{klass}(\n"
      code[:java] << "#{klass} #{name} = new #{klass}();\n"
      code[:js] << "const #{name} = new TransferZeroSdk.#{klass}();\n"
      code[:php] << "$#{name} = new #{klass}();\n"
      code[:ruby] << "#{name} = TransferZero::#{klass}.new\n"
    when "CREATE_END"
      # remove the endline and the last , from the parameter list (if present)
      code.each_pair do |key, value|
        value.chomp!(",\n")
      end
      code[:csharp] << ");\n"
      code[:vb] << ")\n"
      has_var = false
    when /CREATE_API (.*) (.*)/
      name = $1
      klass = $2
      code[:csharp] << "#{klass} #{name} = new #{klass}(configuration);\n"
      code[:vb] << "Dim #{name} as #{klass} = New #{klass}(configuration)\n"
      code[:java] << "#{klass} #{name} = new #{klass}(apiClient);\n"
      code[:js] << "const #{name} = new TransferZeroSdk.#{klass}(apiClient);\n"
      code[:php] << "$#{name} = new #{klass}();\n"
      code[:ruby] << "#{name} = TransferZero::#{klass}.new\n"
    when /POST_ENDPOINT_CALL ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*)/
      result_klass = $1
      result = $2
      api = $3
      name = $4
      parameter = $5

      name_camel = name.gsub(/_(\w)/){$1.upcase}
      name_camel_upper = name.split("_").map(&:capitalize).join

      code[:csharp] << "try {\n"
      code[:csharp] << "  #{result_klass} #{result} = #{api}.#{name_camel_upper}(#{parameter});\n"
      code[:csharp] << "} catch (ApiException e) {\n"
      code[:csharp] << "  if (e.IsValidationError)\n"
      code[:csharp] << "    #{result_klass} #{result} = e.ParseObject<#{result_klass}>();\n"
      code[:csharp] << "    // Process validation error\n"
      code[:csharp] << "  }\n"
      code[:csharp] << "  throw e;\n"
      code[:csharp] << "}\n"

      code[:vb] << "Try\n"
      code[:vb] << "  Dim #{result} as #{result_klass} = #{api}.#{name_camel_upper}(#{parameter})\n"
      code[:vb] << "Catch e As ApiException\n"
      code[:vb] << "  If e.IsValidationError Then\n"
      code[:vb] << "    Dim #{result} as #{result_klass} = e.ParseObject(Of #{result_klass})()\n"
      code[:vb] << "    ' Process validation error\n"
      code[:vb] << "  End If\n"
      code[:vb] << "  Throw e\n"
      code[:vb] << "End Try\n"

      code[:java] << "try {\n"
      code[:java] << "  #{result_klass} #{result} = #{api}.#{name_camel}(#{parameter});\n"
      code[:java] << "} catch (ApiException e) {\n"
      code[:java] << "  if (e.isValidationError()) {\n"
      code[:java] << "    #{result_klass} #{result} = e.getResponseObject(#{result_klass}.class);\n"
      code[:java] << "    // Process validation error\n"
      code[:java] << "  }\n"
      code[:java] << "  throw e;\n"
      code[:java] << "};\n"

      code[:js] << "try {\n"
      code[:js] << "  const #{result} = await #{api}.#{name_camel}(#{parameter});\n"
      code[:js] << "} catch (e) {\n"
      code[:js] << "  if (e.isValidationError) {\n"
      code[:js] << "    const #{result} = e.getResponseObject();\n"
      code[:js] << "    // Process validation error\n"
      code[:js] << "  }\n"
      code[:js] << "  throw e;\n"
      code[:js] << "}\n"

      code[:php] << "try {\n"
      code[:php] << "  $#{result} = #{api}->#{name_camel}($#{parameter});\n"
      code[:php] << "} catch (ApiException $e) {\n"
      code[:php] << "  if ($e->isValidationError()) {\n"
      code[:php] << "    $#{result} = $e->getResponseObject();\n"
      code[:php] << "    // Process validation error\n"
      code[:php] << "  }\n"
      code[:php] << "  throw $e;\n"
      code[:php] << "}\n"

      code[:ruby] << "begin\n"
      code[:ruby] << "  #{result} = #{api}.#{name}(#{parameter})\n"
      code[:ruby] << "rescue TransferZero::ApiError => e\n"
      code[:ruby] << "  if e.validation_error\n"
      code[:ruby] << "    #{result} = e.response_object(\"#{result_klass}\")\n"
      code[:ruby] << "    # Process validation error\n"
      code[:ruby] << "  end\n"
      code[:ruby] << "  raise e\n"
      code[:ruby] << "end\n"
    when /DELETE_ENDPOINT_CALL ([^ ]*) ([^ ]*) ([^ ]*)/
      api = $1
      name = $2
      parameter = $3

      name_camel = name.gsub(/_(\w)/){$1.upcase}
      name_camel_upper = name.split("_").map(&:capitalize).join

      code[:csharp] << "try {\n"
      code[:csharp] << "  #{api}.#{name_camel_upper}(#{parameter});\n"
      code[:csharp] << "} catch (ApiException e) {\n"
      code[:csharp] << "  if (e.IsValidationError)\n"
      code[:csharp] << "    // Process validation error\n"
      code[:csharp] << "  }\n"
      code[:csharp] << "  throw e;\n"
      code[:csharp] << "}\n"

      code[:vb] << "Try\n"
      code[:vb] << "  #{api}.#{name_camel_upper}(#{parameter})\n"
      code[:vb] << "Catch e As ApiException\n"
      code[:vb] << "  If e.IsValidationError Then\n"
      code[:vb] << "    ' Process validation error\n"
      code[:vb] << "  End If\n"
      code[:vb] << "  Throw e\n"
      code[:vb] << "End Try\n"

      code[:java] << "try {\n"
      code[:java] << "  #{api}.#{name_camel}(#{parameter});\n"
      code[:java] << "} catch (ApiException e) {\n"
      code[:java] << "  if (e.isValidationError()) {\n"
      code[:java] << "    // Process validation error\n"
      code[:java] << "  }\n"
      code[:java] << "  throw e;\n"
      code[:java] << "};\n"

      code[:js] << "try {\n"
      code[:js] << "  await #{api}.#{name_camel}(#{parameter});\n"
      code[:js] << "} catch (e) {\n"
      code[:js] << "  if (e.isValidationError) {\n"
      code[:js] << "    // Process validation error\n"
      code[:js] << "  }\n"
      code[:js] << "  throw e;\n"
      code[:js] << "}\n"

      code[:php] << "try {\n"
      code[:php] << "  #{api}->#{name_camel}($#{parameter});\n"
      code[:php] << "} catch (ApiException $e) {\n"
      code[:php] << "  if ($e->isValidationError()) {\n"
      code[:php] << "    // Process validation error\n"
      code[:php] << "  }\n"
      code[:php] << "  throw $e;\n"
      code[:php] << "}\n"

      code[:ruby] << "begin\n"
      code[:ruby] << "  #{api}.#{name}(#{parameter})\n"
      code[:ruby] << "rescue TransferZero::ApiError => e\n"
      code[:ruby] << "  if e.validation_error\n"
      code[:ruby] << "    # Process validation error\n"
      code[:ruby] << "  end\n"
      code[:ruby] << "  raise e\n"
      code[:ruby] << "end\n"
    when /GET_ENDPOINT_CALL_START ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*)/
      result_klass = $1
      result = $2
      api = $3
      name = $4

      name_camel = name.gsub(/_(\w)/){$1.upcase}
      name_camel_upper = name.split("_").map(&:capitalize).join

      code[:csharp] << "#{result_klass} #{result} = #{api}.#{name_camel_upper}("
      code[:vb] << "Dim #{result} as #{result_klass} = #{api}.#{name_camel_upper}("
      code[:java] << "#{result_klass} #{result} = #{api}.#{name_camel}()"
      code[:js] << "const #{result} = await #{api}.#{name_camel}({"
      code[:php] << "$#{result} = #{api}->#{name_camel}(["
      code[:ruby] << "#{result} = #{api}.#{name}({"
    when "GET_ENDPOINT_CALL_END"
      code.each_pair do |key, value|
        value.chomp!(",")
      end
      code[:csharp] << ");\n"
      code[:vb] << ")\n"
      code[:java] << ".execute();\n"
      code[:js] << "});\n"
      code[:php] << "]);\n"
      code[:ruby] << "})\n"
      has_var = false
    when /PARAM ([^ ]*) ([^ ]*) ([^ ]*)/
      type = $1
      var = $2
      value = $3

      var_camel = var.gsub(/_(\w)/){$1.upcase}
      var_camel_upper = var.split("_").map(&:capitalize).join

      has_var = true

      case type
      when "LIT"
        code[:csharp] << "#{var_camel}: #{value},"
        code[:vb] << "#{var_camel}:=#{value},"
        code[:java] << ".#{var_camel}(#{value})"
        code[:js] << "#{var}: #{value},"
        code[:php] << "#{var} => #{value},"
        code[:ruby] << "#{var}: #{value},"
      end
    when /SET ([^ ]*) ([^ ]*) (.*)/
      type = $1
      var = $2
      value = $3

      var_camel = var.gsub(/_(\w)/){$1.upcase}
      var_camel_upper = var.split("_").map(&:capitalize).join

      has_var = true

      case type
      when "BIGNUM"
        code[:csharp] << "  #{var_camel}: #{value},\n"
        code[:vb] << "  #{var_camel}:=#{value},\n"
        code[:java] << "#{name}.set#{var_camel_upper}(new BigDecimal(\"#{value}\"));\n"
        code[:js] << "#{name}.#{var} = #{value};\n"
        code[:php] << "$#{name}->set#{var_camel_upper}(#{value});\n"
        code[:ruby] << "#{name}.#{var} = #{value}\n"
      when "VAR"
        code[:csharp] << "  #{var_camel}: #{value},\n"
        code[:vb] << "  #{var_camel}:=#{value},\n"
        code[:java] << "#{name}.set#{var_camel_upper}(#{value});\n"
        code[:js] << "#{name}.#{var} = #{value};\n"
        code[:php] << "$#{name}->set#{var_camel_upper}($#{value});\n"
        code[:ruby] << "#{name}.#{var} = #{value}\n"
      when "LIT"
        code[:csharp] << "  #{var_camel}: #{value},\n"
        code[:vb] << "  #{var_camel}:=#{value},\n"
        code[:java] << "#{name}.set#{var_camel_upper}(#{value});\n"
        code[:js] << "#{name}.#{var} = #{value};\n"
        code[:php] << "$#{name}->set#{var_camel_upper}(#{value});\n"
        code[:ruby] << "#{name}.#{var} = #{value}\n"
      when "VAR_ARRAY"
        var_klass = value.split(" ").first
        var_value = value.split(" ").last
        code[:csharp] << "  #{var_camel}: new List<#{var_klass}>() { #{var_value} },\n"
        code[:vb] << "  #{var_camel}:=New List(Of #{var_klass})() From { #{var_value} },\n"
        code[:java] << "#{name}.add#{var_camel_upper}Item(#{var_value});\n"
        code[:js] << "#{name}.#{var} = [#{var_value}];\n"
        code[:php] << "$#{name}->set#{var_camel_upper}([#{var_value}]);\n"
        code[:ruby] << "#{name}.#{var} = [#{var_value}]\n"
      when "ENUM"
        enum_klass = value.split(" ").first
        enum_value = value.split(" ").last
        enum_value_conv = enum_value.upcase
        if enum_value[0] =~ /[0-9]/
          enum_value_conv = "_" + enum_value.upcase
        end
        code[:csharp] << "  #{var_camel}: #{enum_klass}.#{enum_value_conv},\n"
        code[:vb] << "  #{var_camel}:=#{enum_klass}.#{enum_value_conv},\n"
        code[:java] << "#{name}.set#{var_camel_upper}(#{enum_klass}.#{enum_value_conv});\n"
        code[:js] << "#{name}.#{var} = \"#{enum_value}\";\n"
        code[:php] << "$#{name}->set#{var_camel_upper}(\"#{enum_value}\");\n"
        code[:ruby] << "#{name}.#{var} = \"#{enum_value}\"\n"
      when "DATE"
        code[:csharp] << "  #{var_camel}: DateTime.Parse(#{value}),\n"
        code[:vb] << "  #{var_camel}:=DateTime.Parse(#{value}),\n"
        code[:java] << "#{name}.set#{var_camel_upper}(LocalDate.parse(#{value}));\n"
        code[:js] << "#{name}.#{var} = #{value};\n"
        code[:php] << "$#{name}->set#{var_camel_upper}(#{value});\n"
        code[:ruby] << "#{name}.#{var} = #{value}\n"
      when "EMPTY_ARRAY"
        code[:csharp] << "  #{var_camel}: new List<#{value}>(),\n"
        code[:vb] << "  #{var_camel}:=New List(Of #{value})()),\n"
        code[:java] << "#{name}.set#{var_camel_upper}(new ArrayList<>());\n"
        code[:js] << "#{name}.#{var} = [];\n"
        code[:php] << "$#{name}->set#{var_camel_upper}([]);\n"
        code[:ruby] << "#{name}.#{var} = []\n"
      end
    when /LIST_EXTRACT ([^ ]*) ([^ ]*) ([^ ]*)/
      list = $1
      klass = $2
      var = $3

      code[:vb] << "If #{list}.Object.Count > 0 Then\n"
      code[:vb] << "    Dim #{var} As #{klass} = #{list}.Object(0)\n"
      code[:vb] << "Else\n"
      code[:vb] << "    ' handle not found scenario\n"
      code[:vb] << "End If\n"

      code[:csharp] << "if (#{list}.Object.Count > 0) {\n"
      code[:csharp] << "  #{klass} #{var} = #{list}.Object[0];\n"
      code[:csharp] << "} else {\n"
      code[:csharp] << "  // handle not found scenario\n"
      code[:csharp] << "}\n"

      code[:java] << "if (#{list}.getObject().size() > 0) {\n"
      code[:java] << "  #{klass} #{var} = #{list}.getObject().get(0);\n"
      code[:java] << "} else {\n"
      code[:java] << "  // handle not found scenario\n"
      code[:java] << "}\n"

      code[:js] << "if (#{list}.object.length > 0) {\n"
      code[:js] << "  const #{var} = #{list}.object[0];\n"
      code[:js] << "} else {\n"
      code[:js] << "  // handle not found scenario\n"
      code[:js] << "}\n"

      code[:php] << "if (count(#{list}->getObject()) > 0) {\n"
      code[:php] << "  $#{var} = #{list}->getObject()[0];\n"
      code[:php] << "} else {\n"
      code[:php] << "  // handle not found scenario\n"
      code[:php] << "}\n"

      code[:ruby] << "if !#{list}.object.empty?\n"
      code[:ruby] << "  #{var} = #{list}.object.first\n"
      code[:ruby] << "else\n"
      code[:ruby] << "  # handle not found scenario\n"
      code[:ruby] << "end\n"
    when /OBJ_EXTRACT ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*)/
      object = $1
      result_klass = $2
      result = $3
      name = $4

      name_camel = name.gsub(/_(\w)/){$1.upcase}
      name_camel_upper = name.split("_").map(&:capitalize).join

      code[:csharp] << "#{result_klass.gsub("UUID","Guid")} #{result} = #{object}.#{name_camel_upper};\n"
      code[:vb] << "Dim #{result} as #{result_klass.gsub("UUID","Guid")} = #{object}.#{name_camel_upper}\n"
      code[:java] << "#{result_klass} #{result} = #{object}.get#{name_camel_upper}();\n"
      code[:js] << "const #{result} = #{object}.#{name};\n"
      code[:php] << "$#{result} = #{object}->get#{name_camel_upper};\n"
      code[:ruby] << "#{result} = #{object}.#{name}\n"
    when /OBJ_EXTRACT_FIRST ([^ ]*) ([^ ]*) ([^ ]*) ([^ ]*)/
      object = $1
      result_klass = $2
      result = $3
      name = $4

      name_camel = name.gsub(/_(\w)/){$1.upcase}
      name_camel_upper = name.split("_").map(&:capitalize).join

      code[:csharp] << "#{result_klass.gsub("UUID","Guid")} #{result} = #{object}.#{name_camel_upper}[0];\n"
      code[:vb] << "Dim #{result} as #{result_klass.gsub("UUID","Guid")} = #{object}.#{name_camel_upper}[0]\n"
      code[:java] << "#{result_klass} #{result} = #{object}.get#{name_camel_upper}().get(0);\n"
      code[:js] << "const #{result} = #{object}.#{name}[0];\n"
      code[:php] << "$#{result} = #{object}->get#{name_camel_upper}[0];\n"
      code[:ruby] << "#{result} = #{object}.#{name}.first\n"
    else
      if state == :json
        json << d << "\n"
      elsif state == :code
        code.each do |key, value|
          value << d << "\n"
        end
      end
    end
  end

  result = +""
  result << "{% capture data-raw %}\n"
  result << "```javascript\n"
  result << json
  result << "```\n"
  result << "{% endcapture %}\n"
  result << "\n"

  code.each_pair do |key, value|
    result << "{% capture data-#{key} %}\n"
    result << "```#{key}\n"
    result << value
    result << "```\n"
    result << "{% endcapture %}\n"
    result << "\n"
  end

  result << '{% include language-tabbar.html prefix="'+prefix+'" raw=data-raw csharp=data-csharp vb=data-vb java=data-java js=data-js php=data-php ruby=data-ruby %}'
end

Dir.glob("_docs/*").each do |filename|
  content = File.read(filename)

  # clear up old auto generated content
  clear = +""
  clearing = false
  content.each_line do |line|
    if line.include?("{::comment}AUTO_GENERATED_CONTENT_START{:\/comment}")
      clearing = true
    elsif line.include?("{::comment}AUTO_GENERATED_CONTENT_END{:\/comment}")
      clearing = false
    elsif !clearing
      clear << line
    end
  end

  # gather code data
  generated = +""
  data = []
  process = :none
  prefix = nil

  clear.each_line do |line|
    if line =~ /CODE_EXAMPLE_START (.*)/
      prefix = $1
      process = :code
      generated << line
    elsif line.include?("CODE_EXAMPLE_END")
      process = :code_end
      generated << line
      generated << "{:\/comment}\n\n{::comment}AUTO_GENERATED_CONTENT_START{:\/comment}\n"

      generated << parse_data("gen-#{prefix}",data)

      generated << "\n{::comment}AUTO_GENERATED_CONTENT_END{:\/comment}"

      process = false
      data = []
    elsif line.include?("{:\/comment}")
      process = :none
    elsif process == :code
      data << line.chomp
      generated << line
    elsif process == :none
      generated << line
    end

  end

  File.open(filename, "w+") do |f|
    f.write generated
  end
end
