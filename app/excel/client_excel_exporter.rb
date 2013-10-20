# encoding: UTF-8

class PedidoExcelExporter < ExcelExporter
	  
	  def build_header
    end
    
    def build_data(domain, index)
      @data.insert_row(0, [ ])
      array_line_label = Array.new
      array_line_label = ['', '', '', '','','','','', '', '', '', '', '', '', '', '', '']
      @data.insert_row(0, array_line_label)
      array_line_label.each_with_index { |data, index|  @data.row(0).set_format(index, format(:pattern_bg_color => 'grey', :pattern => 8)) }

      unless domain.bank_references == nil
        domain.bank_references.each do |bank_reference|
          arrayBank_reference = Array.new
          arrayBank_reference << ''
          arrayBank_reference << bank_reference.name
          arrayBank_reference << bank_reference.bank
          arrayBank_reference << bank_reference.agency
          arrayBank_reference << bank_reference.phone
          @data.insert_row(0, arrayBank_reference)
          @data.row(0).set_format(0, format(:pattern_bg_color => 'grey', :pattern => 8))
        end
      end
      array_bank_referenc = Array.new
      array_bank_referenc = ['Referências Bancárias','Nome:', 'Banco:', 'Agência:', 'Telefone:'] 
      @data.insert_row(0, array_bank_referenc)
      array_bank_referenc.each_with_index { |label, index|  @data.row(0).set_format(index, format(:color => 'white',:pattern_bg_color => 'grey', :pattern => 8, :weight => :bold)) }
      # @data.insert_row(0, ['Referências Bancárias'])
      # @data.row(0).set_format(0, format(:weight => :bold, :size => 12))

      unless domain.commercial_references == nil
        domain.commercial_references.each do |commercial_reference|
          arrayCommercial_reference = Array.new
          arrayCommercial_reference << ''
          arrayCommercial_reference << commercial_reference.name
          arrayCommercial_reference << commercial_reference.phone_number
          @data.insert_row(0, arrayCommercial_reference)
          @data.row(0).set_format(0, format(:pattern_bg_color => 'grey', :pattern => 8))
        end
      end
      array_commercial_referenc = Array.new
      array_commercial_referenc = ['Referências Comerciais','Nome:', 'Telefone:', '', '']
      @data.insert_row(0, array_commercial_referenc)
      array_commercial_referenc.each_with_index { |label, index|  @data.row(0).set_format(index, format(:color => 'white',:pattern_bg_color => 'grey', :pattern => 8, :weight => :bold)) }
      # @data.insert_row(0, ['Referências Comerciais'])
      # @data.row(0).set_format(0, format(:weight => :bold, :size => 12))

      unless domain.histories == nil
        domain.histories.each do |history|
          arrayHystory = Array.new
          arrayHystory << ''
          arrayHystory << history.date
          unless history.pendency
            pendency = 'Sim'
          else
            pendency = 'Não'
          end
          arrayHystory << pendency
          arrayHystory << history.message
          @data.insert_row(0, arrayHystory)
          @data.row(0).set_format(1, @date)
          @data.row(0).set_format(0, format(:pattern_bg_color => 'grey', :pattern => 8))
        end
      end
      array_hystory_label = Array.new
      array_hystory_label = ['Histórico','Data:', 'Pendência:', 'Mensagem:', '']
      @data.insert_row(0, array_hystory_label)
      array_hystory_label.each_with_index { |label, index|  @data.row(0).set_format(index, format(:color => 'white',:pattern_bg_color => 'grey', :pattern => 8, :weight => :bold)) }
      # @data.insert_row(0, ['Histórico'])
      # @data.row(0).set_format(0, format(:weight => :bold, :size => 12))

      unless domain.contacts == nil
        domain.contacts.each_with_index do |contact, index|
          arrayContact = Array.new
          arrayContact << ''
          arrayContact << contact.name
          arrayContact << contact.job
          arrayContact << contact.phone
          arrayContact << contact.birthday
          @data.insert_row(0, arrayContact)
          @data.row(0).set_format(4, @date)
          @data.row(0).set_format(0, format(:pattern_bg_color => 'grey', :pattern => 8))
        end
      end
      array_contact_label = Array.new
      array_contact_label = ['Contatos','Nome:', 'Cargo:', 'Telefone:', 'Aniversário:']
      @data.insert_row(0, array_contact_label)
      array_contact_label.each_with_index { |label, index|  @data.row(0).set_format(index, format(:color => 'white',:pattern_bg_color => 'grey', :pattern => 8, :weight => :bold)) }
      # @data.insert_row(0, ['Contatos'])
      # @data.row(0).set_format(0, format(:weight => :bold, :size => 12))
      arrayData = Array.new
      arrayData << domain.economic_group_name
      arrayData << domain.salesman_name
      arrayData << domain.name
      arrayData << domain.razao_social
      arrayData << domain.cnpj
      arrayData << domain.inscricao_estadual
      arrayData << domain.district
      arrayData << domain.city
      if domain.state
        state = domain.state.name_with_symbol
      else
        state = ''
      end
      arrayData << state
      arrayData << domain.address
      arrayData << domain.number
      arrayData << domain.complement
      arrayData << domain.caixa_postal
      arrayData << domain.cep
      arrayData << domain.phone
      arrayData << domain.fax
      arrayData << domain.email
      @data.insert_row(0, arrayData)
      array_data_label = Array.new
      array_data_label = ['Grupo Econômico:', 'Representante:', 'Nome:', 'Razão Social:','CNPJ:','Inscrição Estadual:','Distrito:','Cidade:', 'Estado:', 'Endereço:', 'Numero:', 'Complemento:', 'Caixa Postal:', 'CEP:', 'Telefone:', 'FAX:', 'E-mail:']
      @data.insert_row(0, array_data_label)
      array_data_label.each_with_index { |data, index|  @data.row(0).set_format(index, format(:color => 'white',:pattern_bg_color => 'grey', :pattern => 8, :weight => :bold)) }
      title = Array.new
      title = ['Cliente:', index]
      @data.insert_row(0, title)
      title.each_with_index { |data, index|  @data.row(0).set_format(index, format(:weight => :bold, :size => 12)) }
    end
end
