OpenCensus Proto - Language Independent Interface Types For OpenCensus
===============================================================
[![Build Status][travis-image]][travis-url]
[![Maven Central][maven-image]][maven-url]

Census provides a framework to define and collect stats against metrics and to
break those stats down across user-defined dimensions.

The Census framework is natively available in many languages (e.g. C++, Go,
and Java). The API interface types are defined using protos to ensure
consistency and interoperability for the different implementations.

## Quickstart

### Install to Go

```bash
$ go get -u github.com/census-instrumentation/opencensus-proto
```

### Add the dependencies to your Java project

For Maven add to `pom.xml`:
```xml
<dependency>
  <groupId>io.opencensus</groupId>
  <artifactId>opencensus-proto</artifactId>
  <version>0.0.2</version>
</dependency>
```

For Gradle add to dependencies:
```gradle
compile 'io.opencensus:opencensus-proto:0.0.2'
```

[travis-image]: https://travis-ci.org/census-instrumentation/opencensus-proto.svg?branch=master
[travis-url]: https://travis-ci.org/census-instrumentation/opencensus-proto
[maven-image]: https://maven-badges.herokuapp.com/maven-central/io.opencensus/opencensus-proto/badge.svg
[maven-url]: https://maven-badges.herokuapp.com/maven-central/io.opencensus/opencensus-proto
