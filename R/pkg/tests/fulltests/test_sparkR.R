#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

context("functions in sparkR.R")

test_that("sparkCheckInstall", {
  # "local, yarn-client" mode, SPARK_HOME was set correctly,
  # and the SparkR job was submitted by "spark-submit"
  sparkHome <- paste0(tempdir(), "/", "sparkHome")
  dir.create(sparkHome)
  master <- ""
  deployMode <- ""
  expect_true(is.null(sparkCheckInstall(sparkHome, master, deployMode)))
  unlink(sparkHome, recursive = TRUE)

  # "yarn-cluster" mode, SPARK_HOME was not set,
  # and the SparkR job was submitted by "spark-submit"
  sparkHome <- ""
  master <- ""
  deployMode <- ""
  expect_true(is.null(sparkCheckInstall(sparkHome, master, deployMode)))

  # "yarn-client" mode, SPARK_HOME was not set
  sparkHome <- ""
  master <- "yarn"
  deployMode <- "client"
  expect_error(sparkCheckInstall(sparkHome, master, deployMode))
  sparkHome <- ""
  master <- ""
  deployMode <- "client"
  expect_error(sparkCheckInstall(sparkHome, master, deployMode))
})
