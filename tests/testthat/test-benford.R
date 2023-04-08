
context('Testa o tipo e a classe do retorno')
test_that("retorne um objeto da classe benford", {
  x<-sample(1:1000,100)
  testthat::expect_s3_class(benford(x),'benford')
})

test_that("retorne um objeto do tipo lista", {
 x<-sample(1:1000,100)
 testthat::expect_type(benford(x),'list')
})
