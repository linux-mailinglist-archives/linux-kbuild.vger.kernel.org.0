Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA5E1D437B
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2020 04:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbgEOCVV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 May 2020 22:21:21 -0400
Received: from conssluserg-06.nifty.com ([210.131.2.91]:26205 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726140AbgEOCVU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 May 2020 22:21:20 -0400
Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id 04F2KjsE006660;
        Fri, 15 May 2020 11:20:46 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-06.nifty.com 04F2KjsE006660
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1589509246;
        bh=IzUeczDTiU6j7SQoJRY/0Lxv/IqTEjwf9kCHbz8El+k=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mFcNR5dSxbobcllrb4kg2FLYevOjewbJvoqCFvOHKvsOBaaYZSc1thZswSEbyO/PR
         ipdQPZbMqjbuUoF8gUNpzPl4597r2rjDUf95exE5xGNnxqQ8faDvFoKVi4KBosDAWW
         xiDmIAEtxxjEFDTjdguWCTai8NnxhW0CkhU5+838KvWHeUlb4/KuW7OD9EXZ7eGVTu
         0lWIrGpjsur9AoIJrEhqgxeoqbii51kh2xw2MkqC7XWXIF1Bun2QU/MKFfD0NlaOAg
         RA554ygLiXF1N1ys4t3YBxqGLyMpwuBimQhWPlW2Wou7TGQr+/p9J/Jx2OPPf9Znw9
         yxAljoZ6pqg7g==
X-Nifty-SrcIP: [209.85.217.41]
Received: by mail-vs1-f41.google.com with SMTP id b11so294563vsa.13;
        Thu, 14 May 2020 19:20:46 -0700 (PDT)
X-Gm-Message-State: AOAM532iSA00G8KhgGr7P8oLI66GAF2wxJOpyGHKdXOqe7mDu+S/q1ry
        /xG4E5JzNvQCRY3iGDa93OxhTZ3cLMAYNkJwW4o=
X-Google-Smtp-Source: ABdhPJxkuu1p84T4jLCgkrmz1k5bN1ReXnWS1JKFZWtwo3kUgKGpRZeCnsfV9U6Y/XtviF10EhPivWPqUiGubKMzLt8=
X-Received: by 2002:a67:d016:: with SMTP id r22mr877053vsi.215.1589509245149;
 Thu, 14 May 2020 19:20:45 -0700 (PDT)
MIME-Version: 1.0
References: <20200514131234.380097-1-efremov@linux.com>
In-Reply-To: <20200514131234.380097-1-efremov@linux.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 15 May 2020 11:20:09 +0900
X-Gmail-Original-Message-ID: <CAK7LNASRv9E-pfYCRmD-RstKhW+WgfHKrn+7bP_dAAkyKaoPGg@mail.gmail.com>
Message-ID: <CAK7LNASRv9E-pfYCRmD-RstKhW+WgfHKrn+7bP_dAAkyKaoPGg@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: add variables for compression tools
To:     Denis Efremov <efremov@linux.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 14, 2020 at 10:14 PM Denis Efremov <efremov@linux.com> wrote:
>
> Allow user to use alternative implementations of compression tools.
> For example, multi-threaded tools to speed up the build:
> $ make KGZIP=3Dpigz KXZ=3Dpxz
>
> Variable KGZIP is used instead of GZIP because the latter is reserved
> by the tool. Other variables are prefixed with 'K' for consistency.


This is unfortunate...

'man gzip' says

       The obsolescent environment variable GZIP can hold a set of default =
op=E2=80=90
       tions for gzip.  These options are interpreted first and can  be  ov=
er=E2=80=90
       written  by  explicit command line parameters.  As this can cause pr=
ob=E2=80=90
       lems when using scripts, this feature is  supported  only  for  opti=
ons
       that  are  reasonably likely to not cause too much harm, and gzip wa=
rns
       if it is used.  This feature will be removed in  a  future  release =
 of
       gzip.


It was deprecated in 2015.

commit 5054e88a7934d5ff5ec14231c8b8676161bb45fa
Author: Paul Eggert <eggert@cs.ucla.edu>
Date:   Mon Mar 16 14:25:17 2015 -0700

    gzip: make the GZIP env var obsolescent




Some possible options I came up with:


[1] Use KGZIP for now, but BZIP2, XZ, etc. for the others.

    (Then, rename KGZIP to GZIP when the time comes)


[2] Do not take this patch

    The whole build process is parallelized
    by 'make -j $(nproc)'.

    If you are still eager to use pigz instead gzip,
    use a symbolic link or a wrapper shell script.

    $ ln -s /usr/bin/pigz  /$HOME/bin/gzip
    $ PATH=3D"$HOME/bin:$PATH"





Thought?




>
> The credit goes to @grsecurity.
>
> Cc: Stephen Rothwell <sfr@canb.auug.org.au>
> Cc: Dmitry Vyukov <dvyukov@google.com>
> Signed-off-by: Denis Efremov <efremov@linux.com>
> ---
>  Makefile                          | 11 +++++++++--
>  arch/arm/boot/deflate_xip_data.sh |  6 +++++-
>  arch/ia64/Makefile                |  2 +-
>  arch/m68k/Makefile                |  4 ++--
>  arch/mips/lasat/image/Makefile    |  2 +-
>  arch/parisc/Makefile              |  2 +-
>  kernel/gen_kheaders.sh            |  6 +++++-
>  scripts/Makefile.lib              | 12 ++++++------
>  scripts/Makefile.package          |  6 +++---
>  scripts/xz_wrap.sh                |  6 +++++-
>  10 files changed, 38 insertions(+), 19 deletions(-)
>
> diff --git a/Makefile b/Makefile
> index 11fe9b1535de..9af13cfeed7a 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -447,6 +447,12 @@ PYTHON             =3D python
>  PYTHON3                =3D python3
>  CHECK          =3D sparse
>  BASH           =3D bash
> +KGZIP          =3D gzip
> +KBZIP2         =3D bzip2
> +KLZMA          =3D lzma
> +KLZOP          =3D lzop
> +KLZ4           =3D lz4c
> +KXZ            =3D xz
>
>  CHECKFLAGS     :=3D -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>                   -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> @@ -496,6 +502,7 @@ export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_H=
OSTCFLAGS CROSS_COMPILE LD
>  export CPP AR NM STRIP OBJCOPY OBJDUMP OBJSIZE READELF PAHOLE LEX YACC A=
WK INSTALLKERNEL
>  export PERL PYTHON PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS LDFLAGS_=
MODULE
> +export KGZIP KBZIP2 KLZMA KLZOP KLZ4 KXZ
>
>  export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS KBUILD_L=
DFLAGS
>  export KBUILD_CFLAGS CFLAGS_KERNEL CFLAGS_MODULE
> @@ -1005,10 +1012,10 @@ export mod_strip_cmd
>  mod_compress_cmd =3D true
>  ifdef CONFIG_MODULE_COMPRESS
>    ifdef CONFIG_MODULE_COMPRESS_GZIP
> -    mod_compress_cmd =3D gzip -n -f
> +    mod_compress_cmd =3D $(KGZIP) -n -f
>    endif # CONFIG_MODULE_COMPRESS_GZIP
>    ifdef CONFIG_MODULE_COMPRESS_XZ
> -    mod_compress_cmd =3D xz -f
> +    mod_compress_cmd =3D $(KXZ) -f
>    endif # CONFIG_MODULE_COMPRESS_XZ
>  endif # CONFIG_MODULE_COMPRESS
>  export mod_compress_cmd
> diff --git a/arch/arm/boot/deflate_xip_data.sh b/arch/arm/boot/deflate_xi=
p_data.sh
> index 40937248cebe..08dd50e08c17 100755
> --- a/arch/arm/boot/deflate_xip_data.sh
> +++ b/arch/arm/boot/deflate_xip_data.sh
> @@ -19,6 +19,10 @@ XIPIMAGE=3D"$2"
>
>  DD=3D"dd status=3Dnone"
>
> +if [ x$KGZIP =3D "x" ]; then
> +       KGZIP=3Dgzip
> +fi
> +
>  # Use "make V=3D1" to debug this script.
>  case "$KBUILD_VERBOSE" in
>  *1*)
> @@ -56,7 +60,7 @@ trap 'rm -f "$XIPIMAGE.tmp"; exit 1' 1 2 3
>  # substitute the data section by a compressed version
>  $DD if=3D"$XIPIMAGE" count=3D$data_start iflag=3Dcount_bytes of=3D"$XIPI=
MAGE.tmp"
>  $DD if=3D"$XIPIMAGE"  skip=3D$data_start iflag=3Dskip_bytes |
> -gzip -9 >> "$XIPIMAGE.tmp"
> +$KGZIP -9 >> "$XIPIMAGE.tmp"
>
>  # replace kernel binary
>  mv -f "$XIPIMAGE.tmp" "$XIPIMAGE"
> diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
> index 32240000dc0c..2876a7df1b0a 100644
> --- a/arch/ia64/Makefile
> +++ b/arch/ia64/Makefile
> @@ -40,7 +40,7 @@ $(error Sorry, you need a newer version of the assember=
, one that is built from
>  endif
>
>  quiet_cmd_gzip =3D GZIP    $@
> -cmd_gzip =3D cat $(real-prereqs) | gzip -n -f -9 > $@
> +cmd_gzip =3D cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
>
>  quiet_cmd_objcopy =3D OBJCOPY $@
>  cmd_objcopy =3D $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
> diff --git a/arch/m68k/Makefile b/arch/m68k/Makefile
> index 5d9288384096..e6c7c92aa72e 100644
> --- a/arch/m68k/Makefile
> +++ b/arch/m68k/Makefile
> @@ -148,10 +148,10 @@ vmlinux.bz2: vmlinux
>  ifndef CONFIG_KGDB
>         cp vmlinux vmlinux.tmp
>         $(STRIP) vmlinux.tmp
> -       bzip2 -1c vmlinux.tmp >vmlinux.bz2
> +       $(KBZIP2) -1c vmlinux.tmp >vmlinux.bz2
>         rm vmlinux.tmp
>  else
> -       bzip2 -1c vmlinux >vmlinux.bz2
> +       $(KBZIP2) -1c vmlinux >vmlinux.bz2
>  endif
>
>  archclean:
> diff --git a/arch/mips/lasat/image/Makefile b/arch/mips/lasat/image/Makef=
ile
> index 78ce4cff1012..617ccb1659d5 100644
> --- a/arch/mips/lasat/image/Makefile
> +++ b/arch/mips/lasat/image/Makefile
> @@ -44,7 +44,7 @@ $(obj)/%.o: $(obj)/%.gz
>         $(LD) -r -o $@ -b binary $<
>
>  $(obj)/%.gz: $(obj)/%.bin
> -       gzip -cf -9 $< > $@
> +       $(KGZIP) -cf -9 $< > $@
>
>  $(obj)/kImage.bin: $(KERNEL_IMAGE)
>         $(OBJCOPY) -O binary -S $^ $@
> diff --git a/arch/parisc/Makefile b/arch/parisc/Makefile
> index 628cd8bb7ad8..412ddec0297d 100644
> --- a/arch/parisc/Makefile
> +++ b/arch/parisc/Makefile
> @@ -162,7 +162,7 @@ vmlinuz: bzImage
>         $(OBJCOPY) $(boot)/bzImage $@
>  else
>  vmlinuz: vmlinux
> -       @gzip -cf -9 $< > $@
> +       @$(KGZIP) -cf -9 $< > $@
>  endif
>
>  install:
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> index e13ca842eb7e..f3dfaf9f6647 100755
> --- a/kernel/gen_kheaders.sh
> +++ b/kernel/gen_kheaders.sh
> @@ -9,6 +9,10 @@ outdir=3D"$(pwd)"
>  tarfile=3D$1
>  cpio_dir=3D$outdir/$tarfile.tmp
>
> +if [ x$KXZ =3D "x" ]; then
> +       KXZ=3Dxz
> +fi
> +
>  dir_list=3D"
>  include/
>  arch/$SRCARCH/include/
> @@ -88,7 +92,7 @@ find $cpio_dir -type f -print0 |
>  find $cpio_dir -printf "./%P\n" | LC_ALL=3DC sort | \
>      tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=3D$KBUILD_BUILD_TIMESTAMP}" \
>      --owner=3D0 --group=3D0 --numeric-owner --no-recursion \
> -    -Jcf $tarfile -C $cpio_dir/ -T - > /dev/null
> +    -I $KXZ -cf $tarfile -C $cpio_dir/ -T - > /dev/null
>
>  echo $headers_md5 > kernel/kheaders.md5
>  echo "$this_file_md5" >> kernel/kheaders.md5
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 4b799737722c..dd38f5ac8d48 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -241,7 +241,7 @@ cmd_objcopy =3D $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYF=
LAGS_$(@F)) $< $@
>  # ----------------------------------------------------------------------=
-----
>
>  quiet_cmd_gzip =3D GZIP    $@
> -      cmd_gzip =3D cat $(real-prereqs) | gzip -n -f -9 > $@
> +      cmd_gzip =3D cat $(real-prereqs) | $(KGZIP) -n -f -9 > $@
>
>  # DTC
>  # ----------------------------------------------------------------------=
-----
> @@ -334,19 +334,19 @@ printf "%08x\n" $$dec_size |                       =
                       \
