Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FC2F30584F
	for <lists+linux-kbuild@lfdr.de>; Wed, 27 Jan 2021 11:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S314210AbhAZXAl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 26 Jan 2021 18:00:41 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:53987 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730929AbhAZSdY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Jan 2021 13:33:24 -0500
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 10QIVnHR008303;
        Wed, 27 Jan 2021 03:31:49 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 10QIVnHR008303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1611685909;
        bh=/cbf7e8LmV7x9OtCuoBUae5y80EWIXt9JqqUtFKiUGQ=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=rxycYHt8rCDfLSHGFXvlHRXizbEMfEEz9NHGNRQbyY35IfYEGaF+rJ3r/IVkCBrck
         f16WOjgwPsGIb6FKuNTTWsZQXFca12XpglKRd+MB0Ufwq5GUMcD7rTVgJCZDPXJOeT
         ZhBHe/T84o8zqoXH4CyUh4A+fDjSFGAUQvgC5RufEmFGURABCGWFgCOQ+ld5XaYQ2a
         xxTpSn+9k0+zEByg5UTYWdI6LqVIfOsS8y2URi4Lg8i2uiCo/aANu7jFcqEIDsscBV
         MeSf1I51Da5WSSZYfhUwbkK1F5c9FJxVDdFdtXOPlBeQQYhDDKeXwbbZ9fbiMqVOM2
         +IN6JWgOnCl4Q==
X-Nifty-SrcIP: [209.85.215.175]
Received: by mail-pg1-f175.google.com with SMTP id c132so11997138pga.3;
        Tue, 26 Jan 2021 10:31:49 -0800 (PST)
X-Gm-Message-State: AOAM533D55PuOtXwBpezd5kwaV4i6L2esi9ZordAq7/cCmDyernsBeyz
        u26b7Hms0lFMAHJn6xt2W+2gLYmTrfRvakrqRzI=
X-Google-Smtp-Source: ABdhPJyI9P2i1eBVt1LJ8nZ/tmGy3m7Kd7gmq+2nA5uZ+g8cMWLfh9ilb8p7qv4I5POT6DncROCedKctHD/HTs8qyzA=
X-Received: by 2002:aa7:8602:0:b029:1bb:4dfd:92fc with SMTP id
 p2-20020aa786020000b02901bb4dfd92fcmr6488077pfn.63.1611685908608; Tue, 26 Jan
 2021 10:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20210120040403.2897639-1-masahiroy@kernel.org>
In-Reply-To: <20210120040403.2897639-1-masahiroy@kernel.org>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 27 Jan 2021 03:31:11 +0900
X-Gmail-Original-Message-ID: <CAK7LNARqYOEySMvVQx31KPOPKeB+UZ3wn4-NF2qcGf=ajOdsyw@mail.gmail.com>
Message-ID: <CAK7LNARqYOEySMvVQx31KPOPKeB+UZ3wn4-NF2qcGf=ajOdsyw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: stop removing stale <linux/version.h> file
To:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jan 20, 2021 at 1:04 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Revert commit 223c24a7dba9 ("kbuild: Automatically remove stale
> <linux/version.h> file").
>
> It was more than 6 years ago. I do not expect anybody to start
> git-bisect for such a big window.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.



>  Makefile | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 23d0494e48bc..ebbf7158dfa0 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -257,7 +257,6 @@ export building_out_of_srctree srctree objtree VPATH
>  # of make so .config is not included in this case either (for *config).
>
>  version_h := include/generated/uapi/linux/version.h
> -old_version_h := include/linux/version.h
>
>  clean-targets := %clean mrproper cleandocs
>  no-dot-config-targets := $(clean-targets) \
> @@ -1261,7 +1260,6 @@ endef
>
>  $(version_h): FORCE
>         $(call filechk,version.h)
> -       $(Q)rm -f $(old_version_h)
>
>  include/generated/utsrelease.h: include/config/kernel.release FORCE
>         $(call filechk,utsrelease.h)
> --
> 2.27.0
>


-- 
Best Regards
Masahiro Yamada
