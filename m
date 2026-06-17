Return-Path: <linux-kbuild+bounces-13795-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yq53Kc6iMmoq3AUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13795-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 15:36:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FBC869A29C
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 15:36:13 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=fritz.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13795-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13795-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D28DC3003BD7
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3BD6407CFB;
	Wed, 17 Jun 2026 13:35:24 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.119])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C8B402457;
	Wed, 17 Jun 2026 13:35:20 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703324; cv=none; b=NEzv0a9OXgapl1TCWZ/xfPYEgfATD6fjbH8vO3VbGRM9kVdLrpp81n+2D/pqUgLtYy0xGvpI3wSCTw1lOnp4s9MOSR03q72qUSAwn23wZDgvNvXvDPgpHDkJdHVu8Y4IC++dZK1JrkU+/YDCkWt7EfWifS/cY0nXmyrfBpCmxrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703324; c=relaxed/simple;
	bh=kDA6Nkp+jAYf3MEAkq8r80XXK88zd+WJ8fd58l0AE1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LrlUIVCHKbj4Na0sZKjjV1rk4QJX0EkSB5axteNRYH6SDVqVqsch2dCKK0NyiocIWWj7AjXDDzuC/AzyLqASFdpFuvtuJT1oEVqKjZ05SL+kfJrUdS59FLJH+lDJvmjOzN5+I0JMYKtqxToqDBbMGrqm7GaMtz+WpMBwFNzcPfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.119
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a32a15a-3215-7f0000032729-7f0000018c22-1
	for <multiple-recipients>; Wed, 17 Jun 2026 15:30:02 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 17 Jun 2026 15:30:02 +0200 (CEST)
Date: Wed, 17 Jun 2026 15:30:01 +0200
From: Nicolas Schier <n.schier@fritz.com>
To: Breno Leitao <leitao@debian.org>
Cc: Masami Hiramatsu <mhiramat@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>, paulmck@kernel.org,
	Nicolas Schier <nsc@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
	bpf@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 3/7] bootconfig: render embedded bootconfig as a
 kernel cmdline at build time
Message-ID: <20260617-congenial-porcupine-of-rain-bb4d8e@l-nschier-aarch64>
References: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
 <20260617-bootconfig_using_tools-v5-3-fd589a9cc5e3@debian.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-bootconfig_using_tools-v5-3-fd589a9cc5e3@debian.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1781703002-EFE5ED97-3DDEDA1F/0/0
