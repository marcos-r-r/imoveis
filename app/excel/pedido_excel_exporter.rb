# encoding: UTF-8

class PedidoExcelExporter < ExcelExporter
	  
      def build_header
      end

    def build_data(domain, index)
      format = Spreadsheet::Format.new(:weight => :bold,
                                       :size => 10,
                                       :align => :center)

      format_value = Spreadsheet::Format.new( :align => :center)
      
      if domain.simulacao.parcelas_30 && domain.simulacao.parcelas_12.nil?
            simulacoes = Array.new
            simulacoes = ["",domain.simulacao.parcelas_30, domain.simulacao.parcelas_36, domain.simulacao.parcelas_48, domain.simulacao.parcelas_48_juros, domain.simulacao.parcelas_60, domain.simulacao.parcelas_60_juros ]
            simulacao_head = Array.new
            simulacao_head = ["PARCELAS: ", "30x","36x","48x","48x c/ Juros","60x","60x c/ Juros"]

            @data.insert_row(6,simulacoes)
            @data.insert_row(6,simulacao_head)

      @data.insert_row(6,[""])
      simulacao_head.each_with_index { |data, index|  @data.row(7).set_format(index, format) }
      end
      
      if domain.simulacao.parcelas_12
            simulacoes = Array.new
            simulacoes = ["",domain.simulacao.parcelas_12, domain.simulacao.parcelas_24, domain.simulacao.parcelas_50 ]
            simulacao_head = Array.new
            simulacao_head = ["PARCELAS: ", "12x","24x","50x"]

            @data.insert_row(6,simulacoes)
            @data.insert_row(6,simulacao_head)

      @data.insert_row(6,[""])
      simulacao_head.each_with_index { |data, index|  @data.row(7).set_format(index, format) }
      end

      @data.insert_row(5, ["","","","","","CNPJ: 14.475.737/0001-75"])
      @data.insert_row(5, ["","","","","","MC EMPREENDIMENTOS IMOBILIÁRIOS"])
      @data.insert_row(5, ["","","","","","___________________"])
      @data.insert_row(5,[""])
      @data.insert_row(5,[""])
      @data.insert_row(5,[""])
      @data.insert_row(5,[""])
      @data.insert_row(5,[""])
      @data.insert_row(5, ["","","","","","Proposto por"])

      @data.insert_row(3, ["","","","","a partir de sua data de emissão."])
      @data.insert_row(3, ["","","","","Esta proposta tem validade de 05 dias úteis"])
      @data.insert_row(3, ["", "", "", "", "Valores Corrigidos pela variação positiva do CUB."])
      @data.insert_row(3, ["", "", "", "", "Eventograma de pagamentos anexo a proposta." ])
      @data.insert_row(3, ["", ""]) 
      @data.insert_row(3, ["Proposta para venda da unidade:" + domain.espaco.identificacao] )
      @data.insert_row(3, ["",""])

      espaco_data = Array.new
      espaco_data = [ domain.espaco.tipo_de_espaco, 
                      domain.espaco.identificacao,
                      domain.espaco.try(:area_privativa),
                      domain.espaco.try(:area_comum),
                      domain.espaco.try(:area_garagem),
                      domain.espaco.try(:numero_garagem),
                      domain.espaco.try(:area_total), 
                      domain.espaco.valor_total     
                     ]
      @data.insert_row(2, espaco_data)
      espaco_header = Array.new
      espaco_header = ['INDIVIDUAIS', '', 'PRIVATIVA', 'COMUM', 'GARAGEM', "N°", 'TOTAL', 'VALOR (R$)']
      @data.insert_row(2, espaco_header)
      espaco_header.each_with_index { |data, index|  @data.row(2).set_format(index, format) }
      espaco_data.each_with_index { |data, index|  @data.row(3).set_format(index, format_value) }
      @data.row(3).set_format(0, format)

      @data.insert_row(1, ["", "", ""])
      vendedor = Array.new
      vendedor = ['VENDEDOR(A)', domain.usuario.nome]
      @data.insert_row(1, vendedor)
      cliente = Array.new
      cliente = ['CLIENTE', domain.cliente.nome] 
      @data.insert_row(1, cliente)
      title = Array.new
      title = ["", "", 'PROPOSTA PARA VENDA DAS UNIDADES: ' + domain.espaco.identificacao]
      @data.insert_row(1, title)
      @data.row(1).set_format(0, format)
      @data.row(1).set_format(1, format)
      @data.row(1).set_format(2, format)
      @data.row(1).set_format(3, format)
      @data.row(1).set_format(4, format)
      @data.row(2).set_format(0, format)
      @data.row(2).set_format(1, format_value)
      @data.row(3).set_format(0, format)
      @data.row(3).set_format(1, format_value)


      #title.each_with_index { |data, index|  @data.row(1).set_format(index, format) }
      @data[1,6] = "JARAGUÁ DO SUL, " + Date.today.strftime('%d %b, %Y')
    end
end
