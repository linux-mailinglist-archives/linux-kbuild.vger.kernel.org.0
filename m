Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 503FD1DE260
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 10:43:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729043AbgEVInz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 22 May 2020 04:43:55 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46968 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728959AbgEVInx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 May 2020 04:43:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id z6so11622864ljm.13;
        Fri, 22 May 2020 01:43:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:references:from:autocrypt:subject
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=iUcTn+R6Pf+FUB70mwoh1xNydTrCEM12cAcqAzXrEhU=;
        b=lHGDE8uopqzVBrsX9aSKA77ianJeET5tS/emYtZu93NAAEdFf1HPfY7C8oJ6+fHdPj
         7ria80QTJ/VyLa815yKKG8iuIF+UZT7iXq1HdgCfyZS69QMLAgGXsCGd0LOyL/04DGBh
         ijAVGlWsjCSUeYCfDnZXZeRQjVe630vxsvnH+Pl/k4Zzhe404OpiZBWuOAUDLo1HbleH
         ltKzwGNrXy1EI3OGtvf2MQjH/o/xq9xYI7OiYN2GHIAmRwjRiiLcL2J9cCNBLDde2A/x
         pMTMDhDcb4qh1bLuXznWu3HRciGisariYIASoazPBtEpjRQ55dGOwUDpvnDmXsZR0xF2
         2LOw==
X-Gm-Message-State: AOAM5300aZBMK3jFLnN2KEPaUYH7rqxwMpX+CdPliEAbYei/t45WsyIy
        TErfGozbhBkcA38nGFkuPTBUpXOJ
X-Google-Smtp-Source: ABdhPJx3JdM1uKiArr0rKqNz/zh6f7G+daQM3ATE/dinUAvXxJ396Ct7wDBz61IYnzj7YWcPiFWVKw==
X-Received: by 2002:a2e:991a:: with SMTP id v26mr5159025lji.470.1590137028757;
        Fri, 22 May 2020 01:43:48 -0700 (PDT)
Received: from [10.68.32.192] (broadband-37-110-38-130.ip.moscow.rt.ru. [37.110.38.130])
        by smtp.gmail.com with ESMTPSA id f6sm2189709ljn.91.2020.05.22.01.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2020 01:43:48 -0700 (PDT)
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200514131234.380097-1-efremov@linux.com>
 <20200521121302.9480-1-efremov@linux.com>
From:   Denis Efremov <efremov@linux.com>
Autocrypt: addr=efremov@linux.com; keydata=
 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
Subject: Re: [RFC PATCH v2] kbuild: add variables for compression tools
Message-ID: <f732650c-af03-3acd-63c0-7aa3682afebe@linux.com>
Date:   Fri, 22 May 2020 11:43:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200521121302.9480-1-efremov@linux.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


On 5/21/20 3:13 PM, Denis Efremov wrote:
> Allow user to use alternative implementations of compression tools.
> For example, multi-threaded tools to speed up the build:
> $ make GZIP=pigz BZIP2=pbzip2
> 
> Variable _GZIP is used internally instead of GZIP because the latter is
> reserved by the tool. The use of GZIP in gzip tool is obsolete since
> 2015. However, alternative implementations (e.g., pigz) can still rely
> on it.

I faced the same problem with BZIP2 (BZIP) env var and LZOP.
I didn't noticed it earlier because pbzip2 doesn't respect BZIP2 env var unlike bzip2.
xz, lzma are ok with XZ, LZMA.

It's possible to handle BZIP2, LZOP vars like GZIP.


