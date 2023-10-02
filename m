Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 54C297B5523
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Oct 2023 16:32:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237545AbjJBO1P (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Oct 2023 10:27:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237476AbjJBO1O (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2023 10:27:14 -0400
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B8B9FA4;
        Mon,  2 Oct 2023 07:27:10 -0700 (PDT)
Received: from pwmachine.localnet (unknown [82.77.158.143])
        by linux.microsoft.com (Postfix) with ESMTPSA id 7C12320B74C0;
        Mon,  2 Oct 2023 07:27:05 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 7C12320B74C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
        s=default; t=1696256830;
        bh=JayfwhboHD36N96J3BeAYMnt30Su//D+hNTj7agdD9E=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=hUidZqeeyLb/F2K7ymnT7t3/wW3g8zYsm4FTyep/Ol+jkSCNGFhjYaTDTcAo+g8S9
         pugGGBoNfu7bhlnAcq0L/E4DTIg8Q0WiFosqp+xm8nvzCLWhwA9ugakYMlKlFFnrBT
         j+SI/BdlrAzLHG8eOnt0ZgW8E5INEJNvV+xnR2w0=
From:   Francis Laniel <flaniel@linux.microsoft.com>
To:     "Alessandro Carminati (Red Hat)" <alessandro.carminati@gmail.com>
Cc:     Masami Hiramatsu <mhiramat@kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Josh Poimboeuf <jpoimboe@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Alexander Lobakin <aleksander.lobakin@intel.com>,
        Nick Alcock <nick.alcock@oracle.com>,
        Kris Van Hees <kris.van.hees@oracle.com>,
        Eugene Loh <eugene.loh@oracle.com>,
        Viktor Malik <vmalik@redhat.com>,
        Petr Mladek <pmladek@suse.com>,
        Alessandro Carminati <alessandro.carminati@gmail.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH v5] scripts/link-vmlinux.sh: Add alias to duplicate symbols for kallsyms
Date:   Mon, 02 Oct 2023 17:27:02 +0300
Message-ID: <2903437.e9J7NaK4W3@pwmachine>
In-Reply-To: <20230927173516.1456594-1-alessandro.carminati@gmail.com>
References: <20230927173516.1456594-1-alessandro.carminati@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Spam-Status: No, score=-17.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_PASS,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi.

Le mercredi 27 septembre 2023, 20:35:16 EEST Alessandro Carminati (Red Hat)=
 a=20
=E9crit :
> It is not uncommon for drivers or modules related to similar peripherals
> to have symbols with the exact same name.
> While this is not a problem for the kernel's binary itself, it becomes an
> issue when attempting to trace or probe specific functions using
> infrastructure like ftrace or kprobe.
>=20
> The tracing subsystem relies on the `nm -n vmlinux` output, which provides
> symbol information from the kernel's ELF binary. However, when multiple
> symbols share the same name, the standard nm output does not differentiate
> between them. This can lead to confusion and difficulty when trying to
> probe the intended symbol.
>=20
>  ~ # cat /proc/kallsyms | grep " name_show"
>  ffffffff8c4f76d0 t name_show
>  ffffffff8c9cccb0 t name_show
>  ffffffff8cb0ac20 t name_show
>  ffffffff8cc728c0 t name_show
>  ffffffff8ce0efd0 t name_show
>  ffffffff8ce126c0 t name_show
>  ffffffff8ce1dd20 t name_show
>  ffffffff8ce24e70 t name_show
>  ffffffff8d1104c0 t name_show
>  ffffffff8d1fe480 t name_show
>=20
> kas_alias addresses this challenge by enhancing symbol names with
> meaningful suffixes generated from the source file and line number
> during the kernel build process.
> These newly generated aliases provide tracers with the ability to
> comprehend the symbols they are interacting with when utilizing the
> ftracefs interface.
> This approach may also allow for the probing by name of previously
> inaccessible symbols.
>=20
>  ~ # cat /proc/kallsyms | grep gic_mask_irq
>  ffffd15671e505ac t gic_mask_irq
>  ffffd15671e505ac t gic_mask_irq@drivers_irqchip_irq_gic_c_167
>  ffffd15671e532a4 t gic_mask_irq
>  ffffd15671e532a4 t gic_mask_irq@drivers_irqchip_irq_gic_v3_c_407
>  ~ #
>=20
> Changes from v1:
> - Integrated changes requested by Masami to exclude symbols with prefixes
>   "_cfi" and "_pfx".
> - Introduced a small framework to handle patterns that need to be excluded
>   from the alias production.
> - Excluded other symbols using the framework.
> - Introduced the ability to discriminate between text and data symbols.
> - Added two new config symbols in this version: CONFIG_KALLSYMS_ALIAS_DAT=
A,
>   which allows data for data, and CONFIG_KALLSYMS_ALIAS_DATA_ALL, which
>   excludes all filters and provides an alias for each duplicated symbol.
>=20
> https://lore.kernel.org/all/20230711151925.1092080-1-alessandro.carminati=
@gm
> ail.com/
>=20
> Changes from v2:
> - Alias tags are created by querying DWARF information from the vmlinux.
> - The filename + line number is normalized and appended to the original
>   name.
> - The tag begins with '@' to indicate the symbol source.
> - Not a change, but worth mentioning, since the alias is added to the
>   existing list, the old duplicated name is preserved, and the livepatch
>   way of dealing with duplicates is maintained.
> - Acknowledging the existence of scenarios where inlined functions
>   declared in header files may result in multiple copies due to compiler
>   behavior, though it is not actionable as it does not pose an operational
>   issue.
> - Highlighting a single exception where the same name refers to different
>   functions: the case of "compat_binfmt_elf.c," which directly includes
>   "binfmt_elf.c" producing identical function copies in two separate
>   modules.
>=20
> https://lore.kernel.org/all/20230714150326.1152359-1-alessandro.carminati=
@gm
> ail.com/
>=20
> Changes from v3:
> - kas_alias was rewritten in Python to create a more concise and
>   maintainable codebase.
> - The previous automation process used by kas_alias to locate the vmlinux
>   and the addr2line has been replaced with an explicit command-line switch
>   for specifying these requirements.
> - addr2line has been added into the main Makefile.
> - A new command-line switch has been introduced, enabling users to extend
>   the alias to global data names.
>=20
> https://lore.kernel.org/all/20230828080423.3539686-1-alessandro.carminati=
@gm
> ail.com/
>=20
> Changes from v4:
> - Fixed the O=3D<build dir> build issue
> - The tool halts execution upon encountering major issues, thereby ensuri=
ng
>   the pipeline is interrupted.
> - A cmdline option to specify the source directory added.
> - Minor code adjusments.
> - Tested on mips32 and i386

Thank you for sending this new version!
I only found nits and I think we are near its merge!

> https://lore.kernel.org/all/20230919193948.465340-1-alessandro.carminati@=
gma
> il.com/
>=20
> NOTE:
> About the symbols name duplication that happens as consequence of the
> inclusion compat_binfmt_elf.c does, it is evident that this corner is
> inherently challenging the addr2line approach.
> Attempting to conceal this limitation would be counterproductive.
>=20
> compat_binfmt_elf.c includes directly binfmt_elf.c, addr2line can't help
> but report all functions and data declared by that file, coming from
> binfmt_elf.c.
>=20
> My position is that, rather than producing a more complicated pipeline
> to handle this corner case, it is better to fix the compat_binfmt_elf.c
> anomaly.
>=20
> This patch does not deal with the two potentially problematic symbols
> defined by compat_binfmt_elf.c
>=20
> Signed-off-by: Alessandro Carminati (Red Hat)
> <alessandro.carminati@gmail.com> ---
>  Makefile                |   4 +-
>  init/Kconfig            |  22 +++++++
>  scripts/kas_alias.py    | 136 ++++++++++++++++++++++++++++++++++++++++
>  scripts/link-vmlinux.sh |  21 ++++++-
>  4 files changed, 180 insertions(+), 3 deletions(-)
>  create mode 100755 scripts/kas_alias.py
>=20
> diff --git a/Makefile b/Makefile
> index 4f283d915e54..f33c179f4cc3 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -488,6 +488,7 @@ OBJCOPY		=3D $(LLVM_PREFIX)llvm-objcopy$
(LLVM_SUFFIX)
>  OBJDUMP		=3D $(LLVM_PREFIX)llvm-objdump$(LLVM_SUFFIX)
>  READELF		=3D $(LLVM_PREFIX)llvm-readelf$(LLVM_SUFFIX)
>  STRIP		=3D $(LLVM_PREFIX)llvm-strip$(LLVM_SUFFIX)
> +ADDR2LINE	=3D $(LLVM_PREFIX)llvm-addr2line$(LLVM_SUFFIX)
>  else
>  CC		=3D $(CROSS_COMPILE)gcc
>  LD		=3D $(CROSS_COMPILE)ld
> @@ -497,6 +498,7 @@ OBJCOPY		=3D $(CROSS_COMPILE)objcopy
>  OBJDUMP		=3D $(CROSS_COMPILE)objdump
>  READELF		=3D $(CROSS_COMPILE)readelf
>  STRIP		=3D $(CROSS_COMPILE)strip
> +ADDR2LINE	=3D $(CROSS_COMPILE)addr2line
>  endif
>  RUSTC		=3D rustc
>  RUSTDOC		=3D rustdoc
> @@ -611,7 +613,7 @@ export RUSTC_BOOTSTRAP :=3D 1
>  export ARCH SRCARCH CONFIG_SHELL BASH HOSTCC KBUILD_HOSTCFLAGS
> CROSS_COMPILE LD CC HOSTPKG_CONFIG export RUSTC RUSTDOC RUSTFMT
> RUSTC_OR_CLIPPY_QUIET RUSTC_OR_CLIPPY BINDGEN CARGO export HOSTRUSTC
> KBUILD_HOSTRUSTFLAGS
> -export CPP AR NM STRIP OBJCOPY OBJDUMP READELF PAHOLE RESOLVE_BTFIDS LEX
> YACC AWK INSTALLKERNEL +export CPP AR NM STRIP OBJCOPY OBJDUMP READELF
> ADDR2LINE PAHOLE RESOLVE_BTFIDS LEX YACC AWK INSTALLKERNEL export PERL
> PYTHON3 CHECK CHECKFLAGS MAKE UTS_MACHINE HOSTCXX
>  export KGZIP KBZIP2 KLZOP LZMA LZ4 XZ ZSTD
>  export KBUILD_HOSTCXXFLAGS KBUILD_HOSTLDFLAGS KBUILD_HOSTLDLIBS
> LDFLAGS_MODULE diff --git a/init/Kconfig b/init/Kconfig
> index 6d35728b94b2..d45dd423e1ec 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1738,6 +1738,28 @@ config KALLSYMS_BASE_RELATIVE
>  	  time constants, and no relocation pass is required at runtime to fix
>  	  up the entries based on the runtime load address of the kernel.
>=20
> +config KALLSYMS_ALIAS_SRCLINE
> +	bool "Produces alias for duplicated text symbols" if EXPERT
> +	depends on KALLSYMS && DEBUG_INFO && !DEBUG_INFO_SPLIT
> +	help
> +	  It is not uncommon for drivers or modules related to similar
> +	  peripherals to have symbols with the exact same name.
> +	  While this is not a problem for the kernel's binary itself, it
> +	  becomes an issue when attempting to trace or probe specific
> +	  functions using infrastructure like ftrace or kprobe.
> +
> +	  This option addresses this challenge, producing alias for text
> +	  symbol names that include the file name and line where the symbols
> +	  are defined in the source code.
> +
> +config KALLSYMS_ALIAS_SRCLINE_DATA
> +	bool "Produces alias also for global variables names"
> +	depends on KALLSYMS_ALIAS_SRCLINE
> +	help
> +	  Sometimes it can be useful to refer to global vars by name. Since
> +	  they suffer the same issue as text symbols, this config option
> +	  allows having aliases for global variables names too.
> +
>  # end of the "standard kernel features (expert users)" menu
>=20
>  # syscall, maps, verifier
> diff --git a/scripts/kas_alias.py b/scripts/kas_alias.py
> new file mode 100755
> index 000000000000..7c6b7045081c
> --- /dev/null
> +++ b/scripts/kas_alias.py
> @@ -0,0 +1,136 @@
> +#!/usr/bin/env python3
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Copyright (C) 2023 Red Hat, Inc. Alessandro Carminati
> <alessandro.carminati@gmail.com> +#
> +# kas_alias: Adds alias to duplicate symbols in the kallsyms output.
> +
> +import subprocess
> +import sys
> +import os
> +import argparse
> +import re
> +from collections import namedtuple
> +
> +regex_filter =3D [
> +        "^__compound_literal\\.[0-9]+$",
> +        "^__[wm]*key\\.[0-9]+$",
> +        "^_*TRACE_SYSTEM.*$",
> +        "^__already_done\\.[0-9]+$",
> +        "^__msg\\.[0-9]+$",
> +        "^__func__\\.[0-9]+$",
> +        "^CSWTCH\\.[0-9]+$",
> +        "^_rs\\.[0-9]+$",
> +        "^___tp_str\\.[0-9]+$",
> +        "^__flags\\.[0-9]+$",
> +        "^___done\\.[0-9]+$",
> +        "^__print_once\\.[0-9]+$",
> +        "^___once_key\\.[0-9]+$",
> +        "^__pfx_.*$",
> +        "^__cfi_.*$"
> +        ]
> +
> +class SeparatorType:
> +    def __call__(self, separator):
> +        if len(separator) !=3D 1:
> +            raise argparse.ArgumentTypeError("Separator must be a single
> character") +        return separator
> +
> +Line =3D namedtuple('Line', ['address', 'type', 'name'])
> +
> +def parse_file(filename):
> +    symbol_list =3D []
> +    name_occurrences =3D {}
> +
> +    with open(filename, 'r') as file:
> +        for line in file:
> +            fields =3D line.strip().split()
> +
> +            if len(fields) >=3D 3:
> +                address, type, name =3D fields[0], fields[1], '
> '.join(fields[2:]) +                symbol_list.append(Line(address, type,
> name))
> +                name_occurrences[name] =3D name_occurrences.get(name, 0)=
 + 1
