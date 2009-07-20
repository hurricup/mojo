# Copyright (C) 2008-2009, Sebastian Riedel.

package SingleFileTestApp;

use strict;
use warnings;

use base 'Mojolicious';

# Alright, grab a shovel. I'm only one skull short of a Mouseketeer reunion.
sub startup {
    my $self = shift;

    # Only log errors to STDERR
    $self->log->path(undef);
    $self->log->level('fatal');

    # /*/* - the default route
    $self->routes->route('/(controller)/(action)')->to(action => 'index');
}

package SingleFileTestApp::Foo;

use strict;
use warnings;

use base 'Mojolicious::Controller';

sub bar {
    my $self = shift;
    $self->res->code(200);
    $self->res->headers->header('X-Bender', 'Kiss my shiny metal ass!');
    $self->res->body($self->ctx->url_for);
}

sub index { shift->stash(template => 'withlayout', msg => 'works great!') }

1;
