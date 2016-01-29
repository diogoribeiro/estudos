module CurrencyHelper
    class Currency
        def format(value, minDecimal = nil)
            parts = value.to_s.split('.')
            intPart = formatIntPart(parts[0])
            fraction = parts.count > 1 ? formatDecimal(parts[1], minDecimal) :  formatDecimal('00', minDecimal)

            return "#{@currency_symbol}$ #{intPart}#{@decimal_separator}#{fraction}"
        end

        def formatIntPart(value)
            valueInt = value.to_i
            formatedValue = ""
            while(valueInt / 1000 > 0)
                c = valueInt % 1000
                if c >= 100 then
                    formatedValue.prepend "#{@thousands_separator}#{c}"
                elsif c >=10 then
                    formatedValue.prepend "#{@thousands_separator}0#{c}"
                elsif c >1 then 
                    formatedValue.prepend "#{@thousands_separator}00#{c}"
                else
                    formatedValue.prepend "#{@thousands_separator}000"
                end
                
                valueInt = valueInt / 1000
            end

            formatedValue.prepend("#{valueInt}")
        end

        def formatDecimal(value, minDecimal)
            if minDecimal
                while  value.length < minDecimal
                    value << "0"                
                end
            end

            value
        end
    end

    class PTBr < Currency
        def initialize
            @thousands_separator = '.'
            @decimal_separator = ','
            @currency_symbol = 'R'
        end
    end

    class US < Currency
        def initialize
            @thousands_separator = ','
            @decimal_separator = '.'
            @currency_symbol = 'US'
        end
    end
end