Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B912E242E41
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Aug 2020 19:48:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726477AbgHLRss (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Aug 2020 13:48:48 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:18504 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725993AbgHLRss (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Aug 2020 13:48:48 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 07CHmT0v012843;
        Thu, 13 Aug 2020 02:48:30 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 07CHmT0v012843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1597254510;
        bh=Ij7DTc0+G5aYQMMUK117Wrc+BtKR/opUoeRVB4ysu5w=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=am32WSW9rM61TKdiGbvmyS2CXrjpgNA9SaPVnYT1DfLUKrxQguOocWKiKDbtEUMIN
         +s7O9g3V4MXn4tX0YIlybIsLoKxRON8FpqAlyL9Aavdn9QIiWB6U9sUOCqB8jTwsQp
         eORlnbjFwAfiXOk+sDkw3nGXrB6zcXa4bmsoM7Cr2azXy1j5S7py4xHJ4I7VC4IagF
         ck1RmXWGprVNKqFEittzEAlal5wUpv5OBseFLORihFRyDwGdAlLCryFikGMakJr7do
         mvwIk4OEvKGjfatxTRgkr6JEh8USkS7UFIi73ZamW90TJ3utOs2mV9iJ592/fFHfh/
         aHYtrMcsxBGuQ==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id k25so1525606vsm.11;
        Wed, 12 Aug 2020 10:48:30 -0700 (PDT)
X-Gm-Message-State: AOAM530LvdYc+Z+luQ5pzs7Id90an8aseLleWdr2kDdsR1Lx3w391uCO
        sK/KPLCCoKph/1Rnr/zovWEFCTBkA+3Os515e9I=
X-Google-Smtp-Source: ABdhPJzetrCFjWMWorlM78pluJ8mIRVZKqXRbqxC7kbwHtCysk4df/83X8LPmdlF0mAhagZ0k6VqVgyrCQKxB/8vY6U=
X-Received: by 2002:a67:7c11:: with SMTP id x17mr254093vsc.155.1597254509215;
 Wed, 12 Aug 2020 10:48:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdnni_G2tw+0eCLQQvvdcz97Fy1-cBjzPvLwbBNDu1-KqQ@mail.gmail.com>
 <20200728004736.3590053-1-nhuck@google.com> <CAK7LNAT-AO9_Y-qunRvPbBYf7GZnoE6bxYKFNtcdKAKV8d_A+w@mail.gmail.com>
 <CAJkfWY5ywOtO6fAyPd0B2BjEWamJRRMgg4et0uVq2bpkJSECwA@mail.gmail.com>
 <CAK7LNAQVdhMraYejrTsGZSLFJDk4CVf6ke-bsQ7kaDUM2Lf4SA@mail.gmail.com> <CAJkfWY5kooS1cPFq+3s0oFT8=O_vszAMnJ8BBOmy084oi+4tgw@mail.gmail.com>
In-Reply-To: <CAJkfWY5kooS1cPFq+3s0oFT8=O_vszAMnJ8BBOmy084oi+4tgw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 13 Aug 2020 02:47:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNASi+as9+2c=a9+cwbj4DjPfqpo50KxEp2EUFAc_Vs4yXg@mail.gmail.com>
Message-ID: <CAK7LNASi+as9+2c=a9+cwbj4DjPfqpo50KxEp2EUFAc_Vs4yXg@mail.gmail.com>
Subject: Re: [PATCH v7] Makefile: Add clang-tidy and static analyzer support
 to makefile
To:     Nathan Huckleberry <nhuck@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Pirama Arumuga Nainar <pirama@google.com>,
        Bill Wendling <morbo@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 12, 2020 at 10:24 AM 'Nathan Huckleberry' via Clang Built
Linux <clang-built-linux@googlegroups.com> wrote:
>
> Sounds good. Do you think this patch is ready to land then?


I do not think so.

I pointed out the CC=clang check was not working.
I see false positive errors from GCC commands.



This patch does not use the benefit of Makefile.

Makefile is used to describe the dependency
between a target and its prerequisites,
and how to update the target.

Make compares the timestamps between the
targets and prerequisites, then determines
which targets need updating.


See your code.


clang-tidy:
ifdef CONFIG_CC_IS_CLANG
       $(PYTHON3) scripts/clang-tools/gen_compile_commands.py
       $(PYTHON3) scripts/clang-tools/run-clang-tools.py clang-tidy
compile_commands.json
else
       $(error clang-tidy requires CC=clang)
endif


This always runs two commands sequentially.
It rebuilds compile_commands.json even if
nothing in the source tree has been changed.

If you do this, there is no strong reason to use Make,
and actually you can rewrite it in a shell script:


clang_tidy () {
  if [ "$CONFIG_CC_IS_CLANG = "y" ]; then
    $PYTHON3 scripts/clang-tools/gen_compile_commands.py
    $PYTHON3 scripts/clang-tools/run-clang-tools.py clang-tidy
compile_commands.json
  else
    echo "clang-tidy requires CC=clang"
    exit 1
  fi
}




I changed the rules to Makefile-ish style.

https://patchwork.kernel.org/project/linux-kbuild/list/?series=331893


I will wait for comments for the new version.


-- 
Best Regards
Masahiro Yamada