> 
> The credit goes to @grsecurity.
> 
> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT="--threads=0"
> 
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
> 
> Compile tested on x86_64, parisc, arm64, mips, m68k.
> 
>  Makefile                          | 16 ++++++++++++++--
>  arch/arm/boot/deflate_xip_data.sh |  6 +++++-
>  arch/ia64/Makefile                |  2 +-
>  arch/m68k/Makefile                |  8 ++++----
>  arch/mips/lasat/image/Makefile    |  2 +-
>  arch/parisc/Makefile              |  2 +-
>  kernel/gen_kheaders.sh            |  6 +++++-
>  scripts/Kbuild.include            |  4 ++++
>  scripts/Makefile.lib              | 12 ++++++------
>  scripts/Makefile.package          |  8 ++++----
>  scripts/package/buildtar          | 15 ++++++++++++---
>  scripts/xz_wrap.sh                |  6 +++++-
>  12 files changed, 62 insertions(+), 25 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index 04f5662ae61a..dd5ff189d97e 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -447,6 +447,12 @@ PYTHON		= python
>  PYTHON3		= python3
>  CHECK		= sparse
>  BASH		= bash
> +GZIP		= gzip
> +BZIP2		= bzip2
> +LZMA		= lzma
> +LZO		= lzop
> +LZ4		= lz4c
> +XZ		= xz
>  
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>  		  -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> @@ -492,10 +498,16 @@ KBUILD_LDFLAGS :=
>  GCC_PLUGINS_CFLAGS :=
>  CLANG_FLAGS :=
>  
> +# GZIP env var is used by old (<= 2015) versions of the tool
> +# and alternative implementations for additional arguments
> +override _GZIP=$(GZIP)
> +unexport GZIP
> +
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
> +export _GZIP BZIP2 LZMA LZO LZ4 XZ
>  
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> @@ -1005,10 +1017,10 @@ export mod_strip_cmd
>  mod_compress_cmd = true
>  ifdef CONFIG_MODULE_COMPRESS
>    ifdef CONFIG_MODULE_COMPRESS_GZIP
> -    mod_compress_cmd = gzip -n -f
> +    mod_compress_cmd = $(_GZIP) -n -f
>    endif # CONFIG_MODULE_COMPRESS_GZIP
>    ifdef CONFIG_MODULE_COMPRESS_XZ
> -    mod_compress_cmd = xz -f
> +    mod_compress_cmd = $(XZ) -f
>    endif # CONFIG_MODULE_COMPRESS_XZ
>  endif # CONFIG_MODULE_COMPRESS
>  export mod_compress_cmd
> diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xip_data.sh
> index 40937248cebe..81253142d2ae 100755
> --- a/arch/arm/boot/deflate_xip_data.sh
> +++ b/arch/arm/boot/deflate_xip_data.sh
> @@ -19,6 +19,10 @@ XIPIMAGE="$2"
>  
>  DD="dd status=none"
>  
> +if [ x$_GZIP = "x" ]; then
> +	_GZIP=gzip
> +fi
> +
>  # Use "make V=1" to debug this script.
>  case "$KBUILD_VERBOSE" in
>  *1*)
> @@ -56,7 +60,7 @@ trap 'rm -f "$XIPIMAGE.tmp"; exit 1' 1 2 3
>  # substitute the data section by a compressed version
>  $DD if="$XIPIMAGE" count=$data_start iflag=count_bytes of="$XIPIMAGE.tmp"
>  $DD if="$XIPIMAGE"  skip=$data_start iflag=skip_bytes |
> -gzip -9 >> "$XIPIMAGE.tmp"
> +$_GZIP -9 >> "$XIPIMAGE.tmp"
>  
>  # replace kernel binary
>  mv -f "$XIPIMAGE.tmp" "$XIPIMAGE"
> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> index 32240000dc0c..f817f3d5e758 100644
> --- a/arch/ia64/Makefile
> +++ b/arch/ia64/Makefile
> @@ -40,7 +40,7 @@ $(error Sorry, you need a newer version of the assember, one that is built from
>  endif
>  
>  quiet_cmd_gzip = GZIP    $@
> -cmd_gzip = cat $(real-prereqs) | gzip -n -f -9 > $@
> +cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
>  
>  quiet_cmd_objcopy = OBJCOPY $@
>  cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
> diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
> index 5d9288384096..7f259a723753 100644
> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -135,10 +135,10 @@ vmlinux.gz: vmlinux
>  ifndef CONFIG_KGDB
>  	cp vmlinux vmlinux.tmp
>  	$(STRIP) vmlinux.tmp
> -	gzip -9c vmlinux.tmp >vmlinux.gz
> +	$(_GZIP) -9c vmlinux.tmp >vmlinux.gz
>  	rm vmlinux.tmp
>  else
> -	gzip -9c vmlinux >vmlinux.gz
> +	$(_GZIP) -9c vmlinux >vmlinux.gz
>  endif
>  
>  bzImage: vmlinux.bz2
> @@ -148,10 +148,10 @@ vmlinux.bz2: vmlinux
>  ifndef CONFIG_KGDB
>  	cp vmlinux vmlinux.tmp
>  	$(STRIP) vmlinux.tmp
> -	bzip2 -1c vmlinux.tmp >vmlinux.bz2
> +	$(BZIP2) -1c vmlinux.tmp >vmlinux.bz2
>  	rm vmlinux.tmp
>  else
> -	bzip2 -1c vmlinux >vmlinux.bz2
> +	$(BZIP2) -1c vmlinux >vmlinux.bz2
>  endif
>  
>  archclean:
> diff --git a/arch/mips/lasat/image/Makefile b/arch/mips/lasat/image/Makefile
> index 78ce4cff1012..24d8dbde1109 100644
> --- a/arch/mips/lasat/image/Makefile
> +++ b/arch/mips/lasat/image/Makefile
> @@ -44,7 +44,7 @@ $(obj)/%.o: $(obj)/%.gz
>  	$(LD) -r -o $@ -b binary $<
>  
>  $(obj)/%.gz: $(obj)/%.bin
> -	gzip -cf -9 $< > $@
> +	$(_GZIP) -cf -9 $< > $@
>  
>  $(obj)/kImage.bin: $(KERNEL_IMAGE)
>  	$(OBJCOPY) -O binary -S $^ $@
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 628cd8bb7ad8..e1aa514aeb36 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -162,7 +162,7 @@ vmlinuz: bzImage
>  	$(OBJCOPY) $(boot)/bzImage $@
>  else
>  vmlinuz: vmlinux
> -	@gzip -cf -9 $< > $@
> +	@$(_GZIP) -cf -9 $< > $@
>  endif
>  
>  install:
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index e13ca842eb7e..58e05b3702f3 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -9,6 +9,10 @@ outdir="$(pwd)"
>  tarfile=$1
>  cpio_dir=$outdir/$tarfile.tmp
>  
> +if [ x$XZ = "x" ]; then
> +	XZ=xz
> +fi
> +
>  dir_list="
>  include/
>  arch/$SRCARCH/include/
> @@ -88,7 +92,7 @@ find $cpio_dir -type f -print0 |
>  find $cpio_dir -printf "./%P\n" | LC_ALL=C sort | \
>      tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
>      --owner=0 --group=0 --numeric-owner --no-recursion \
> -    -Jcf $tarfile -C $cpio_dir/ -T - > /dev/null
> +    -I $XZ -cf $tarfile -C $cpio_dir/ -T - > /dev/null
>  
>  echo $headers_md5 > kernel/kheaders.md5
>  echo "$this_file_md5" >> kernel/kheaders.md5
> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
> index 6cabf20ce66a..d7c25b3cb1a8 100644
> --- a/scripts/Kbuild.include
> +++ b/scripts/Kbuild.include
> @@ -2,6 +2,10 @@
>  ####
>  # kbuild: Generic definitions
>  
> +# GZIP env var is used by old (<= 2015) versions of the tool
> +# and alternative implementations for additional arguments
> +unexport GZIP
> +
>  # Convenient variables
>  comma   := ,
>  quote   := "
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 4b799737722c..812f1c0e5beb 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -241,7 +241,7 @@ cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
>  # ---------------------------------------------------------------------------
>  
>  quiet_cmd_gzip = GZIP    $@
> -      cmd_gzip = cat $(real-prereqs) | gzip -n -f -9 > $@
> +      cmd_gzip = cat $(real-prereqs) | $(_GZIP) -n -f -9 > $@
>  
>  # DTC
>  # ---------------------------------------------------------------------------
> @@ -334,19 +334,19 @@ printf "%08x\n" $$dec_size |						\
>  )
>  
>  quiet_cmd_bzip2 = BZIP2   $@
> -      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@
> +      cmd_bzip2 = { cat $(real-prereqs) | $(BZIP2) -9; $(size_append); } > $@
>  
>  # Lzma
>  # ---------------------------------------------------------------------------
>  
>  quiet_cmd_lzma = LZMA    $@
> -      cmd_lzma = { cat $(real-prereqs) | lzma -9; $(size_append); } > $@
> +      cmd_lzma = { cat $(real-prereqs) | $(LZMA) -9; $(size_append); } > $@
>  
>  quiet_cmd_lzo = LZO     $@
> -      cmd_lzo = { cat $(real-prereqs) | lzop -9; $(size_append); } > $@
> +      cmd_lzo = { cat $(real-prereqs) | $(LZO) -9; $(size_append); } > $@
>  
>  quiet_cmd_lz4 = LZ4     $@
> -      cmd_lz4 = { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
> +      cmd_lz4 = { cat $(real-prereqs) | $(LZ4) -l -c1 stdin stdout; \
>                    $(size_append); } > $@
>  
>  # U-Boot mkimage
> @@ -393,7 +393,7 @@ quiet_cmd_xzkern = XZKERN  $@
>                       $(size_append); } > $@
>  
>  quiet_cmd_xzmisc = XZMISC  $@
> -      cmd_xzmisc = cat $(real-prereqs) | xz --check=crc32 --lzma2=dict=1MiB > $@
> +      cmd_xzmisc = cat $(real-prereqs) | $(XZ) --check=crc32 --lzma2=dict=1MiB > $@
>  
>  # ASM offsets
>  # ---------------------------------------------------------------------------
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 02135d2671a6..537179828d0c 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -45,7 +45,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>  	false; \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
> -tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> +tar -I $(_GZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>  	--transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
>  
> @@ -127,9 +127,9 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> -$(if $(findstring bz2,$@),bzip2,                                    \
> -$(if $(findstring gz,$@),gzip,                                      \
> -$(if $(findstring xz,$@),xz,                                        \
> +$(if $(findstring bz2,$@),$(BZIP2),                                 \
> +$(if $(findstring gz,$@),$(_GZIP),                                  \
> +$(if $(findstring xz,$@),$(XZ),                                     \
>  $(error unknown target $@))))                                       \
>  	-f -9 $(perf-tar).tar)
>  
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 77c7caefede1..8a0ebcc292af 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -19,6 +19,15 @@ set -e
>  tmpdir="${objtree}/tar-install"
>  tarball="${objtree}/linux-${KERNELRELEASE}-${ARCH}.tar"
>  
> +if [ x$_GZIP = "x" ]; then
> +	_GZIP=gzip
> +fi
> +if [ x$BZIP2 = "x" ]; then
> +	BZIP2=bzip2
> +fi
> +if [ x$XZ = "x" ]; then
> +	XZ=xz
> +fi
>  
>  #
>  # Figure out how to compress, if requested at all
> @@ -28,15 +37,15 @@ case "${1}" in
>  		opts=
>  		;;
>  	targz-pkg)
> -		opts=--gzip
> +		opts="-I ${_GZIP}"
>  		tarball=${tarball}.gz
>  		;;
>  	tarbz2-pkg)
> -		opts=--bzip2
> +		opts="-I ${BZIP2}"
>  		tarball=${tarball}.bz2
>  		;;
>  	tarxz-pkg)
> -		opts=--xz
> +		opts="-I ${XZ}"
>  		tarball=${tarball}.xz
>  		;;
>  	*)
> diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
> index 7a2d372f4885..b387cd208952 100755
> --- a/scripts/xz_wrap.sh
> +++ b/scripts/xz_wrap.sh
> @@ -9,6 +9,10 @@
>  # You can do whatever you want with this file.
>  #
>  
> +if [ x$XZ = "x" ]; then
> +	XZ=xz
> +fi
> +
>  BCJ=
>  LZMA2OPTS=
>  
> @@ -20,4 +24,4 @@ case $SRCARCH in
>  	sparc)          BCJ=--sparc ;;
>  esac
>  
> -exec xz --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
> +exec $XZ --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
> 
