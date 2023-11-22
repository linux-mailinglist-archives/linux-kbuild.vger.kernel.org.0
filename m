Return-Path: <linux-kbuild+bounces-108-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 491F67F3D47
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 06:28:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6072B1C20D6A
	for <lists+linux-kbuild@lfdr.de>; Wed, 22 Nov 2023 05:28:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 65E442BAF6;
	Wed, 22 Nov 2023 05:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AQz9sF7O"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A0421170E
	for <linux-kbuild@vger.kernel.org>; Wed, 22 Nov 2023 05:28:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8CEC433C9;
	Wed, 22 Nov 2023 05:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700630883;
	bh=EBMV64TVAEmvatBc/v/ek55B5TzVsxrXfaawNaU3xp8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=AQz9sF7OGrhH/emVQ2K7K0htP5E8HeSRgOp2cD98hxQK3Od/YBPROQ4Qd8GImCEB1
	 kCVPv2Hxd/vULZdyc0WvP184ZXXzxMSK4ize+mWUufavSBIdWv1mySXFn5nAT+NWU+
	 gnlkhU/jfGGf9VNy7iYWbdlLlbsYDOjIyBoDvApMnhvep++WT1tyvxM6/+Z4winkKl
	 0CWnCYvho9ulGNunC6Lj+haSHkqoezUKvLHM4qWM+HC0anYRJLErz6LWOy9lRTuI+k
	 c8ttwU+P87kgNnjp65TTTfKjuUU5S3NNcLnlbgjf7xGg3rvLVe1ASHeA+y6ti7REEi
	 976+ohdLcnOLA==
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6cd0a8bc6dcso3959467a34.2;
        Tue, 21 Nov 2023 21:28:03 -0800 (PST)
X-Gm-Message-State: AOJu0YwfY3Ah5IoNJnc7ziTHRejkdWEl+br7OUXawbPB/eDk9R29/12y
	CSpblXglxsKOCVsohSJ2SQqwSVUjgrafWpXBanw=
X-Google-Smtp-Source: AGHT+IHUMvCXR5sX/73kpyljv1aHGQ3tiTlkgwp+tpq8FbjY+cVwnrLIL+TbxGImEu8SaavzkeJL0rBNw9cra3Ojgc0=
X-Received: by 2002:a05:6870:44d2:b0:1f5:ef2a:9dee with SMTP id
 t18-20020a05687044d200b001f5ef2a9deemr1990013oai.37.1700630882912; Tue, 21
 Nov 2023 21:28:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231119150229.634424-1-sjg@chromium.org> <20231119150229.634424-3-sjg@chromium.org>
In-Reply-To: <20231119150229.634424-3-sjg@chromium.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Wed, 22 Nov 2023 14:27:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNATgd6M4P8-e-vas=X6eYGpuoRF32oizZ8aXvGQh0NiytA@mail.gmail.com>
Message-ID: <CAK7LNATgd6M4P8-e-vas=X6eYGpuoRF32oizZ8aXvGQh0NiytA@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: boot: Support Flat Image Tree
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	U-Boot Mailing List <u-boot@lists.denx.de>, Tom Rini <trini@konsulko.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Nick Terrell <terrelln@fb.com>, 
	Nicolas Schier <nicolas@fjasle.eu>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 20, 2023 at 12:02=E2=80=AFAM Simon Glass <sjg@chromium.org> wro=
te:
>
> Add a script which produces a Flat Image Tree (FIT), a single file
> containing the built kernel and associated devicetree files.
> Compression defaults to gzip which gives a good balance of size and
> performance.
>
> The files compress from about 86MB to 24MB using this approach.
>
> The FIT can be used by bootloaders which support it, such as U-Boot
> and Linuxboot. It permits automatic selection of the correct
> devicetree, matching the compatible string of the running board with
> the closest compatible string in the FIT. There is no need for
> filenames or other workarounds.
>
> Add a 'make image.fit' build target for arm64, as well.
>
> The FIT can be examined using 'dumpimage -l'.
>
> This features requires pylibfdt (use 'pip install libfdt'). It also


This feature





I CC'ed you in [1] so that you would notice
that you are introducing the same bug.


[1] https://lore.kernel.org/linux-kbuild/CAPnjgZ1w+0jcdR-qHSbhdXHJFA-UNFNFT=
tB4-6BvxYTyuhyweA@mail.gmail.com/T/#md4084ff402a59ba04f258b24f49ecd1fd4fe79=
00




