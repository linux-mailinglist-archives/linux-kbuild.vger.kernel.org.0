Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F52E79D9CA
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 Sep 2023 21:52:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232087AbjILTwp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 Sep 2023 15:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjILTwo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 Sep 2023 15:52:44 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2BF19115
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2023 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694548314;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SpkWIcywOI7EUaXHnJ48FH2b2w1/1CU3c8x4AKomLQ0=;
        b=ZV68cOa69BRKq1+OSdHMARewe1qK0MTeXRUaFQYJ7huTM/L1q5zBvhImofRs1mHy38QEqu
        f/oYd7djKO9yyjtfJckscptdM3H+wmOyOf+lRi020z/v+zCKZpAL3s3xL9LY4SkmIc+wIu
        xUAgAYvxaveStLEtWyrG8SKVO8T9hm4=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-114-ZySitXMNPGyfOK5XSTeVVg-1; Tue, 12 Sep 2023 15:51:53 -0400
X-MC-Unique: ZySitXMNPGyfOK5XSTeVVg-1
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-6b9c82f64b7so5095373a34.3
        for <linux-kbuild@vger.kernel.org>; Tue, 12 Sep 2023 12:51:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694548312; x=1695153112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SpkWIcywOI7EUaXHnJ48FH2b2w1/1CU3c8x4AKomLQ0=;
        b=joECJ9FNTyidISV/6m7amBMHHBM8I6t9ZFyJ+239I6O7qeDDYiFS22lFVL3wl9AeVm
         vM3njLAOyRnk9hlY7RFlA5NYLPKn06B6BECfU1RsHqluBD3sla+DwR84Lc1A+P7CCWVy
         oDk3mM7PkLzl0XRuvclUF6mqjG/usjsFyO23E1dyVWDgbeneiKOb2z5NrsZyR4tyth1t
         7VkvjGyk8S0Kpmy4ALqRb26WQMVtF/zTrn6DZ94vuoeUnpDEJlHqXfg4PozHVvOR+/DR
         x5OM0CHiZRWusbj6XS0/q1/atoDNdZZjB5DS8NkidMxablEYD8+QWsKnKRHslTOrWbmz
         HYew==
X-Gm-Message-State: AOJu0Yza5m967BzkUu51PsjLvNwq165T2EEr++lCXk3U8JI+QdLGnG+A
        g4ojMcst0fvaFEkZo1KaTMVdExdULGjTYVpZ8kcus0PhM7PZmLb2rD6tpNQkgBGN6Zc1lHbeziZ
        YMEZ1EZ2IHNxda3Sg3FyAh0Tm
X-Received: by 2002:a05:6830:1d3:b0:6b9:b600:536 with SMTP id r19-20020a05683001d300b006b9b6000536mr821560ota.27.1694548312281;
        Tue, 12 Sep 2023 12:51:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLcOQy8bFVn8sA9vJ1pUoD8G2TGNTzqPyeqA0tILJqjfnqd5tE1niPmNXR3IvjaMgBpquM2w==
X-Received: by 2002:a05:6830:1d3:b0:6b9:b600:536 with SMTP id r19-20020a05683001d300b006b9b6000536mr821548ota.27.1694548312051;
        Tue, 12 Sep 2023 12:51:52 -0700 (PDT)
Received: from redhat.com ([2804:1b3:a803:c91:da45:7fbc:86c3:920a])
        by smtp.gmail.com with ESMTPSA id p65-20020a4a4844000000b005734f40f89fsm4696575ooa.12.2023.09.12.12.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 12:51:51 -0700 (PDT)
Date:   Tue, 12 Sep 2023 16:51:47 -0300
From:   Leonardo Bras <leobras@redhat.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: Re: [RFC PATCH v2 1/1] scripts: Introduce a default git.orderFile
Message-ID: <ZQDBU7BcIe7XKWGz@redhat.com>
References: <20230911234418.38154-2-leobras@redhat.com>
 <CAK7LNASKRoxLwz1jvsbbxv0=JQtySG4O7eN2+_PT6q20G7YT9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK7LNASKRoxLwz1jvsbbxv0=JQtySG4O7eN2+_PT6q20G7YT9g@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Sep 12, 2023 at 04:53:11PM +0900, Masahiro Yamada wrote:
> On Tue, Sep 12, 2023 at 8:45 AM Leonardo Bras <leobras@redhat.com> wrote:
> >
> > When reviewing patches, it looks much nicer to have some changes shown
> > before others, which allow better understanding of the patch before the
> > the .c files reviewing.
> >
> > Introduce a default git.orderFile, in order to help developers getting the
> > best ordering easier.
> >
> > Signed-off-by: Leonardo Bras <leobras@redhat.com>
> > ---
> >
> > Please provide feedback on what else to add / remove / reorder here!
> >
> > Changes since RFCv1:
> > - Added Kconfig* (thanks Randy Dunlap!)
> > - Changed Kbuild to Kbuild* (improve matching)
> >
> >  scripts/git.orderFile | 32 ++++++++++++++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 scripts/git.orderFile
> >
> > diff --git a/scripts/git.orderFile b/scripts/git.orderFile
> > new file mode 100644
> > index 000000000000..819f0a957fe3
> > --- /dev/null
> > +++ b/scripts/git.orderFile
> > @@ -0,0 +1,32 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +
> 
> 
> Please use "# SPDX-License-Identifier: GPL-2.0".
> 
> /* ... */ is not a valid comment style for the orderfile.

