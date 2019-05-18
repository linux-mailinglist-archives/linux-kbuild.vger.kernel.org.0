Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9662B221B7
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 May 2019 07:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725554AbfERFaS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 18 May 2019 01:30:18 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:21184 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725468AbfERFaS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 18 May 2019 01:30:18 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x4I5U7t7032365;
        Sat, 18 May 2019 14:30:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com x4I5U7t7032365
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1558157408;
        bh=bVCmTcACCJr6uhRD/vNQSoiPeZODwHTqDi7Us1rmUAE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WP362Zh1Jih8KFwiv1ygYG2IbQMzuC3/w2M2jJ7aPOFh7bNfFbkmJykY2UXHgz3pY
         CTfGPk42zIjlPMYXT1TmkuG3F41r91cQNM0gtkQxRcLDCuAuI9SBW6d6psBW4ZR4FD
         y7Wkb+1r5VMus0ker9L49QXSFhHjcqMJO7/IEobNmjbfF+s83CezDee2IaY/reCPfY
         YxleIEOTlPsAy2xudbpdTm5SC6n9ZYgQquiiQ2iDHWxFX/OH53GavAiuMswuREYdje
         5Zgr/QyxcMwHmhO2ZPoeSytxBVqSSsqtF4ec8sqkOu3y2ck96DeARJbezDvGm1U+fc
         0HwEb4AHM+ivw==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id e9so3530895uar.9;
        Fri, 17 May 2019 22:30:07 -0700 (PDT)
X-Gm-Message-State: APjAAAUGoQinXAvrtDmX80lBTO1iDBgMD5pAm0NGY6Ubpi8yD3P8ZT7N
        jzDidDjINnS1PAV6pkTUPHVNiwCCh6YDdfe/RCs=
X-Google-Smtp-Source: APXvYqytsoHz/FUR/y3xPLk9XD9sLwCi502xoetqPlftmQaLTMdIX5RuLxGmM5u4PfQmgTJJB/DBBxp3wT59sCGNt+0=
X-Received: by 2002:a9f:24a3:: with SMTP id 32mr6526105uar.109.1558157406712;
 Fri, 17 May 2019 22:30:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190516194818.29230-1-jani.nikula@intel.com> <155808211071.12244.10320883277188429270@skylake-alporthouse-com>
In-Reply-To: <155808211071.12244.10320883277188429270@skylake-alporthouse-com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Sat, 18 May 2019 14:29:30 +0900
X-Gmail-Original-Message-ID: <CAK7LNARMb4Wza09Kq2it=NUkbd3asS9Me7uhUOSwPbu+j0OmeQ@mail.gmail.com>
Message-ID: <CAK7LNARMb4Wza09Kq2it=NUkbd3asS9Me7uhUOSwPbu+j0OmeQ@mail.gmail.com>
Subject: Re: [RFC 1/3] kbuild: add support for ensuring headers are self-contained
To:     Chris Wilson <chris@chris-wilson.co.uk>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        intel-gfx@lists.freedesktop.org,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, May 17, 2019 at 5:35 PM Chris Wilson <chris@chris-wilson.co.uk> wrote:
>
> Quoting Jani Nikula (2019-05-16 20:48:16)
> > diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> > index 8a1f64f17740..c2839de06485 100644
> > --- a/scripts/Makefile.lib
> > +++ b/scripts/Makefile.lib
> > @@ -66,6 +66,9 @@ extra-y += $(patsubst %.dtb,%.dt.yaml, $(dtb-y))
> >  extra-$(CONFIG_OF_ALL_DTBS) += $(patsubst %.dtb,%.dt.yaml, $(dtb-))
> >  endif
> >
> > +# Test self-contained headers
> > +extra-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.o,$(header-test-y))
>
> This didn't get pulled into clean-files.
>
> clean-files-$(CONFIG_HEADER_TEST) += $(patsubst %.h,%.header_test.c,$(header-test-y))
> ?
>
> Not enough. Nor is clean-files-y +=...


The correct syntax is 'clean-files +='
instead of 'clean-files-y +='


If Kbuild supports this in the core Makefiles,
we can add "-o -name '*.header_test.c'"
to the top Makefile.



> And it should also be put into the global gitignore I think.


Documentation/dontdiff too.



> -Chris



-- 
Best Regards
Masahiro Yamada
