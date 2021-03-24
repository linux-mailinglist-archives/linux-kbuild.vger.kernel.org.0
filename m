Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACF4F3479FB
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 14:55:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235647AbhCXNy3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 09:54:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:50710 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235430AbhCXNyT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 09:54:19 -0400
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com [66.24.58.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9FD53619BB;
        Wed, 24 Mar 2021 13:54:18 +0000 (UTC)
Date:   Wed, 24 Mar 2021 09:54:17 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "John (Warthog9) Hawley" <warthog9@kernel.org>
Subject: Re: [PATCH 2/2] streamline_config.pl: Add softtabstop=4 for vim
 users
Message-ID: <20210324095417.49c6377b@gandalf.local.home>
In-Reply-To: <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
References: <20210322213806.089334551@goodmis.org>
        <20210322214032.293992979@goodmis.org>
        <CAK7LNAQh=zKVTwup5Kh39oTnVEUNotX-Ce7_+2uRO1GNVOaDbw@mail.gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 24 Mar 2021 15:01:13 +0900
Masahiro Yamada <masahiroy@kernel.org> wrote:

> On Tue, Mar 23, 2021 at 6:40 AM Steven Rostedt <rostedt@goodmis.org> wrote:
> >
> > From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> >
> > The tab stop for Perl files is by default (at least in emacs) to be 4
> > spaces, where a tab is used for all 8 spaces. Add a local variable comment
> > to make vim do the same by default, and this will help keep the file
> > consistent in the future when others edit it via vim and not emacs.
> >
> > Signed-off-by: Steven Rostedt (VMware) <rostedt@goodmis.org>  
> 
> 
> Documentation/process/coding-style.rst says "do not do this".

I take that file more as for C code, never took it for Perl ;-)

> 
> Rather, I want to remove this ugly stuff entirely.
> https://lore.kernel.org/patchwork/patch/1401439/

And I totally agree it does not belong in C code.

> 
> Adding .editorconfig seems OK to me, but
> Doing this in individual files in an editor-specific
> manner is a horror.

Is there a way to add this for the directory?

The reason I added this was because of the different ways that vim and
emacs handle Perl files. I just added this to ktest.pl because I want it to
be consistent.

The emacs way to edit Perl is to have 4 space indentation, but use tabs for
every 8 spaces. That is, you have:

    (4 spaces)
	(1 tab)
	    (1 tab and 4 spaces)
		(2 tabs)
		    (2 tabs and 4 spaces)

etc.

What I found from people who edit Perl code is that they will either just
indent 8 (with tabs), or just use all spaces. Then you have:

	    (1 tab and 4 spaces)
            (followed by 12 spaces!)

The way to make vim work the same is to add the softtabspace=4 command.

We can not add this, but then have to either police the patches coming in,
or constantly clean up the code after the fact.

This code doesn't change much, so I'm fine with that. But for ktest.pl, I'm
adding it.

-- Steve
