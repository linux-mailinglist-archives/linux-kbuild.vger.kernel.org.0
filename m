Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 723A51B1964
	for <lists+linux-kbuild@lfdr.de>; Tue, 21 Apr 2020 00:27:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726599AbgDTW1I (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 20 Apr 2020 18:27:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgDTW1I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Apr 2020 18:27:08 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2315CC061A0C
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 15:27:08 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id v7so12645698qkc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Apr 2020 15:27:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=massaru-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=FnTnNFEg7Eu5eE5Hx3GU/Dpc3NxMHsYhRv+oF0x2HIU=;
        b=CuexACRM/C7YEMKWw9T0KV9eEQVZc8QUsaRMUaeTFwVC1cxNRwOvGcF+3MHhGFJElL
         rKFypSJxXiymzlr+Puvh5wsRv8jVT59EXleHsAtvkBJKEPeVy/dTBxXDC83umNjZOKCV
         2g4eALDgePL8EH/4+737PUzU3ZimD59H5a978UMEt/LAulA8eV1sZ+fzPjzFHw95WRoU
         ArZp4qpwzAw2g4gV9G4ZTpojWKjrxhHOB86qTEUaui57pW87Fi5+Sc7HDtyvdqm93I0P
         oy0NrFnMbya1fLltw+j51dTwjtxslYV1vngnIoR1JV6EcSbftzbB4S+S5mSdx7p1XzK1
         PD/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=FnTnNFEg7Eu5eE5Hx3GU/Dpc3NxMHsYhRv+oF0x2HIU=;
        b=YhLCpyRW1OeyWeZvV8pTHfTJOtoBu3h0ZnnI2rywa0ximXdre7N0mObjV7kxp+IOgq
         IEzzQJqYwg2A3LsljJDYRA85g6PkeMcI1eZWzA3/tBWgqWRtsWyG7oYv8n7xd65Tubdy
         8FYxVLXCNqa0wni/GVlzrvuOgi3j8ohcUXT9KCVaMspcRV72KhcbneA2KxFBRo6LH7BC
         URECbmNGnqcbcwvCkvIXJVCO3g5hgTfjj864YUKDGI3yFFhCpcCFk+JHe9xs4P7OizdL
         1SpCwhIdsKdXVfiuVdf27krhDgOo4wA7KnhQ3nrqGHOnfxZPT6MSLIKz+3ycihD45C4D
         i9GA==
X-Gm-Message-State: AGi0PuZ5caUJNsoALXrB0hBeHB2vuG3S9nynPywqDIfEIuVbpM36oZI/
        sWiVApYdpnZXnzvFn9LWjoH2rP3czz1Pwg==
X-Google-Smtp-Source: APiQypLK3tuG/uhayBXi71l583i9rWvzEYAli3/mm+oZ/U6XVf951KadRVyZLHxYclATHuNj3xjQnQ==
X-Received: by 2002:a05:620a:b03:: with SMTP id t3mr18349178qkg.209.1587421627192;
        Mon, 20 Apr 2020 15:27:07 -0700 (PDT)
Received: from bbking.lan ([2804:14c:4a5:36c::cd2])
        by smtp.gmail.com with ESMTPSA id j2sm451758qth.57.2020.04.20.15.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2020 15:27:06 -0700 (PDT)
Message-ID: <b82142248b38085fa3ab49a9d3181cabd5a79a91.camel@massaru.org>
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
Date:   Mon, 20 Apr 2020 19:27:03 -0300
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

Hi Masahiro,

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

Was actually Reported-by Theodore Ts'o <tytso@mit.edu>	
https://groups.google.com/forum/#!msg/kunit-dev/QmA27YEgEgI/hvS1kiz2CwAJ

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

Can I add suggested-by Masahiro Yamada <masahiroy@kernel.org> ?

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

