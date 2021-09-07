Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6766440312E
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Sep 2021 00:50:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344607AbhIGWvs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 7 Sep 2021 18:51:48 -0400
Received: from gate.crashing.org ([63.228.1.57]:34906 "EHLO gate.crashing.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1344396AbhIGWvs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 7 Sep 2021 18:51:48 -0400
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 187MgSFs013086;
        Tue, 7 Sep 2021 17:42:29 -0500
Received: (from segher@localhost)
        by gate.crashing.org (8.14.1/8.14.1/Submit) id 187MgRGq013085;
        Tue, 7 Sep 2021 17:42:27 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date:   Tue, 7 Sep 2021 17:42:27 -0500
From:   Segher Boessenkool <segher@kernel.crashing.org>
To:     Marco Elver <elver@google.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        llvm@lists.linux.dev,
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
Subject: Re: [PATCH] Revert "Enable '-Werror' by default for all kernel builds"
Message-ID: <20210907224227.GL1583@gate.crashing.org>
References: <20210907183843.33028-1-ndesaulniers@google.com> <CAHk-=whJOxDefgSA1_ojGbweRJGonWX9_nihA-=fbXFV1DhuxQ@mail.gmail.com> <CAKwvOdkuYoke=Sa8Qziveo9aSA2zaNWEcKW8LZLg+d3TPwHkoA@mail.gmail.com> <YTfkO2PdnBXQXvsm@elver.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YTfkO2PdnBXQXvsm@elver.google.com>
User-Agent: Mutt/1.4.2.3i
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 08, 2021 at 12:14:19AM +0200, Marco Elver wrote:
> Here's a datapoint: I had to disable CONFIG_WERROR on a bunch of syzbot
> instances which started failing because of -Werror [1], because syzbot's
> time is better spent on fuzzing, and having the odd warning in some
> subsystem penalize fuzzing of the entire kernel is not appropriate.

Similarly, I have to disable -Werror (which various archs and subsystems
already use) whenever I test building the kernel with new toolchains.
It is the biggest set of kernel patches I keep, already, since many
years.

I actually have good hopes that a centralised -Werror thing will make
this easier :-)

Maybe there can be an E=[01] kernel build flag to disable / enable
CONFIG_WERROR?  Something that will override it for just that command.
This would make life easier for many use cases, while at the same time
not being something that people can "forget" they did.


Segher