> requires compression utilities for the algorithm being used. Supported
> compression options are the same as the Image.xxx files. For now there
> is no way to change the compression other than by editing the rule for
> $(obj)/image.fit
>
> While FIT supports a ramdisk / initrd, no attempt is made to support
> this here, since it must be built separately from the Linux build.
>
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
>
> (no changes since v5)
>
> Changes in v5:
> - Drop patch previously applied
> - Correct compression rule which was broken in v4
>
> Changes in v4:
> - Use single quotes for UIMAGE_NAME
>
> Changes in v3:
> - Drop temporary file image.itk
> - Drop patch 'Use double quotes for image name'
> - Drop double quotes in use of UIMAGE_NAME
> - Drop unnecessary CONFIG_EFI_ZBOOT condition for help
> - Avoid hard-coding "arm64" for the DT architecture
>
> Changes in v2:
> - Drop patch previously applied
> - Add .gitignore file
> - Move fit rule to Makefile.lib using an intermediate file
> - Drop dependency on CONFIG_EFI_ZBOOT
> - Pick up .dtb files separately from the kernel
> - Correct pylint too-many-args warning for write_kernel()
> - Include the kernel image in the file count
> - Add a pointer to the FIT spec and mention of its wide industry usage
> - Mention the kernel version in the FIT description
>
>  MAINTAINERS                |   7 +
>  arch/arm64/Makefile        |   3 +-
>  arch/arm64/boot/.gitignore |   1 +
>  arch/arm64/boot/Makefile   |   6 +-
>  scripts/Makefile.lib       |  13 ++
>  scripts/make_fit.py        | 289 +++++++++++++++++++++++++++++++++++++
>  6 files changed, 317 insertions(+), 2 deletions(-)
>  create mode 100755 scripts/make_fit.py
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a17935edfa33..f388f45fcbfe 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1585,6 +1585,13 @@ F:       Documentation/process/maintainer-soc*.rst
>  F:     arch/arm/boot/dts/Makefile
>  F:     arch/arm64/boot/dts/Makefile
>
> +ARM64 FIT SUPPORT
> +M:     Simon Glass <sjg@chromium.org>
> +L:     linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> +S:     Maintained
> +F:     arch/arm64/boot/Makefile
> +F:     scripts/make_fit.py
> +
>  ARM ARCHITECTED TIMER DRIVER
>  M:     Mark Rutland <mark.rutland@arm.com>
>  M:     Marc Zyngier <maz@kernel.org>
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index ae0c5ee8c78b..a58599dca07e 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -150,7 +150,7 @@ libs-$(CONFIG_EFI_STUB) +=3D $(objtree)/drivers/firmw=
are/efi/libstub/lib.a
>  # Default target when executing plain make
>  boot           :=3D arch/arm64/boot
>
> -BOOT_TARGETS   :=3D Image vmlinuz.efi
> +BOOT_TARGETS   :=3D Image vmlinuz.efi image.fit
>
>  PHONY +=3D $(BOOT_TARGETS)
>
> @@ -215,6 +215,7 @@ virtconfig:
>  define archhelp
>    echo  '* Image.gz      - Compressed kernel image (arch/$(ARCH)/boot/Im=
age.gz)'
>    echo  '  Image         - Uncompressed kernel image (arch/$(ARCH)/boot/=
Image)'
> +  echo  '  image.fit     - Flat Image Tree (arch/$(ARCH)/boot/image.fit)=
'
>    echo  '  install       - Install uncompressed kernel'
>    echo  '  zinstall      - Install compressed kernel'
>    echo  '                  Install using (your) ~/bin/installkernel or'
> diff --git a/arch/arm64/boot/.gitignore b/arch/arm64/boot/.gitignore
> index af5dc61f8b43..abaae9de1bdd 100644
> --- a/arch/arm64/boot/.gitignore
> +++ b/arch/arm64/boot/.gitignore
> @@ -2,3 +2,4 @@
>  Image
>  Image.gz
>  vmlinuz*
> +image.fit
> diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
> index 1761f5972443..8d591fda078f 100644
> --- a/arch/arm64/boot/Makefile
> +++ b/arch/arm64/boot/Makefile
> @@ -16,7 +16,8 @@
>
>  OBJCOPYFLAGS_Image :=3D-O binary -R .note -R .note.gnu.build-id -R .comm=
ent -S
>
> -targets :=3D Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo Ima=
ge.zst
> +targets :=3D Image Image.bz2 Image.gz Image.lz4 Image.lzma Image.lzo \
> +       Image.zst image.fit
>
>  $(obj)/Image: vmlinux FORCE
>         $(call if_changed,objcopy)
> @@ -39,6 +40,9 @@ $(obj)/Image.lzo: $(obj)/Image FORCE
>  $(obj)/Image.zst: $(obj)/Image FORCE
>         $(call if_changed,zstd)
>
> +$(obj)/image.fit: $(obj)/Image FORCE
> +       $(call cmd,fit,gzip)
> +
>  EFI_ZBOOT_PAYLOAD      :=3D Image
>  EFI_ZBOOT_BFD_TARGET   :=3D elf64-littleaarch64
>  EFI_ZBOOT_MACH_TYPE    :=3D ARM64
> diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
> index 1a965fe68e01..ecd8cd358f3e 100644
> --- a/scripts/Makefile.lib
> +++ b/scripts/Makefile.lib
> @@ -496,6 +496,19 @@ quiet_cmd_uimage =3D UIMAGE  $@
>                         -a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
>                         -n '$(UIMAGE_NAME)' -d $< $@
>
> +# Flat Image Tree (FIT)
> +# This allows for packaging of a kernel and all devicetrees files, using
> +# compression.
> +# ----------------------------------------------------------------------=
-----
> +
> +MAKE_FIT :=3D $(srctree)/scripts/make_fit.py
> +
> +quiet_cmd_fit =3D FIT     $@
> +      cmd_fit =3D $(MAKE_FIT) -f $@ --arch $(UIMAGE_ARCH) --os linux \
> +                       --name '$(UIMAGE_NAME)' \
> +                       --compress $(UIMAGE_COMPRESSION) -k $< \
> +                       $(dir $<)/dts
> +
>  # XZ
>  # ----------------------------------------------------------------------=
-----
>  # Use xzkern to compress the kernel image and xzmisc to compress other t=
hings.
> diff --git a/scripts/make_fit.py b/scripts/make_fit.py
> new file mode 100755
> index 000000000000..e1059825de9c
> --- /dev/null
> +++ b/scripts/make_fit.py
> @@ -0,0 +1,289 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0+
> +#
> +# Copyright 2023 Google LLC
> +# Written by Simon Glass <sjg@chromium.org>
> +#
> +
> +"""Build a FIT containing a lot of devicetree files
> +
> +Usage:
> +    make_fit.py -A arm64 -n 'Linux-6.6' -O linux
> +        -f arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.=
itk
> +        /tmp/kern/arch/arm64/boot/dts/ -E -c gzip
> +
> +Creates a FIT containing the supplied kernel and a directory containing =
the
> +devicetree files.
> +
> +Use -E to generate an external FIT (where the data is placed after the
> +FIT data structure). This allows parsing of the data without loading
> +the entire FIT.
> +
> +Use -c to compress the data, using bzip2, gzip, lz4, lzma, lzo and
> +zstd
> +
> +The resulting FIT can be booted by bootloaders which support FIT, such
> +as U-Boot, Linuxboot, Tianocore, etc.
> +
> +Note that this tool does not yet support adding a ramdisk / initrd.
> +"""
> +
> +import argparse
> +import collections
> +import os
> +import subprocess
> +import sys
> +import tempfile
> +import time
> +
> +import libfdt
> +
> +
> +# Tool extension and the name of the command-line tools
> +CompTool =3D collections.namedtuple('CompTool', 'ext,tools')
> +
> +COMP_TOOLS =3D {
> +    'bzip2': CompTool('.bz2', 'bzip2'),
> +    'gzip': CompTool('.gz', 'pigz,gzip'),
> +    'lz4': CompTool('.lz4', 'lz4'),
> +    'lzma': CompTool('.lzma', 'lzma'),
> +    'lzo': CompTool('.lzo', 'lzop'),
> +    'zstd': CompTool('.zstd', 'zstd'),
> +}
> +
> +def parse_args():
> +    """Parse the program ArgumentParser
> +
> +    Returns:
> +        Namespace object containing the arguments
> +    """
> +    epilog =3D 'Build a FIT from a directory tree containing .dtb files'
> +    parser =3D argparse.ArgumentParser(epilog=3Depilog)
> +    parser.add_argument('-A', '--arch', type=3Dstr, required=3DTrue,
> +          help=3D'Specifies the architecture')
> +    parser.add_argument('-c', '--compress', type=3Dstr, default=3D'none'=
,
> +          help=3D'Specifies the compression')
> +    parser.add_argument('-E', '--external', action=3D'store_true',
> +          help=3D'Convert the FIT to use external data')
> +    parser.add_argument('-n', '--name', type=3Dstr, required=3DTrue,
> +          help=3D'Specifies the name')
> +    parser.add_argument('-O', '--os', type=3Dstr, required=3DTrue,
> +          help=3D'Specifies the operating system')
> +    parser.add_argument('-f', '--fit', type=3Dstr, required=3DTrue,
> +          help=3D'Specifies the output file (.fit)')
> +    parser.add_argument('-k', '--kernel', type=3Dstr, required=3DTrue,
> +          help=3D'Specifies the (uncompressed) kernel input file (.itk)'=
)
> +    parser.add_argument('srcdir', type=3Dstr, nargs=3D'*',
> +          help=3D'Specifies the directory tree that contains .dtb files'=
)
> +
> +    return parser.parse_args()
> +
> +def setup_fit(fsw, name):
> +    """Make a start on writing the FIT
> +
> +    Outputs the root properties and the 'images' node
> +
> +    Args:
> +        fsw (libfdt.FdtSw): Object to use for writing
> +        name (str): Name of kernel image
> +    """
> +    fsw.INC_SIZE =3D 65536
> +    fsw.finish_reservemap()
> +    fsw.begin_node('')
> +    fsw.property_string('description', f'{name} with devicetree set')
> +    fsw.property_u32('#address-cells', 1)
> +
> +    fsw.property_u32('timestamp', int(time.time()))
> +    fsw.begin_node('images')
> +
> +
> +def write_kernel(fsw, data, args):
> +    """Write out the kernel image
> +
> +    Writes a kernel node along with the required properties
> +
> +    Args:
> +        fsw (libfdt.FdtSw): Object to use for writing
> +        data (bytes): Data to write (possibly compressed)
> +        args (Namespace): Contains necessary strings:
> +            arch: FIT architecture, e.g. 'arm64'
> +            fit_os: Operating Systems, e.g. 'linux'
> +            name: Name of OS, e.g. 'Linux-6.6.0-rc7'
> +            compress: Compression algorithm to use, e.g. 'gzip'
> +    """
> +    with fsw.add_node('kernel'):
> +        fsw.property_string('description', args.name)
> +        fsw.property_string('type', 'kernel_noload')
> +        fsw.property_string('arch', args.arch)
> +        fsw.property_string('os', args.os)
> +        fsw.property_string('compression', args.compress)
> +        fsw.property('data', data)
> +        fsw.property_u32('load', 0)
> +        fsw.property_u32('entry', 0)
> +
> +
> +def finish_fit(fsw, entries):
> +    """Finish the FIT ready for use
> +
> +    Writes the /configurations node and subnodes
> +
> +    Args:
> +        fsw (libfdt.FdtSw): Object to use for writing
> +        entries (list of tuple): List of configurations:
> +            str: Description of model
> +            str: Compatible stringlist
> +    """
> +    fsw.end_node()
> +    seq =3D 0
> +    with fsw.add_node('configurations'):
> +        for model, compat in entries:
> +            seq +=3D 1
> +            with fsw.add_node(f'conf-{seq}'):
> +                fsw.property('compatible', bytes(compat))
> +                fsw.property_string('description', model)
> +                fsw.property_string('fdt', f'fdt-{seq}')
> +                fsw.property_string('kernel', 'kernel')
> +    fsw.end_node()
> +
> +
> +def compress_data(inf, compress):
> +    """Compress data using a selected algorithm
> +
> +    Args:
> +        inf (IOBase): Filename containing the data to compress
> +        compress (str): Compression algorithm, e.g. 'gzip'
> +
> +    Return:
> +        bytes: Compressed data
> +    """
> +    if compress =3D=3D 'none':
> +        return inf.read()
> +
> +    comp =3D COMP_TOOLS.get(compress)
> +    if not comp:
> +        raise ValueError(f"Unknown compression algorithm '{compress}'")
> +
> +    with tempfile.NamedTemporaryFile() as comp_fname:
> +        with open(comp_fname.name, 'wb') as outf:
> +            done =3D False
> +            for tool in comp.tools.split(','):
> +                try:
> +                    subprocess.call([tool, '-c'], stdin=3Dinf, stdout=3D=
outf)
> +                    done =3D True
> +                    break
> +                except FileNotFoundError:
> +                    pass
> +            if not done:
> +                raise ValueError(f'Missing tool(s): {comp.tools}\n')
> +            with open(comp_fname.name, 'rb') as compf:
> +                comp_data =3D compf.read()
> +    return comp_data
> +
> +
> +def output_dtb(fsw, seq, fname, arch, compress):
> +    """Write out a single devicetree to the FIT
> +
> +    Args:
> +        fsw (libfdt.FdtSw): Object to use for writing
> +        seq (int): Sequence number (1 for first)
> +        fmame (str): Filename containing the DTB
> +        arch: FIT architecture, e.g. 'arm64'
> +        compress (str): Compressed algorithm, e.g. 'gzip'
> +
> +    Returns:
> +        tuple:
> +            str: Model name
> +            bytes: Compatible stringlist
> +    """
> +    with fsw.add_node(f'fdt-{seq}'):
> +        # Get the compatible / model information
> +        with open(fname, 'rb') as inf:
> +            data =3D inf.read()
> +        fdt =3D libfdt.FdtRo(data)
> +        model =3D fdt.getprop(0, 'model').as_str()
> +        compat =3D fdt.getprop(0, 'compatible')
> +
> +        fsw.property_string('description', model)
> +        fsw.property_string('type', 'flat_dt')
> +        fsw.property_string('arch', arch)
> +        fsw.property_string('compression', compress)
> +        fsw.property('compatible', bytes(compat))
> +
> +        with open(fname, 'rb') as inf:
> +            compressed =3D compress_data(inf, compress)
> +        fsw.property('data', compressed)
> +    return model, compat
> +
> +
> +def build_fit(args):
> +    """Build the FIT from the provided files and arguments
> +
> +    Args:
> +        args (Namespace): Program arguments
> +
> +    Returns:
> +        tuple:
> +            bytes: FIT data
> +            int: Number of configurations generated
> +            size: Total uncompressed size of data
> +    """
> +    fsw =3D libfdt.FdtSw()
> +    setup_fit(fsw, args.name)
> +    seq =3D 0
> +    size =3D 0
> +    entries =3D []
> +
> +    # Handle the kernel
> +    with open(args.kernel, 'rb') as inf:
> +        comp_data =3D compress_data(inf, args.compress)
> +    size +=3D os.path.getsize(args.kernel)
> +    write_kernel(fsw, comp_data, args)
> +
> +    for path in args.srcdir:
> +        # Handle devicetree files
> +        if os.path.isdir(path):
> +            for dirpath, _, fnames in os.walk(path):
> +                for fname in fnames:
> +                    if os.path.splitext(fname)[1] !=3D '.dtb':
> +                        continue
> +                    pathname =3D os.path.join(dirpath, fname)
> +                    seq +=3D 1
> +                    size +=3D os.path.getsize(pathname)
> +                    model, compat =3D output_dtb(fsw, seq, pathname,
> +                                               args.arch, args.compress)
> +                    entries.append([model, compat])
> +
> +    finish_fit(fsw, entries)
> +
> +    # Include the kernel itself in the returned file count
> +    return fsw.as_fdt().as_bytearray(), seq + 1, size
> +
> +
> +def run_make_fit():
> +    """Run the tool's main logic"""
> +    args =3D parse_args()
> +
> +    out_data, count, size =3D build_fit(args)
> +    with open(args.fit, 'wb') as outf:
> +        outf.write(out_data)
> +
> +    ext_fit_size =3D None
> +    if args.external:
> +        mkimage =3D os.environ.get('MKIMAGE', 'mkimage')
> +        subprocess.check_call([mkimage, '-E', '-F', args.fit],
> +                              stdout=3Dsubprocess.DEVNULL)
> +
> +        with open(args.fit, 'rb') as inf:
> +            data =3D inf.read()
> +        ext_fit =3D libfdt.FdtRo(data)
> +        ext_fit_size =3D ext_fit.totalsize()
> +
> +    comp_size =3D len(out_data)
> +    print(f'FIT size {comp_size:#x}/{comp_size / 1024 / 1024:.1f} MB', e=
nd=3D'')
> +    if ext_fit_size:
> +        print(f', header {ext_fit_size:#x}/{ext_fit_size / 1024:.1f} KB'=
, end=3D'')
> +    print(f', {count} files, uncompressed {size / 1024 / 1024:.1f} MB')
> +
> +
> +if __name__ =3D=3D "__main__":
> +    sys.exit(run_make_fit())
> --
> 2.43.0.rc0.421.g78406f8d94-goog
>


--=20
Best Regards
Masahiro Yamada

