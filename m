Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC69B305860
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:28:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314193AbhAZXAg (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:36 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38633 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392482AbhAZSE2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:04:28 -0500
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 10QI314b020894;
        Wed, 27 Jan 2021 03:03:02 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 10QI314b020894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611684182;
        bh=kWOccqxKJoFYPnJsQ+y0BCvq3KmzNRThKQzTaXhv0S8=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=N7TcHLcnqdF/FFV1Wy+s+viyBMtrA6US56U/UtYazUnTYqU39VnCpTmA3AMq8I6qh
         Yxzq5E45SKbeLvAjdvbZXkEoaSs6HnpW12otvGY7JDxdwBTA6tC7kLwCmhBvItc/K6
         s+2JlSHUg8pF15Uvpkj6KPm7GHd4Jnii/mPGV0gysoR3HGbC/CWD1f0nWbODVNb+7f
         yZQly0ZOhpqX+r3KLAu6HhIb5GZW2ZPEgnp2JG1J7bUKfQxvJQI/f9YaDLsJr5rwdL
         6KufYEBlN1he17eOVTBS+t6F+Tb9kyuUW9qStXlhS8mwwuCvYRyQY0xMySu4dom2Xt
         EFB+W6S9BlB5A==
X-Nifty-SrcIP: [209.85.215.177]
Received: by mail-pg1-f177.google.com with SMTP id o16so2317059pgg.5;
        Tue, 26 Jan 2021 10:03:02 -0800 (PST)
X-Gm-Message-State: AOAM5335+Lei3tGibMPWexIKZzcYioLoSAtBRWn7X3y1YYU7NseuYUWo
        8byl5bWIyxzp7Wheq7oWx3HpIeKXedJsOivPtPA=
X-Google-Smtp-Source: ABdhPJx+H/cXgj5zI7oWkcqkTZSzrMbWyb/BlnvQyP4tIvkh5dGbenAkbeJD4xYcpMHWSPyDiZNSRGiDCJ8advtWTH0=
X-Received: by 2002:a63:ff09:: with SMTP id k9mr6846869pgi.175.1611684181350;
 Tue, 26 Jan 2021 10:03:01 -0800 (PST)
MIME-Version: 1.0
References: <1611343638-28206-1-git-send-email-eberman@codeaurora.org> <1611343638-28206-2-git-send-email-eberman@codeaurora.org>
In-Reply-To: <1611343638-28206-2-git-send-email-eberman@codeaurora.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 27 Jan 2021 03:02:24 +0900
X-Gmail-Original-Message-ID: <CAK7LNASJww-7Tboj4w7sJ-ERXz9J7rUswACVQpYuZjOtsDV8Lw@mail.gmail.com>
Message-ID: <CAK7LNASJww-7Tboj4w7sJ-ERXz9J7rUswACVQpYuZjOtsDV8Lw@mail.gmail.com>
Subject: Re: [RFC 1/2] Kbuild: Make composite object searching more generic
To:     Elliot Berman <eberman@codeaurora.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Sami Tolvanen <samitolvanen@google.com>,
        Trilok Soni <tsoni@codeaurora.org>,
        Mahesh Kumar Kalikot Veetil <mkalikot@codeaurora.org>,
        Jeff Johnson <jjohnson@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Jan 23, 2021 at 4:27 AM Elliot Berman <eberman@codeaurora.org> wrote:
>
> Reduce repeated logic around expanding composite objects in preparation
> for later commit to support nested composite objects.
>
> Signed-off-by: Elliot Berman <eberman@codeaurora.org>

This patch is a nice clean-up
regardless of your main motivation in 2/2.


I removed the "in preparation ..." part.

Applied to linux-kbuild. Thanks.




> ---
>  scripts/Makefile.lib | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 213677a5..93e4f10 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -56,15 +56,19 @@ else
>  obj-y          := $(filter-out %/, $(obj-y))
>  endif
>
> +# Expand $(foo-objs) $(foo-y) by calling $(call suffix-search,foo.o,-objs -y)
> +suffix-search = $(foreach s,$(2),$($(1:.o=$s)))
>  # If $(foo-objs), $(foo-y), $(foo-m), or $(foo-) exists, foo.o is a composite object
> -multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))), $(m))))
> -multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))), $(m))))
> +multi-search = $(sort $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)), $(m))))
> +multi-used-y := $(call multi-search,$(obj-y),-objs -y)
> +multi-used-m := $(call multi-search,$(obj-m),-objs -y -m)
>  multi-used   := $(multi-used-y) $(multi-used-m)
>
>  # Replace multi-part objects by their individual parts,
>  # including built-in.a from subdirectories
> -real-obj-y := $(foreach m, $(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
> -real-obj-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)) $($(m:.o=-))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
> +real-search = $(foreach m,$(1), $(if $(strip $(call suffix-search,$(m),$(2) -)),$(call suffix-search,$(m),$(2)),$(m)))
> +real-obj-y := $(call real-search, $(obj-y),-objs -y)
> +real-obj-m := $(call real-search, $(obj-m),-objs -y -m)
>
>  always-y += $(always-m)
>
> --
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
>


--
Best Regards
Masahiro Yamada
