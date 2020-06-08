Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7FD1F1EA6
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2020 20:03:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729965AbgFHSD0 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 8 Jun 2020 14:03:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729827AbgFHSDZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 8 Jun 2020 14:03:25 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBE0EC08C5C2;
        Mon,  8 Jun 2020 11:03:25 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id ne5so157181pjb.5;
        Mon, 08 Jun 2020 11:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=GeRA3EczrVklFeQkto1N+CGMtbQRIWePjBzYeQl41iQ=;
        b=ibhuqKC5D7PbWd38N11DgQgVajEu06dMIx4r6UJX+jl187YfWd23pfReQUxhWMYAV0
         yqOZyBnCkEjAgPd7UMCKfH/MKZQd3WW5WGF1De/aSFoeiTci1F42nzJUYgNTaXQYoSB+
         IOAmVZ/hNQPjDdhqYaZClQJu3l2CTBvjqT0lQCnnpOYXmW+F/qxw0iUCS8fou/+ZM2Df
         Igy6qc48NsqqLZG4ZBT05ScPlkXZstWwjIR1s9zGHyr8K8Qo843od8pkaUAan+3UdMDu
         2DgQrEfAYTT/COKzzvSUEMN1gEZF5r+K6m2WkllS9sDr2yy++Tm9MxmipxLl7qvCGI6w
         FERw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :mime-version:content-disposition:user-agent;
        bh=GeRA3EczrVklFeQkto1N+CGMtbQRIWePjBzYeQl41iQ=;
        b=agcucTFQGCyt1jtz61MMiWPFdftTs4r08j42+zH3BSn2eU8XYUffS9uUGLwlFsPUUL
         W4U0VV9lTm10qTFiS28AslCQepYq+63qQtFTyKVJTWUIPDAtZCxbfDUpbv+MIkzmHR8D
         B0YTbnKvoyAKalBivyYZDQoJH9L1fI8n0DMqQIYltqI1MNkQhB6hDukXszKMdxZq5S10
         vwLpG2+B7QJhlo7vwW6ErseJcnzApL5c+MKHLIO3poOXtmBca9Oq9ihaoutcseYGreX1
         x5RLUYYeREV7oa293qkJg8C4eQsIfzwbN4w9thIZvAd4sFF32caOQ8e08ndxTJJrfj/d
         m4Ng==
X-Gm-Message-State: AOAM53087TDPlLO2eW0XeSSFQ1m+a2svzkzExPydMjRCpXOGNZzR+xNa
        RcSC0baMyrKfyBuX1g0zXIR7gZf8
X-Google-Smtp-Source: ABdhPJyNG7LC4ULyzjxEAhb3BFIfgpWXbA0C7dwCIUwrAKfGe01qzhv6iWGuT42Semyu5gBEqbm2wA==
X-Received: by 2002:a17:902:b60e:: with SMTP id b14mr22117pls.81.1591639405153;
        Mon, 08 Jun 2020 11:03:25 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id y4sm7835613pfr.182.2020.06.08.11.03.23
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jun 2020 11:03:24 -0700 (PDT)
Date:   Mon, 8 Jun 2020 11:03:22 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Denis Efremov <efremov@linux.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] kbuild: fix broken builds because of GZIP,BZIP2,LZOP
 variables
