Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EFF484E3A2B
	for <lists+linux-kbuild@lfdr.de>; Tue, 22 Mar 2022 09:10:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiCVIKb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 22 Mar 2022 04:10:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbiCVIK2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 22 Mar 2022 04:10:28 -0400
Received: from conssluserg-04.nifty.com (conssluserg-04.nifty.com [210.131.2.83])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9F626340
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Mar 2022 01:09:00 -0700 (PDT)
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 22M88cHa012822
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Mar 2022 17:08:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 22M88cHa012822
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1647936519;
        bh=EI+hlrVn+LE4qzsUPEbMCxX9jVyiWn1MGHB7wLYIoFI=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=neZ3ohv1K9ZhyWBK1fxFKy6diS5ndnW5IzHkvAwUCgJ6qiP6gmrMPg+oZhW3dLk1C
         J/qoQrd3b4QwRE79gBdtrRr4D6ufynEIMQiyPNvDpYQPEUoFakpxUyIytmD04WgK/I
         5ZfS9cHbZeJ0jflzFxr31ZuWf09qKo6wmF/Gb0w79l3OtkswK6QVZYyOHFpg81B/mA
         UgqCJ7YUsh/46YMjLNpjgC/niyIUmZOQhoPO6tdMgg4SzAweLFZhCCfQjQ+RsgW1r5
         wwjuMenBQrtl6PscHb8XkjR5xpHfpIFgFXrk+DkZpWF6gV8P5HG19PHmOpnDvB05XI
         QeQi1I9KVzPjA==
X-Nifty-SrcIP: [209.85.215.181]
Received: by mail-pg1-f181.google.com with SMTP id o8so12090412pgf.9
        for <linux-kbuild@vger.kernel.org>; Tue, 22 Mar 2022 01:08:39 -0700 (PDT)
X-Gm-Message-State: AOAM532jZ0PudgaK/BcUQgMou+MkL1Ng6YBnwYULXmiCwCtj7W4D80Jg
        0BcM/PuvTHAxwDYNDb4OcVtrggMdk5rsChUn7Ws=
X-Google-Smtp-Source: ABdhPJwhTLFGwfJDoT569BIcUH2vIsmqs0aBripoaSbi4GiW/rhR73Mh3hX8ZTelV66PmEcdj+guBjgcHrWUCNKxhzg=
X-Received: by 2002:a63:ec47:0:b0:382:692a:dc04 with SMTP id
 r7-20020a63ec47000000b00382692adc04mr9332997pgj.352.1647936518120; Tue, 22
 Mar 2022 01:08:38 -0700 (PDT)
MIME-Version: 1.0
References: <202203141621.9GAoyWx1-lkp@intel.com> <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
In-Reply-To: <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 22 Mar 2022 17:07:53 +0900
X-Gmail-Original-Message-ID: <CAK7LNATsFvD6sLr57nE0+ZK_B_vfvQE_C7DaWy5ubgdLarX72g@mail.gmail.com>
Message-ID: <CAK7LNATsFvD6sLr57nE0+ZK_B_vfvQE_C7DaWy5ubgdLarX72g@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:for-next 3/5] arch/arm/mm/copypage-v4mc.c:70:3:
 error: implicit declaration of function '__flush_dcache_page' is invalid in C99
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     kernel test robot <lkp@intel.com>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_SOFTFAIL,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 14, 2022 at 6:19 PM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Mar 14, 2022 at 9:06 AM kernel test robot <lkp@intel.com> wrote:
> >
> > If you fix the issue, kindly add following tag as appropriate
> > Reported-by: kernel test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> > >> arch/arm/mm/copypage-v4mc.c:70:3: error: implicit declaration of function '__flush_dcache_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
> >                    __flush_dcache_page(page_mapping_file(from), from);
> >                    ^
> >    arch/arm/mm/copypage-v4mc.c:70:3: note: did you mean 'flush_dcache_page'?
> >    arch/arm/include/asm/cacheflush.h:292:13: note: 'flush_dcache_page' declared here
> >    extern void flush_dcache_page(struct page *);
> >                ^
> > >> arch/arm/mm/copypage-v4mc.c:74:2: error: implicit declaration of function 'set_top_pte' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>
> I checked this, and found that the configuration was already broken,
> what changed is just the
> exact error message that gcc produces, so lkp flags it as a regression.


Agree.

Clang shows a slightly different error message with -std=gnu89/11.



Old error message     (with -std=gnu89):
  implicit declaration of function '__flush_dcache_page'
[-Werror,-Wimplicit-function-declaration]

New error message   (with -std=gnu11)
  implicit declaration of function '__flush_dcache_page' is invalid in
C99 [-Werror,-Wimplicit-function-declaration]



This was already broken before.









> This is a NOMMU StrongARM1100 config, which has been broken for a long time,
> and already have a patch to disallow that configuration because we ran
> into another
> issue with NOMMU classic processors last week.
>
>          Arnd





-- 
Best Regards
Masahiro Yamada
