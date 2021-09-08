Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81ED8403D6A
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 18:12:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348078AbhIHQNo (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Sep 2021 12:13:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:37344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230091AbhIHQNn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Sep 2021 12:13:43 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DBCBC6113E;
        Wed,  8 Sep 2021 16:12:33 +0000 (UTC)
Date:   Wed, 8 Sep 2021 12:12:29 -0400
From:   Steven Rostedt <rostedt@goodmis.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>, llvm@lists.linux.dev,
        LSM List <linux-security-module@vger.kernel.org>,
        linux-toolchains@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Kees Cook <keescook@chromium.org>,
        Mark Brown <broonie@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vipin Sharma <vipinsh@google.com>,
        Chris Down <chris@chrisdown.name>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Vlastimil Babka <vbabka@suse.cz>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel
 builds"
Message-ID: <YTjg7T4HI+pA4hI4@home.goodmis.org>
References: <20210907183843.33028-1-ndesaulniers@google.com>
 <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 07, 2021 at 12:16:22PM -0700, Linus Torvalds wrote:
> 
> That's the POINT of that commit. That "but but but I have thousands of
> warnings" is not acceptable.

I'm actually surprised you did this after the discussion with gcc warning
about using "main" as a local variable.

> My "no warnings" policy isn't exactly new, and people shouldn't be
> shocked when I then say "time to clean up *YOUR* house too".

Note, ktest has a way to create a list of current warnings, and then test your
code against it, and will fail on any new warning. I run this on all my pull
requests to make sure that I do not introduce any new warnings.

That said, I still get bug reports on various configs that I did not test,
where my code introduces a warning. I hate to be the one that fails their
builds.

It's not the configs that have something enabled, its the configs that have
something not enabled, where another config depends on it.

I'm not against the -Werror. I just don't want to be changing local variables
called "main" because it breaks someones build due to some daft warning that
the compiler is emitting.

-- Steve

