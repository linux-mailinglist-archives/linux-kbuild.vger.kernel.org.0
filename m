Return-Path: <linux-kbuild+bounces-13956-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bvzmGWN5T2rVhgIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13956-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 12:35:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D0D0572FAC4
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 12:35:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=arm.com header.s=foss header.b=VXvLVzkj;
	dmarc=pass (policy=none) header.from=arm.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13956-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13956-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D5DFD316729F
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jul 2026 09:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 965DE40242B;
	Thu,  9 Jul 2026 09:57:14 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E7638C40C;
	Thu,  9 Jul 2026 09:57:12 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591034; cv=none; b=PBrKXdgnOLNg26vQmx+2gPbEH7sb/0RzpsRhXqlp2+EEpL4OrIKF4Uv1v+OZdXVF8qfQ7Xa5UX+noeouKSUX7sd3G+nFK6Pq7M8TBBMB+ydNtrTSRT39n5saX9IWR3vuuGV+SdJGk6p0x4KiOECoowLpaTYq5PIwQAq5LvbYmnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591034; c=relaxed/simple;
	bh=AZezY7IareJ5IsUYt/siTCDUpcdWNasD6UjbyctxOPI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jz0ccTCMel7Wn6Uk+ur5564M4CAjH+rC8OQyrKtY68vXWqpUZ4WwRNSTxhd3hfwanVqUB9z1m3EL8Hqno3bElGiwNdeid0C8j1dvE+7d0Jw+nG5aVemNM6Xm9lv2mMho1HwylLD0KxNhSnBLlDXrk7FCA4rlDhSKHKCV5GboZ04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=VXvLVzkj; arc=none smtp.client-ip=217.140.110.172
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0CDC2357B;
	Thu,  9 Jul 2026 02:57:08 -0700 (PDT)
Received: from [10.2.200.62] (e119884-lin.cambridge.arm.com [10.2.200.62])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9E3773FE53;
	Thu,  9 Jul 2026 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783591032; bh=AZezY7IareJ5IsUYt/siTCDUpcdWNasD6UjbyctxOPI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VXvLVzkjOPYKR62N44rSsll2/tbUQcow8n9HemYmfqmD5V3LVJbhrBjtTmFz3XX3n
	 oOGPUYIw0fosCZsyrC448uxdIraB/CUt4ydhW34JJ3owFoEO9+snJDwSVn06rvRC6d
	 jcdM0I54c2BMBXgC4+tpQMHbFe4v5vhvuykFc/wQ=
