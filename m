Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 41E1214103B
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Jan 2020 18:52:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726935AbgAQRwZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 17 Jan 2020 12:52:25 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:51303 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgAQRwZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Jan 2020 12:52:25 -0500
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 00HHq8Bx003701
        for <linux-kbuild@vger.kernel.org>; Sat, 18 Jan 2020 02:52:08 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 00HHq8Bx003701
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579283529;
        bh=hivT4wSA3iwY78RH28O8O0J0M5irsVyD9yX51K5G7Gk=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=GqNZ1Z3sOdusfHpGUTxC0nYG0UKTf31y+ud/sKICyjO7BxjxjLNiZbieXKAeRfSJ3
         rGk6zrVzdhOrkbJfGgYpwB+H1ZyMaqMcdHwJen98AUYpKsmpSkB9bbCQjWMkODtzzP
         nvoULCffNVQ38Hw25m6tHq4WfMvpnKIiHyHGG/Ocbt+W96KetQE0FOEfhH8ufAeWH6
         H1nxlGo3SbrdzPT3h5Z9d6aE9sH4xvv+iubBR6+92cSPtmPO1eLo2FaRI45aCsuyNE
         jF2NclASR79LUUXetZJuc/1QNIodc7IQvRYSNrzC+ZCGTHGgVDxx0Zo7czrAgOBsDm
         Y/Lk/Rp6W5IGw==
X-Nifty-SrcIP: [209.85.217.44]
Received: by mail-vs1-f44.google.com with SMTP id t12so15326943vso.13
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Jan 2020 09:52:08 -0800 (PST)
X-Gm-Message-State: APjAAAVVc54PUSfyM0cwKQm8sCSS/gsuaXGEi6+ePfMLlesxautDR7c8
        otc/37aBy3wPA4U2IQxHiasLHwIwlwjz6+3gU+o=
X-Google-Smtp-Source: APXvYqyKvN3mcvVZNtBBJUUlIRvc8qNb1u6qte38CldDocLzGjTiUwInBSRZoKg9w+f4fHovaEvv3/20g2rDKzsaMuU=
X-Received: by 2002:a05:6102:48b:: with SMTP id n11mr5781677vsa.181.1579283527448;
 Fri, 17 Jan 2020 09:52:07 -0800 (PST)
MIME-Version: 1.0
References: <1576486038-9899-1-git-send-email-amit.kachhap@arm.com>
 <1576486038-9899-15-git-send-email-amit.kachhap@arm.com> <20200117113351.GF26090@arrakis.emea.arm.com>
In-Reply-To: <20200117113351.GF26090@arrakis.emea.arm.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 18 Jan 2020 02:51:31 +0900
X-Gmail-Original-Message-ID: <CAK7LNASyrra9Xxvk+aG5OspbxmenDvohBVfusokD0RHy4CvqFg@mail.gmail.com>
Message-ID: <CAK7LNASyrra9Xxvk+aG5OspbxmenDvohBVfusokD0RHy4CvqFg@mail.gmail.com>
Subject: Re: [PATCH v3 14/16] kconfig: Add support for 'as-option'
To:     Catalin Marinas <catalin.marinas@arm.com>
Cc:     Amit Daniel Kachhap <amit.kachhap@arm.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Will Deacon <will@kernel.org>,
        Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
        Kristina Martsenko <kristina.martsenko@arm.com>,
        Dave Martin <Dave.Martin@arm.com>,
        James Morse <james.morse@arm.com>,
        Vincenzo Frascino <Vincenzo.Frascino@arm.com>,
        Mark Brown <Mark.Brown@arm.com>,
        Richard Henderson <richard.henderson@linaro.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 17, 2020 at 8:33 PM Catalin Marinas <catalin.marinas@arm.com> wrote:
>
> On Mon, Dec 16, 2019 at 02:17:16PM +0530, Amit Daniel Kachhap wrote:
> > diff --git a/scripts/Kconfig.include b/scripts/Kconfig.include
> > index d4adfbe..cc465dd 100644
> > --- a/scripts/Kconfig.include
> > +++ b/scripts/Kconfig.include
> > @@ -31,6 +31,10 @@ cc-option = $(success,$(CC) -Werror $(CLANG_FLAGS) $(1) -E -x c /dev/null -o /de
> >  # Return y if the linker supports <flag>, n otherwise
> >  ld-option = $(success,$(LD) -v $(1))
> >
> > +# $(as-option,<flag>)
> > +# Return y if the assembler supports <flag>, n otherwise
> > +as-option = $(success, $(CC) $(CLANG_FLAGS) $(1) -E -x assembler /dev/null -o /dev/null)
>
> I had different experiments with this for MTE and noticed that clang
> does not honour the -Wa, option (which you use in a subsequent patch).
> So not sure how useful as-option is.


I think this is because it uses '-E' option.

To invoke the assembler, -c is needed.


I replaced -E with -c, and tested it.
It seems working for both gcc and clang.



I noticed a similar case for cc-option:
https://patchwork.kernel.org/patch/11339567/


-- 
Best Regards
Masahiro Yamada
