Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9F0C1562E3
	for <lists+linux-kbuild@lfdr.de>; Sat,  8 Feb 2020 06:05:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725876AbgBHFFz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 8 Feb 2020 00:05:55 -0500
Received: from conssluserg-05.nifty.com ([210.131.2.90]:31875 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbgBHFFz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 8 Feb 2020 00:05:55 -0500
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com [209.85.217.53]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 01855cV8011501;
        Sat, 8 Feb 2020 14:05:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 01855cV8011501
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1581138339;
        bh=xfUarjL/4ttWXwZmf+E7cmkD+z3pYKifJ+1FXUZBOd4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=p+pP5BWuh6eY4h4B7Uqb17+o64tPtJRMrqtRePHYbor6cES5e+HIJrXW3VFYiIPpa
         UPbziR9jkRhAo04T1Jjjrn9pM8e7Qs8UDY07GPm4EUgmDJNrzGSKV47lms35konP2L
         ZXZ7s5PRVrpVtmVUi0aSBtE7LDZHHk8rI9jhqedbBGj+n4pks4ml5Oa+moMRnh5ImB
         T2MmDh6YxT3qSFrFUw1gJDfzZ/FadeMk5+UYcx34ABjj6Haaz4C/B5sSQqSGE9K1H8
         W3uV27lkLwZ7EQj1NG2HbY4GbmoB1wlybWIeJ094ef7EG/yYiSjzRo3Nx+gI4ZiZ/6
         mfRG/RhlTEZlg==
X-Nifty-SrcIP: [209.85.217.53]
Received: by mail-vs1-f53.google.com with SMTP id g15so1017892vsf.1;
        Fri, 07 Feb 2020 21:05:39 -0800 (PST)
X-Gm-Message-State: APjAAAVqEQXOtRuKKHvc98si0lyMDf/HyZzTEx8tUb+lPFNTSSGoQa1i
        1tjF0CHxEYfTf465ddOWtCS2CAhdYQBCWMyUtWQ=
X-Google-Smtp-Source: APXvYqzuJPmPD4c8u/4HoEoZbf4Rvm7VGU+szn3HrfAvLVT0ccCAjc+VWktkYW8xrxc2aIREO4VKePYTnpYF8+lvAUk=
X-Received: by 2002:a05:6102:1174:: with SMTP id k20mr1077279vsg.155.1581138338276;
 Fri, 07 Feb 2020 21:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20200207180755.100561-1-qperret@google.com> <20200207180755.100561-2-qperret@google.com>
In-Reply-To: <20200207180755.100561-2-qperret@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 8 Feb 2020 06:05:02 +0100
X-Gmail-Original-Message-ID: <CAK7LNASMeXjxaj2Hbh420bxBZqVUoa87PtBuu38+fB6aZgJTXg@mail.gmail.com>
Message-ID: <CAK7LNASMeXjxaj2Hbh420bxBZqVUoa87PtBuu38+fB6aZgJTXg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] kbuild: allow symbol whitelisting with TRIM_UNUSED_KSYMS
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

Hi.



On Fri, Feb 7, 2020 at 7:08 PM Quentin Perret <qperret@google.com> wrote:
>
> CONFIG_TRIM_UNUSED_KSYMS currently removes all unused exported symbols
> from ksymtab. This works really well when using in-tree drivers, but
> cannot be used in its current form if some of them are out-of-tree.
>
> Indeed, even if the list of symbols required by out-of-tree drivers is
> known at compile time, the only solution today to guarantee these don't
> get trimmed is to set CONFIG_TRIM_UNUSED_KSYMS=n. This not only wastes
> space, but also makes it difficult to control the ABI usable by vendor
> modules in distribution kernels such as Android. Being able to control
> the kernel ABI surface is particularly useful to ship a unique Generic
> Kernel Image (GKI) for all vendors, which is a first step in the
> direction of getting all vendors to contribute their code upstream.
>
> As such, attempt to improve the situation by enabling users to specify a
> symbol 'whitelist' at compile time. Any symbol specified in this
> whitelist will be kept exported when CONFIG_TRIM_UNUSED_KSYMS is set,
> even if it has no in-tree user. The whitelist is defined as a simple
> text file, listing symbols, one per line.
>
> Acked-by: Jessica Yu <jeyu@kernel.org>
> Signed-off-by: Quentin Perret <qperret@google.com>
> ---
> @Nicolas: I left your Reviewed-by behind as the code has changed a bit
> but let me know what you think
> ---
>  init/Kconfig                | 13 +++++++++++++
>  scripts/adjust_autoksyms.sh |  5 +++++
>  2 files changed, 18 insertions(+)
>
> diff --git a/init/Kconfig b/init/Kconfig
> index a34064a031a5..79fd976ce031 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -2180,6 +2180,19 @@ config TRIM_UNUSED_KSYMS
>
>           If unsure, or if you need to build out-of-tree modules, say N.
>
> +config UNUSED_KSYMS_WHITELIST
> +       string "Whitelist of symbols to keep in ksymtab"
> +       depends on TRIM_UNUSED_KSYMS
> +       help
> +         By default, all unused exported symbols will be un-exported from the
> +         build when TRIM_UNUSED_KSYMS is selected.
> +
> +         UNUSED_KSYMS_WHITELIST allows to whitelist symbols that must be kept
> +         exported at all times, even in absence of in-tree users. The value to
> +         set here is the path to a text file containing the list of symbols,
> +         one per line. The path can be absolute, or relative to the kernel
> +         source tree.
> +
>  endif # MODULES
>
>  config MODULES_TREE_LOOKUP
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index a904bf1f5e67..58335eee4b38 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -38,6 +38,10 @@ esac
>  # We need access to CONFIG_ symbols
>  . include/config/auto.conf
>
> +# The symbol whitelist, relative to the source tree
> +eval ksym_wl="${CONFIG_UNUSED_KSYMS_WHITELIST:-/dev/null}"

What is this 'eval' needed for?

This worked for me without it.





> +[[ "$ksym_wl" =~ ^/ ]] || ksym_wl="$abs_srctree/$ksym_wl"
> +
>  # Generate a new ksym list file with symbols needed by the current
>  # set of modules.
>  cat > "$new_ksyms_file" << EOT
> @@ -48,6 +52,7 @@ cat > "$new_ksyms_file" << EOT
>  EOT
>  sed 's/ko$/mod/' modules.order |
>  xargs -n1 sed -n -e '2{s/ /\n/g;/^$/!p;}' -- |
> +cat - "$ksym_wl" |
>  sort -u |
>  sed -e 's/\(.*\)/#define __KSYM_\1 1/' >> "$new_ksyms_file"
>
> --
> 2.25.0.341.g760bfbb309-goog
>


--
Best Regards
Masahiro Yamada
