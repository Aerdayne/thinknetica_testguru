class GistQuestionService
  def initialize(question, client = default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    Result.new(@client.create_gist(gist_params))
  end

  class Result
    attr_reader :html_url

    def initialize(result)
      @html_url = result[:html_url]
    end

    def success?
      @html_url
    end
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist.description', title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.content]
    content += @question.answers.pluck(:content)
    content.join("\n")
  end


  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_ACCESS_TOKEN'])
  end
end