Message-ID: <20200608180322.GA20788@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Jun 08, 2020 at 12:59:44PM +0300, Denis Efremov wrote:
> Redefine GZIP, BZIP2, LZOP variables as KGZIP, KBZIP2, KLZOP resp.
> GZIP, BZIP2, LZOP env variables are reserved by the tools. The original
> attempt to redefine them internally doesn't work in makefiles/scripts
> intercall scenarios, e.g., "make GZIP=gzip bindeb-pkg" and results in
> broken builds. There can be other broken build commands because of this,
> so the universal solution is to use non-reserved env variables for the
> compression tools.
> 
> Fixes: 8dfb61dcbace ("kbuild: add variables for compression tools")
> Signed-off-by: Denis Efremov <efremov@linux.com>

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  Makefile                          | 24 +++++-------------------
>  arch/arm/boot/deflate_xip_data.sh |  2 +-
>  arch/ia64/Makefile                |  2 +-
>  arch/m68k/Makefile                |  8 ++++----
>  arch/parisc/Makefile              |  2 +-
>  scripts/Makefile.lib              |  6 +++---
>  scripts/Makefile.package          |  6 +++---
>  scripts/package/buildtar          |  4 ++--
>  8 files changed, 20 insertions(+), 34 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 839f9fee22cb..e43d193bb3b2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -458,27 +458,13 @@ PYTHON		= python
>  PYTHON3		= python3
>  CHECK		= sparse
>  BASH		= bash
> -GZIP		= gzip
> -BZIP2		= bzip2
> -LZOP		= lzop
> +KGZIP		= gzip
> +KBZIP2		= bzip2
> +KLZOP		= lzop
>  LZMA		= lzma
>  LZ4		= lz4c
>  XZ		= xz
>  
> -# GZIP, BZIP2, LZOP env vars are used by the tools. Support them as the command
> -# line interface, but use _GZIP, _BZIP2, _LZOP internally.
> -_GZIP          := $(GZIP)
> -_BZIP2         := $(BZIP2)
> -_LZOP          := $(LZOP)
> -
> -# Reset GZIP, BZIP2, LZOP in this Makefile
> -override GZIP=
> -override BZIP2=
> -override LZOP=
> -
> -# Reset GZIP, BZIP2, LZOP in recursive invocations
> -MAKEOVERRIDES += GZIP= BZIP2= LZOP=
> -
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>  		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
>  NOSTDINC_FLAGS :=
> @@ -526,7 +512,7 @@ CLANG_FLAGS :=
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> -export _GZIP _BZIP2 _LZOP LZMA LZ4 XZ
> +export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>  
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
> @@ -1047,7 +1033,7 @@ export mod_strip_cmd
>  mod_compress_cmd = true
>  ifdef CONFIG_MODULE_COMPRESS
>    ifdef CONFIG_MODULE_COMPRESS_GZIP
> -    mod_compress_cmd = $(_GZIP) -n -f
> +    mod_compress_cmd = $(KGZIP) -n -f
>    endif # CONFIG_MODULE_COMPRESS_GZIP
>    ifdef CONFIG_MODULE_COMPRESS_XZ
>      mod_compress_cmd = $(XZ) -f
> diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xip_data.sh
> index 739f0464321e..304495c3c2c5 100755
> --- a/arch/arm/boot/deflate_xip_data.sh
> +++ b/arch/arm/boot/deflate_xip_data.sh
> @@ -56,7 +56,7 @@ trap 'rm -f "$XIPIMAGE.tmp"; exit 1' 1 2 3
>  # substitute the data section by a compressed version
>  $DD if="$XIPIMAGE" count=$data_start iflag=count_bytes of="$XIPIMAGE.tmp"
>  $DD if="$XIPIMAGE"  skip=$data_start iflag=skip_bytes |
> -$_GZIP -9 >> "$XIPIMAGE.tmp"
> +$KGZIP -9 >> "$XIPIMAGE.tmp"
>  
>  # replace kernel binary
>  mv -f "$XIPIMAGE.tmp" "$XIPIMAGE"
> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> index f817f3d5e758..2876a7df1b0a 100644
> --- a/arch/ia64/Makefile
> +++ b/arch/ia64/Makefile
> @@ -40,7 +40,7 @@ $(error Sorry, you need a newer version of the assember, one that is built from
>  endif
>  
>  quiet_cmd_gzip = GZIP    $@
> -cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
> +cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
>  
>  quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
> diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
> index ce6db5e5a5a3..0415d28dbe4f 100644
> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -135,10 +135,10 @@ vmlinux.gz: vmlinux
>  ifndef CONFIG_KGDB
>  	cp vmlinux vmlinux.tmp
>  	$(STRIP) vmlinux.tmp
> -	$(_GZIP) -9c vmlinux.tmp >vmlinux.gz
> +	$(KGZIP) -9c vmlinux.tmp >vmlinux.gz
>  	rm vmlinux.tmp
>  else
> -	$(_GZIP) -9c vmlinux >vmlinux.gz
> +	$(KGZIP) -9c vmlinux >vmlinux.gz
>  endif
>  
>  bzImage: vmlinux.bz2
> @@ -148,10 +148,10 @@ vmlinux.bz2: vmlinux
>  ifndef CONFIG_KGDB
>  	cp vmlinux vmlinux.tmp
>  	$(STRIP) vmlinux.tmp
> -	$(_BZIP2) -1c vmlinux.tmp >vmlinux.bz2
> +	$(KBZIP2) -1c vmlinux.tmp >vmlinux.bz2
>  	rm vmlinux.tmp
>  else
> -	$(_BZIP2) -1c vmlinux >vmlinux.bz2
> +	$(KBZIP2) -1c vmlinux >vmlinux.bz2
>  endif
>  
>  archclean:
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 182a5bca3e2c..5140c602207f 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -162,7 +162,7 @@ vmlinuz: bzImage
>  	$(OBJCOPY) $(boot)/bzImage $@
>  else
>  vmlinuz: vmlinux
> -	@$(_GZIP) -cf -9 $< > $@
> +	@$(KGZIP) -cf -9 $< > $@
>  endif
>  
>  install:
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 127f2a7e3ced..94eeddb2e599 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -244,7 +244,7 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>  # ---------------------------------------------------------------------------
>  
>  quiet_cmd_gzip = GZIP    $@
> -      cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
> +      cmd_gzip = cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
>  
>  # DTC
>  # ---------------------------------------------------------------------------
> @@ -337,7 +337,7 @@ printf "%08x\n" $$dec_size |						\
>  )
>  
>  quiet_cmd_bzip2 = BZIP2   $@
> -      cmd_bzip2 = { cat $(real-prereqs) | $(_BZIP2) -9; $(size_append); } > $@
> +      cmd_bzip2 = { cat $(real-prereqs) | $(KBZIP2) -9; $(size_append); } > $@
>  
>  # Lzma
>  # ---------------------------------------------------------------------------
> @@ -346,7 +346,7 @@ quiet_cmd_lzma = LZMA    $@
>        cmd_lzma = { cat $(real-prereqs) | $(LZMA) -9; $(size_append); } > $@
>  
>  quiet_cmd_lzo = LZO     $@
> -      cmd_lzo = { cat $(real-prereqs) | $(_LZOP) -9; $(size_append); } > $@
> +      cmd_lzo = { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); } > $@
>  
>  quiet_cmd_lz4 = LZ4     $@
>        cmd_lz4 = { cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout; \
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index b2b6153af63a..f952fb64789d 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -45,7 +45,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>  	false; \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
> -tar -I $(_GZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> +tar -I $(KGZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>  	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
>  
> @@ -127,8 +127,8 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> -$(if $(findstring bz2,$@),$(_BZIP2),                                 \
> -$(if $(findstring gz,$@),$(_GZIP),                                  \
> +$(if $(findstring bz2,$@),$(KBZIP2),                                 \
> +$(if $(findstring gz,$@),$(KGZIP),                                  \
>  $(if $(findstring xz,$@),$(XZ),                                     \
>  $(error unknown target $@))))                                       \
>  	-f -9 $(perf-tar).tar)
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index ad62c6879622..fb1578e72ab9 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -28,11 +28,11 @@ case "${1}" in
>  		opts=
>  		;;
>  	targz-pkg)
> -		opts="-I ${_GZIP}"
> +		opts="-I ${KGZIP}"
>  		tarball=${tarball}.gz
>  		;;
>  	tarbz2-pkg)
> -		opts="-I ${_BZIP2}"
> +		opts="-I ${KBZIP2}"
>  		tarball=${tarball}.bz2
>  		;;
>  	tarxz-pkg)
> -- 
> 2.26.2
> 
