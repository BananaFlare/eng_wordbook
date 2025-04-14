# EngWordbook
Linux only because lots of linux dependencies required


This gem is designed to create a dictionary from an online article and output it in a table format in a Microsoft Word docx file.


## Requirements
system packages: gcc, make, ruby-psych, ruby-dev, libyaml-dev


gems: bundler


You need a .env.rb file, which you can request from the creator or create yourself if you have a Deepseek API key.
```bash
 module EnvVariables
  def self.set
    ENV['DS_API_KEY'] = "ваш ключ"
  end
end
```
## Installation
1. Move the .env.rb file to the lib directory.
2. Run the following commands:
```bash
 sudo bundle
 gem build
```

## Usage

rake


Sorry, no other options are available yet.


Enter the URL of the article website.
Enter the name of the Word document.

Optionally, add or exclude words from the suggested list.





## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BananaFlare/eng_wordbook. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/eng_wordbook/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EngWordbook project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/eng_wordbook/blob/master/CODE_OF_CONDUCT.md).