> +
> +    return symbol_list, name_occurrences
> +
> +def find_duplicate(symbol_list, name_occurrences):

This function is never used.

> +    name_to_lines =3D {}
> +    duplicate_lines =3D []
> +
> +    for line in symbol_list:
> +        if line.name in name_to_lines:
> +            first_occurrence =3D name_to_lines[line.name]
> +            duplicate_lines.extend([first_occurrence, line])
> +        else:
> +            name_to_lines[line.name] =3D line
> +
> +    return duplicate_lines
> +
> +def start_addr2line_process(binary_file, addr2line_file):
> +    try:
> +        addr2line_process =3D subprocess.Popen([addr2line_file, '-fe',
> binary_file], +                                           =20
> stdin=3Dsubprocess.PIPE, +                                           =20
> stdout=3Dsubprocess.PIPE, +                                           =20
> stderr=3Dsubprocess.PIPE, +                                           =20
> text=3DTrue)
> +        return addr2line_process
> +    except Exception as e:
> +        print(f"Error starting addr2line process: {str(e)}")
> +        sys.exit(1)

As you already have a try/except block code in your main function, I think =
it=20
is better to handle all exception here rather than inside each function.

> +
> +def addr2line_fetch_address(addr2line_process, address):
> +    try:
> +        addr2line_process.stdin.write(address + '\n')
> +        addr2line_process.stdin.flush()
> +        addr2line_process.stdout.readline().strip()
> +        output =3D addr2line_process.stdout.readline().strip()
> +
> +        return os.path.normpath(output)
> +    except Exception as e:
> +        print(f"Error communicating with addr2line: {str(e)}")
> +        sys.exit(1)