Oh, you are right.
My bad, it was a last minute change.

> 
> 
> 
> 
> > +# order file for git, to produce patches which are easier to review
> > +# by diffing the important stuff like header changes first.
> > +#
> > +# one-off usage:
> > +#   git diff -O scripts/git.orderfile ...
> > +#
> > +# add to git config:
> > +#   git config diff.orderFile scripts/git.orderfile
> 
> 
> These comments are bogus.
> 
> 
> I guess this comment header was copied from QEMU,

Yes, I tried to adapt it from QEMU to kernel needs.


> but you changed the file path
> from scripts/git.orderfile to scripts/git.orderFile.
> 
> 
> You need to adjust the comment lines to
> 
> 
>     git diff -O scripts/git.orderFile ...
> 
>     git config diff.orderFile scripts/git.orderFile
> 
>

Adjusted, thanks!
 
> 
> Or, you need to get the file path back to scripts/git.orderfile
> 
> 
> 
> 
> 
> 
> 
> 
> > +#
> > +
> > +MAINTAINERS
> > +
> > +# Documentation
> > +Documentation/*
> > +*.rst
> > +
> > +# build system
> > +Kbuild*
> > +Kconfig*
> > +Makefile*
> 
> 
> Kbuild* and Makefile* are interchangeable.
> (both are for GNU Make)
> 
> Kconfig* are different types.
> 
> 
> Better to arrange the order to
> 
> Kconfig*
> Kbuild*
> Makefile*
> 
> 

Oh, that makes sense.
Done!

> 
> 
> 
> > +*.mak
> 
> QEMU consistently uses only *.mak.
> 
> I just realized the kernel tree uses both *.mak and *.mk
> 
> masahiro@zoe:~/ref/linux(master)$ find .  -name '*.mak'
> ./tools/scripts/utilities.mak
> masahiro@zoe:~/ref/linux(master)$ find .  -name '*.mk'
> ./tools/testing/selftests/lib.mk
> ./tools/testing/selftests/ptp/testptp.mk

Sure, I will add '*.mk' after '*.mak', getting:

# build system
Kconfig*
Kbuild*
Makefile*
*.mak
*.mk


> 
> 
> 
> 
> 
> BTW, I quickly tested this, but
> it did not work as I expected.
> 
> 
> 
> 
> 
> masahiro@zoe:~/ref/linux(aaa)$ git diff --name-only d34599b^..d34599b
> MAINTAINERS
> drivers/Kconfig
> drivers/Makefile
> drivers/cache/Kconfig
> drivers/cache/Makefile
> drivers/cache/ax45mp_cache.c
> 
> masahiro@zoe:~/ref/linux(aaa)$ git diff --name-only -O
> scripts/git.orderFile d34599b^..d34599b
> MAINTAINERS
> drivers/cache/ax45mp_cache.c
> drivers/Kconfig
> drivers/Makefile
> drivers/cache/Kconfig
> drivers/cache/Makefile
> 
> masahiro@zoe:~/ref/linux(aaa)$ git diff --name-only -O
> scripts/git.orderFile d34599b..d34599b^
> MAINTAINERS
> drivers/cache/ax45mp_cache.c
> drivers/Kconfig
> drivers/Makefile
> drivers/cache/Kconfig
> drivers/cache/Makefile
> 
> 
> 
> 
> 
> My expectation was the following:
> 
> MAINTAINERS
> drivers/Kconfig
> drivers/cache/Kconfig
> drivers/Makefile
> drivers/cache/Makefile
> drivers/cache/ax45mp_cache.c
> 
> 
> It did not work like that.
> Am I missing something?

I can reproduce this same behavior for this commit list, and this is odd.

When I added a line-end at the .c extension, it works as expected:

*.c$

I think this makes sense. 
Just to make sure, I will add an line-end at every pattern with extension:

*.h$
*.c$
*.mk$

and so on.
Does that work for you?


I will send a v3 soon.
Thanks!
Leo

> 
> 
> 
> 
> 
> > +
> > +# semantic patches
> > +*.cocci
> > +
> > +# headers
> > +*.h
> > +
> > +# code
> > +*.c
> > --
> > 2.42.0
> >
> 
> 
> 
> 
> 
> -- 
> Best Regards
> Masahiro Yamada
> 

