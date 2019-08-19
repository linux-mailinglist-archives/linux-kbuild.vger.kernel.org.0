Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A2B29927A4
	for <lists+linux-kbuild@lfdr.de>; Mon, 19 Aug 2019 16:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726390AbfHSOyG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 19 Aug 2019 10:54:06 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:24315 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbfHSOyG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 10:54:06 -0400
Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id x7JEs0i7031748;
        Mon, 19 Aug 2019 23:54:01 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com x7JEs0i7031748
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1566226442;
        bh=4rGi8J2rUzntz7GIHg2SOoPHDUBssi7TUk7NlAC+Y7k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mI5bqIlcbGX1RP0whGa+PkKZ0Ot8+XEqRlRuqLPeMYY1VNyl/CXJigA3Cg/QAUgMF
         0c+Itq63zQGC6FSQWXCVXcRxmTcZq93piWIR8PpXHXSHGLDJQzT9kyqNWkFip/jZ3m
         KIqaN+9wW/1CeD3HaHxjt0d9WZjlNUfyT++CuYrjyHAxHZOZwZiUoDvbZ7S6k8/4FT
         mVZx0E1SKvajikuAuk1+ssZo+xklcxrBwH+6SLENERVQfficsd47W5BitXs9MtBQAv
         80LoYQovprjhbYZtgq1jzVVzrQ+8sJiie+VWC8J65o6B+3VUCosYkSrplSY8IhDCtC
         bAwB+o1qERPFA==
X-Nifty-SrcIP: [209.85.217.45]
Received: by mail-vs1-f45.google.com with SMTP id 62so1359289vsl.5;
        Mon, 19 Aug 2019 07:54:01 -0700 (PDT)
X-Gm-Message-State: APjAAAV0jvLwTVaD5PTrHUzg9Q+0Zbgj4DA0n5uMnDfktkqzrjh+tz5x
        hQkCBPxZEk1kXv43EQR+ERLW3iGR4+wxatXZCg8=
X-Google-Smtp-Source: APXvYqxCvPdamZU+p02SDF09e1/NvXrn0Hz7DR3KtmzcpTVIO+I0G8oV9tN9ed3CMXFLqH/dKJESxZpEmc6A73VTg4s=
X-Received: by 2002:a67:e401:: with SMTP id d1mr3659378vsf.215.1566226439982;
 Mon, 19 Aug 2019 07:53:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190806063923.1266-1-yamada.masahiro@socionext.com> <20190806063923.1266-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190806063923.1266-2-yamada.masahiro@socionext.com>
From:   Masahiro Yamada <yamada.masahiro@socionext.com>
Date:   Mon, 19 Aug 2019 23:53:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNATaj9zY1E=7-HU_v_PwiQYs+GP1Y5r19evqUdYaZ7+Hpg@mail.gmail.com>
Message-ID: <CAK7LNATaj9zY1E=7-HU_v_PwiQYs+GP1Y5r19evqUdYaZ7+Hpg@mail.gmail.com>
Subject: Re: [PATCH 1/5] kbuild: treat an object as multi-used when $(foo-) is set
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Jani Nikula <jani.nikula@intel.com>,
        intel-gfx@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 6, 2019 at 3:40 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Currently, Kbuild treats an object as multi-used when any of
> $(foo-objs), $(foo-y), $(foo-m) is set. It makes more sense to
> check $(foo-) as well.
>
> In the context of foo-$(CONFIG_FOO_FEATURE1), CONFIG_FOO_FEATURE1
> could be unset.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Only this patch applied for now.


> ---
>
>  scripts/Makefile.lib | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 41c50f9461e5..0a540599823e 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -41,9 +41,9 @@ obj-m         := $(filter-out %/, $(obj-m))
>  # Subdirectories we need to descend into
>  subdir-ym      := $(sort $(subdir-y) $(subdir-m))
>
> -# if $(foo-objs), $(foo-y), or $(foo-m) exists, foo.o is a composite object
> -multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
> -multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
> +# If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
> +multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $(m))))
> +multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
>  multi-used   := $(multi-used-y) $(multi-used-m)
>
>  # $(subdir-obj-y) is the list of objects in $(obj-y) which uses dir/ to
> @@ -52,8 +52,8 @@ subdir-obj-y := $(filter %/built-in.a, $(obj-y))
>
>  # Replace multi-part objects by their individual parts,
>  # including built-in.a from subdirectories
> -real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
> -real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
> +real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
> +real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
>
>  # DTB
>  # If CONFIG_OF_ALL_DTBS is enabled, all DT blobs are built
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
