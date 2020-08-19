Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5416424A851
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Aug 2020 23:16:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727125AbgHSVQz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Aug 2020 17:16:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726646AbgHSVQy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Aug 2020 17:16:54 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BEEB0C061757;
        Wed, 19 Aug 2020 14:16:53 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id w17so19265983edt.8;
        Wed, 19 Aug 2020 14:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:date:from:to:cc:message-id:in-reply-to:references;
        bh=L+xw/TvXzS5DRJVpZyjyebx0Vc5+Vwu/ASyNp17Shxw=;
        b=sXT5iDBPCqhvexexP0UNPc3NTSFzCnX6obN0oTekbXYys4YReg7gAGj4CZlHT5Wwpj
         f2rsyl1WWZFv1TizDpw+ONIRN+WPoVPUJl8v50ORRkHZknOIxSDOCLvDGUAt9Gk8Bcq0
         C8b6Mhyi0AHgEW/CG9jiEefdadwgwwKQkSlifmyCbx+wYFy56dF7XfPwOLqHr6pSl9gf
         4VkddbdAgaqdZt8/Sz3JRbpt3WrIFfsOOPTSlB8b16KHQZEBc5/ufDkgMl7me21bJEMH
         NYz3PL/aVuhIRisnGJTku+3Lgi1n3Qb4LlrRdqmKBW8MYCzrLwo+rVgrGlqNO5wCNnwx
         7gbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:date:from:to:cc:message-id:in-reply-to
         :references;
        bh=L+xw/TvXzS5DRJVpZyjyebx0Vc5+Vwu/ASyNp17Shxw=;
        b=PUpjslujFzHlFEmUnaNt/ukrE52XizrfncAem4uNLZ4RJlXC5qIHAOl6HR99Yr36lY
         dgIWjO7CIznztX+ErQ2yjnAxB0WxHBzOG6gF6h6JsNTS3oNjVz6/NWrkHea9rm8ybIH0
         1CYs7EeygxGsxPJPO3Gx9OocgPgfJMBW7tE8Q8FSswVYhQBNiCDMNpLfxn80NtttChTu
         JLnpqGpQFfe5JQIGLdKOCoqaNf6Prtd+ArvB0UYgZQ63NdCqF+LzSWdZo0aV/nZQI0Ut
         v0cm+JgZY9hRHYcauuwuIOS0lDEwFuQDHMUfvLITk10cA+bFUawa9G20YYMJVVis6GOx
         20qQ==
X-Gm-Message-State: AOAM532Fts2afU2UYS9qWWBImNrOtrqw9/xFItw4DdzD9q9zpwv86sT2
        6O26bhkJqkVtVNpStYTFuRL6kBeYzquOdbvcShU=
X-Google-Smtp-Source: ABdhPJyZ9Fpa9727PI1C6+RwTJZP1XISd5vH5YOM+f07DH3Ncyt2AUCjQtDSMUNBHgSUL4BKmLSrUA==
X-Received: by 2002:aa7:c2c6:: with SMTP id m6mr27047423edp.118.1597871811854;
        Wed, 19 Aug 2020 14:16:51 -0700 (PDT)
Received: from gmail.com (relay4.tor.ian.sh. [51.75.64.187])
        by smtp.gmail.com with ESMTPSA id fx15sm39815ejb.1.2020.08.19.14.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2020 14:16:51 -0700 (PDT)
Subject: Re: [PATCH] Makefile: Yes. Finally remove '-Wdeclaration-after-statement'
Date:   Wed, 19 Aug 2020 21:15:00 -0000
From:   Michael Witten <mfwitten@gmail.com>
To:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Ingo Molnar <mingo@kernel.org>,
        Eric Biederman <ebiederm@xmission.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        John Levon <john.levon@joyent.com>,
        John Levon <levon@movementarian.org>,
        Pavel Machek <pavel@ucw.cz>,
        David Laight <David.Laight@aculab.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Sam Ravnborg <sam@ravnborg.org>
