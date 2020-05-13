Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA181D04F8
	for <lists+linux-kbuild@lfdr.de>; Wed, 13 May 2020 04:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727890AbgEMCcK (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 22:32:10 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:51405 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727082AbgEMCcJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 22:32:09 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 04D2VenL025348;
        Wed, 13 May 2020 11:31:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 04D2VenL025348
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589337101;
        bh=pHIa5fFsx8zz9gzzrhQU7O/+Uu4ZQI0I+ydqfvHXHw0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=gMm1B1S3D6npQrdwB+n9OdwHGDO4Kpf8NvH3A0fkEiuC6IAD8oQKNe6i7aE0uYIun
         MIJzWZVxVs4E+XSzEyHzSRfLFPQJH1zz2AtmMhB/88b2DwAV0827ot0CGZq6vVAjds
         yL/Mp5gJMklg8iTGBQvwtH5ucyocz0zrwjADP0vdHdV/K2cp7rMwQVmZzO8F6l0pHd
         D32G4LbVoFu9pQenZgAjLKODu6I11kdUKHxDZWiacOQIdI51KzJGrOYGm4tp3edCUQ
         yfxYbDCf7RqmYn3sme1yvMtcU/itusRnlwilpb4ioF5zOTu1YXg0qDY9zThxsyzkHQ
         3PPz1kuFasBPg==
X-Nifty-SrcIP: [209.85.160.170]
Received: by mail-qt1-f170.google.com with SMTP id x8so12926767qtr.2;
        Tue, 12 May 2020 19:31:41 -0700 (PDT)
X-Gm-Message-State: AOAM531EgHosBra8RN34zish0qgELVJ+LCiRkjEEaiITFJAIkW7iBFUG
        y8xz0ZL/85w2YRMO4ijKjZdJaLy9TIfrhMco09M=
X-Google-Smtp-Source: ABdhPJyPm1TDgFfhissLLm3GMkHaRGbgDKHsM/2UPq+3GdGM7Keo+khWxm395qEIMUGoAbv2ZHrd61RLsgQrBRArhyM=
X-Received: by 2002:ac8:7698:: with SMTP id g24mr9239062qtr.290.1589337100109;
 Tue, 12 May 2020 19:31:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200512153607.5560-1-changbin.du@gmail.com>
In-Reply-To: <20200512153607.5560-1-changbin.du@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Wed, 13 May 2020 11:31:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNATjTK2FXe8ogHSKQsFfw8GvpEOq76BfKGf+x2puF5PYKQ@mail.gmail.com>
Message-ID: <CAK7LNATjTK2FXe8ogHSKQsFfw8GvpEOq76BfKGf+x2puF5PYKQ@mail.gmail.com>
Subject: Re: [PATCH v6] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
To:     Changbin Du <changbin.du@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, May 13, 2020 at 12:36 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
>
>  $ make LMC_KEEP="drivers/usb:fs" localmodconfig
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
>

Applied to linux-kbuild.
Thanks.


> ---
> v6: add note for localyesconfig.
> v5: use ':' as delimiter.
> v4: fix typo.
> v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> v2: fix typo in documentation. (Randy Dunlap)
> ---
>  Documentation/admin-guide/README.rst | 11 +++++++++--
>  scripts/kconfig/Makefile             |  2 ++
>  scripts/kconfig/streamline_config.pl | 21 +++++++++++++++++++++
>  3 files changed, 32 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index cc6151fc0845..5fb526900023 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -209,15 +209,22 @@ Configuring the kernel
>                             store the lsmod of that machine into a file
>                             and pass it in as a LSMOD parameter.
>
> +                           Also, you can preserve modules in certain folders
> +                           or kconfig files by specifying their paths in
> +                           parameter LMC_KEEP.
> +
>                     target$ lsmod > /tmp/mylsmod
>                     target$ scp /tmp/mylsmod host:/tmp
>
> -                   host$ make LSMOD=/tmp/mylsmod localmodconfig
> +                   host$ make LSMOD=/tmp/mylsmod \
> +                           LMC_KEEP="drivers/usb:drivers/gpu:fs" \
> +                           localmodconfig
>
>                             The above also works when cross compiling.
>
>       "make localyesconfig" Similar to localmodconfig, except it will convert
> -                           all module options to built in (=y) options.
> +                           all module options to built in (=y) options. You can
> +                           also preserve modules by LMC_KEEP.
>
>       "make kvmconfig"   Enable additional options for kvm guest kernel support.
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index c9d0a4a8efb3..f3355bd86aa5 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -123,7 +123,9 @@ help:
>         @echo  '  gconfig         - Update current config utilising a GTK+ based front-end'
>         @echo  '  oldconfig       - Update current config utilising a provided .config as base'
>         @echo  '  localmodconfig  - Update current config disabling modules not loaded'
> +       @echo  '                    except those preserved by LMC_KEEP environment variable'
>         @echo  '  localyesconfig  - Update current config converting local mods to core'
> +       @echo  '                    except those preserved by LMC_KEEP environment variable'
>         @echo  '  defconfig       - New config with default from ARCH supplied defconfig'
>         @echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
>         @echo  '  allnoconfig     - New config where all options are answered with no'
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index e2f8504f5a2d..19857d18d814 100755
> --- a/scripts/kconfig/streamline_config.pl
> +++ b/scripts/kconfig/streamline_config.pl
> @@ -143,6 +143,7 @@ my %depends;
>  my %selects;
>  my %prompts;
>  my %objects;
> +my %config2kfile;
>  my $var;
>  my $iflevel = 0;
>  my @ifdeps;
> @@ -201,6 +202,7 @@ sub read_kconfig {
>         if (/^\s*(menu)?config\s+(\S+)\s*$/) {
>             $state = "NEW";
>             $config = $2;
> +           $config2kfile{"CONFIG_$config"} = $kconfig;
>
>             # Add depends for 'if' nesting
>             for (my $i = 0; $i < $iflevel; $i++) {
> @@ -591,6 +593,20 @@ while ($repeat) {
>  }
>
>  my %setconfigs;
> +my @preserved_kconfigs = split(/:/,$ENV{LMC_KEEP});
> +
> +sub in_preserved_kconfigs {
> +    my $kconfig = $config2kfile{$_[0]};
> +    if (!defined($kconfig)) {
> +        return 0;
> +    }
> +    foreach my $excl (@preserved_kconfigs) {
> +        if($kconfig =~ /^$excl/) {
> +            return 1;
> +        }
> +    }
> +    return 0;
> +}
>
>  # Finally, read the .config file and turn off any module enabled that
>  # we could not find a reason to keep enabled.
> @@ -644,6 +660,11 @@ foreach my $line (@config_file) {
>      }
>
>      if (/^(CONFIG.*)=(m|y)/) {
> +        if (in_preserved_kconfigs($1)) {
> +            dprint "Preserve config $1";
> +            print;
> +            next;
> +        }
>         if (defined($configs{$1})) {
>             if ($localyesconfig) {
>                 $setconfigs{$1} = 'y';
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