X-purgate-type: clean
X-purgate-size: 10746
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[fritz.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13795-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	R_DKIM_NA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,vger.kernel.org:from_smtp,sashiko.dev:url,fritz.com:from_mime,fritz.com:email,l-nschier-aarch64:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9FBC869A29C

On Wed, Jun 17, 2026 at 04:23:35AM -0700, Breno Leitao wrote:
> Add the build-time pipeline that renders the "kernel" subtree of
> CONFIG_BOOT_CONFIG_EMBED_FILE into a flat cmdline string and stashes
> it in .init.rodata as embedded_kernel_cmdline[]. A follow-up patch
> adds the runtime helper that prepends this string to boot_command_line
> during early architecture setup so parse_early_param() sees the values.
> 
> The build wires up:
>   tools/bootconfig -C kernel - userspace tool already shared with
>                                lib/bootconfig.c, used here in -C mode
>                                to render a bootconfig file to a cmdline
>   lib/embedded-cmdline.S     - .incbin's the rendered text plus a NUL
>                                (listed under the EXTRA BOOT CONFIG
>                                MAINTAINERS entry)
>   lib/Makefile rule          - runs tools/bootconfig at build time
>   Makefile prepare dep       - ensures tools/bootconfig is built first,
>                                same pattern as tools/objtool and
>                                tools/bpf/resolve_btfids
[...]
> 
> Drop the test target from tools/bootconfig/Makefile's default 'all'
> recipe so that hooking the binary into the kernel build does not run
> test-bootconfig.sh on every prepare. The tests stay available as
> 'make -C tools/bootconfig test', matching the convention of
> tools/objtool and tools/bpf/resolve_btfids whose 'all' targets only
> build the binary.
> 
> Require BOOT_CONFIG_EMBED_FILE to be non-empty before the new option
> can be enabled, otherwise tools/bootconfig -C runs against an empty
> file and prints a parse error on every kernel build.
> 
> The feature gates on CONFIG_ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG, a
> silent symbol arches select once they've wired the prepend call into
> setup_arch(). No arch selects it in this patch, so the user-visible
> CONFIG_BOOT_CONFIG_EMBED_CMDLINE is not yet enableable; when an arch
> later opts in, the runtime behavior is added by the follow-up patches.
> 
> tools/bootconfig also installs on target systems, so its own Makefile
> keeps $(CC) and stays cross-buildable as a standalone tool. The kernel
> build, which runs the tool on the build host during prepare, instead
> forces CC=$(HOSTCC) from a dedicated tools/bootconfig rule and clears
> CROSS_COMPILE= in the sub-make. Without that clear, an LLVM=1 cross
> build would inherit CROSS_COMPILE and tools/scripts/Makefile.include
> would inject --target=/--sysroot= flags into the host clang invocation,
> producing a target binary that fails to exec ("Exec format error").
> 
> embedded-cmdline.S places the rendered string in its own .init.rodata
> subsection (.init.rodata.embed_cmdline) with the "a" (allocatable,
> read-only) flag and %progbits. lib/bootconfig-data.S already places
> the embedded bootconfig blob in .init.rodata with the "aw" flag
> (xbc_init() rewrites separators in place, so that data must be
> writable). Using a distinct subsection name avoids the ld.lld section-
> type mismatch that would otherwise arise from mixing "a" and "aw"
> under the same name; the linker's "*(.init.rodata .init.rodata.*)"
> glob still folds both into the init image and frees them after boot.
> 
> A follow-up patch wires the build-time tools/bootconfig into the
> top-level clean target.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  MAINTAINERS               |  1 +
>  Makefile                  | 15 +++++++++++++++
>  init/Kconfig              | 35 +++++++++++++++++++++++++++++++++++
>  lib/Makefile              | 16 ++++++++++++++++
>  lib/embedded-cmdline.S    | 16 ++++++++++++++++
>  tools/bootconfig/Makefile |  2 +-
>  6 files changed, 84 insertions(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 57656ec0e9d5d..953231df1911d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9844,6 +9844,7 @@ F:	fs/proc/bootconfig.c
>  F:	include/linux/bootconfig.h
>  F:	lib/bootconfig-data.S
>  F:	lib/bootconfig.c
> +F:	lib/embedded-cmdline.S
>  F:	tools/bootconfig/*
>  F:	tools/bootconfig/scripts/*
>  
> diff --git a/Makefile b/Makefile
> index bf196c6df5b92..a7abb3f9a6264 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1545,6 +1545,21 @@ prepare: tools/bpf/resolve_btfids
>  endif
>  endif
>  
> +# tools/bootconfig renders the embedded bootconfig into a cmdline at build time.
> +ifdef CONFIG_BOOT_CONFIG_EMBED_CMDLINE
> +prepare: tools/bootconfig
> +endif
> +
> +# tools/bootconfig is run on the build host during prepare, so force a host
> +# binary here; its own Makefile keeps $(CC) for standalone and cross builds.
> +# CROSS_COMPILE= is cleared so tools/scripts/Makefile.include does not inject
> +# the target's --target=/--sysroot= flags into the host clang invocation under
> +# LLVM=1 cross builds (which would produce a target binary that fails to exec).
> +tools/bootconfig: FORCE
> +	$(Q)mkdir -p $(objtree)/tools
> +	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ \
> +		bootconfig CC=$(HOSTCC) CROSS_COMPILE=

sashiko whines (priority: low) about the 'CC=$(HOSTCC)' as HOSTCC might 
contains spaces (e.g. "ccache gcc") [1].  Instead of adding quotes (as 
sashiko suggests), the CC could be redefined locally for the target, for 
example:


tools/bootconfig: export CC := $(HOSTCC)
tools/bootconfig: FORCE
	$(Q)mkdir -p $(objtree)/tools
	$(Q)$(MAKE) O=$(abspath $(objtree)) subdir=tools -C $(srctree)/tools/ \
		bootconfig CROSS_COMPILE=


That way, make handles the variable definition as it should and there is 
no interference with shell escaping.

for Kbuild:

Reviewed-by: Nicolas Schier <n.schier@fritz.com>


Kind regards,
Nicolas


[1]: http://sashiko.dev/#/message/20260617113701.0405E1F000E9%40smtp.kernel.org


> +
>  # The tools build system is not a part of Kbuild and tends to introduce
>  # its own unique issues. If you need to integrate a new tool into Kbuild,
>  # please consider locating that tool outside the tools/ tree and using the
> diff --git a/init/Kconfig b/init/Kconfig
> index 5230d4879b1c8..d2b8613a6b927 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -1566,6 +1566,41 @@ config BOOT_CONFIG_EMBED_FILE
>  	  This bootconfig will be used if there is no initrd or no other
>  	  bootconfig in the initrd.
>  
> +config ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
> +	bool
> +	help
> +	  Silent symbol; no C code reads it directly. Architectures
> +	  select it once their setup_arch() calls
> +	  xbc_prepend_embedded_cmdline() before parse_early_param().
> +	  Its only role is to gate the user-visible
> +	  BOOT_CONFIG_EMBED_CMDLINE option per-arch, the same
> +	  ARCH_SUPPORTS_* idiom used by ARCH_SUPPORTS_CFI, etc.
> +
> +config BOOT_CONFIG_EMBED_CMDLINE
> +	bool "Render embedded bootconfig as kernel cmdline at build time"
> +	depends on BOOT_CONFIG_EMBED_FILE != ""
> +	depends on ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
> +	default n
> +	help
> +	  Render the "kernel" subtree of the embedded bootconfig file into a
> +	  flat cmdline string at kernel build time and prepend it to
> +	  boot_command_line during early architecture setup. This makes
> +	  early_param() handlers (e.g. mem=, earlycon=, loglevel=) see the
> +	  values supplied via the embedded bootconfig.
> +
> +	  The runtime bootconfig parser is unaffected, so tree-structured
> +	  consumers such as ftrace boot-time tracing keep working.
> +
> +	  Note: when an initrd also carries a bootconfig, its "kernel"
> +	  subtree is still parsed at runtime, but the embedded "kernel"
> +	  keys remain in boot_command_line for parse_early_param() and
> +	  end up later than the initrd keys in saved_command_line, so
> +	  parse_args() last-wins favors the embedded values. If you need
> +	  initrd to override embedded kernel.* keys, leave this option
> +	  off.
> +
> +	  If unsure, say N.
> +
>  config CMDLINE_LOG_WRAP_IDEAL_LEN
>  	int "Length to try to wrap the cmdline when logged at boot"
>  	default 1021
> diff --git a/lib/Makefile b/lib/Makefile
> index 7f75cc6edf94a..4ace86a5cb6de 100644
> --- a/lib/Makefile
> +++ b/lib/Makefile
> @@ -273,6 +273,22 @@ filechk_defbconf = cat $(or $(real-prereqs), /dev/null)
>  $(obj)/default.bconf: $(CONFIG_BOOT_CONFIG_EMBED_FILE) FORCE
>  	$(call filechk,defbconf)
>  
> +obj-$(CONFIG_BOOT_CONFIG_EMBED_CMDLINE) += embedded-cmdline.o
> +$(obj)/embedded-cmdline.o: $(obj)/embedded_cmdline.bin
> +
> +# Render the bootconfig "kernel" subtree to a flat cmdline string using
> +# the userspace tools/bootconfig parser (-C mode). The runtime prepend
> +# helper enforces COMMAND_LINE_SIZE at boot, so no build-time size
> +# check is performed here (COMMAND_LINE_SIZE is an arch header
> +# constant, not a Kconfig value).
> +quiet_cmd_render_cmdline = BCONF2C $@
> +      cmd_render_cmdline = \
> +	$(objtree)/tools/bootconfig/bootconfig -C $< > $@
> +
> +targets += embedded_cmdline.bin
> +$(obj)/embedded_cmdline.bin: $(obj)/default.bconf $(objtree)/tools/bootconfig/bootconfig FORCE
> +	$(call if_changed,render_cmdline)
> +
>  obj-$(CONFIG_RBTREE_TEST) += rbtree_test.o
>  obj-$(CONFIG_INTERVAL_TREE_TEST) += interval_tree_test.o
>  
> diff --git a/lib/embedded-cmdline.S b/lib/embedded-cmdline.S
> new file mode 100644
> index 0000000000000..bda81b4a42bea
> --- /dev/null
> +++ b/lib/embedded-cmdline.S
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Embed the build-time-rendered bootconfig "kernel" subtree as a flat
> + * cmdline string. setup_arch() prepends this to boot_command_line on
> + * architectures that select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG.
> + *
> + * Copyright (c) 2026 Meta Platforms, Inc. and affiliates
> + * Copyright (c) 2026 Breno Leitao <leitao@debian.org>
> + */
> +	.section .init.rodata.embed_cmdline, "a", %progbits
> +	.global embedded_kernel_cmdline
> +embedded_kernel_cmdline:
> +	.incbin "lib/embedded_cmdline.bin"
> +	.byte 0
> +	.global embedded_kernel_cmdline_end
> +embedded_kernel_cmdline_end:
> diff --git a/tools/bootconfig/Makefile b/tools/bootconfig/Makefile
> index 90eb47c9d8de6..4e82fd9553cde 100644
> --- a/tools/bootconfig/Makefile
> +++ b/tools/bootconfig/Makefile
> @@ -15,7 +15,7 @@ override CFLAGS += -Wall -g -I$(CURDIR)/include
>  ALL_TARGETS := bootconfig
>  ALL_PROGRAMS := $(patsubst %,$(OUTPUT)%,$(ALL_TARGETS))
>  
> -all: $(ALL_PROGRAMS) test
> +all: $(ALL_PROGRAMS)
>  
>  $(OUTPUT)bootconfig: main.c include/linux/bootconfig.h $(LIBSRC)
>  	$(CC) $(filter %.c,$^) $(CFLAGS) $(LDFLAGS) -o $@
> 
> -- 
> 2.53.0-Meta
> 

