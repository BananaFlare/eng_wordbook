require_relative "./.env"
require "json"
require 'faraday'
require_relative 'parsing'
require 'tty-prompt'
EnvVariables.set
DEEPSEEK_API_KEY = ENV['DS_API_KEY']
require_relative 'text_parser'
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
end



