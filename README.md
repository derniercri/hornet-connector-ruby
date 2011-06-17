# Hornet Ruby Connector

## Description

[Hornet](https://github.com/nectify/hornet) is a realtime engine that let you enhance your web application by connecting users together. [Hornet](https://github.com/nectify/hornet) is a publish/suscribe extremely easy to use, secure and scalable. Well, [Hornet](https://github.com/nectify/hornet) will also integrates very well your own existing application, no matter what language or framework you're using.

[Hornet](https://github.com/nectify/hornet) is powered by NodeJs, Socket.io and backed by Redis.

The current library is a connector, a piece of software that will make your application able to talk with [Hornet](https://github.com/nectify/hornet). 

### Hornet Philosophy, core engine and connectors

Hornet is intented to act as a hub for your existing web application, offering the possibility to keep a pool of connected users and broadcasting messages to them in realtime.

When a client access a page with realtime features on it, your web application will generates a connection token to subscribe to a hornet channel. This job is done by an hornet connector.

When you want to broadcast a message to a specific channel, you'll also use the hornet connector to publish it. Hornet core engines will be notified by this new message and transfer it to subscribed clients.

## Connector Installation

Add the following dependency in your Gemfile:

  gem "hornet-connector-ruby"

## License

This project is distributed under Apache 2 License. See LICENSE.txt for more information.

