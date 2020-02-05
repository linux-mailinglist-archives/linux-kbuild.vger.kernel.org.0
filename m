Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C45481534E3
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2020 17:02:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726413AbgBEQCx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 5 Feb 2020 11:02:53 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:54321 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726896AbgBEQCx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 5 Feb 2020 11:02:53 -0500
Received: by mail-pj1-f68.google.com with SMTP id dw13so1151088pjb.4
        for <linux-kbuild@vger.kernel.org>; Wed, 05 Feb 2020 08:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=+AeCGL2lj79oLdk7fxV05TUxOgARWDhVkDbxtkPjipM=;
        b=bzycflIp4oqpZR7YINJUKZGaEkL+FZw7AS3Mk3GhykOqyAOVdNEIxPNJsF7ZXtMBYt
         CAXjPDLJgLMsln3tE/SBpxndFAHqIzF7hTlYkDEUoEvuHoqxhqthUNIjLOom4ISWb1uf
         Qvi4aCeveaS0VHEzqnaNMcwaP0RqAogtOX4EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=+AeCGL2lj79oLdk7fxV05TUxOgARWDhVkDbxtkPjipM=;
        b=GvyO9doO+XL7ECsj4S0yB4UdjVlMO+FMWP+N8FQfqqefSX6VP6/1/se9teEOVvbXUq
         x/XssazBcFDTM0hw//MxWXSHS40o+AzVxLhQkjDBW06971BRqMMWkwG9TySSCfFNhbFM
         UeRKCjUTa9JifQvQON/uf0bSG7MDR3FK3hCFy40y5JVPih5gNOGOGi3JgMwa+KJ3uAzF
         3Ez8AjAIjhy4zyF6oy468MryDt+hSKOjrqMs6NHiBQTj/KZE3oi0sl05SMbrZN396Cfj
         BAVy5YwYlnkrP/fZzYiaPY54YEA8S7EGCBk6zcYb8lItKOZe0PvbcRHSW8xuQxuK/7cp
         XHIA==
X-Gm-Message-State: APjAAAVol8VzTtgvq5pYIp/OlyMCCru4ZfDr7mKdqhmVL2NBLAsNKHal
        wCk1L0gK0yvnqyg2YJJWFTVj8Q==
X-Google-Smtp-Source: APXvYqzQgVz8fC7tDSyNR6BHZZc1yory3It2uzEp9w6Bps1s0URaJnbcVIPztOGRJF3976yqOhAq7g==
X-Received: by 2002:a17:90a:9f93:: with SMTP id o19mr6416489pjp.76.1580918571981;
        Wed, 05 Feb 2020 08:02:51 -0800 (PST)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id e16sm206509pgk.77.2020.02.05.08.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2020 08:02:51 -0800 (PST)
Date:   Wed, 5 Feb 2020 11:02:50 -0500
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>, ast@kernel.org
Cc:     Olof Johansson <olof.johansson@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Tejun Heo <tj@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        David Howells <dhowells@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Revert kheaders feature
Message-ID: <20200205160250.GG142103@google.com>
References: <20200205154629.GA1257054@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200205154629.GA1257054@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 05, 2020 at 03:46:29PM +0000, Greg Kroah-Hartman wrote:
> Now that BPF does not need a copy of the kernel headers anymore in order
> to build programs, there's no real need for putting the kernel headers
> into a kernel module.  So drop the feature quick, before someone starts
> using it :)

Temporary Nack. Adding Alexei to the thread.

I believe at the time of this going in, the BPF's BTF feature was not fully
ready or able to support the usecases. Especially because BPF programs can
call or use macros in kernel headers as well.

Also, now BCC project does depend on this and so does bpftrace. Have both
of these tools migrated to use BTF and don't need CONFIG_KHEADERS to be
compiled? Sorry if I lost track.

Just last week someone was using CONFIG_KHEADERS for BPF tracing purposes at
Google and pinged me as well. There are several others. This would at least
them some amount of pain.

I'd suggest let us discuss more before ripping it out. thanks,

 - Joel



