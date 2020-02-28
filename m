Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A56F417357C
	for <lists+linux-kbuild@lfdr.de>; Fri, 28 Feb 2020 11:43:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgB1Knh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 28 Feb 2020 05:43:37 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:28884 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgB1Knh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 05:43:37 -0500
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01SAhHjV010135;
        Fri, 28 Feb 2020 19:43:18 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01SAhHjV010135
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1582886598;
        bh=pw9wwq0fdWwe3WrbhEgXZBbCYvCpt4TuDC/wTPamIL4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=Ed9LKACdPeNGq3IVRngqeVFbaNMBZEDTSwug06j15WF/oeFs6Sc4TRgcDZUv9fHu2
         rL0tNgbgS8FCOel5pkczsD6G3yZ5N6+BvtpqErUsa9zXYVwwvlwpWsUEHfcxwIpjW+
         TugZuvscqAPFWVjxPYDoUGmW/zCoP2Ie83//kw0jExXjVzfQegZWiGU0AIGioCRy5t
         x5bTVDlBkJm9NSlqOygDDP4Wsk/OYlBjX0YVolj6a1GmicsB1JCjeswP2l6a+kh+iG
         XiVAmFovL3IElxchpswcwnCZMRF0qfOPiTZkufH0M8on5mmxSo7PYvHpHdMrlAJrCI
         Yw6jhHgMj1geQ==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id h5so680688vsc.4;
        Fri, 28 Feb 2020 02:43:18 -0800 (PST)
X-Gm-Message-State: ANhLgQ0VwTEwf1Nh83sKPB8KrtmU6krFBoQ4DLUxz2MwresGLwuCBdw5
        7dmxYohfk3XoeUbNXJnOtvuOs3dlw1uGLf90mtA=
X-Google-Smtp-Source: ADFU+vuhZ5cfUXezc/zp2ykKceOheNsBUgjzsLoYt+1MzTIjEiZ3cT/2EwWGLCaVP3qt7iPea0jLhQQ+VMmgBKxito4=
X-Received: by 2002:a67:fa4b:: with SMTP id j11mr2110890vsq.155.1582886597156;
 Fri, 28 Feb 2020 02:43:17 -0800 (PST)
MIME-Version: 1.0
References: <20200218094139.78835-1-qperret@google.com> <20200218094139.78835-4-qperret@google.com>
In-Reply-To: <20200218094139.78835-4-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Feb 2020 19:42:41 +0900
X-Gmail-Original-Message-ID: <CAK7LNASCrTj4_RgtxvZm0ei_HExYaPPMJodngKXBOL+=GODv5w@mail.gmail.com>
Message-ID: <CAK7LNASCrTj4_RgtxvZm0ei_HExYaPPMJodngKXBOL+=GODv5w@mail.gmail.com>
Subject: Re: [PATCH v5 3/3] kbuild: generate autoksyms.h early
To:     Quentin Perret <qperret@google.com>
Cc:     Nicolas Pitre <nico@fluxnic.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Matthias Maennich <maennich@google.com>,
        "Cc: Android Kernel" <kernel-team@android.com>,
        Jessica Yu <jeyu@kernel.org>,
        Christoph Hellwig <hch@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 18, 2020 at 6:41 PM Quentin Perret <qperret@google.com> wrote:
>
> When doing a cold build, autoksyms.h starts empty, and is updated late
> in the build process to have visibility over the symbols used by in-tree
> drivers. But since the symbol whitelist is known upfront, it can be used
> to pre-populate autoksyms.h and maximize the amount of code that can be
> compiled to its final state in a single pass, hence reducing build time.
>
> Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
> creating an empty file.
>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>
> Tested-by: Matthias Maennich <maennich@google.com>
> Reviewed-by: Matthias Maennich <maennich@google.com>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  Makefile                 | 7 +++++--
>  scripts/gen_autoksyms.sh | 3 ++-
>  2 files changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 84b71845c43f..17b7e7f441bd 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1062,9 +1062,12 @@ endif
>
>  autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
>
> +quiet_cmd_autoksyms_h = GEN     $@
> +      cmd_autoksyms_h = mkdir -p $(dir $@); $(CONFIG_SHELL) \
> +                       $(srctree)/scripts/gen_autoksyms.sh $@


When you send v6,
could you wrap the line as follows (CONFIG_SHELL in the next line)  ?

         cmd_autoksyms_h = mkdir -p $(dir $@); \
                          $(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@


This still fits in 80-cols.

Thanks.




> +
>  $(autoksyms_h):
> -       $(Q)mkdir -p $(dir $@)
> -       $(Q)touch $@
> +       $(call cmd,autoksyms_h)
>
>  ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index 6c625f52118f..679c9f05e4b4 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -39,7 +39,8 @@ cat > "$output_file" << EOT
>
>  EOT
>
> -sed 's/ko$/mod/' modules.order |
> +[ -f modules.order ] && modlist=modules.order || modlist=/dev/null
> +sed 's/ko$/mod/' $modlist |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>  cat - "$ksym_wl" |
>  sort -u |
> --
> 2.25.0.265.gbab2e86ba0-goog
>


-- 
Best Regards
Masahiro Yamada
