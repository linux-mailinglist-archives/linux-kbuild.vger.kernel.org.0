Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2994E1B188B
	for <lists+linux-kbuild@lfdr.de>; Mon, 20 Apr 2020 23:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726017AbgDTVjV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Apr 2020 17:39:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726828AbgDTVjT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 17:39:19 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9A42C061A0C
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 14:39:16 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id v10so1485609qvr.2
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 14:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=wzoQ8wJxvFhV344X9PJvX5TTrX/IwRx/mNK5Ox4iO9E=;
        b=fg7nmJ0/lCD3NAGktYNMgs1Taa5sCjIqBkT+XDP8OqF52oZYyhh4fJHSekyf8ZWT7j
         jiqI1kfyfgqRRJboQE6nxFxPLuG/ZgimOXLVIfAr/G7/kdMZog0rYRUb0hmDwSBKcewU
         W/iAK44r6kdXwcjrfWPUnpMEZZ/QTjaWBMkmn5WOIOjzBM76aCXti4TsIQOWjmlOjuAg
         G8777grL9z1RfqXD/A+Bf3LB7tXN4bAfv/6JLf0WI8Zyydaz0qqPKuPjg8SFp8XbixEk
         7E54YsoXyNkeXEA4382qJOTbVd98CsnJUqE64Z7W9d+uamI1HXccoqfl+ZPKIWGklBxO
         018Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=wzoQ8wJxvFhV344X9PJvX5TTrX/IwRx/mNK5Ox4iO9E=;
        b=lrMrbavM6UmhD/gnCG1H8JZXLiICXGs0z7GzfOfrUsWh3UW94Uy6LxOOlgcURSccgz
         b4TWQYQkqwLlQrh8PbVuCfyl52ee9aCpUofrcu27F5HywXitqP1IocQeYGPuhUWKDhqz
         HAawRy2Q5Fm+/Wl7zghuDayYQjtbd+5OM2Gy5sKwRxw6doOWw25mtumTHBuJB/ff30+m
         ED/TkAlfPWhKEGB4YctV9dzHxH6ka89CIwcCaspWB1P5fhIN0/iRyNn6/K/IzULssfxA
         rzc/DwCx41gXVcWcXF534PqGSXBmAuO0fB/Yf/k7ewYt/UPQxJY/TsbcC7LwA8RMTpuu
         kmvw==
X-Gm-Message-State: AGi0PuY5Vmd9PViCuqJMejnUd+uOysS+AA3g51Guw8l323Wpb+8VgdHs
        swlRf1PRCFl91LDb7BQK5OJPRkPYRlA=
X-Google-Smtp-Source: APiQypJA+tqZbx4LxDeg1IuoG8wdPK9ozSfLBS1LcZNN3xzgp1bql+qusbdixOHygYNj9Vk/oYps0A==
X-Received: by 2002:a0c:a9c2:: with SMTP id c2mr4283111qvb.23.1587418755936;
        Mon, 20 Apr 2020 14:39:15 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id t75sm533471qke.127.2020.04.20.14.39.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 14:39:15 -0700 (PDT)
Message-ID: <f0f3a22042bdab2cffe12600f17f1485ca71caae.camel@massaru.org>
Subject: Re: [PATCH v2] kbuild: ensure mrproper removes
 arch/$(SUBARCH)/include/generated/
From:   Vitor Massaru Iha <vitor@massaru.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Brendan Higgins <brendanhiggins@google.com>,
        Shuah Khan <skhan@linuxfoundation.org>,
        "linux-kernel-mentees@lists.linuxfoundation.org" 
        <linux-kernel-mentees@lists.linuxfoundation.org>
