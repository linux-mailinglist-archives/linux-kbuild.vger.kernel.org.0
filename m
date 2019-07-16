Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A57D76A8D1
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jul 2019 14:35:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731015AbfGPMfA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jul 2019 08:35:00 -0400
Received: from outgoing-auth-1.mit.edu ([18.9.28.11]:43220 "EHLO
        outgoing.mit.edu" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726997AbfGPMfA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jul 2019 08:35:00 -0400
Received: from callcc.thunk.org (guestnat-104-133-0-99.corp.google.com [104.133.0.99] (may be forged))
        (authenticated bits=0)
        (User authenticated as tytso@ATHENA.MIT.EDU)
        by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x6GCYWYd026006
        (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 16 Jul 2019 08:34:33 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
        id EBB74420054; Tue, 16 Jul 2019 08:34:31 -0400 (EDT)
Date:   Tue, 16 Jul 2019 08:34:31 -0400
From:   "Theodore Y. Ts'o" <tytso@mit.edu>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH 4/4] debian: add generic rule file
Message-ID: <20190716123431.GB2999@mit.edu>
Mail-Followup-To: "Theodore Y. Ts'o" <tytso@mit.edu>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Robo Bot <apw@canonical.com>, Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-riscv@lists.infradead.org,
        clang-built-linux <clang-built-linux@googlegroups.com>
References: <1562664759-16009-1-git-send-email-info@metux.net>
 <1562664759-16009-4-git-send-email-info@metux.net>
 <CAK7LNAR1N-bwVWm0LXky2-d2GfvRuRrEWeo5CGm3Z2Lp_s0WEw@mail.gmail.com>
 <5af9db32-2cf5-10ba-261c-e08852d0814f@metux.net>
 <20190715191245.GD3068@mit.edu>
 <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASps6JBAvtJshjMbqMk8QaSrMaH8pm-wHsEySTRJzu0Kw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jul 16, 2019 at 05:58:49PM +0900, Masahiro Yamada wrote:
> I want debian/ to be kept as a drop-in directory
> for packagers, without replacing the upstream debian/rules.
> 
> If a check-in source file is modified in anyway,
> scripts/setlocalversion would set -dirty flag,
> which I want to avoid.

In practice, that's not going to be a problem for most distributions.
The traditional way Debian-derived systems have done builds is
completely outside of git.  So there will be a linux_5.2.orig.tar.gz
and a linux_5.2-1.debian.tar.xz.  dpkg_source -x will first unpackage
the orig.tar.gz, and then the debian.tar.xz, and if the second
overwrites the first, it's no big deal.

More modern Debian package maintainer workflows may be using git, but
in that case, all of the "Debianizations" are reflected in a separate
branch.  So it's not going to set the -dirty flag.

There will be potential merge conflicts between Enrico's proposed
"upstream default debian/rules" file and the Debian/Ubuntu
debian/rules file on their distro branch.  However, I don't think
that's a big issue, for two reasons.

First, once it's checked in, I expect changes to the default
debian/rules file will be relatively rare.  Secondly, it's easy enough
to use gitattributes and defining a custom merge driver so that a
distribution can configure things so that they always use the version
of debian/rules from their branch, so the merge conflict resolution
can be set up to always do the right thing.

There are certainly other upstreams which ship their own debian/
directories.  E2fsprogs is one such example, but in that case I'm
cheating because I'm both the Debian package maintainer as well as the
upstream maintainer.  :-)   However, it's never been an issue for Ubuntu
when they choose to ship their own customized debian/rules file.

> debian/rules is a hook for packagers to do their jobs in downstream.
> "We kindly committed a generic one for you" sounds weird to me.

It is weird, and it's not common for upstream packages (which are not
native Debian packages) to ship their own debian directory.  But it
certainly does happen, and it won't cause any problems in actual
practice.

Regards,

					- Ted
