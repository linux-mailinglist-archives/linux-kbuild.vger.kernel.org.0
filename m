Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D3371ED9E0
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 02:13:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726170AbgFDANA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 3 Jun 2020 20:13:00 -0400
Received: from conssluserg-01.nifty.com ([210.131.2.80]:53580 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725946AbgFDAM7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 20:12:59 -0400
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 0540Cgnn003921;
        Thu, 4 Jun 2020 09:12:42 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 0540Cgnn003921
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1591229563;
        bh=kz4OXbjk0zI2YAJ4ciu7z8HJrH2OISl4iTIzTuhMLbY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=XSom8YapRkKjepWL+IRa2nqndCHzpml2YOV+J82Gzxr3ireSb+rBhxP30OOpnG2kg
         wsaHIAXsO0SsXZaiN45IywVOIv6bjE69L8fmr/HVaGje+VuXdAteIe3vfx0oe7FAk5
         HRv1BQ/1v/cO/LULhncaziylFnhD6VyBU1KHI0dC/Y43kZIOn4qIsGGGqtltsPnTfW
         /HXei2FNrgS+A8lLNH2raDBvcSrYXbwaJrkyLxTmtUL//4dJ1vzZ4Qt/e79Y/BEogA
         B0ZchwGDsd0e4jnhgyZmjmi+tktafOEwjC5ziH5DBLe6BmCimdGRxNevlFdMtACyx/
         09hn0K+SAlvnw==
X-Nifty-SrcIP: [209.85.222.46]
Received: by mail-ua1-f46.google.com with SMTP id v6so1463187uam.10;
        Wed, 03 Jun 2020 17:12:42 -0700 (PDT)
X-Gm-Message-State: AOAM532quF1E4nGkY6iVZzdVEYdyNtiw8BgwozooxspsOuqihEnQyR8V
        4Ko1G0esGl5b9m1m0jeRIFOBAJXBRbcbH09lkqQ=
X-Google-Smtp-Source: ABdhPJyxS2L9479oQwB3Kze91Hoi+CssW/fGnZr05ofYK0TIsg/ePsRaSPCzb7kcBztFJxcJjZ3rjqya6WICCbfV3t4=
X-Received: by 2002:a9f:3791:: with SMTP id q17mr1916065uaq.95.1591229561492;
 Wed, 03 Jun 2020 17:12:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com> <20200603092049.2036551-1-efremov@linux.com>
In-Reply-To: <20200603092049.2036551-1-efremov@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 4 Jun 2020 09:12:04 +0900
X-Gmail-Original-Message-ID: <CAK7LNASrVFAR+4cK=3b7TtOyNNTNxfvAph=3mfivQVqjBJ3tKg@mail.gmail.com>
Message-ID: <CAK7LNASrVFAR+4cK=3b7TtOyNNTNxfvAph=3mfivQVqjBJ3tKg@mail.gmail.com>
Subject: Re: [RFC PATCH v4] kbuild: add variables for compression tools
To:     Denis Efremov <efremov@linux.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 3, 2020 at 6:19 PM Denis Efremov <efremov@linux.com> wrote:
>
> Allow user to use alternative implementations of compression tools,
> such as pigz, pbzip2, pxz. For example, multi-threaded tools to
> speed up the build:
> $ make GZIP=pigz BZIP2=pbzip2
>
> Variables _GZIP, _BZIP2, _LZOP are used internally because original env
> vars are reserved by the tools. The use of GZIP in gzip tool is obsolete
> since 2015. However, alternative implementations (e.g., pigz) still rely
> on it. BZIP2, BZIP, LZOP vars are not obsolescent.
>
> The credit goes to @grsecurity.
>
> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT="--threads=0"
>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---

Applied to linux-kbuild.
Thanks.



> Changes in v2:
>   - _GZIP used instead of GZIP
>   - tar commands altered to use tools from the vars
> Changes in v3:
>   - _BZIP2 used instead of BZIP2
>   - _LZOP used instead of LZOP
> Changes in v4:
>   - Unexports removed from Kbuild.include
>   - MAKEOVERRIDES used in top Makefile
>   - All variables checks removed from scripts
>
>  Makefile                          | 25 +++++++++++++++++++++++--
>  arch/arm/boot/deflate_xip_data.sh |  2 +-
>  arch/ia64/Makefile                |  2 +-
>  arch/m68k/Makefile                |  8 ++++----
>  arch/mips/lasat/image/Makefile    |  2 +-
>  arch/parisc/Makefile              |  2 +-
>  kernel/gen_kheaders.sh            |  2 +-
>  scripts/Makefile.lib              | 12 ++++++------
>  scripts/Makefile.package          |  8 ++++----
>  scripts/package/buildtar          |  6 +++---
>  scripts/xz_wrap.sh                |  2 +-
>  11 files changed, 46 insertions(+), 25 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index b668725a2a62..9a9cce1ed83d 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -447,6 +447,26 @@ PYTHON             = python
>  PYTHON3                = python3
>  CHECK          = sparse
>  BASH           = bash
> +GZIP           = gzip
> +BZIP2          = bzip2
> +LZOP           = lzop
> +LZMA           = lzma
> +LZ4            = lz4c
> +XZ             = xz
> +
> +# GZIP, BZIP2, LZOP env vars are used by the tools. Support them as the command
> +# line interface, but use _GZIP, _BZIP2, _LZOP internally.
> +_GZIP          := $(GZIP)
> +_BZIP2         := $(BZIP2)
> +_LZOP          := $(LZOP)
> +
> +# Reset GZIP, BZIP2, LZOP in this Makefile
> +override GZIP=
> +override BZIP2=
> +override LZOP=
> +
> +# Reset GZIP, BZIP2, LZOP in recursive invocations
> +MAKEOVERRIDES += GZIP= BZIP2= LZOP=
>
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>                   -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> @@ -495,6 +515,7 @@ CLANG_FLAGS :=
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS CROSS_COMPILE LD CC
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC AWK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
> +export _GZIP _BZIP2 _LZOP LZMA LZ4 XZ
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_MODULE
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_LDFLAGS
> @@ -1005,10 +1026,10 @@ export mod_strip_cmd
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
> index 40937248cebe..739f0464321e 100755
> --- a/arch/arm/boot/deflate_xip_data.sh
> +++ b/arch/arm/boot/deflate_xip_data.sh
> @@ -56,7 +56,7 @@ trap 'rm -f "$XIPIMAGE.tmp"; exit 1' 1 2 3
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
> index 5d9288384096..ce6db5e5a5a3 100644
> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -135,10 +135,10 @@ vmlinux.gz: vmlinux
>  ifndef CONFIG_KGDB
>         cp vmlinux vmlinux.tmp
>         $(STRIP) vmlinux.tmp
> -       gzip -9c vmlinux.tmp >vmlinux.gz
> +       $(_GZIP) -9c vmlinux.tmp >vmlinux.gz
>         rm vmlinux.tmp
>  else
> -       gzip -9c vmlinux >vmlinux.gz
> +       $(_GZIP) -9c vmlinux >vmlinux.gz
>  endif
>
>  bzImage: vmlinux.bz2
> @@ -148,10 +148,10 @@ vmlinux.bz2: vmlinux
>  ifndef CONFIG_KGDB
>         cp vmlinux vmlinux.tmp
>         $(STRIP) vmlinux.tmp
> -       bzip2 -1c vmlinux.tmp >vmlinux.bz2
> +       $(_BZIP2) -1c vmlinux.tmp >vmlinux.bz2
>         rm vmlinux.tmp
>  else
> -       bzip2 -1c vmlinux >vmlinux.bz2
> +       $(_BZIP2) -1c vmlinux >vmlinux.bz2
>  endif
>
>  archclean:
> diff --git a/arch/mips/lasat/image/Makefile b/arch/mips/lasat/image/Makefile
> index 78ce4cff1012..24d8dbde1109 100644
> --- a/arch/mips/lasat/image/Makefile
> +++ b/arch/mips/lasat/image/Makefile
> @@ -44,7 +44,7 @@ $(obj)/%.o: $(obj)/%.gz
>         $(LD) -r -o $@ -b binary $<
>
>  $(obj)/%.gz: $(obj)/%.bin
> -       gzip -cf -9 $< > $@
> +       $(_GZIP) -cf -9 $< > $@
>
>  $(obj)/kImage.bin: $(KERNEL_IMAGE)
>         $(OBJCOPY) -O binary -S $^ $@
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 628cd8bb7ad8..e1aa514aeb36 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -162,7 +162,7 @@ vmlinuz: bzImage
>         $(OBJCOPY) $(boot)/bzImage $@
>  else
>  vmlinuz: vmlinux
> -       @gzip -cf -9 $< > $@
> +       @$(_GZIP) -cf -9 $< > $@
>  endif
>
>  install:
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index e13ca842eb7e..c1510f0ab3ea 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -88,7 +88,7 @@ find $cpio_dir -type f -print0 |
>  find $cpio_dir -printf "./%P\n" | LC_ALL=C sort | \
>      tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
>      --owner=0 --group=0 --numeric-owner --no-recursion \
> -    -Jcf $tarfile -C $cpio_dir/ -T - > /dev/null
> +    -I $XZ -cf $tarfile -C $cpio_dir/ -T - > /dev/null
>
>  echo $headers_md5 > kernel/kheaders.md5
>  echo "$this_file_md5" >> kernel/kheaders.md5
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 4b799737722c..a1c1424e6b52 100644
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
> @@ -334,19 +334,19 @@ printf "%08x\n" $$dec_size |                                              \
>  )
>
>  quiet_cmd_bzip2 = BZIP2   $@
> -      cmd_bzip2 = { cat $(real-prereqs) | bzip2 -9; $(size_append); } > $@
> +      cmd_bzip2 = { cat $(real-prereqs) | $(_BZIP2) -9; $(size_append); } > $@
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
> +      cmd_lzo = { cat $(real-prereqs) | $(_LZOP) -9; $(size_append); } > $@
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
> index 02135d2671a6..b2b6153af63a 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -45,7 +45,7 @@ if test "$(objtree)" != "$(srctree)"; then \
>         false; \
>  fi ; \
>  $(srctree)/scripts/setlocalversion --save-scmversion; \
> -tar -cz $(RCS_TAR_IGNORE) -f $(2).tar.gz \
> +tar -I $(_GZIP) -c $(RCS_TAR_IGNORE) -f $(2).tar.gz \
>         --transform 's:^:$(2)/:S' $(TAR_CONTENT) $(3); \
>  rm -f $(objtree)/.scmversion
>
> @@ -127,9 +127,9 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);              \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> -$(if $(findstring bz2,$@),bzip2,                                    \
> -$(if $(findstring gz,$@),gzip,                                      \
> -$(if $(findstring xz,$@),xz,                                        \
> +$(if $(findstring bz2,$@),$(_BZIP2),                                 \
> +$(if $(findstring gz,$@),$(_GZIP),                                  \
> +$(if $(findstring xz,$@),$(XZ),                                     \
>  $(error unknown target $@))))                                       \
>         -f -9 $(perf-tar).tar)
>
> diff --git a/scripts/package/buildtar b/scripts/package/buildtar
> index 77c7caefede1..ad62c6879622 100755
> --- a/scripts/package/buildtar
> +++ b/scripts/package/buildtar
> @@ -28,15 +28,15 @@ case "${1}" in
>                 opts=
>                 ;;
>         targz-pkg)
> -               opts=--gzip
> +               opts="-I ${_GZIP}"
>                 tarball=${tarball}.gz
>                 ;;
>         tarbz2-pkg)
> -               opts=--bzip2
> +               opts="-I ${_BZIP2}"
>                 tarball=${tarball}.bz2
>                 ;;
>         tarxz-pkg)
> -               opts=--xz
> +               opts="-I ${XZ}"
>                 tarball=${tarball}.xz
>                 ;;
>         *)
> diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
> index 7a2d372f4885..76e9cbcfbeab 100755
> --- a/scripts/xz_wrap.sh
> +++ b/scripts/xz_wrap.sh
> @@ -20,4 +20,4 @@ case $SRCARCH in
>         sparc)          BCJ=--sparc ;;
>  esac
>
> -exec xz --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
> +exec $XZ --check=crc32 $BCJ --lzma2=$LZMA2OPTS,dict=32MiB
> --
> 2.26.2
>


-- 
Best Regards
Masahiro Yamada
