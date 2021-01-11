tasks:
  compile: => for file in wildcard "*.lua" do sh "moonc #{file}" unless file == "Alfons.moon"
  make:    => sh "rockbuild -m --delete #{@v}" if @v
  release: => sh "rockbuild -m -t #{@v} u"     if @v
  clean:   => for file in wildcard "*.lua" do fs.delete file
  test:    => sh "cat test/table.txt | tableview > test/table.html"