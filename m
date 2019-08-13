Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32BD38BFF1
	for <lists+linux-kbuild@lfdr.de>; Tue, 13 Aug 2019 19:51:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727960AbfHMRvD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 13 Aug 2019 13:51:03 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39918 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfHMRvD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 13:51:03 -0400
Received: by mail-pf1-f195.google.com with SMTP id f17so48025525pfn.6
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Aug 2019 10:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bYvJDB8ENVMXI7xYb0Ylsc0wziPDSy3JqRQOkU0CNB4=;
        b=wG3a3k31jsSF6BIw8bkJXaJI2NxjB+fdjeiW5Z94mwfwqnNKU5XLNXf7GJUmwneh8F
         3+4lVI1GRH9lQcxHScomTp5mrcJRuXuQVeD3Q6mE1zSKDCCLbx1i0wEdWhs3iVc2YdTd
         xhd8H8X9oAwqxtZKRsyozKJT6lA88T1G3bLtDBTqY2QDZpMR5nNvUx2koCL6DcD7N5qG
         1YPcyP3wEqDe/BuBfxdbVpfCm/P7lXjphsb1sUO676202tsqc3ygNmA76O+a2OozdwKB
         fWvA1i8dioD1rmDgz+0bCKYcYA/IxVXl3eUAT80SGOsC2d6bSuuL0sz3Tb9bEvGaQKlH
         nHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bYvJDB8ENVMXI7xYb0Ylsc0wziPDSy3JqRQOkU0CNB4=;
        b=Nr2isz5oY2IR9G1PLNM02nAVj+XSQdPzd0RoGIEa/wxawiAt5ckYSl29sme+yXKfXY
         jIvfHlRw8g1uGS4hCLl14GOM0q3Nwiq6y0xpov6JoICIH2XpOP1F12RGBFv0qo1oi/4L
         XVRDqh+5IddUaCACKRruSu+mHDGXwvtS+wVqQx8hv8KPGyLJpxoZdjCibcFethkNEV3T
         ZcBI2ovGQUsJKIK5FlEgUKGhNy9M82ChoD2nyL3mjysvIIBPMgOVxyYwkE6hf1ZOg9A2
         myh813Gs8hzWzuCfam7MQgqr2nLpORD6N1hofwHq8lkjtLzVeedDg5NSyAkGtNGPmEqK
         fWew==
X-Gm-Message-State: APjAAAW0/nmTRp/EoytR/wNHvzOox6zD0kQui4KbxKVKPTpGWL1YDNPI
        Jpk0abuSvVVnQNgjZ56ud7zikN8+OOgo1KmmPqYueg==
X-Google-Smtp-Source: APXvYqxrLaoMidJUTH3HR3ySeiZBysRXGkgA8Tfb3y1r5OWM88+G8mJO83zwubWmBlkV2gYuE+Son415m2aWs0YE6pQ=
X-Received: by 2002:aa7:8f2e:: with SMTP id y14mr12892823pfr.113.1565718661800;
 Tue, 13 Aug 2019 10:51:01 -0700 (PDT)
MIME-Version: 1.0
References: <cover.92d76bb4f6dcedc971d0b72a49e8e459a98bca54.1565676440.git-series.knut.omang@oracle.com>
 <CAFd5g47bK2hv6dRvqE3hOyq-FrgrR8NJo__HonHFoYOOMkWh6w@mail.gmail.com> <b4d2cf8635103e30313773761b095f3a1cfd9a82.camel@oracle.com>
In-Reply-To: <b4d2cf8635103e30313773761b095f3a1cfd9a82.camel@oracle.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 13 Aug 2019 10:50:49 -0700
Message-ID: <CAFd5g47Q+bRQfyyqPx7CvcnUWnpDxO9goXtEaH8U4EWLbmhFUA@mail.gmail.com>
Subject: Re: [RFC 00/19] Integration of Kernel Test Framework (KTF) into the
 kernel tree
To:     Knut Omang <knut.omang@oracle.com>
Cc:     "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Shreyans Devendra Doshi <0xinfosect0r@gmail.com>,
        Alan Maguire <alan.maguire@oracle.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Hidenori Yamaji <hidenori.yamaji@sony.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Timothy Bird <Tim.Bird@sony.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Daniel Vetter <daniel@ffwll.ch>,
        Stephen Boyd <sboyd@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 13, 2019 at 4:29 AM Knut Omang <knut.omang@oracle.com> wrote:
>
> On Tue, 2019-08-13 at 01:17 -0700, Brendan Higgins wrote:
> > On Mon, Aug 12, 2019 at 11:11 PM Knut Omang <knut.omang@oracle.com> wrote:
> > [...]
> > > Alan Maguire (3):
> > >   ktf: Implementation of ktf support for overriding function entry and return.
> > >   ktf: A simple debugfs interface to test results
> > >   ktf: Simple coverage support
> > >
> > > Knut Omang (16):
> > >   kbuild: Fixes to rules for host-cshlib and host-cxxshlib
> > >   ktf: Introduce the main part of the kernel side of ktf
> > >   ktf: Introduce a generic netlink protocol for test result communication
> > >   ktf: An implementation of a generic associative array container
> > >   ktf: Configurable context support for network info setup
> > >   ktf: resolve: A helper utility to aid in exposing private kernel symbols to KTF tests.
> > >   ktf: Add documentation for Kernel Test Framework (KTF)
> > >   ktf: Add a small test suite with a few tests to test KTF itself
> > >   ktf: Main part of user land library for executing tests
> > >   ktf: Integration logic for running ktf tests from googletest
> > >   ktf: Internal debugging facilities
> > >   ktf: Some simple examples
> > >   ktf: Some user applications to run tests
> > >   ktf: Toplevel ktf Makefile/makefile includes and scripts to run from kselftest
> > >   kselftests: Enable building ktf
> > >   Documentation/dev-tools: Add index entry for KTF documentation
> > >
> > >  Documentation/dev-tools/index.rst                   |    1 +-
> > >  Documentation/dev-tools/ktf/concepts.rst            |  242 +++-
> > >  Documentation/dev-tools/ktf/debugging.rst           |  248 +++-
> > >  Documentation/dev-tools/ktf/examples.rst            |   26 +-
> > >  Documentation/dev-tools/ktf/features.rst            |  307 ++++-
> > >  Documentation/dev-tools/ktf/implementation.rst      |   70 +-
> > >  Documentation/dev-tools/ktf/index.rst               |   14 +-
> > >  Documentation/dev-tools/ktf/installation.rst        |   73 +-
> > >  Documentation/dev-tools/ktf/introduction.rst        |  134 ++-
> > >  Documentation/dev-tools/ktf/progref.rst             |  144 ++-
> > >  scripts/Makefile.host                               |   17 +-
> > >  tools/testing/selftests/Makefile                    |    1 +-
> > >  tools/testing/selftests/ktf/Makefile                |   21 +-
> > >  tools/testing/selftests/ktf/examples/Makefile       |   17 +-
> > >  tools/testing/selftests/ktf/examples/h2.c           |   45 +-
> > >  tools/testing/selftests/ktf/examples/h3.c           |   84 +-
> > >  tools/testing/selftests/ktf/examples/h4.c           |   62 +-
> > >  tools/testing/selftests/ktf/examples/hello.c        |   38 +-
> > >  tools/testing/selftests/ktf/examples/kgdemo.c       |   61 +-
> > >  tools/testing/selftests/ktf/kernel/Makefile         |   15 +-
> > >  tools/testing/selftests/ktf/kernel/ktf.h            |  604 +++++++-
> > >  tools/testing/selftests/ktf/kernel/ktf_context.c    |  409 +++++-
> > >  tools/testing/selftests/ktf/kernel/ktf_cov.c        |  690 ++++++++-
> > >  tools/testing/selftests/ktf/kernel/ktf_cov.h        |   94 +-
> > >  tools/testing/selftests/ktf/kernel/ktf_debugfs.c    |  356 ++++-
> > >  tools/testing/selftests/ktf/kernel/ktf_debugfs.h    |   34 +-
> > >  tools/testing/selftests/ktf/kernel/ktf_map.c        |  261 +++-
> > >  tools/testing/selftests/ktf/kernel/ktf_map.h        |  154 ++-
> > >  tools/testing/selftests/ktf/kernel/ktf_netctx.c     |  132 ++-
> > >  tools/testing/selftests/ktf/kernel/ktf_netctx.h     |   64 +-
> > >  tools/testing/selftests/ktf/kernel/ktf_nl.c         |  516 ++++++-
> > >  tools/testing/selftests/ktf/kernel/ktf_nl.h         |   15 +-
> > >  tools/testing/selftests/ktf/kernel/ktf_override.c   |   45 +-
> > >  tools/testing/selftests/ktf/kernel/ktf_override.h   |   15 +-
> > >  tools/testing/selftests/ktf/kernel/ktf_test.c       |  397 +++++-
> > >  tools/testing/selftests/ktf/kernel/ktf_test.h       |  381 ++++-
> > >  tools/testing/selftests/ktf/kernel/ktf_unlproto.h   |  105 +-
> > >  tools/testing/selftests/ktf/lib/Makefile            |   21 +-
> > >  tools/testing/selftests/ktf/lib/ktf.h               |  114 +-
> > >  tools/testing/selftests/ktf/lib/ktf_debug.cc        |   20 +-
> > >  tools/testing/selftests/ktf/lib/ktf_debug.h         |   59 +-
> > >  tools/testing/selftests/ktf/lib/ktf_int.cc          | 1031 ++++++++++++-
> > >  tools/testing/selftests/ktf/lib/ktf_int.h           |   84 +-
> > >  tools/testing/selftests/ktf/lib/ktf_run.cc          |  177 ++-
> > >  tools/testing/selftests/ktf/lib/ktf_unlproto.c      |   21 +-
> > >  tools/testing/selftests/ktf/scripts/ktf_syms.mk     |   16 +-
> > >  tools/testing/selftests/ktf/scripts/resolve         |  188 ++-
> > >  tools/testing/selftests/ktf/scripts/runtests.mk     |    3 +-
> > >  tools/testing/selftests/ktf/scripts/runtests.sh     |  100 +-
> > >  tools/testing/selftests/ktf/scripts/top_make.mk     |   14 +-
> > >  tools/testing/selftests/ktf/selftest/Makefile       |   17 +-
> > >  tools/testing/selftests/ktf/selftest/context.c      |  149 ++-
> > >  tools/testing/selftests/ktf/selftest/context.h      |   15 +-
> > >  tools/testing/selftests/ktf/selftest/context_self.h |   34 +-
> > >  tools/testing/selftests/ktf/selftest/hybrid.c       |   35 +-
> > >  tools/testing/selftests/ktf/selftest/hybrid.h       |   24 +-
> > >  tools/testing/selftests/ktf/selftest/hybrid_self.h  |   27 +-
> > >  tools/testing/selftests/ktf/selftest/ktf_syms.txt   |   17 +-
> > >  tools/testing/selftests/ktf/selftest/self.c         |  661 ++++++++-
> > >  tools/testing/selftests/ktf/user/Makefile           |   26 +-
> > >  tools/testing/selftests/ktf/user/hybrid.cc          |   39 +-
> > >  tools/testing/selftests/ktf/user/ktfcov.cc          |   68 +-
> > >  tools/testing/selftests/ktf/user/ktfrun.cc          |   20 +-
> > >  tools/testing/selftests/ktf/user/ktftest.cc         |   46 +-
> > >  64 files changed, 8909 insertions(+), 9 deletions(-)
> >
> > It also looks like all your test code lives outside of the kernel
> > source dir. I take it you intend for tests to live in
> > tools/testing/selftests/ktf/ ?
>
> Good point,
> with this RFC it would be just to add another directory under ktf/
> but this was just to find a simple way to integrate it below selftests,
> without interfering with the current structure.
>
> I imagine a tighter integration/unification between normal Kbuild targets and selftests
> targets that also took kernel module building into consideration would be a better solution.

I think tests should live alongside the code that they test, so if I
understand what you are saying, then I agree. Where do you think KTF
should go then?

> I think this is a good topic for discussion.
> As I indicate above, I think it is problematic that test code has to be explicitly
> configured in as we configure code features of the kernel, which changes the "logical"
> kernel we build.

Yep, Luis Chamberlain and I have been discussing this for a while (I
should probably try to open up that conversation and add you to it);
it's a very tricky problem. I think that in the long term a good goal
is to have a way to express code dependencies separate from the
configuration system, but that would probably mean some substantial
changes to Kbuild and friends. Even then, we have all these macros
that generate different code (not just on/off) depending on how the
kernel is configured.

> So some more "native" support for test modules are desired, IMHO.

What do you mean by "native"? Just having the tests be more aware of the code?
