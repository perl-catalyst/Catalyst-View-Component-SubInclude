package ESITest::View::TT;
use Moose;
use namespace::autoclean;

extends 'Catalyst::View::TT';
with 'Catalyst::View::Component::SubInclude';

__PACKAGE__->config(
    render_die => 1,
    TEMPLATE_EXTENSION => '.tt',
    subinclude_plugin => 'Visit',
    subinclude => {
        'HTTP::GET' => {
            class => 'HTTP',
            http_method => 'GET',
            uri_map => {
                '/cpan/' => 'http://search.cpan.org/~',
                '/github/' => 'http://github.com/',
            },
        },
    },
);

__PACKAGE__->meta->make_immutable;
1;

