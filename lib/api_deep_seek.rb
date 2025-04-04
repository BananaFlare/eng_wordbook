require_relative "./.env"
require "json"
require 'faraday'
require_relative 'parsing'
EnvVariables.set
DEEPSEEK_API_KEY = ENV['DS_API_KEY']

module ApiDeepSeek
  API_URL = 'https://hubai.loe.gg/v1/chat/completions' # Example endpoint

  def self.call_deepseek_api(prompt)
    headers = {
      'Content-Type' => 'application/json',
      'Authorization' => "Bearer #{DEEPSEEK_API_KEY}"
    }

    body = {
      model: "deepseek-chat", # Specify the model to use
      messages: [{ role: "user", content: prompt }],
      temperature: 0.7, # Adjust creativity (0 = strict, 1 = creative)

    }.to_json

    response = Faraday.post(API_URL, body, headers)

    if response.success?
      JSON.parse(response.body)['choices'][0]['message']['content']
    else
      "Error: #{response.status} - #{response.body}"
    end

  end

  def self.words_to_array
    text = Parsing_page.page_content
    prompt = "выдели из статьи слова, которые могут быть непонятны уровню английского A2. В ответе оставь только найденные слова в формате: номер по порядку ** слово или абреввиатура (расшифровать) ** транскрипция ** перевод ** пример из текста, без лишних слов, конец формата, следующая строка.#{text}"

    response = call_deepseek_api(prompt)
    p response
  end
end



