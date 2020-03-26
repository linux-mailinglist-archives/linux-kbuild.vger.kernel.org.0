Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8B25F19495F
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Mar 2020 21:44:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgCZUoH (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Mar 2020 16:44:07 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:19131 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726034AbgCZUoG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 16:44:06 -0400
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com [209.85.222.43]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 02QKhtES030568;
        Fri, 27 Mar 2020 05:43:56 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 02QKhtES030568
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1585255436;
        bh=6HJwRTaLrQez1RAJvnsU1ylf9hNXRZ8k4BSgYFgJ22k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=T0Y1kMBwFGoCVnrYmgbljc8dGfYYmNn1y5912DRfmdrZ52tovyg2MebhB9htlrcek
         EBCBHT4EkxUxjtN+Pocobt56tKzjylF44IAR3wNgt+rElQrG49wtEG/SGzDIh07Nmb
         1vD0ZIWdhyCGUMFZyWwXA/liOP3cPEIwOQNV/ZH/tKdrUzOGWGbsYwxKYVkTJGBksY
         ohv/3vYXBVSBzbzyhVspvaJ8oVdHuojxS2Ka7r7osBRYu0OeTcH+dYykPSI9i3CLRo
         cMuBpo8cWrm0kOxa58lZQpGC0tzA3oZc6DzUSx7qeiYiQkY8PxkZbMDdKLCG6egLsJ
         1ab1uBfbtdgkw==
X-Nifty-SrcIP: [209.85.222.43]
Received: by mail-ua1-f43.google.com with SMTP id a6so2697308uao.2;
        Thu, 26 Mar 2020 13:43:55 -0700 (PDT)
X-Gm-Message-State: ANhLgQ3ZkfJGNvKRUqQ9Kgx0WY+xnzpjvl4wYdsBbG5sIPfyFw4KCm0o
        bZqEzMlWiSpzfMMJoQUKNtkaZfzgr/P+GSvIGzc=
X-Google-Smtp-Source: ADFU+vtsUXD+aSP8lpvYCbKxZbqHSpDlYx8uyE46+TTsrnTO4BDwceM64UJEqOELPHKlfLTGso2KU8OCkIQLa5hZG1I=
X-Received: by 2002:ab0:2085:: with SMTP id r5mr8287832uak.95.1585255434710;
 Thu, 26 Mar 2020 13:43:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200326080104.27286-1-masahiroy@kernel.org> <CAHmME9pnAvgErYkcvvdakvfMY8ZGKfwHHNYzpVtJ913Tgp16CQ@mail.gmail.com>
 <20200326092213.GA100918@gmail.com>
In-Reply-To: <20200326092213.GA100918@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 27 Mar 2020 05:43:18 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
Message-ID: <CAK7LNAQ7-wpm+g=cXeJ01vGrO1nVjfP-ornKm=SXoDEn4x+DjQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/16] x86, crypto: remove always-defined CONFIG_AS_*
 and cosolidate Kconfig/Makefiles
To:     Ingo Molnar <mingo@kernel.org>
Cc:     "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        "H . Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        "David S. Miller" <davem@davemloft.net>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Ingo Molnar <mingo@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Jim Kukunas <james.t.kukunas@linux.intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        NeilBrown <neilb@suse.de>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Yuanhan Liu <yuanhan.liu@linux.intel.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        intel-gfx@lists.freedesktop.org,
        Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi all,

On Thu, Mar 26, 2020 at 6:22 PM Ingo Molnar <mingo@kernel.org> wrote:
>
>
> * Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> > Very little has changed from last time, and this whole series still
> > looks good to me. I think I already ack'd most packages, but in case
> > it helps:
> >
> > Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
>
> Acked-by: Ingo Molnar <mingo@kernel.org>
>
> > Since this touches a lot of stuff, it might be best to get it in as
> > early as possible during the merge window, as I imagine new code being
> > added is going to want to be touching those makefiles too.
>
> I'd argue the opposite: please merge this later in the merge window, to
> not disrupt the vast body of other stuff that has already been lined up
> and has been tested, and to give time for these new bits to get tested
> some more.

I agree.


> Also, please get it into -next ASAP, today would be ideal for test
> coverage ...

I collected more Reviewed-by and Acked-by,
then pushed this series to

git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
kbuild-asinstr

It will show up in -next soon.


-- 
Best Regards
Masahiro Yamada