Date:   Mon, 20 Apr 2020 18:39:12 -0300
In-Reply-To: <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
References: <20200414012132.32721-1-vitor@massaru.org>
         <CAK7LNAQYxtcNinV7JR+c8Pn9Rp1g0TxJ7m_mOFNOJQsB=OiAoA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.4 (3.34.4-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, 2020-04-18 at 03:12 +0900, Masahiro Yamada wrote:
> Hi.
> 
> On Tue, Apr 14, 2020 at 10:21 AM Vitor Massaru Iha <vitor@massaru.org
> > wrote:
> > In the following use case, when compiling the kernel for the UML
> > architecture, for example:
> > 
> >  * `make ARCH=um defconfig && make ARCH=um -j8`,
> > 
> > SUBARCH files are generated, however when we run the command:
> > 
> >  * `mrproper ARCH=um`
> 
>       make ARCH=um mrproper
> 
> 
> > the files `arch/$(SUBARCH)/include/generated/ aren't cleaned up.
> > 
> > This generates compilation errors by running the following command:
> > 
> >  * `make ARCH=um defconfig O=./build_um && make ARCH=um -j8
> > O=./build_um`
> > 
> > This PATCH fix that problem.
> 
>   This patch fixes ...
> 
> > This makes it possible to compile on different architectures that
> > use the
> > SUBARCH variable, in different build directories and root directory
> > of the
> > linux directory. This is important because we can compile without
> > the object
> > files being overwritten. This reduces the re-compilation time in
> > this use case.
> 
> Sorry, I do not understand this paragraph.
> 
> 
> Brendan Higgins just reported the build error
> in the out-of-tree build after in-tree build.
> 
> 
> [1] make ARCH=um defconfig all
> [2] make ARCH=um mrproper
> [3] make ARCH=um O=foo defconfig all
> 
>   -> build error
> 
> Ins't it?
> 
> 
> 
> > Besides that, in the workflow of developing unit tests, using
> > kunit, and
> > compiling in different architectures to develop or test a PATCH,
> > this use case
> > applies.
> > 
> >  * This bug was introduced in this commit a788b2ed81abe
> 
> Instead, adding Fixes tag is the convention.
> 
> Fixes: a788b2ed81ab ("kbuild: check arch/$(SRCARCH)/include/generated
> before out-of-tree build")
> 
> 
> >  * Related bug: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> 
> Maybe, this can be also a tag.
> 
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=205219
> 
> 
> 
> 
> > Signed-off-by: Vitor Massaru Iha <vitor@massaru.org>
> 
> Reported-by: Brendan Higgins <brendanhiggins@google.com>
> 
> 
> 
> > Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
> > Tested-by: Brendan Higgins <brendanhiggins@google.com>
> > ---
> > v2:
> >  * Explains what this PATCH does and the importance as suggested
> >    by Brendan Higgins.
> > ---
> >  Makefile | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 70def4907036..e1a79796032e 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -532,7 +532,8 @@ outputmakefile:
> >  ifdef building_out_of_srctree
> >         $(Q)if [ -f $(srctree)/.config -o \
> >                  -d $(srctree)/include/config -o \
> > -                -d $(srctree)/arch/$(SRCARCH)/include/generated ];
> > then \
> > +                -d $(srctree)/arch/$(SRCARCH)/include/generated -o
> > \
> > +                -d $(srctree)/arch/$(SUBARCH)/include/generated ];
> > then \
> 
> This hunk is unneeded.
> 
> 
> 
> >                 echo >&2 "***"; \
> >                 echo >&2 "*** The source tree is not clean, please
> > run 'make$(if $(findstring command line, $(origin ARCH)),
> > ARCH=$(ARCH)) mrproper'"; \
> >                 echo >&2 "*** in $(abs_srctree)";\
> > @@ -1388,6 +1389,7 @@ CLEAN_FILES += modules.builtin
> > modules.builtin.modinfo modules.nsdeps
> >  # Directories & files removed with 'make mrproper'
> >  MRPROPER_DIRS  += include/config include/generated          \
> >                   arch/$(SRCARCH)/include/generated .tmp_objdiff \
> > +                 arch/$(SUBARCH)/include/generated \
> >                   debian/ snap/ tar-install/
> >  MRPROPER_FILES += .config .config.old .version \
> >                   Module.symvers \
> > --
> > 2.25.1
> > 
> 
> This problem is only related to ARCH=um builds.
> So, it should be fixed in arch/um/Makefile.
> 
> 
> 
> 
> diff --git a/arch/um/Makefile b/arch/um/Makefile
> index d2daa206872d..275f5ffdf6f0 100644
> --- a/arch/um/Makefile
> +++ b/arch/um/Makefile
> @@ -140,6 +140,7 @@ export CFLAGS_vmlinux := $(LINK-y) $(LINK_WRAPS)
> $(LD_FLAGS_CMDLINE)
>  # When cleaning we don't include .config, so we don't include
>  # TT or skas makefiles and don't clean skas_ptregs.h.
>  CLEAN_FILES += linux x.i gmon.out
> +MRPROPER_DIRS += arch/$(SUBARCH)/include/generated
> 
>  archclean:
>         @find . \( -name '*.bb' -o -name '*.bbg' -o -name '*.da' \
> 
> 
> 
> 
> 
> --
> Best Regards
> Masahiro Yamada

Thanks for review. I agree with the suggested changes.