>  )
>
>  quiet_cmd_bzip2 =3D BZIP2   $@
> -      cmd_bzip2 =3D { cat $(real-prereqs) | bzip2 -9; $(size_append); } =
> $@
> +      cmd_bzip2 =3D { cat $(real-prereqs) | $(KBZIP2) -9; $(size_append)=
; } > $@
>
>  # Lzma
>  # ----------------------------------------------------------------------=
-----
>
>  quiet_cmd_lzma =3D LZMA    $@
> -      cmd_lzma =3D { cat $(real-prereqs) | lzma -9; $(size_append); } > =
$@
> +      cmd_lzma =3D { cat $(real-prereqs) | $(KLZMA) -9; $(size_append); =
} > $@
>
>  quiet_cmd_lzo =3D LZO     $@
> -      cmd_lzo =3D { cat $(real-prereqs) | lzop -9; $(size_append); } > $=
@
> +      cmd_lzo =3D { cat $(real-prereqs) | $(KLZOP) -9; $(size_append); }=
 > $@
>
>  quiet_cmd_lz4 =3D LZ4     $@
> -      cmd_lz4 =3D { cat $(real-prereqs) | lz4c -l -c1 stdin stdout; \
> +      cmd_lz4 =3D { cat $(real-prereqs) | $(KLZ4) -l -c1 stdin stdout; \
>                    $(size_append); } > $@
>
>  # U-Boot mkimage
> @@ -393,7 +393,7 @@ quiet_cmd_xzkern =3D XZKERN  $@
>                       $(size_append); } > $@
>
>  quiet_cmd_xzmisc =3D XZMISC  $@
> -      cmd_xzmisc =3D cat $(real-prereqs) | xz --check=3Dcrc32 --lzma2=3D=
dict=3D1MiB > $@
> +      cmd_xzmisc =3D cat $(real-prereqs) | $(KXZ) --check=3Dcrc32 --lzma=
2=3Ddict=3D1MiB > $@
>
>  # ASM offsets
>  # ----------------------------------------------------------------------=
-----
> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
> index 02135d2671a6..1b91fe1bfcdb 100644
> --- a/scripts/Makefile.package
> +++ b/scripts/Makefile.package
> @@ -127,9 +127,9 @@ util/PERF-VERSION-GEN $(CURDIR)/$(perf-tar)/);       =
       \