Same comment as above.

> +def process_line(obj, config):
> +    if config:
> +        return not (any(re.match(regex, obj.name) for regex in
> regex_filter)) +    else:
> +        return obj.type in {"T", "t"}
> +
> +if __name__ =3D=3D "__main__":
> +    parser =3D argparse.ArgumentParser(description=3D'Add alias to multi=
ple
> occurring symbols name in kallsyms') +    parser.add_argument('-a',
> "--addr2line", dest=3D"addr2line_file", required=3DTrue) +  =20
> parser.add_argument('-v', "--vmlinux", dest=3D"vmlinux_file", required=3D=
True)
> +    parser.add_argument('-o', "--outfile", dest=3D"output_file",
> required=3DTrue) +    parser.add_argument('-n', "--nmdata",
> dest=3D"nm_data_file", required=3DTrue) +    parser.add_argument('-b',
> "--basedir", dest=3D"linux_base_dir", required=3DTrue) +  =20
> parser.add_argument('-s', "--separator", dest=3D"separator", required=3DF=
alse,
> default=3D"@", type=3DSeparatorType()) +    parser.add_argument('-d', "--=
data",
> dest=3D"include_data", required=3DFalse, action=3D'store_true') +    conf=
ig =3D
> parser.parse_args()
> +
> +    try:
> +        config.linux_base_dir =3D os.path.normpath(os.getcwd() + "/" +
> config.linux_base_dir) + "/" +        symbol_list, name_occurrences =3D
> parse_file(config.nm_data_file) +        addr2line_process =3D
> start_addr2line_process(config.vmlinux_file, config.addr2line_file) +
> +        with open(config.output_file, 'w') as file:
> +            for obj in symbol_list:
> +                file.write(f"{obj.address} {obj.type} {obj.name}\n")
> +                if (name_occurrences[obj.name] > 1) and process_line(obj,
> config.include_data) : +                    output =3D
> addr2line_fetch_address(addr2line_process, obj.address) +                =
 =20
