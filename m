Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 145C33505B7
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 19:49:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233900AbhCaRtC (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 13:49:02 -0400
Received: from vulcan.natalenko.name ([104.207.131.136]:56438 "EHLO
        vulcan.natalenko.name" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234473AbhCaRse (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 13:48:34 -0400
Received: from localhost (kaktus.kanapka.ml [151.237.229.131])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by vulcan.natalenko.name (Postfix) with ESMTPSA id 1FCB5A0F3AA;
        Wed, 31 Mar 2021 19:48:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
        s=dkim-20170712; t=1617212907;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=u8JY2IcOL6NoLU6Xyn0f/jFDmqEv9W2ivfIar+8wmT4=;
        b=lOIAz+WT0xfdFacyhHI3pL7eaquPdcnWyjfHvUhzoh8IooDuvcIPlUChhzELdYgJGWJnPI
        WDLkupIpNeNto95nVxdS+9Z5tA2Z0PlRDTokRxIecUWeb82CQd6UuDEQu3evHvfCzKGuff
        fRT3WxgNDDvEWn0AUsoK/ZgCx4bcvZw=
Date:   Wed, 31 Mar 2021 19:48:26 +0200
From:   Oleksandr Natalenko <oleksandr@natalenko.name>
To:     Nick Terrell <terrelln@fb.com>
Cc:     Piotr Gorski <lucjan.lucjanov@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Valentin Schneider <valentin.schneider@arm.com>,
        "Jan Alexander Steffens (heftig)" <jan.steffens@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH] init: add support for zstd compressed modules
Message-ID: <20210331174826.uhunfmkhlpyteb3d@spock.localdomain>
References: <20210330113235.2767216-1-lucjan.lucjanov@gmail.com>
 <20210330115023.qt742qsdekwiroey@spock.localdomain>
 <33D7F6C9-6F53-471A-A146-7F128F6918F5@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33D7F6C9-6F53-471A-A146-7F128F6918F5@fb.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello.

On Wed, Mar 31, 2021 at 05:39:25PM +0000, Nick Terrell wrote:
> 
> 
> > On Mar 30, 2021, at 4:50 AM, Oleksandr Natalenko <oleksandr@natalenko.name> wrote:
> > 
> > On Tue, Mar 30, 2021 at 01:32:35PM +0200, Piotr Gorski wrote:
> >> kmod 28 supports modules compressed in zstd format so let's add this possibility to kernel.
> >> 
> >> Signed-off-by: Piotr Gorski <lucjan.lucjanov@gmail.com>
> >> ---
> >> Makefile     | 7 +++++--
> >> init/Kconfig | 9 ++++++---
> >> 2 files changed, 11 insertions(+), 5 deletions(-)
> >> 
> >> diff --git a/Makefile b/Makefile
> >> index 5160ff8903c1..82f4f4cc2955 100644
> >> --- a/Makefile
> >> +++ b/Makefile
> >> @@ -1156,8 +1156,8 @@ endif # INSTALL_MOD_STRIP
> >> export mod_strip_cmd
> >> 
> >> # CONFIG_MODULE_COMPRESS, if defined, will cause module to be compressed
> >> -# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP
> >> -# or CONFIG_MODULE_COMPRESS_XZ.
> >> +# after they are installed in agreement with CONFIG_MODULE_COMPRESS_GZIP,
> >> +# CONFIG_MODULE_COMPRESS_XZ, or CONFIG_MODULE_COMPRESS_ZSTD.
> >> 
> >> mod_compress_cmd = true
> >> ifdef CONFIG_MODULE_COMPRESS
> >> @@ -1167,6 +1167,9 @@ ifdef CONFIG_MODULE_COMPRESS
> >>   ifdef CONFIG_MODULE_COMPRESS_XZ
> >>     mod_compress_cmd = $(XZ) --lzma2=dict=2MiB -f
> >>   endif # CONFIG_MODULE_COMPRESS_XZ
> >> +  ifdef CONFIG_MODULE_COMPRESS_ZSTD
> >> +    mod_compress_cmd = $(ZSTD) -T0 --rm -f -q
> 
> This will use the default zstd level, level 3. I think it would make more sense to use a high
> compression level. Level 19 would probably be a good choice. That will choose a window
> size of up to 8MB, meaning the decompressor needs to allocate that much memory. If that
> is unacceptable, you could use `zstd -T0 --rm -f -q -19 --zstd=wlog=21`, which will use a
> window size of up to 2MB, to match the XZ command. Note that if the file is smaller than
> the window size, it will be shrunk to the smallest power of two at least as large as the file.

Please no. We've already done that with initramfs in Arch, and it
increased the time to generate it enormously.

I understand that building a kernel is a more rare operation than
regenerating initramfs, but still I'd go against hard-coding the level.
And if it should be specified anyway, I'd opt in for an explicit
configuration option. Remember, not all the kernel are built on
build farms...

FWIW, Piotr originally used level 9 which worked okay, but I insisted
on sending the patch initially without specifying level at all like it is
done for other compressors. If this is a wrong approach, then oh meh,
mea culpa ;).

Whatever default non-standard compression level you choose, I'm fine
as long as I can change it without editing Makefile.

Thanks!

> 
> Best,
> Nick Terrell
> 
> >> +  endif # CONFIG_MODULE_COMPRESS_ZSTD
> >> endif # CONFIG_MODULE_COMPRESS
> >> export mod_compress_cmd
> >> 
> >> diff --git a/init/Kconfig b/init/Kconfig
> >> index 8c2cfd88f6ef..86a452bc2747 100644
> >> --- a/init/Kconfig
> >> +++ b/init/Kconfig
> >> @@ -2250,8 +2250,8 @@ config MODULE_COMPRESS
> >> 	bool "Compress modules on installation"
> >> 	help
> >> 
> >> -	  Compresses kernel modules when 'make modules_install' is run; gzip or
> >> -	  xz depending on "Compression algorithm" below.
> >> +	  Compresses kernel modules when 'make modules_install' is run; gzip,
> >> +	  xz, or zstd depending on "Compression algorithm" below.
> >> 
> >> 	  module-init-tools MAY support gzip, and kmod MAY support gzip and xz.
> >> 
> >> @@ -2273,7 +2273,7 @@ choice
> >> 	  This determines which sort of compression will be used during
> >> 	  'make modules_install'.
> >> 
> >> -	  GZIP (default) and XZ are supported.
> >> +	  GZIP (default), XZ, and ZSTD are supported.
> >> 
> >> config MODULE_COMPRESS_GZIP
> >> 	bool "GZIP"
> >> @@ -2281,6 +2281,9 @@ config MODULE_COMPRESS_GZIP
> >> config MODULE_COMPRESS_XZ
> >> 	bool "XZ"
> >> 
> >> +config MODULE_COMPRESS_ZSTD
> >> +	bool "ZSTD"
> >> +
> >> endchoice
> >> 
> >> config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
> >> -- 
> >> 2.31.0.97.g1424303384
> >> 
> > 
> > Great!
> > 
> > Reviewed-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> > 
> > This works perfectly fine in Arch Linux if accompanied by the
> > following mkinitcpio amendment: [1].
> > 
> > I'm also Cc'ing other people from get_maintainers output just
> > to make this submission more visible.
> > 
> > Thanks.
> > 
> > [1] https://github.com/archlinux/mkinitcpio/pull/43
> > 
> > -- 
> >  Oleksandr Natalenko (post-factum)
> 

-- 
  Oleksandr Natalenko (post-factum)