>  tar rf $(perf-tar).tar $(perf-tar)/HEAD $(perf-tar)/PERF-VERSION-FILE; \
>  rm -r $(perf-tar);                                                  \
>  $(if $(findstring tar-src,$@),,                                     \
> -$(if $(findstring bz2,$@),bzip2,                                    \
> -$(if $(findstring gz,$@),gzip,                                      \
> -$(if $(findstring xz,$@),xz,                                        \
> +$(if $(findstring bz2,$@),$(KBZIP2),                                \
> +$(if $(findstring gz,$@),$(KGZIP),                                  \
> +$(if $(findstring xz,$@),$(KXZ),                                    \
>  $(error unknown target $@))))                                       \
>         -f -9 $(perf-tar).tar)
>
> diff --git a/scripts/xz_wrap.sh b/scripts/xz_wrap.sh
> index 7a2d372f4885..4922102dbfe7 100755
> --- a/scripts/xz_wrap.sh
> +++ b/scripts/xz_wrap.sh
> @@ -9,6 +9,10 @@
>  # You can do whatever you want with this file.
>  #
>
> +if [ x$KXZ =3D "x" ]; then
> +       KXZ=3Dxz
> +fi
> +
>  BCJ=3D
>  LZMA2OPTS=3D
>
> @@ -20,4 +24,4 @@ case $SRCARCH in
>         sparc)          BCJ=3D--sparc ;;
>  esac
>
> -exec xz --check=3Dcrc32 $BCJ --lzma2=3D$LZMA2OPTS,dict=3D32MiB
> +exec $KXZ --check=3Dcrc32 $BCJ --lzma2=3D$LZMA2OPTS,dict=3D32MiB
> --
> 2.25.4
>


--
Best Regards
Masahiro Yamada