>  decoration =3D config.separator + "".join(
> +                        "_" if not c.isalnum() else c for c in
> output.replace(config.linux_base_dir, "") +                    )
> +                    # The addr2line can emit the special string "?:??" w=
hen
> addr2line can not find the +                    # specified address in the
> DWARF section that after normalization it becomes "____". +              =
 =20
>    # In such cases, emitting an alias wouldn't make sense, so it is
> skipped.=20

Thank you for the comment!

> +                    if decoration !=3D config.separator + "____":
> +                        file.write(f"{obj.address} {obj.type} {obj.name +
> decoration}\n") +
> +        addr2line_process.stdin.close()
> +        addr2line_process.stdout.close()
> +        addr2line_process.stderr.close()
> +        addr2line_process.wait()
> +
> +    except Exception as e:
> +        print(f"An error occurred: {str(e)}")
> +        raise SystemExit("Script terminated due to an error")
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index a432b171be82..c110b0f58a19 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -91,7 +91,12 @@ vmlinux_link()
>=20
>  	# The kallsyms linking does not need debug symbols included.
>  	if [ "$output" !=3D "${output#.tmp_vmlinux.kallsyms}" ] ; then
> -		ldflags=3D"${ldflags} ${wl}--strip-debug"
> +		# The kallsyms linking does not need debug symbols included,
> +		# unless the KALLSYMS_ALIAS_SRCLINE.
> +		if ! is_enabled CONFIG_KALLSYMS_ALIAS_SRCLINE && \
> +		   [ "$output" !=3D "${output#.tmp_vmlinux.kallsyms}" ] ; then
> +			ldflags=3D"${ldflags} ${wl}--strip-debug"
> +		fi
>  	fi
>=20
>  	if is_enabled CONFIG_VMLINUX_MAP; then
> @@ -161,7 +166,19 @@ kallsyms()
>  	fi
>=20
>  	info KSYMS ${2}
> -	scripts/kallsyms ${kallsymopt} ${1} > ${2}
> +	ALIAS=3D""
> +	KAS_DATA=3D""
> +	if is_enabled CONFIG_KALLSYMS_ALIAS_SRCLINE_DATA; then
> +		KAS_DATA=3D"--data"
> +	fi
> +	if is_enabled CONFIG_KALLSYMS_ALIAS_SRCLINE; then
> +		ALIAS=3D".alias"
> +		${srctree}/scripts/kas_alias.py \
> +			--addr2line ${ADDR2LINE} --vmlinux ${kallsyms_vmlinux} \
> +			--nmdata ${1} --outfile ${1}${ALIAS} \
> +			--basedir ${srctree} --separator @ ${KAS_DATA}
> +	fi
> +	scripts/kallsyms ${kallsymopt} ${1}${ALIAS} > ${2}
>  }
>=20
>  # Perform one step in kallsyms generation, including temporary linking of

Best regards.


