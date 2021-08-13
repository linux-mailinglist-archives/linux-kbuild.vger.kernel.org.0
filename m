Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C94D63EB2BB
	for <lists+linux-kbuild@lfdr.de>; Fri, 13 Aug 2021 10:40:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238739AbhHMIkb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 13 Aug 2021 04:40:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238688AbhHMIka (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Aug 2021 04:40:30 -0400
X-Greylist: delayed 464 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 13 Aug 2021 01:40:04 PDT
Received: from mail.avm.de (mail.avm.de [IPv6:2001:bf0:244:244::120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2433DC061756;
        Fri, 13 Aug 2021 01:40:04 -0700 (PDT)
Received: from mail-auth.avm.de (dovecot-mx-01.avm.de [212.42.244.71])
        by mail.avm.de (Postfix) with ESMTPS;
        Fri, 13 Aug 2021 10:32:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=avm.de; s=mail;
        t=1628843533; bh=WgDG4+v+9Te4gNm9R9XKLR82p8dpxWsSryvc/+cGqtc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bwSgIwwS9w+I4T3tIwZocKLHFhPmzOrvfQb2ZpYLk5K6u7h7Jll68ccgwqXspjnBB
         6b8BTnx5LaYgQnBGx9c1xkQbySLdDzwNV9N9B4ctLEHETGfIjG/EF8RR5bqMTekDIA
         m9DjlK7INb4+Y3GcK6sXQlxCyUn26SPDxo0cV1A8=
Received: from deb-nschier.ads.avm.de (unknown [172.17.24.144])
        by mail-auth.avm.de (Postfix) with ESMTPSA id 65708802F0;
        Fri, 13 Aug 2021 10:32:12 +0200 (CEST)
Date:   Fri, 13 Aug 2021 10:32:11 +0200
From:   Nicolas Schier <n.schier@avm.de>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Subject: Re: [PATCH] kbuild: allow "make" targets 'versioncheck' and
 'includecheck' withoug .config file
Message-ID: <YRYuC9p5G714Bt68@deb-nschier.ads.avm.de>
References: <20210811225442.9537-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210811225442.9537-1-rdunlap@infradead.org>
X-purgate-ID: 149429::1628843532-00002E98-7E68066B/0/0
X-purgate-type: clean
X-purgate-size: 1703
X-purgate-Ad: Categorized by eleven eXpurgate (R) http://www.eleven.de
X-purgate: This mail is considered clean (visit http://www.eleven.de for further information)
X-purgate: clean
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 11, 2021 at 03:54:42PM -0700, Randy Dunlap wrote:
> Top-level Makefile targets 'versioncheck' and 'includecheck' don't
> need a configured kernel (i.e., don't need a .config file), so add
> them the the list of "no-dot-config-targets".
> This eliminates the 'make' error:
> 
> ***
> *** Configuration file ".config" not found!
> ***
> *** Please run some configurator (e.g. "make oldconfig" or
> *** "make menuconfig" or "make xconfig").
> ***
> Makefile:759: include/config/auto.conf.cmd: No such file or directory
> 
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> ---

I like that change, works for me as expected.  Possibly you might want
to fix the commit subject typo (withoug -> without).

Regards,
Nicolas


> Fixes: I couldn't determine this.
> 
>  Makefile |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- linux-next-20210811.orig/Makefile
> +++ linux-next-20210811/Makefile
> @@ -274,7 +274,8 @@ no-dot-config-targets := $(clean-targets
>  			 cscope gtags TAGS tags help% %docs check% coccicheck \
>  			 $(version_h) headers headers_% archheaders archscripts \
>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
> -			 outputmakefile rustfmt rustfmtcheck
> +			 outputmakefile rustfmt rustfmtcheck \
> +			 versioncheck includecheck
>  # Installation targets should not require compiler. Unfortunately, vdso_install
>  # is an exception where build artifacts may be updated. This must be fixed.
>  no-compiler-targets := $(no-dot-config-targets) install dtbs_install \
