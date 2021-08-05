Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09663E1643
	for <lists+linux-kbuild@lfdr.de>; Thu,  5 Aug 2021 16:01:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241831AbhHEOBW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 5 Aug 2021 10:01:22 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65075 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238069AbhHEOBV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Aug 2021 10:01:21 -0400
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 175E0P3H016450;
        Thu, 5 Aug 2021 23:00:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 175E0P3H016450
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1628172026;
        bh=lffbE45BRrgQKayNYnYaGttwzdEDcoutwDeVAJukOHE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=RTYjuW+6Yj1y9WzrY5XZjN8EW2tKGg1fUci/yOtrtiq7uReI24qIrR14DKLufRhPV
         icB+n15fCVkVIpp8Aid1bJfQX0yGRzdpKXF0TApwcvXJaf+kGLaWGaxzD+luQkMhjz
         Z380y4zm7YDD4UUKZDrYrHX36Qps58U8YRZWRDApaoVJa5WBwZP+bVha33ijwydDZV
         Wng+ATPLPChlhTmfYd2+trS64OZZsKBVLaBWfYERIP2BegQa7V8qkVPGJ2fslkroAh
         QaPOcwfq/NTJjC8aWQ665qMgcAJatI7rMcVDh3vsViswk9uiYETv0d/wbnzoUjybFf
         VYpGqORKJsPyA==
X-Nifty-SrcIP: [209.85.216.54]
Received: by mail-pj1-f54.google.com with SMTP id s22-20020a17090a1c16b0290177caeba067so15057356pjs.0;
        Thu, 05 Aug 2021 07:00:25 -0700 (PDT)
X-Gm-Message-State: AOAM530BGiaMWx0fMfIFM3a+i0LRAt13w+a9vCqdrT5sJQZ71E52siua
        J4PV+5M5v26ramAS2ZUw6+YjtfKMJ2l5xWf4Sr8=
X-Google-Smtp-Source: ABdhPJxZa5hhUZfNZ1UgobCzy0zyXlvxx8sD248nZ0a4FXFWiLIEtivCGL+LfW0JxWplPlExOQFTlkwqFc3NHJ3/r2Y=
X-Received: by 2002:a05:6a00:d71:b029:3c7:6648:69c6 with SMTP id
 n49-20020a056a000d71b02903c7664869c6mr2014065pfv.63.1628172025021; Thu, 05
 Aug 2021 07:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210802234304.3519577-1-ndesaulniers@google.com> <YQicuh/Qtj0AfxdK@casper.infradead.org>
In-Reply-To: <YQicuh/Qtj0AfxdK@casper.infradead.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 5 Aug 2021 22:59:47 +0900
X-Gmail-Original-Message-ID: <CAK7LNASq2CdhbybOrdcxBDA7BmF1jfBK6mX2z75MR7DLN3GMwQ@mail.gmail.com>
Message-ID: <CAK7LNASq2CdhbybOrdcxBDA7BmF1jfBK6mX2z75MR7DLN3GMwQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/Makefile.clang: default to LLVM_IAS=1
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Khem Raj <raj.khem@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 3, 2021 at 10:33 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 02, 2021 at 04:43:03PM -0700, Nick Desaulniers wrote:
> > +++ b/Documentation/kbuild/llvm.rst
> > @@ -60,17 +60,14 @@ They can be enabled individually. The full list of the parameters: ::
> >         OBJCOPY=llvm-objcopy OBJDUMP=llvm-objdump READELF=llvm-readelf \
> >         HOSTCC=clang HOSTCXX=clang++ HOSTAR=llvm-ar HOSTLD=ld.lld
> >
> > -Currently, the integrated assembler is disabled by default. You can pass
> > -``LLVM_IAS=1`` to enable it.
> > +Currently, the integrated assembler is enabled by default. You can pass
> > +``LLVM_IAS=0`` to disable it.
>
> I'd drop the "Currently,".  This is presumably going to be the default
> going forward unless there's some horrible unforeseen problem.  The
> "Currently," implies that we're planning on changing it.

I agree.



-- 
Best Regards
Masahiro Yamada