Message-ID: <3b508e7d9d2a44079d161707819dfd88@gmail.com>
In-Reply-To: <5820d82432a0485b9a0d40bc093cfeb8@gmail.com>
References: <c6fda26e8d134264b04fadc3386d6c32@gmail.com>
  <20200816175303.GB1236603@ZenIV.linux.org.uk>
  <20200817204223.GB12414@amd>
  <87lfid6kpi.fsf@x220.int.ebiederm.org>
  <CAHk-=wj04wKCjHz6b6d7N58xoS4AftnwTUBaXsEekQ5RhfWVnw@mail.gmail.com>
  <20200817220908.GA3701@amd>
  <CAHk-=wh7Rn=8mVi_KWV71ZaQ2HrCz240DbjEJMDdARTwB3CYvA@mail.gmail.com>
  <20200818051717.GA3134537@gmail.com>
  <e986450210154d49aee1a3885d76c862@AcuMS.aculab.com>
  <61f8da080e5fac1bc23cdd68c43f199029c0a788.camel@perches.com>
  <23e2e6c2d3a24954bccb67a3186019b9@gmail.com>
  <5820d82432a0485b9a0d40bc093cfeb8@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The quick RFC patch I just proposed in the parent email is
broken in its implementation. I will submit an updated
version soon.

Michael Witten (Tue, 18 Aug 2020 22:05:00 -0000):

> I think there's an important distinction to make between
> the following 2 kinds of code:
>
>   * The curated code people just want to build.
>   * The new patches that maintainers are reviewing.
>
> Certainly, maintainers should have a wide range of tools
> at their disposal to probe the quality of a patch; then,
> after bending rules of style to taste, the maintainers
> declare the merged code to be curated, after which that
> merged code need not be probed so invasively every time
> it is built.
>
> To this end, I propose the following new patch, which
> introduces some build-time switches that will help
> people make this distinction.
>
>   As you know, you can save this email to some path:
>
>     /path/to/email.eml
>
>   Then apply and review the patch as follows:
>
>     $ cd /path/to/linux/repo
>     $ git reset --hard HEAD
>     $ git checkout --detach origin/master
>     $ git am --scissors /path/to/email.eml
>     $ git log -1 -p
>
> At this point, the patch is intended as a[n] RFC;
> I haven't tested it, and just wanted to get the
> idea out there.
>
> Sincerely,
> Michael Witten
>
> ---8<------8<------8<------8<------8<------8<------8<------8<---
> Subject: [PATCH] kbuild: Introduce "Warnings for maintainers"
> This commit introduces the following new Kconfig options:
>
>   CONFIG_MAINTAINERS_WARNINGS
>     |
>     +-> CONFIG_WARN_DECLARATION_AFTER_STATEMENT
>     |
>     +-> CONFIG_WARN_MAYBE_UNINITIALIZED
>
> These produce the following menu items:
>
>   -> Kernel hacking
>     -> Compile-time checks and compiler options
>       -> Warnings for maintainers                                [NEW]
>          * Warn about mixing variable definitions and statements [NEW]
>          * Warn about use of potentially uninitialized variables [NEW]
>
> In short:
>
>   * CONFIG_MAINTAINERS_WARNINGS
>       is the umbrella control.
>
>   * CONFIG_WARN_DECLARATION_AFTER_STATEMENT
>       determines whether "-Wdeclaration-after-statement" is used.
>
>   * CONFIG_WARN_MAYBE_UNINITIALIZED
>       determines whether "-Wmaybe-uninitialized" is used.
>
> Currently, the default is "y" for each, but it is expected that
> eventually the default will be "n" for CONFIG_MAINTAINERS_WARNINGS.
>
> Running "make" with "W=2" should turn both warnings on, unless
> they are thwarted by some other Kbuild logic.
>
> Signed-off-by: Michael Witten <mfwitten@gmail.com>
>
> [... PATCH ...]
