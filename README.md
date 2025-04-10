# EngWordbook
Этот гем предназначен для создания словаря по статье из интернета и вывода ее в формате таблицы в docx MS Word
## Requirements
system packages: gcc,make,ruby-psych,ruby-dev, libyaml-dev
gems: bundler
Нужен файл .env.rb который можно попросить у создателя или сделать самому,
если у вас есть ключ для Deepseek api
```bash
 module EnvVariables
  def self.set
    ENV['DS_API_KEY'] = "ваш ключ"
  end
end
```
## Installation
1. переместить .env.rb файл в lib директорию
2. выполните команды
```bash
 sudo bundle
 gem build
```

## Usage

rake


введите ссылку на сайт со статьей
введите имя ворд документа


по желанию добавьте или исключите слова из предложенных


извините, других вариантов пока нет


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/BananaFlare/eng_wordbook. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/[USERNAME]/eng_wordbook/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the EngWordbook project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/[USERNAME]/eng_wordbook/blob/master/CODE_OF_CONDUCT.md).
