Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 015533F214D
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 22:05:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229751AbhHSUFp (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 19 Aug 2021 16:05:45 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:32191 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229514AbhHSUFp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 19 Aug 2021 16:05:45 -0400
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 17JK4oIU007015
        for <linux-kbuild@vger.kernel.org>; Fri, 20 Aug 2021 05:04:51 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 17JK4oIU007015
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629403491;
        bh=8hjQkClvKSbKvju+DhtDTCJuXhxcdg5TLaUR+EqdtQg=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=FJybV/NiBh+b5QWSjP8cl5qYq1ZNVBbZSco64rce4sOVnI0rd0qx+ihfdT1tVW5ha
         HfPejgLYLDPnPAvq2tOZ+KT9E4ylSJj43AL+1x7KBh44TircNetDJPmUioNuv+M9UW
         KzYVjRcizURSowJjLFzxo8cO810U0GhUofXfv78CMxYC9T44ZPqeRFNh3ZBsTPJD1S
         adAonPfbQB8ZMhu77FZSqtAH+XdyfrmtlyVDrJZPc0O53OPZf8ra+J4DRcpUt57p3s
         +vie6S2p2NqSD3gjLncpktxkXC21eTJHtWlir4ttEB71cY48i6MK+w+w/fL3lraG9C
         8/k0kWpAwTaQQ==
X-Nifty-SrcIP: [209.85.216.45]
Received: by mail-pj1-f45.google.com with SMTP id nt11so5769695pjb.2
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Aug 2021 13:04:50 -0700 (PDT)
X-Gm-Message-State: AOAM531OHk6cWcT6YepRElPo9CVOeV0LZExjWeITfeH+sBhbHOO/XxWd
        LTRyeOTqIACD8d8vmst3/E1KIqLNr5dfTNGUWIk=
X-Google-Smtp-Source: ABdhPJxnUC0AY//iMezqYAYLMqXCNtAJECV2jieKTY8HPz6eY4jOaI/yOn+2XM2h12nuQv/f8ZxczmP0Vxl7iVG4+tw=
X-Received: by 2002:a17:90a:a581:: with SMTP id b1mr454883pjq.153.1629403490185;
 Thu, 19 Aug 2021 13:04:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-4-ndesaulniers@google.com> <87a6lghkdj.fsf@mpe.ellerman.id.au>
In-Reply-To: <87a6lghkdj.fsf@mpe.ellerman.id.au>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 20 Aug 2021 05:04:13 +0900
X-Gmail-Original-Message-ID: <CAK7LNAR2E8XDRrfVCis_qxDs3-dnf-HfqxkcYOMemqns7pgcmQ@mail.gmail.com>
Message-ID: <CAK7LNAR2E8XDRrfVCis_qxDs3-dnf-HfqxkcYOMemqns7pgcmQ@mail.gmail.com>
Subject: Re: [PATCH 3/7] powerpc: replace cc-option-yn uses with cc-option
To:     Michael Ellerman <mpe@ellerman.id.au>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 17, 2021 at 11:31 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Nick Desaulniers <ndesaulniers@google.com> writes:
> > cc-option-yn can be replaced with cc-option. ie.
> > Checking for support:
> > ifeq ($(call cc-option-yn,$(FLAG)),y)
> > becomes:
> > ifneq ($(call cc-option,$(FLAG)),)
> >
> > Checking for lack of support:
> > ifeq ($(call cc-option-yn,$(FLAG)),n)
> > becomes:
> > ifeq ($(call cc-option,$(FLAG)),)
> >
> > This allows us to pursue removing cc-option-yn.
> >
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: linuxppc-dev@lists.ozlabs.org
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/powerpc/Makefile      | 12 ++++++------
> >  arch/powerpc/boot/Makefile |  5 +----
> >  2 files changed, 7 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> > index 9aaf1abbc641..85e224536cf7 100644
> > --- a/arch/powerpc/Makefile
> > +++ b/arch/powerpc/Makefile
> > @@ -12,12 +12,12 @@
> >  # Rewritten by Cort Dougan and Paul Mackerras
> >  #
> >
> > -HAS_BIARCH   := $(call cc-option-yn, -m32)
> > +HAS_BIARCH   := $(call cc-option,-m32)
> >
> >  # Set default 32 bits cross compilers for vdso and boot wrapper
> >  CROSS32_COMPILE ?=
> >
> > -ifeq ($(HAS_BIARCH),y)
> > +ifeq ($(HAS_BIARCH),-m32)
>
> I don't love that we have to repeat "-m32" in each check.
>
> I'm pretty sure you can use ifdef here, because HAS_BIARCH is a simple
> variable (assigned with ":=").
>
> ie, this can be:
>
>   ifdef HAS_BIARCH
>
>
> And that avoids having to spell out "-m32" everywhere.
>
> cheers


Yes.

Comments from Nathan and Michael
both sound good.

-- 
Best Regards
Masahiro Yamada
