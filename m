Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FC0C1C8073
	for <lists+linux-kbuild@lfdr.de>; Thu,  7 May 2020 05:20:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgEGDU4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 6 May 2020 23:20:56 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:63080 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbgEGDUx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 23:20:53 -0400
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 0473KYvD014344;
        Thu, 7 May 2020 12:20:34 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 0473KYvD014344
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1588821635;
        bh=qQyluZ7mOy/m7UtR6KHo32hLJ8zj6s7Wbis5gOyL850=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=obwaIpbVfNHmlGM+/K3cut/ZFJ3DDIma/vMgc1y6FY+bfiZMsVJEcf+tqZ2K5bwnG
         rESGRpG/mu+dg7LFTumeAGroNpVNEmWwkGlJav63kEO9T96Ujez237fqKZ46Dn94OJ
         ZV1Pk9jw7MX6w03zdZ1wTNu5glOFh8aTx/qOvVrAidOQUdF+Dz1MHGPr0OtE/OEe4J
         MjkNVx/DbdxiRTjeonFPIe7/dLdmovRUZkzN/iFbM3HAOM30gkZfiGWntXvtD0n4av
         7LW+/ROtvoJiJu24P3NDA0YIrOVdt/vlyKWw3gUljrALc1RO7KQjn//25dBY0RzFCI
         r3RgGDnSCxafA==
X-Nifty-SrcIP: [209.85.221.180]
Received: by mail-vk1-f180.google.com with SMTP id b14so1114435vkk.10;
        Wed, 06 May 2020 20:20:34 -0700 (PDT)
X-Gm-Message-State: AGi0PuZXmOK8vQhasFCgv14DCL1Q37rDazXTyFMwWXYh83joIyJ0fJNU
        ++YixiQic2L7sEaAZxyR8URN3Ubke9TXIz0w0eQ=
X-Google-Smtp-Source: APiQypKPWT1VyEpw8SXXLzadbs0W/IljladDXCbCPO4LoRyZSuErcwr4PH11Rt74yBLMD4rLrQL94ROkDgp9VchjKi8=
X-Received: by 2002:a1f:2a13:: with SMTP id q19mr9970940vkq.73.1588821633138;
 Wed, 06 May 2020 20:20:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200503001141.9647-1-changbin.du@gmail.com>
In-Reply-To: <20200503001141.9647-1-changbin.du@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 7 May 2020 12:19:57 +0900
X-Gmail-Original-Message-ID: <CAK7LNATBt1NxRSWiv8Ab-pKBRemp43WUs96KWELTf+vFq_VPTA@mail.gmail.com>
Message-ID: <CAK7LNATBt1NxRSWiv8Ab-pKBRemp43WUs96KWELTf+vFq_VPTA@mail.gmail.com>
Subject: Re: [PATCH v4] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
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

On Sun, May 3, 2020 at 9:11 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
>
>  $ make LMC_KEEP="drivers/usb;fs" localmodconfig
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
>
> ---
> v4: fix typo.
> v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> v2: fix typo in documentation. (Randy Dunlap)
> ---


Personally, I do not mind the long LOCALMODCONFIG_PRESERVE,
but this tends to be bike-sheding.
I do not have a strong opinion.


>  Documentation/admin-guide/README.rst |  8 +++++++-
>  scripts/kconfig/Makefile             |  1 +
>  scripts/kconfig/streamline_config.pl | 23 +++++++++++++++++++++++
>  3 files changed, 31 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index cc6151fc0845..1371deab8bc7 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -209,10 +209,16 @@ Configuring the kernel
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
> +                           LMC_KEEP="drivers/usb;drivers/gpu;fs" \


This might be another bike-sheding item, but
can you use a space for the delimiter?


LMC_KEEP="drivers/usb drivers/gpu fs"

If you pass multiple directories,
you will need to surround them with double-quotes.




> +                           localmodconfig
>
>                             The above also works when cross compiling.
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index c9d0a4a8efb3..e0abbf5805f5 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -123,6 +123,7 @@ help:
>         @echo  '  gconfig         - Update current config utilising a GTK+ based front-end'
>         @echo  '  oldconfig       - Update current config utilising a provided .config as base'
>         @echo  '  localmodconfig  - Update current config disabling modules not loaded'
> +       @echo  '                    except those preserved by LMC_KEEP environment variable'
>         @echo  '  localyesconfig  - Update current config converting local mods to core'
>         @echo  '  defconfig       - New config with default from ARCH supplied defconfig'
>         @echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
> diff --git a/scripts/kconfig/streamline_config.pl b/scripts/kconfig/streamline_config.pl
> index e2f8504f5a2d..d26543a807c9 100755
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
> @@ -592,6 +594,22 @@ while ($repeat) {
>
>  my %setconfigs;
>
> +my @preserved_kconfigs;
> +@preserved_kconfigs = split(/;/,$ENV{LMC_KEEP}) if (defined($ENV{LMC_KEEP}));

Maybe, you can do 'my' declaration and the assignment
in a single line?

Can you drop the 'if ...' conditional?


Does this work for you?

my @preserved_kconfigs = split(/;/,$ENV{LMC_KEEP});







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
> +
>  # Finally, read the .config file and turn off any module enabled that
>  # we could not find a reason to keep enabled.
>  foreach my $line (@config_file) {
> @@ -644,6 +662,11 @@ foreach my $line (@config_file) {
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
