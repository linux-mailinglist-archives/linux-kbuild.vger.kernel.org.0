Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 550B885ACB
	for <lists+linux-kbuild@lfdr.de>; Thu,  8 Aug 2019 08:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731098AbfHHGan (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 8 Aug 2019 02:30:43 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:54085 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725817AbfHHGan (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 8 Aug 2019 02:30:43 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x786US1B009911;
        Thu, 8 Aug 2019 15:30:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x786US1B009911
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1565245829;
        bh=gPVn4kg/MQMRHf5Lz12yg0uXG1KyqNHjoIC0Y1yDWPo=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mEJslXuASafslBYnKfdobR0iREcFNPyJfk6U35DUduNt6HiYpMm75SA0Gwxq9wfit
         ustypL/fVDMLkNik17RqYikXROrOHIkt0yd5+LT30kNCZDzU9mQWjCKUJUW9ycwjC2
         ujbMDDrv+b5Oe9fQd9g0RkcMCD+ZpAecdvahNp0vIJxldAgQ+Jo1U6ABWmbCpZow+o
         ujyq6CfDT5Hljs1lugE8p1Hha6gETtCXdZjpjfTNrZTtHy+k2c7y6t/FoHimUC259j
         fKmtXVY6zu37n2mGHBiTFWdEuZAm7P4gcn2JvBfdbtQMP5mqwiKRRY2GYZwJFdURKn
         BTrXZ0qfVMWKw==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id y16so62270686vsc.3;
        Wed, 07 Aug 2019 23:30:29 -0700 (PDT)
X-Gm-Message-State: APjAAAWHvF8rgXd7ZRjvsqBd4DG8av/KjS/iArALXyqMoMnHzVZ2LK9R
        XuM1yJ4ZKd/MjSuaHfq+hFSus41Q7hmG5cyF90k=
X-Google-Smtp-Source: APXvYqz5LBOdTMvDI8Dv1tMNZP247T6t7FKAkqs+TVVnRbFMv21IkcWjIiYjripFL+jsFTam+Ic/T/5fQtOvkUD0Bbk=
X-Received: by 2002:a67:d46:: with SMTP id 67mr8336889vsn.181.1565245828043;
 Wed, 07 Aug 2019 23:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190806100323.22919-1-yamada.masahiro@socionext.com> <20190806100323.22919-3-yamada.masahiro@socionext.com>
In-Reply-To: <20190806100323.22919-3-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Thu, 8 Aug 2019 15:29:52 +0900
X-Gmail-Original-Message-ID: <CAK7LNARrC2h_qtFaY6=2+YVz2kJcMK_+QZ+WJEba8T1AH_Nvjg@mail.gmail.com>
Message-ID: <CAK7LNARrC2h_qtFaY6=2+YVz2kJcMK_+QZ+WJEba8T1AH_Nvjg@mail.gmail.com>
Subject: Re: [PATCH 3/3] kbuild: show hint if subdir-y/m is used to visit
 module Makefile
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jan Kiszka <jan.kiszka@siemens.com>,
        Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 6, 2019 at 7:03 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Since commit ff9b45c55b26 ("kbuild: modpost: read modules.order instead
> of $(MODVERDIR)/*.mod"), a module is no longer built in the following
> pattern:
>
>   [Makefile]
>   subdir-y := some-module
>
>   [some-module/Makefile]
>   obj-m := some-module.o
>
> You cannot write Makefile this way in upstream because modules.order is
> not correctly generated. subdir-y is used to descend to a sub-directory
> that builds tools, device trees, etc.
>
> For external modules, the modules order does not matter. So, the
> Makefile above was known to work.
>
> I believe the Makefile should be re-written as follows:
>
>   [Makefile]
>   obj-m := some-module/
>
>   [some-module/Makefile]
>   obj-m := some-module.o
>
> However, people will have no idea if their Makefile suddenly stops
> working. In fact, I received questions from multiple people.
>
> Show a warning if obj-m is specified in a Makefile visited by subdir-y
> or subdir-m.
>
> Cc: Jan Kiszka <jan.kiszka@siemens.com>
> Cc: Tom Stonecypher <thomas.edwardx.stonecypher@intel.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

This produces false-positive warnings for single-targets.
I will fix up as follows:


diff --git a/Makefile b/Makefile
index 0e37ad2f77bf..fac25e279da6 100644
--- a/Makefile
+++ b/Makefile
@@ -1783,7 +1783,7 @@ PHONY += /
 /: ./

 %/: prepare FORCE
-       $(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir)
+       $(Q)$(MAKE) KBUILD_MODULES=1 $(build)=$(build-dir) need-modorder=1

 # FIXME Should go into a make.lib or something
 # ===========================================================================



>
>  scripts/Makefile.build | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 37a1d2cd49d4..4a26c7ed9198 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -52,6 +52,13 @@ ifndef obj
>  $(warning kbuild: Makefile.build is included improperly)
>  endif
>
> +ifeq ($(need-modorder),)
> +ifneq ($(obj-m),)
> +$(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
> +$(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
> +endif
> +endif
> +
>  # ===========================================================================
>
>  ifneq ($(strip $(lib-y) $(lib-m) $(lib-)),)
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
