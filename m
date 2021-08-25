Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C8E63F6E7D
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Aug 2021 06:38:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhHYEjS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Aug 2021 00:39:18 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:54859 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbhHYEjS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Aug 2021 00:39:18 -0400
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 17P4cBxK014941;
        Wed, 25 Aug 2021 13:38:12 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 17P4cBxK014941
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1629866292;
        bh=185z9fBx84g4EeM7cWLgAxqs/o1lYgR8mgEZJhnnvEs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gBblxi6seNJfBudaLxQzOZmqz/OTwWLQL3IcPRbA8nDVPg9xEtjgc/Ehac30HM4FC
         uLRTiQqrid58d0/ravMCKKMk991rH8FFZt6b73qx4wvTnidG8aTZEAtj68h75esyjs
         fkm+GWqenrP0Tx+saqUu7L/lCNhtrbqTCPC6/76OKZ1NXIMfld2gpQ4db9C3c/EMFn
         zHNBG7uBeZhQzDawqMNFG3l3bJ3a+LId0QdJEHl+ikeSqWAWLxEjeoo3I+e1Tina0h
         UojoOxJrYNiUcmNpGm2HLl5u6F7uQQrC0p+623NJGBR9XpRHrm5AIEnGKA+Rb97kwW
         rw78OrNJOQWnw==
X-Nifty-SrcIP: [209.85.210.178]
Received: by mail-pf1-f178.google.com with SMTP id 18so20211782pfh.9;
        Tue, 24 Aug 2021 21:38:12 -0700 (PDT)
X-Gm-Message-State: AOAM5302D7gtLQBSEPGYIhKG9rWPXw78VuMSt/UjFC+DQ7SsOldrPhZY
        1HloRHaZhAbvrtXGF+pmJ4ypEG7QEibMJxILG3Y=
X-Google-Smtp-Source: ABdhPJwcdJFuOrLNf7RmHq3OLHTTbvtGb+4Xh8aGyjWezKKziH+PtPzo7jkceRnU/VmUdPjuerTZAX28CQHZvIaKn48=
X-Received: by 2002:aa7:98da:0:b029:3e0:8b98:df83 with SMTP id
 e26-20020aa798da0000b02903e08b98df83mr42751636pfm.63.1629866291328; Tue, 24
 Aug 2021 21:38:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
 <20210817002109.2736222-3-ndesaulniers@google.com> <YSPePKNwZ/znykqf@osiris>
In-Reply-To: <YSPePKNwZ/znykqf@osiris>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 25 Aug 2021 13:37:34 +0900
X-Gmail-Original-Message-ID: <CAK7LNASupkuA=vY3NOUWW_mX1Mnp+NFeGAUxuFC=k-ADMFd35Q@mail.gmail.com>
Message-ID: <CAK7LNASupkuA=vY3NOUWW_mX1Mnp+NFeGAUxuFC=k-ADMFd35Q@mail.gmail.com>
Subject: Re: [PATCH 2/7] s390: replace cc-option-yn uses with cc-option
To:     Heiko Carstens <hca@linux.ibm.com>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        linux-s390 <linux-s390@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 24, 2021 at 2:43 AM Heiko Carstens <hca@linux.ibm.com> wrote:
>
> On Mon, Aug 16, 2021 at 05:21:04PM -0700, Nick Desaulniers wrote:
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
> > Cc: Heiko Carstens <hca@linux.ibm.com>
> > Cc: Vasily Gorbik <gor@linux.ibm.com>
> > Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> > Cc: linux-s390@vger.kernel.org
> > Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
> > ---
> >  arch/s390/Makefile | 14 +++++++-------
> >  1 file changed, 7 insertions(+), 7 deletions(-)
>
> Acked-by: Heiko Carstens <hca@linux.ibm.com>

Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