> 
> This patch reverts the following commits:
> f276031b4e2f ("kheaders: explain why include/config/autoconf.h is excluded from md5sum")
> 1463f74f492e ("kheaders: remove the last bashism to allow sh to run it")
> ea79e5168be6 ("kheaders: optimize header copy for in-tree builds")
> 0e11773e7609 ("kheaders: optimize md5sum calculation for in-tree builds")
> 9a0663571844 ("kheaders: remove unneeded 'cat' command piped to 'head' / 'tail'")
> 700dea5a0bea ("kheaders: substituting --sort in archive creation")
> 86cdd2fdc4e3 ("kheaders: make headers archive reproducible")
> 7199ff7d7400 ("kheaders: include only headers into kheaders_data.tar.xz")
> b60b7c2ea9b7 ("kheaders: remove meaningless -R option of 'ls'")
> 1457dc9ed8da ("kheaders: Do not regenerate archive if config is not changed")
> f7b101d33046 ("kheaders: Move from proc to sysfs")
> 43d8ce9d65a5 ("Provide in-kernel headers to make extending kernel easier")
> 
> Reported-by: Olof Johansson <olof.johansson@gmail.com>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Joel Fernandes <joel@joelfernandes.org>
> Cc: Tejun Heo <tj@kernel.org>
> Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Patrick Bellasi <patrick.bellasi@arm.com>
> Cc: Krzysztof Kozlowski <krzk@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-doc@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
> 
> This came up in a bpf presentation today, along with talking with Olof.
> Anyone object to ripping this out before people start to rely on it, now
> that it's stated reason isn't needed anymore?
> 
> 
>  Documentation/kbuild/reproducible-builds.rst | 13 +--
>  init/Kconfig                                 |  9 --
>  kernel/.gitignore                            |  1 -
>  kernel/Makefile                              | 10 --
>  kernel/gen_kheaders.sh                       | 97 --------------------
>  kernel/kheaders.c                            | 66 -------------
>  6 files changed, 4 insertions(+), 192 deletions(-)
>  delete mode 100755 kernel/gen_kheaders.sh
>  delete mode 100644 kernel/kheaders.c
> 
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation/kbuild/reproducible-builds.rst
> index 503393854e2e..ab92e98c89c8 100644
> --- a/Documentation/kbuild/reproducible-builds.rst
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -16,21 +16,16 @@ the kernel may be unreproducible, and how to avoid them.
>  Timestamps
>  ----------
>  
> -The kernel embeds timestamps in three places:
> +The kernel embeds a timestamp in two places:
>  
>  * The version string exposed by ``uname()`` and included in
>    ``/proc/version``
>  
>  * File timestamps in the embedded initramfs
>  
> -* If enabled via ``CONFIG_IKHEADERS``, file timestamps of kernel
> -  headers embedded in the kernel or respective module,
> -  exposed via ``/sys/kernel/kheaders.tar.xz``
> -
> -By default the timestamp is the current time and in the case of
> -``kheaders`` the various files' modification times. This must
> -be overridden using the `KBUILD_BUILD_TIMESTAMP`_ variable.
> -If you are building from a git commit, you could use its commit date.
> +By default the timestamp is the current time.  This must be overridden
> +using the `KBUILD_BUILD_TIMESTAMP`_ variable.  If you are building
> +from a git commit, you could use its commit date.
>  
>  The kernel does *not* use the ``__DATE__`` and ``__TIME__`` macros,
>  and enables warnings if they are used.  If you incorporate external
> diff --git a/init/Kconfig b/init/Kconfig
> index 24b23d843df1..da5dea21b9cb 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -599,15 +599,6 @@ config IKCONFIG_PROC
>  	  This option enables access to the kernel configuration file
>  	  through /proc/config.gz.
>  
> -config IKHEADERS
> -	tristate "Enable kernel headers through /sys/kernel/kheaders.tar.xz"
> -	depends on SYSFS
> -	help
> -	  This option enables access to the in-kernel headers that are generated during
> -	  the build process. These can be used to build eBPF tracing programs,
> -	  or similar programs.  If you build the headers as a module, a module called
> -	  kheaders.ko is built which can be loaded on-demand to get access to headers.
> -
>  config LOG_BUF_SHIFT
>  	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>  	range 12 25
> diff --git a/kernel/.gitignore b/kernel/.gitignore
> index 34d1e77ee9df..6e699100872f 100644
> --- a/kernel/.gitignore
> +++ b/kernel/.gitignore
> @@ -1,6 +1,5 @@
>  #
>  # Generated files
>  #
> -kheaders.md5
>  timeconst.h
>  hz.bc
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 4cb4130ced32..9ea0a49bd856 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -74,7 +74,6 @@ obj-$(CONFIG_UTS_NS) += utsname.o
>  obj-$(CONFIG_USER_NS) += user_namespace.o
>  obj-$(CONFIG_PID_NS) += pid_namespace.o
>  obj-$(CONFIG_IKCONFIG) += configs.o
> -obj-$(CONFIG_IKHEADERS) += kheaders.o
>  obj-$(CONFIG_SMP) += stop_machine.o
>  obj-$(CONFIG_KPROBES_SANITY_TEST) += test_kprobes.o
>  obj-$(CONFIG_AUDIT) += audit.o auditfilter.o
> @@ -127,12 +126,3 @@ $(obj)/configs.o: $(obj)/config_data.gz
>  targets += config_data.gz
>  $(obj)/config_data.gz: $(KCONFIG_CONFIG) FORCE
>  	$(call if_changed,gzip)
> -
> -$(obj)/kheaders.o: $(obj)/kheaders_data.tar.xz
> -
> -quiet_cmd_genikh = CHK     $(obj)/kheaders_data.tar.xz
> -      cmd_genikh = $(CONFIG_SHELL) $(srctree)/kernel/gen_kheaders.sh $@
> -$(obj)/kheaders_data.tar.xz: FORCE
> -	$(call cmd,genikh)
> -
> -clean-files := kheaders_data.tar.xz kheaders.md5
> diff --git a/kernel/gen_kheaders.sh b/kernel/gen_kheaders.sh
> deleted file mode 100755
> index e13ca842eb7e..000000000000
> --- a/kernel/gen_kheaders.sh
> +++ /dev/null
> @@ -1,97 +0,0 @@
> -#!/bin/sh
> -# SPDX-License-Identifier: GPL-2.0
> -
> -# This script generates an archive consisting of kernel headers
> -# for CONFIG_IKHEADERS.
> -set -e
> -sfile="$(readlink -f "$0")"
> -outdir="$(pwd)"
> -tarfile=$1
> -cpio_dir=$outdir/$tarfile.tmp
> -
> -dir_list="
> -include/
> -arch/$SRCARCH/include/
> -"
> -
> -# Support incremental builds by skipping archive generation
> -# if timestamps of files being archived are not changed.
> -
> -# This block is useful for debugging the incremental builds.
> -# Uncomment it for debugging.
> -# if [ ! -f /tmp/iter ]; then iter=1; echo 1 > /tmp/iter;
> -# else iter=$(($(cat /tmp/iter) + 1)); echo $iter > /tmp/iter; fi
> -# find $all_dirs -name "*.h" | xargs ls -l > /tmp/ls-$iter
> -
> -all_dirs=
> -if [ "$building_out_of_srctree" ]; then
> -	for d in $dir_list; do
> -		all_dirs="$all_dirs $srctree/$d"
> -	done
> -fi
> -all_dirs="$all_dirs $dir_list"
> -
> -# include/generated/compile.h is ignored because it is touched even when none
> -# of the source files changed.
> -#
> -# When Kconfig regenerates include/generated/autoconf.h, its timestamp is
> -# updated, but the contents might be still the same. When any CONFIG option is
> -# changed, Kconfig touches the corresponding timestamp file include/config/*.h.
> -# Hence, the md5sum detects the configuration change anyway. We do not need to
> -# check include/generated/autoconf.h explicitly.
> -#
> -# Ignore them for md5 calculation to avoid pointless regeneration.
> -headers_md5="$(find $all_dirs -name "*.h"			|
> -		grep -v "include/generated/compile.h"	|
> -		grep -v "include/generated/autoconf.h"	|
> -		xargs ls -l | md5sum | cut -d ' ' -f1)"
> -
> -# Any changes to this script will also cause a rebuild of the archive.
> -this_file_md5="$(ls -l $sfile | md5sum | cut -d ' ' -f1)"
> -if [ -f $tarfile ]; then tarfile_md5="$(md5sum $tarfile | cut -d ' ' -f1)"; fi
> -if [ -f kernel/kheaders.md5 ] &&
> -	[ "$(head -n 1 kernel/kheaders.md5)" = "$headers_md5" ] &&
> -	[ "$(head -n 2 kernel/kheaders.md5 | tail -n 1)" = "$this_file_md5" ] &&
> -	[ "$(tail -n 1 kernel/kheaders.md5)" = "$tarfile_md5" ]; then
> -		exit
> -fi
> -
> -if [ "${quiet}" != "silent_" ]; then
> -       echo "  GEN     $tarfile"
> -fi
> -
> -rm -rf $cpio_dir
> -mkdir $cpio_dir
> -
> -if [ "$building_out_of_srctree" ]; then
> -	(
> -		cd $srctree
> -		for f in $dir_list
> -			do find "$f" -name "*.h";
> -		done | cpio --quiet -pd $cpio_dir
> -	)
> -fi
> -
> -# The second CPIO can complain if files already exist which can happen with out
> -# of tree builds having stale headers in srctree. Just silence CPIO for now.
> -for f in $dir_list;
> -	do find "$f" -name "*.h";
> -done | cpio --quiet -pd $cpio_dir >/dev/null 2>&1
> -
> -# Remove comments except SDPX lines
> -find $cpio_dir -type f -print0 |
> -	xargs -0 -P8 -n1 perl -pi -e 'BEGIN {undef $/;}; s/\/\*((?!SPDX).)*?\*\///smg;'
> -
> -# Create archive and try to normalize metadata for reproducibility.
> -# For compatibility with older versions of tar, files are fed to tar
> -# pre-sorted, as --sort=name might not be available.
> -find $cpio_dir -printf "./%P\n" | LC_ALL=C sort | \
> -    tar "${KBUILD_BUILD_TIMESTAMP:+--mtime=$KBUILD_BUILD_TIMESTAMP}" \
> -    --owner=0 --group=0 --numeric-owner --no-recursion \
> -    -Jcf $tarfile -C $cpio_dir/ -T - > /dev/null
> -
> -echo $headers_md5 > kernel/kheaders.md5
> -echo "$this_file_md5" >> kernel/kheaders.md5
> -echo "$(md5sum $tarfile | cut -d ' ' -f1)" >> kernel/kheaders.md5
> -
> -rm -rf $cpio_dir
> diff --git a/kernel/kheaders.c b/kernel/kheaders.c
> deleted file mode 100644
> index 8f69772af77b..000000000000
> --- a/kernel/kheaders.c
> +++ /dev/null
> @@ -1,66 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0
> -/*
> - * Provide kernel headers useful to build tracing programs
> - * such as for running eBPF tracing tools.
> - *
> - * (Borrowed code from kernel/configs.c)
> - */
> -
> -#include <linux/kernel.h>
> -#include <linux/module.h>
> -#include <linux/kobject.h>
> -#include <linux/init.h>
> -
> -/*
> - * Define kernel_headers_data and kernel_headers_data_end, within which the
> - * compressed kernel headers are stored. The file is first compressed with xz.
> - */
> -
> -asm (
> -"	.pushsection .rodata, \"a\"		\n"
> -"	.global kernel_headers_data		\n"
> -"kernel_headers_data:				\n"
> -"	.incbin \"kernel/kheaders_data.tar.xz\"	\n"
> -"	.global kernel_headers_data_end		\n"
> -"kernel_headers_data_end:			\n"
> -"	.popsection				\n"
> -);
> -
> -extern char kernel_headers_data;
> -extern char kernel_headers_data_end;
> -
> -static ssize_t
> -ikheaders_read(struct file *file,  struct kobject *kobj,
> -	       struct bin_attribute *bin_attr,
> -	       char *buf, loff_t off, size_t len)
> -{
> -	memcpy(buf, &kernel_headers_data + off, len);
> -	return len;
> -}
> -
> -static struct bin_attribute kheaders_attr __ro_after_init = {
> -	.attr = {
> -		.name = "kheaders.tar.xz",
> -		.mode = 0444,
> -	},
> -	.read = &ikheaders_read,
> -};
> -
> -static int __init ikheaders_init(void)
> -{
> -	kheaders_attr.size = (&kernel_headers_data_end -
> -			      &kernel_headers_data);
> -	return sysfs_create_bin_file(kernel_kobj, &kheaders_attr);
> -}
> -
> -static void __exit ikheaders_cleanup(void)
> -{
> -	sysfs_remove_bin_file(kernel_kobj, &kheaders_attr);
> -}
> -
> -module_init(ikheaders_init);
> -module_exit(ikheaders_cleanup);
> -
> -MODULE_LICENSE("GPL v2");
> -MODULE_AUTHOR("Joel Fernandes");
> -MODULE_DESCRIPTION("Echo the kernel header artifacts used to build the kernel");
> -- 
> 2.25.0
> 
