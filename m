Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4EFD1562E7
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2020 06:09:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgBHFJ4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 8 Feb 2020 00:09:56 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:37415 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgBHFJz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Feb 2020 00:09:55 -0500
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01859hmN013105;
        Sat, 8 Feb 2020 14:09:43 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01859hmN013105
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581138583;
        bh=N6D5jo+vAq8fHn5iSXB7XmN5f+J7iCxpb/iTdSTATRY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=s4tjOqYnhagTSuxQlIKrMIrOUW+I/qtjVPpb/L2OK76jWXkDFpeKaC0RMATeWly3L
         bftzyQkHEQLaHhWm7IfbhQoR1NjY/L2XL0FAO4aXLcykpPmg0hlRqLf/JGVpVb8bj0
         6n1+4wI6mzagJw66lrmEAGIJYZnTKZQLGBZurlri96Tze0xtDgwdHDh/nzdBvB/xzh
         fB1EYbl0PR6mjiSfJfkwTOehq6X8b6QqIKFqn5a630THnPur/xk9T7s8RKZZzQ62l+
         Bayh7nEH+2ACfqW52hydIehsy4/sdIVHVLWUO4cWm2BoW/YzkATYKqOiV+s+48q3im
         +KzxlSfoKD9Cw==
X-Nifty-SrcIP: [209.85.221.176]
Received: by mail-vk1-f176.google.com with SMTP id w67so422686vkf.1;
        Fri, 07 Feb 2020 21:09:43 -0800 (PST)
X-Gm-Message-State: APjAAAVo5ExxS+RuWO2GrbN0yDwQYXbaQV/jWtIf6sEbVAKSmYOxiyVR
        BWal2CIaaUHOfgfUqkG8odFEfRcRGPcBhvcxvRw=
X-Google-Smtp-Source: APXvYqwjN7p0lr2wEjZebW2hKuAYzvbCXoP/0n+3izd4inMtjm45k8b8J/myUy584914wKNNbE+z4QKXrh1r52BZOMk=
X-Received: by 2002:a1f:72c3:: with SMTP id n186mr1512436vkc.12.1581138582383;
 Fri, 07 Feb 2020 21:09:42 -0800 (PST)
MIME-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com> <20200207180755.100561-4-qperret@google.com>
In-Reply-To: <20200207180755.100561-4-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 8 Feb 2020 06:09:06 +0100
X-Gmail-Original-Message-ID: <CAK7LNAT+Xw8ntYcrcMtLrekkgziaHU+7nvzdh5tqD0cbe8pJhw@mail.gmail.com>
Message-ID: <CAK7LNAT+Xw8ntYcrcMtLrekkgziaHU+7nvzdh5tqD0cbe8pJhw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] kbuild: generate autoksyms.h early
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

On Fri, Feb 7, 2020 at 7:08 PM Quentin Perret <qperret@google.com> wrote:
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
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
>  Makefile                 | 2 +-
>  scripts/gen_autoksyms.sh | 3 ++-
>  2 files changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 6a01b073915e..e5c389d189f7 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1065,7 +1065,7 @@ autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
>
>  $(autoksyms_h):
>         $(Q)mkdir -p $(dir $@)
> -       $(Q)touch $@
> +       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@


Now that this line is doing a non-trivial task,
it might be a good idea to show a short log, like this:

  GEN     include/generated/autoksyms.h



You can do it like this:


quiet_cmd_autoksyms_h = GEN     $@
      cmd_autoksyms_h = mkdir -p $(dir $@); $(BASH)
$(srctree)/scripts/gen_autoksyms.sh $@

$(autoksyms_h):
        $(call cmd,autoksyms_h)





>
>  ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index ce0919c3791a..ae033ab03a4a 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -32,7 +32,8 @@ cat > "$output_file" << EOT
>
>  EOT
>
> -sed 's/ko$/mod/' modules.order |
> +[[ -f modules.order ]] && modlist=modules.order || modlist=/dev/null
> +sed 's/ko$/mod/' $modlist |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
>  cat - "$ksym_wl" |
>  sort -u |
> --
> 2.25.0.341.g760bfbb309-goog
>


--
Best Regards

Masahiro Yamada
