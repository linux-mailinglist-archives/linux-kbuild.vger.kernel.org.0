Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7CCE87AAF9
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jul 2019 16:29:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731323AbfG3O3J (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jul 2019 10:29:09 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61647 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727865AbfG3O3J (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jul 2019 10:29:09 -0400
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id x6UESv7a009658;
        Tue, 30 Jul 2019 23:28:58 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com x6UESv7a009658
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1564496938;
        bh=v84lwITMwCbRgHyGZMYws7mMj8il4DSwjrW7UNUSg5s=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RtdPT8ltnUvK47R3j68P8C1ZgZzYqVWotPMaw0LJAVvePrrX+Fl2GRu1+yayV2Nej
         nNfIbaRCYKuyhQoJFWYR0M4UPhPlwTqm9WBgqtUfKh5MoapJ2kDfKMQniqIpqFmPZk
         JsehKH42e+hVl8+kgz864YFu0qtgBVkyxQ0T4ijQQEB0TpJUwPNY4iGb1Amipx2ySq
         BWtjM1G9j+kHvie/qINAqOViDgXoVyrWIiM8nKMB9FJ9EtbBWACYdZhH5y0lXX9zS7
         uXOrnxe0cJFUBF56IrkgG54aFmpx4ToY+GCfdbRFYLK5wwjULseJm8pOIWP2pZM+cu
         RHydlHo73dWOg==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id a186so42001316vsd.7;
        Tue, 30 Jul 2019 07:28:57 -0700 (PDT)
X-Gm-Message-State: APjAAAURssm5Fpnj99TI7Pv9RTKZuYk/rVnzynKjsXouHRQaMzTAS7vf
        ltKVfsiQF2Fibfet4+FToA2OOzAZko0cYmrtSXw=
X-Google-Smtp-Source: APXvYqw4h6Qez6BRRK5N+FsF/UXKydbLOoQOr33HDGNPcw0K68jyVimtbBSfZetRbfL80Q7Iojj0TJk60p/dT3uJL08=
X-Received: by 2002:a67:cd1a:: with SMTP id u26mr72503702vsl.155.1564496936927;
 Tue, 30 Jul 2019 07:28:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190725154730.80169-1-swboyd@chromium.org> <CAK7LNAQZJgkx-yEwgHcTapKFayExgUCb3=zLBpJmVMJMeEA_WA@mail.gmail.com>
 <5d3f016c.1c69fb81.b4775.c7d0@mx.google.com>
In-Reply-To: <5d3f016c.1c69fb81.b4775.c7d0@mx.google.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Tue, 30 Jul 2019 23:28:20 +0900
X-Gmail-Original-Message-ID: <CAK7LNASoNRsMHHBW=d_Lkjo7eLpq5=gkU_g+k8NwEB0BwV37ZQ@mail.gmail.com>
Message-ID: <CAK7LNASoNRsMHHBW=d_Lkjo7eLpq5=gkU_g+k8NwEB0BwV37ZQ@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Check for unknown options with cc-option usage
 in Kconfig and clang
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Peter Smith <peter.smith@linaro.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Douglas Anderson <dianders@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jul 29, 2019 at 11:23 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Masahiro Yamada (2019-07-29 03:02:40)
> >
> > Thanks for catching this.
> >
> > I wonder if we could fix this issue
> > by one-liner, like this:
> >
> >
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index 8a5c4d645eb1..4bbf4fc163a2 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -25,7 +25,7 @@ failure = $(if-success,$(1),n,y)
> >
> >  # $(cc-option,<flag>)
> >  # Return y if the compiler supports <flag>, n otherwise
> > -cc-option = $(success,$(CC) -Werror $(1) -E -x c /dev/null -o /dev/null)
> > +cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c
> > /dev/null -o /dev/null)
> >
> >  # $(ld-option,<flag>)
> >  # Return y if the linker supports <flag>, n otherwise
> >
> >
> >
> > This propagates not only -Werror=unknown-warning-option
> > but also other clang flags to Kconfig.
> >
> >
> > Currently, we do not pass the target triplet to Kconfig.
> > This means, cc-option in Kconfig evaluates the given flags
> > against host-arch instead of target-arch.
> > The compiler flags are mostly independent of the architecture,
> > and this is not a big deal, I think.
> > But, maybe, would it make more sense to pass the other
> > basic clang flags as well?
> >
>
> Yes that also works and I had that earlier. I wanted to mirror what was
> done in scripts/Kbuild.include where there's a CC_OPTION_CFLAGS
> variable. I'm happy either way, so it's up to you.
>

Can you post v3 with $(CLANG_FLAGS) ?

Thanks.

-- 
Best Regards
Masahiro Yamada
