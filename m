Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E28141CED51
	for <lists+linux-kbuild@lfdr.de>; Tue, 12 May 2020 08:52:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726193AbgELGw5 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 12 May 2020 02:52:57 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:64357 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgELGw4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 12 May 2020 02:52:56 -0400
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 04C6qeQt027831;
        Tue, 12 May 2020 15:52:41 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 04C6qeQt027831
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589266362;
        bh=UwPvBry7yPGOUilCJDkKrbKYyu1A4n8MuWA4AkJQmPc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=uOyUjH4Lk6Bz11TLsUUQeyavZZNYpk9WP+oUZjYw9IzNsPKYVxy0T28akwEZasKcY
         7heuEiz5sbqoaYXxHP1hUQ56FCd/eyvpxbKRFwdHn/D+bdb1unws11xIK3WkA95ZD4
         4vsqylaQBd4pp3iToF5CcQbcIHzJ58oi96aTz4TDgydslMNW96eU8PYwUJKvE22D0h
         pH/6UecfPDadhnrEN9S7dvChDe3PkNX7Wlpahao66CjiXJ/3RFxgaPCn5cLDCGtBlB
         OIKpLNtF4ghm3YBb8/Zlp6gmrKim94rEI3Oq8elJ4pKgAto4TkPh1loapJFCCLbLL/
         WWb9RwgaXkdYQ==
X-Nifty-SrcIP: [209.85.217.52]
Received: by mail-vs1-f52.google.com with SMTP id z1so7197186vsn.11;
        Mon, 11 May 2020 23:52:41 -0700 (PDT)
X-Gm-Message-State: AGi0PubrEpFYgJZQ8+hxu27bNYOmh5hoYiqqE7Xa4peQyzSvKqFaeYLP
        cT1NAZokzm3im4jsVoK4I9RdY+XbI5GxIZFqVmg=
X-Google-Smtp-Source: APiQypLzAPXzg3s/5sjYf+Hirmk79ZX4a6xnYpJCL0XPD4t0LmJvQFEJnZnz7nJs3j+jeZqtpikBb584Tc2r25yU5QQ=
X-Received: by 2002:a67:db0d:: with SMTP id z13mr14479268vsj.155.1589266360272;
 Mon, 11 May 2020 23:52:40 -0700 (PDT)
MIME-Version: 1.0
References: <20200510010603.3896-1-changbin.du@gmail.com>
In-Reply-To: <20200510010603.3896-1-changbin.du@gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 12 May 2020 15:52:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNARH_1nQRExVSCcJ=Twuze5AosG3z2GcA7zwnF6Vi52GWA@mail.gmail.com>
Message-ID: <CAK7LNARH_1nQRExVSCcJ=Twuze5AosG3z2GcA7zwnF6Vi52GWA@mail.gmail.com>
Subject: Re: [PATCH v5] streamline_config.pl: add LMC_KEEP to preserve some kconfigs
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

On Sun, May 10, 2020 at 10:06 AM Changbin Du <changbin.du@gmail.com> wrote:
>
> Sometimes it is useful to preserve batches of configs when making
> localmodconfig. For example, I usually don't want any usb and fs
> modules to be disabled. Now we can do it by:
>
>  $ make LMC_KEEP="drivers/usb:fs" localmodconfig
>
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
>
> ---
> v4: fix typo.
> v3: rename LOCALMODCONFIG_PRESERVE to shorter LMC_KEEP.
> v2: fix typo in documentation. (Randy Dunlap)
> ---
>  Documentation/admin-guide/README.rst |  8 +++++++-
>  scripts/kconfig/Makefile             |  1 +
>  scripts/kconfig/streamline_config.pl | 21 +++++++++++++++++++++
>  3 files changed, 29 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index cc6151fc0845..407aa206bb70 100644
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
> +                           LMC_KEEP="drivers/usb:drivers/gpu:fs" \
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

Just a nitpicking.

I was just about to apply this patch,
then noticed this.

This works for localyesconfig as well as
localmodconfig.

Do you want to add the note to localyesconfig too?


LMC_ is an acronym of LOCAL_MOD_CONFIG_.
Maybe it is OK because
we mostly use localmodconfig,
using localyesconfig is somewhat rare, I guess.


Just a reminder, if you want to send v6
or if you want me to pick this up as-is.

Thanks.






>         @echo  '  defconfig       - New config with default from ARCH supplied defconfig'
>         @echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
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
