Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC4023FCC68
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Aug 2021 19:36:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240363AbhHaRh3 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Aug 2021 13:37:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234317AbhHaRh0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Aug 2021 13:37:26 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AECAC061760
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:36:30 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id f11-20020a17090aa78b00b0018e98a7cddaso15267pjq.4
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Aug 2021 10:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ozgrJoMSVTFebISsv50jA0Nno/Q4rjG/KeTbmaUxtfc=;
        b=WEU2xa2her22+ld80Gjru6MnIBWFYEKbeePZXsl++gnEblQ8w67U5QSQuXQ3yEx4J/
         6dU9F5TB2d2CpmY7/cnvAWEEbP9MQTOMcat1lqblLgb2M0Kt9wrbOQEvaVGu4YqfQV1R
         hopSe6QVosKT9eJ3V+QI7O0wFm1bmQ6itrXCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ozgrJoMSVTFebISsv50jA0Nno/Q4rjG/KeTbmaUxtfc=;
        b=cwmkw2iLH3nNcjKef8mlZtcs0FpeDGP7Ru1QJXMz7td6NcIlETLRTdyIM4UGi0wjF3
         tlD8M4YAJNh1vU2l1KGM/conAoWmELkNP4hcUUwnz3dncQ3SRQyI7hiF93+GesQ58cZQ
         m6qFI1UTfoTnmTWh67eyNfLqSUZoS80RJLWSKExvaM8Zo/4Ayb+WhJbzrQ99frg5SKxw
         dUZXVL5PKfKSCunzHL+h3w0NvXMbLX7Mf7AoiQBOkqTk9EE3JF9Ie7QRdrcwawtE9dm3
         XX43K9ti3FxmXJToYzU1snmqfH3RWguGxPpQzrQNkfuzRvEFiWQhivGJidBm+MON0Xjm
         hBXQ==
X-Gm-Message-State: AOAM531MhahCPgAsJDrQXAQJ9vnoh9E12iXKVWW8DxloP846tOj8CYZF
        KmHx566ea2qPQQ1cKt/ou7d7uw==
X-Google-Smtp-Source: ABdhPJwlSYvwzcvmr3WZIpz6Ih9rk5dUibF5iR4iscS+MOrmI7NANACwWJiHd5rBtIa5S+WEiwupcg==
X-Received: by 2002:a17:90a:4093:: with SMTP id l19mr6733228pjg.118.1630431390167;
        Tue, 31 Aug 2021 10:36:30 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x124sm7530582pfb.59.2021.08.31.10.36.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Aug 2021 10:36:29 -0700 (PDT)
Date:   Tue, 31 Aug 2021 10:36:28 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/13] kbuild: do not create built-in.a.symversions or
 lib.a.symversions
Message-ID: <202108311035.5390256E@keescook>
References: <20210831074004.3195284-1-masahiroy@kernel.org>
 <20210831074004.3195284-8-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831074004.3195284-8-masahiroy@kernel.org>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Aug 31, 2021 at 04:39:58PM +0900, Masahiro Yamada wrote:
> Merge all *.o.symversions in scripts/link-vmlinux.sh instead of
> incrementally merging them in the unit of built-in.a or lib.a.
> 
> This is a preparation for further code cleanups.
> 
> The initial patch version was implemented in a shell script, but it
> was slow due to the slowness of the 'cat' command [1]. This version
> was implemented in Perl.
> 
> [1]: https://lore.kernel.org/lkml/CAK7LNATyNAu6sa-TT9JXy=BXr5d2Q5K-sp-mVXXtJDuJyi6_bA@mail.gmail.com/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

My earlier questions about speed here were actually with regard to
non-LTO builds. But it sounds like it's not a problem there either.

Reviewed-by: Kees Cook <keescook@chromium.org>