Message-ID: <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com>
Date: Thu, 9 Jul 2026 10:57:09 +0100
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nam Cao <namcao@linutronix.de>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[arm.com:s=foss];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13956-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[15];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:bigeasy@linutronix.de,m:andrealmeid@igalia.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[vincenzo.frascino@arm.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[arm.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[vincenzo.frascino@arm.com,linux-kbuild@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,arm.com:from_mime,arm.com:email,arm.com:mid,arm.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linutronix.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D0D0572FAC4



On 08/07/2026 14:56, Thomas Weißschuh wrote:
> Finding the debug version of the vDSO is not trivial as there is no common
> scheme where it is placed. That's especially problematic for CI testing.
> 
> The vDSO futex unlock mechanism requires for testing to have access to the
> inner labels of the unlock assembly, which are only accessible via the
> debug so.
> 
> Also for general debugging purposes it's convenient to have access to the
> debug vDSO at a well defined place.
> 
> The files are placed in /sys/kernel/vdso_debug.tar.xz. They use the
> regular 'make vdso_install' layout, including build-id symlinks to find
> the correct file for each process.
> 
> The design is kept close to the ones of the similar IKCONFIG and IKHEADERS.
> 
> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
> explicit dependency to avoid errors due to concurrent builds.
> 
> Suggested-by: Thomas Gleixner <tglx@kernel.org>
> Link: https://lore.kernel.org/lkml/20260602090536.045586688@kernel.org/
> Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

This is a really good idea. Thanks!

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>

> ---
>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
>  arch/x86/Makefile   |  3 +++
>  init/Kconfig        | 10 ++++++++++
>  kernel/Makefile     |  1 +
>  kernel/vdso_debug.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  5 files changed, 89 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index b9c5792c79e0..8049f10c27b2 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -298,7 +298,7 @@ no-dot-config-targets := $(clean-targets) \
>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
>  			 dt_style_selftest \
>  			 outputmakefile rustavailable rustfmt rustfmtcheck \
> -			 run-command
> +			 run-command have-vdso-debug
>  no-sync-config-targets := $(no-dot-config-targets) %install modules_sign kernelrelease \
>  			  image_name
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.rsi %.s %/
> @@ -1539,6 +1539,37 @@ vdso_install: export INSTALL_FILES = $(vdso-install-y)
>  vdso_install:
>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.vdsoinst
>  
> +# ---------------------------------------------------------------------------
> +# vDSO embedded debug symbols
> +
> +PHONY += vdso_prepare
> +
> +# Build the targets in $(vdso-install-y)
> +# Some architectures may do this already through vdso_prepare,
> +# so add a dependency to avoid race conditions
> +$(vdso-install-y): vdso_prepare prepare0 FORCE
> +	@$(MAKE) $(build)=$(patsubst %/,%,$(dir $@)) $@
> +
> +tar-opts := --mtime='1970-01-01 00:00:00' --owner=0 --group=0 --sort=name --numeric-owner --mode=u=rw,go=r,a+X
> +
> +quiet_cmd_vdso_debug_tar_xz = VDSODBG $@
> +      cmd_vdso_debug_tar_xz = \
> +		rm -rf $(tmp-target); mkdir -p $(tmp-target)/vdso/; \
> +		$(MAKE) quiet=@ MODLIB=$(tmp-target) vdso_install; \
> +		$(TAR) $(tar-opts) -a -c -f $@ -C $(tmp-target)/vdso/ .
> +
> +targets += vdso_debug.tar.xz
> +vdso_debug.tar.xz: $(vdso-install-y) FORCE
> +	$(call if_changed,vdso_debug_tar_xz)
> +
> +ifdef CONFIG_IVDSODEBUG
> +prepare: vdso_debug.tar.xz
> +endif
> +
> +PHONY += have-vdso-debug
> +have-vdso-debug:
> +	@echo $(if $(vdso-install-y)$(vdso-install-),y,n)
> +
>  # ---------------------------------------------------------------------------
>  # Tools
>  
> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
> index 598f178102ee..b762fddb620e 100644
> --- a/arch/x86/Makefile
> +++ b/arch/x86/Makefile
> @@ -316,6 +316,9 @@ vdso-install-$(CONFIG_X86_64)	   += arch/x86/entry/vdso/vdso64/vdso64.so.dbg
>  vdso-install-$(CONFIG_X86_X32_ABI) += arch/x86/entry/vdso/vdso64/vdsox32.so.dbg
>  vdso-install-$(CONFIG_COMPAT_32)   += arch/x86/entry/vdso/vdso32/vdso32.so.dbg
>  
> +# vdsox32.so.dbg is derived from vdso64.so.dbg. Avoid races with CONFIG_IVDSODEBUG
> +arch/x86/entry/vdso/vdso64/vdsox32.so.dbg: arch/x86/entry/vdso/vdso64/vdso64.so.dbg
> +
>  archprepare: checkbin
>  checkbin:
>  ifdef CONFIG_MITIGATION_RETPOLINE
> diff --git a/init/Kconfig b/init/Kconfig
> index 5230d4879b1c..f09132a44264 100644
> --- a/init/Kconfig
> +++ b/init/Kconfig
> @@ -801,6 +801,16 @@ config IKHEADERS
>  	  or similar programs.  If you build the headers as a module, a module called
>  	  kheaders.ko is built which can be loaded on-demand to get access to headers.
>  
> +config IVDSODEBUG
> +	tristate "Enable vDSO debug information through /sys/kernel/vdso_debug.tar.xz"
> +	depends on SYSFS
> +	depends on "$(shell,make have-vdso-debug)"
> +	help
> +	  This option enables access to the vDSO debug information. That can be
> +	  used to debug applications and test the vDSO implementation.
> +
> +	  If configured as M the module will be called vdso_debug.ko.
> +
>  config LOG_BUF_SHIFT
>  	int "Kernel log buffer size (16 => 64KB, 17 => 128KB)"
>  	range 12 25
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 1e1a31673577..8adcc26ef859 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -93,6 +93,7 @@ obj-$(CONFIG_USER_NS) += user_namespace.o
>  obj-$(CONFIG_PID_NS) += pid_namespace.o
>  obj-$(CONFIG_IKCONFIG) += configs.o
>  obj-$(CONFIG_IKHEADERS) += kheaders.o
> +obj-$(CONFIG_IVDSODEBUG) += vdso_debug.o
>  obj-$(CONFIG_SMP) += stop_machine.o
>  obj-$(CONFIG_AUDIT) += audit.o auditfilter.o
>  obj-$(CONFIG_AUDITSYSCALL) += auditsc.o audit_watch.o audit_fsnotify.o audit_tree.o
> diff --git a/kernel/vdso_debug.c b/kernel/vdso_debug.c
> new file mode 100644
> index 000000000000..72d4f11327fc
> --- /dev/null
> +++ b/kernel/vdso_debug.c
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/cache.h>
> +#include <linux/init.h>
> +#include <linux/kobject.h>
> +#include <linux/module.h>
> +#include <linux/sysfs.h>
> +
> +asm (
> +"	.pushsection .rodata, \"a\"	\n"
> +"	.global vdso_debug_data		\n"
> +"vdso_debug_data:			\n"
> +"	.incbin \"vdso_debug.tar.xz\"	\n"
> +"	.global vdso_debug_data_end	\n"
> +"vdso_debug_data_end:			\n"
> +"	.popsection			\n"
> +);
> +
> +extern char vdso_debug_data[];
> +extern char vdso_debug_data_end[];
> +
> +static struct bin_attribute vdso_debug_attr __ro_after_init =
> +	__BIN_ATTR_SIMPLE_RO(vdso_debug.tar.xz, 0444);
> +
> +static int __init vdso_debug_init(void)
> +{
> +	vdso_debug_attr.private = vdso_debug_data;
> +	vdso_debug_attr.size = vdso_debug_data_end - vdso_debug_data;
> +
> +	return sysfs_create_bin_file(kernel_kobj, &vdso_debug_attr);
> +}
> +
> +static void __exit vdso_debug_exit(void)
> +{
> +	sysfs_remove_bin_file(kernel_kobj, &vdso_debug_attr);
> +}
> +
> +module_init(vdso_debug_init);
> +module_exit(vdso_debug_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Thomas Weißschuh <thomas.weissschuh@linutronix.de>");
> +MODULE_DESCRIPTION("Provide vDSO debug information at runtime");
> 
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260624-vdso-sysfs-abfd14fde5a7
> 
> Best regards,
> --  
> Thomas Weißschuh <thomas.weissschuh@linutronix.de>
> 

-- 
Regards,
Vincenzo


