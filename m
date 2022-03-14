Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 46DB04D7E65
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Mar 2022 10:24:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237812AbiCNJZw (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 14 Mar 2022 05:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231899AbiCNJZw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 14 Mar 2022 05:25:52 -0400
X-Greylist: delayed 303 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 14 Mar 2022 02:24:42 PDT
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CCEE12BB0F
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Mar 2022 02:24:42 -0700 (PDT)
Received: from mail-wr1-f49.google.com ([209.85.221.49]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MzQwa-1oP6sL2UtM-00vMTR for <linux-kbuild@vger.kernel.org>; Mon, 14 Mar 2022
 10:19:37 +0100
Received: by mail-wr1-f49.google.com with SMTP id j17so22866826wrc.0
        for <linux-kbuild@vger.kernel.org>; Mon, 14 Mar 2022 02:19:37 -0700 (PDT)
X-Gm-Message-State: AOAM530qSCW7gBjL0kmBE/HaadLZLiGOYHJpURpUKmK1Ng1adOgdfl9I
        jpHejB4jeOJ+keHikDN8KVLHyEvtuPLNFlaD1pc=
X-Google-Smtp-Source: ABdhPJw1TgSEGWls36dsqQHki/rQyFgnONCGRQaK0Rt+A3nm2L9IHD+dXHVrauXi+iRe3bEroixu/aUQvpON/ku+icw=
X-Received: by 2002:a5d:6d0f:0:b0:203:9157:1c48 with SMTP id
 e15-20020a5d6d0f000000b0020391571c48mr12910202wrq.192.1647249577205; Mon, 14
 Mar 2022 02:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <202203141621.9GAoyWx1-lkp@intel.com>
In-Reply-To: <202203141621.9GAoyWx1-lkp@intel.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 14 Mar 2022 10:19:21 +0100
X-Gmail-Original-Message-ID: <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
Message-ID: <CAK8P3a0FwEPBBSar1t0BDgOBCZr6sxBDdOAMAFC4Cn0Gam2dxQ@mail.gmail.com>
Subject: Re: [masahiroy-kbuild:for-next 3/5] arch/arm/mm/copypage-v4mc.c:70:3:
 error: implicit declaration of function '__flush_dcache_page' is invalid in C99
To:     kernel test robot <lkp@intel.com>
Cc:     Arnd Bergmann <arnd@arndb.de>, llvm@lists.linux.dev,
        kbuild-all@lists.01.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Alex Shi <alexs@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:fT4u7y8QggiHDVAnp9mHqTEc124CJns+fKG0jS6ya7ttdXBdoKH
 1qU5lXriFnsmVH9SjsjwBSc0bKVkrZGSQv1eh4jGVVbUU3lUoA0EpmxTU08vaSs4e6H10B1
 cB/ZAGQy6saIPe6kB+cRfIPuDIRwwFPxtu1DVtY9P86KKILAdyXxX+g7ZLaUrLq/i2A21Za
 qSrunmz0BYUMY3LHTOkyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:Mp0DaItGxq4=:pCOEJjTAjusgYyzYHzOkyi
 iDOJHi6Q1vpYuvU1tjPFxjhGT6bRPMcCHQCz22Mpwir8YBKQz+PT0e8vrTrzWeYl9k/vQL0i3
 dS13Nn058aDXSm+yRiccncjSlCCFUR5MzP45x8h4ittkvidspxGlCPxjgN9goy2idy17UYN5W
 Rdx1dSOzt28vlEFSIEkHG+vCb08sgsZSIZSChVvkk+j2G7wk2NnJ6OyP6vKXSOaZaz1aKLBGu
 V4HpGw9CdrWCAUb3O76VAu5g63MQvpGHP2E3B1kgdiw2aB3zCCBfj/qgEuMwXGG8h4sDZQwhV
 axCT3tbDEH3lGmmw/CoSMoh609zwTvnQHXFnoeC8Id2apdwx26kw3bPHU4btzxQ+40RRvyQxs
 OExdRBG7I4w8Fkol7IjnjAm59yhxWWxR7LgeYhS1iBJkg1unC+gcws1EiLY1VwQVi9OlkT4v4
 HURTQrNHAwooQlDXombJYdf/s+y9mV0uEPMzTrMjKFoAIDI8zpFpBRQzU3Bgb9CDN1wUFiobf
 1kfekNQLFDoHq6RveOS5ZJoEvPkr7ysakSkYld+M9Hsv8IOhtOU0rUhGuoYvUoR+9I17qtTmC
 xH2cbsEE+l7n9xQXHp2SEn0dPE8EHg7PwCWU/d8Vcp4Uf6czpowi00+kM9SFnE7rm3xrGeRz/
 aHcibq+R7PXYxfJ3NojhizpWt5rk93QniF5pk/af/fX/YnHfOnbsCpZhuCFFl7QHGLeQ=
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Mar 14, 2022 at 9:06 AM kernel test robot <lkp@intel.com> wrote:
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All errors (new ones prefixed by >>):
>
> >> arch/arm/mm/copypage-v4mc.c:70:3: error: implicit declaration of function '__flush_dcache_page' is invalid in C99 [-Werror,-Wimplicit-function-declaration]
>                    __flush_dcache_page(page_mapping_file(from), from);
>                    ^
>    arch/arm/mm/copypage-v4mc.c:70:3: note: did you mean 'flush_dcache_page'?
>    arch/arm/include/asm/cacheflush.h:292:13: note: 'flush_dcache_page' declared here
>    extern void flush_dcache_page(struct page *);
>                ^
> >> arch/arm/mm/copypage-v4mc.c:74:2: error: implicit declaration of function 'set_top_pte' is invalid in C99 [-Werror,-Wimplicit-function-declaration]

I checked this, and found that the configuration was already broken,
what changed is just the
exact error message that gcc produces, so lkp flags it as a regression.

This is a NOMMU StrongARM1100 config, which has been broken for a long time,
and already have a patch to disallow that configuration because we ran
into another
issue with NOMMU classic processors last week.

         Arnd