> ---
> 
>  scripts/Makefile.build   | 10 ++------
>  scripts/link-vmlinux.sh  |  9 ++-----
>  scripts/merge-symvers.pl | 52 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 15 deletions(-)
>  create mode 100644 scripts/merge-symvers.pl
> 
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index afc906cd7256..3ad1b1227371 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -434,11 +434,8 @@ endif
>  quiet_cmd_ar_builtin = AR      $@
>        cmd_ar_builtin = rm -f $@; $(AR) cDPrST $@ $(real-prereqs)
>  
> -quiet_cmd_ar_and_symver = AR      $@
> -      cmd_ar_and_symver = $(cmd_update_lto_symversions); $(cmd_ar_builtin)
> -
>  $(obj)/built-in.a: $(real-obj-y) FORCE
> -	$(call if_changed,ar_and_symver)
> +	$(call if_changed,ar_builtin)
>  
>  #
>  # Rule to create modules.order file
> @@ -458,11 +455,8 @@ $(obj)/modules.order: $(obj-m) FORCE
>  #
>  # Rule to compile a set of .o files into one .a file (with symbol table)
>  #
> -quiet_cmd_ar_lib = AR      $@
> -      cmd_ar_lib = $(cmd_update_lto_symversions); $(cmd_ar)
> -
>  $(obj)/lib.a: $(lib-y) FORCE
> -	$(call if_changed,ar_lib)
> +	$(call if_changed,ar)
>  
>  # NOTE:
>  # Do not replace $(filter %.o,^) with $(real-prereqs). When a single object
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index d74cee5c4326..0cc6a03f2cb1 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -57,13 +57,8 @@ gen_initcalls()
>  gen_symversions()
>  {
>  	info GEN .tmp_symversions.lds
> -	rm -f .tmp_symversions.lds
> -
> -	for o in ${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}; do
> -		if [ -f ${o}.symversions ]; then
> -			cat ${o}.symversions >> .tmp_symversions.lds
> -		fi
> -	done
> +	${PERL} scripts/merge-symvers.pl -a ${AR} -o .tmp_symversions.lds \
> +		${KBUILD_VMLINUX_OBJS} ${KBUILD_VMLINUX_LIBS}
>  }
>  
>  # Link of vmlinux.o used for section mismatch analysis
> diff --git a/scripts/merge-symvers.pl b/scripts/merge-symvers.pl
> new file mode 100644
> index 000000000000..0bd092d24eff
> --- /dev/null
> +++ b/scripts/merge-symvers.pl
> @@ -0,0 +1,52 @@
> +#!/usr/bin/env perl
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +use autodie;
> +use strict;
> +use warnings;
> +use Getopt::Long 'GetOptions';
> +
> +my $ar;
> +my $output;
> +
> +GetOptions(
> +	'a|ar=s' => \$ar,
> +	'o|output=s'  => \$output,
> +);
> +
> +# Collect all objects
> +my @objects;
> +
> +foreach (@ARGV) {
> +	if (/\.o$/) {
> +		# Some objects (head-y) are linked to vmlinux directly.
> +		push(@objects, $_);
> +	} elsif (/\.a$/) {
> +		# Most of built-in objects are contained in built-in.a or lib.a.
> +		# Use 'ar -t' to get the list of the contained objects.
> +		$_ = `$ar -t $_`;
> +		push(@objects, split(/\n/));
> +	} else {
> +		die "$_: unknown file type\n";
> +	}
> +}
> +
> +open(my $out_fh, '>', "$output");
> +
> +foreach (@objects) {
> +	# The symbol CRCs for foo/bar/baz.o is output to foo/bar/baz.o.symversions
> +	s/(.*)/$1.symversions/;
> +
> +	if (! -e $_) {
> +		# .symversions does not exist if the object does not contain
> +		# EXPORT_SYMBOL at all. Skip it.
> +		next;
> +	}
> +
> +	open(my $in_fh, '<', "$_");
> +	# Concatenate all the existing *.symversions files.
> +	print $out_fh do { local $/; <$in_fh> };
> +	close $in_fh;
> +}
> +
> +close $out_fh;
> -- 
> 2.30.2
> 

-- 
Kees Cook
