Return-Path: <linux-kbuild+bounces-13981-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tA5ZEVDzT2oTrAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13981-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 21:15:28 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B033734D64
	for <lists+linux-kbuild@lfdr.de>; Thu, 09 Jul 2026 21:15:27 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=zytor.com header.s=2026062701 header.b=GIaC+qnh;
	dmarc=pass (policy=none) header.from=zytor.com;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13981-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13981-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7BDA30F03EF
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jul 2026 19:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 44ED644999A;
	Thu,  9 Jul 2026 19:07:04 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58380449983;
	Thu,  9 Jul 2026 19:07:02 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783624024; cv=none; b=NI0QOYgBk/3vEcvKAA7Jfs9/wgYjRhLrwcycDCfujV95XlVRkvVZC+Bo8EE31uKlp0bunG9HRS0E9anRiiNl7YheKCvwGP9ipEgoPZYfYSRFhbT5GrVVWRgknw99H1vMWBcUWslz6cMWLv+aAn1xXaRKBV2+HYVOM9m1ANo0S5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783624024; c=relaxed/simple;
	bh=vcSF3fb2GIpv6EAsQbqFIHP7NVJbMAxmFAAFkRFdYVI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=TgYiyeyIeD9xB8LdE11jdTosmmeOE0sadWRK145Dqyp6AkC6SooZH+lCXSZbbA4FD6uneT99MUGJL7ydyh0EoNjRRv/wUkafgKWmxQqhWGUrsVqkZh11IsRSrQLx3c2a7StLNnNiY2DsDroNfwMd4WY2W+pD/iQ9awAH1WeKl68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GIaC+qnh; arc=none smtp.client-ip=198.137.202.136
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 669J6BLJ2064047
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Thu, 9 Jul 2026 12:06:12 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 669J6BLJ2064047
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026062701; t=1783623973;
	bh=pSTHsABoTv2jkhMsmmfWZ8Lk4b35cXmwQ/aUxXwoSXM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=GIaC+qnhiOL8IkuGde8nyW/+xOVAIX3QGgkxeQ28Bdj43zgNlJLuxmeiBZYb4qeGq
	 32zN8W6uYC2n729+yl9hXcNEKfcWZLSvoF1LWfoJ05/rd1mZ0y+6teftvtnw21kDhK
	 cFZb+FUCmqxHKNT0oEaro1U5f3rh4GDFsppFKc34DXyvr0eDT6ZTSzljk4ixhWvOYy
	 ehW/KVysN38xKm+/CsquL06K6mjXBESuntACyUpYszbcIqtLWjoqXoFv2D3ZmIjqAK
	 OABPsZSfNGwGO2yOgc7WOa5T/a03gAYAQb6hx33iX6+DCuEZzhXNfLTHXwREHxVVMW
	 5om4S8ZKhHBIQ==
Date: Thu, 09 Jul 2026 12:06:07 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
        =?ISO-8859-1?Q?Thomas_Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
        Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>,
        Thomas Gleixner <tglx@kernel.org>, Andy Lutomirski <luto@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nam Cao <namcao@linutronix.de>,
        Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
        =?ISO-8859-1?Q?Andr=E9_Almeida?= <andrealmeid@igalia.com>
Subject: Re: [PATCH] vDSO, kbuild: Provide vDSO debug variants at runtime
User-Agent: K-9 Mail for Android
In-Reply-To: <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com>
References: <20260708-vdso-sysfs-v1-1-fcd93385006d@linutronix.de> <947ba63d-59d5-4f4a-a037-c9de100ced97@arm.com>
Message-ID: <9131ADF7-6D08-418F-BE2F-2E99CC83FD2E@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026062701];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vincenzo.frascino@arm.com,m:thomas.weissschuh@linutronix.de,m:nathan@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:luto@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:namcao@linutronix.de,m:bigeasy@linutronix.de,m:andrealmeid@igalia.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[hpa@zytor.com,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TAGGED_FROM(0.00)[bounces-13981-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,zytor.com:from_mime,zytor.com:dkim,zytor.com:mid,arm.com:email,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9B033734D64

On July 9, 2026 2:57:09 AM PDT, Vincenzo Frascino <vincenzo=2Efrascino@arm=
=2Ecom> wrote:
>
>
>On 08/07/2026 14:56, Thomas Wei=C3=9Fschuh wrote:
>> Finding the debug version of the vDSO is not trivial as there is no com=
mon
>> scheme where it is placed=2E That's especially problematic for CI testi=
ng=2E
>>=20
>> The vDSO futex unlock mechanism requires for testing to have access to =
the
>> inner labels of the unlock assembly, which are only accessible via the
>> debug so=2E
>>=20
>> Also for general debugging purposes it's convenient to have access to t=
he
>> debug vDSO at a well defined place=2E
>>=20
>> The files are placed in /sys/kernel/vdso_debug=2Etar=2Exz=2E They use t=
he
>> regular 'make vdso_install' layout, including build-id symlinks to find
>> the correct file for each process=2E
>>=20
>> The design is kept close to the ones of the similar IKCONFIG and IKHEAD=
ERS=2E
>>=20
>> On x86 the x32 vDSO is derived from the x86_64 one, necessitating an
>> explicit dependency to avoid errors due to concurrent builds=2E
>>=20
>> Suggested-by: Thomas Gleixner <tglx@kernel=2Eorg>
>> Link: https://lore=2Ekernel=2Eorg/lkml/20260602090536=2E045586688@kerne=
l=2Eorg/
>> Signed-off-by: Thomas Wei=C3=9Fschuh <thomas=2Eweissschuh@linutronix=2E=
de>
>
>This is a really good idea=2E Thanks!
>
>Reviewed-by: Vincenzo Frascino <vincenzo=2Efrascino@arm=2Ecom>
>
>> ---
>>  Makefile            | 33 ++++++++++++++++++++++++++++++++-
>>  arch/x86/Makefile   |  3 +++
>>  init/Kconfig        | 10 ++++++++++
>>  kernel/Makefile     |  1 +
>>  kernel/vdso_debug=2Ec | 43 +++++++++++++++++++++++++++++++++++++++++++
>>  5 files changed, 89 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/Makefile b/Makefile
>> index b9c5792c79e0=2E=2E8049f10c27b2 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -298,7 +298,7 @@ no-dot-config-targets :=3D $(clean-targets) \
>>  			 %asm-generic kernelversion %src-pkg dt_binding_check \
>>  			 dt_style_selftest \
>>  			 outputmakefile rustavailable rustfmt rustfmtcheck \
>> -			 run-command
>> +			 run-command have-vdso-debug
>>  no-sync-config-targets :=3D $(no-dot-config-targets) %install modules_=
sign kernelrelease \
>>  			  image_name
>>  single-targets :=3D %=2Ea %=2Ei %=2Eko %=2Elds %=2Ell %=2Elst %=2Emod =
%=2Eo %=2Ersi %=2Es %/
>> @@ -1539,6 +1539,37 @@ vdso_install: export INSTALL_FILES =3D $(vdso-in=
stall-y)
>>  vdso_install:
>>  	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile=2Evdsoinst
>> =20
>> +# --------------------------------------------------------------------=
-------
>> +# vDSO embedded debug symbols
>> +
>> +PHONY +=3D vdso_prepare
>> +
>> +# Build the targets in $(vdso-install-y)
>> +# Some architectures may do this already through vdso_prepare,
>> +# so add a dependency to avoid race conditions
>> +$(vdso-install-y): vdso_prepare prepare0 FORCE
>> +	@$(MAKE) $(build)=3D$(patsubst %/,%,$(dir $@)) $@
>> +
>> +tar-opts :=3D --mtime=3D'1970-01-01 00:00:00' --owner=3D0 --group=3D0 =
--sort=3Dname --numeric-owner --mode=3Du=3Drw,go=3Dr,a+X
>> +
>> +quiet_cmd_vdso_debug_tar_xz =3D VDSODBG $@
>> +      cmd_vdso_debug_tar_xz =3D \
>> +		rm -rf $(tmp-target); mkdir -p $(tmp-target)/vdso/; \
>> +		$(MAKE) quiet=3D@ MODLIB=3D$(tmp-target) vdso_install; \
>> +		$(TAR) $(tar-opts) -a -c -f $@ -C $(tmp-target)/vdso/ =2E
>> +
>> +targets +=3D vdso_debug=2Etar=2Exz
>> +vdso_debug=2Etar=2Exz: $(vdso-install-y) FORCE
>> +	$(call if_changed,vdso_debug_tar_xz)
>> +
>> +ifdef CONFIG_IVDSODEBUG
>> +prepare: vdso_debug=2Etar=2Exz
>> +endif
>> +
>> +PHONY +=3D have-vdso-debug
>> +have-vdso-debug:
>> +	@echo $(if $(vdso-install-y)$(vdso-install-),y,n)
>> +
>>  # --------------------------------------------------------------------=
-------
>>  # Tools
>> =20
>> diff --git a/arch/x86/Makefile b/arch/x86/Makefile
>> index 598f178102ee=2E=2Eb762fddb620e 100644
>> --- a/arch/x86/Makefile
>> +++ b/arch/x86/Makefile
>> @@ -316,6 +316,9 @@ vdso-install-$(CONFIG_X86_64)	   +=3D arch/x86/entr=
y/vdso/vdso64/vdso64=2Eso=2Edbg
>>  vdso-install-$(CONFIG_X86_X32_ABI) +=3D arch/x86/entry/vdso/vdso64/vds=
ox32=2Eso=2Edbg
>>  vdso-install-$(CONFIG_COMPAT_32)   +=3D arch/x86/entry/vdso/vdso32/vds=
o32=2Eso=2Edbg
>> =20
>> +# vdsox32=2Eso=2Edbg is derived from vdso64=2Eso=2Edbg=2E Avoid races =
with CONFIG_IVDSODEBUG
>> +arch/x86/entry/vdso/vdso64/vdsox32=2Eso=2Edbg: arch/x86/entry/vdso/vds=
o64/vdso64=2Eso=2Edbg
>> +
>>  archprepare: checkbin
>>  checkbin:
>>  ifdef CONFIG_MITIGATION_RETPOLINE
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 5230d4879b1c=2E=2Ef09132a44264 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -801,6 +801,16 @@ config IKHEADERS
>>  	  or similar programs=2E  If you build the headers as a module, a mod=
ule called
>>  	  kheaders=2Eko is built which can be loaded on-demand to get access =
to headers=2E
>> =20
>> +config IVDSODEBUG
>> +	tristate "Enable vDSO debug information through /sys/kernel/vdso_debu=
g=2Etar=2Exz"
>> +	depends on SYSFS
>> +	depends on "$(shell,make have-vdso-debug)"
>> +	help
>> +	  This option enables access to the vDSO debug information=2E That ca=
n be
>> +	  used to debug applications and test the vDSO implementation=2E
>> +
>> +	  If configured as M the module will be called vdso_debug=2Eko=2E
>> +
>>  config LOG_BUF_SHIFT
>>  	int "Kernel log buffer size (16 =3D> 64KB, 17 =3D> 128KB)"
>>  	range 12 25
>> diff --git a/kernel/Makefile b/kernel/Makefile
>> index 1e1a31673577=2E=2E8adcc26ef859 100644
>> --- a/kernel/Makefile
>> +++ b/kernel/Makefile
>> @@ -93,6 +93,7 @@ obj-$(CONFIG_USER_NS) +=3D user_namespace=2Eo
>>  obj-$(CONFIG_PID_NS) +=3D pid_namespace=2Eo
>>  obj-$(CONFIG_IKCONFIG) +=3D configs=2Eo
>>  obj-$(CONFIG_IKHEADERS) +=3D kheaders=2Eo
>> +obj-$(CONFIG_IVDSODEBUG) +=3D vdso_debug=2Eo
>>  obj-$(CONFIG_SMP) +=3D stop_machine=2Eo
>>  obj-$(CONFIG_AUDIT) +=3D audit=2Eo auditfilter=2Eo
>>  obj-$(CONFIG_AUDITSYSCALL) +=3D auditsc=2Eo audit_watch=2Eo audit_fsno=
tify=2Eo audit_tree=2Eo
>> diff --git a/kernel/vdso_debug=2Ec b/kernel/vdso_debug=2Ec
>> new file mode 100644
>> index 000000000000=2E=2E72d4f11327fc
>> --- /dev/null
>> +++ b/kernel/vdso_debug=2Ec
>> @@ -0,0 +1,43 @@
>> +// SPDX-License-Identifier: GPL-2=2E0
>> +
>> +#include <linux/cache=2Eh>
>> +#include <linux/init=2Eh>
>> +#include <linux/kobject=2Eh>
>> +#include <linux/module=2Eh>
>> +#include <linux/sysfs=2Eh>
>> +
>> +asm (
>> +"	=2Epushsection =2Erodata, \"a\"	\n"
>> +"	=2Eglobal vdso_debug_data		\n"
>> +"vdso_debug_data:			\n"
>> +"	=2Eincbin \"vdso_debug=2Etar=2Exz\"	\n"
>> +"	=2Eglobal vdso_debug_data_end	\n"
>> +"vdso_debug_data_end:			\n"
>> +"	=2Epopsection			\n"
>> +);
>> +
>> +extern char vdso_debug_data[];
>> +extern char vdso_debug_data_end[];
>> +
>> +static struct bin_attribute vdso_debug_attr __ro_after_init =3D
>> +	__BIN_ATTR_SIMPLE_RO(vdso_debug=2Etar=2Exz, 0444);
>> +
>> +static int __init vdso_debug_init(void)
>> +{
>> +	vdso_debug_attr=2Eprivate =3D vdso_debug_data;
>> +	vdso_debug_attr=2Esize =3D vdso_debug_data_end - vdso_debug_data;
>> +
>> +	return sysfs_create_bin_file(kernel_kobj, &vdso_debug_attr);
>> +}
>> +
>> +static void __exit vdso_debug_exit(void)
>> +{
>> +	sysfs_remove_bin_file(kernel_kobj, &vdso_debug_attr);
>> +}
>> +
>> +module_init(vdso_debug_init);
>> +module_exit(vdso_debug_exit);
>> +
>> +MODULE_LICENSE("GPL");
>> +MODULE_AUTHOR("Thomas Wei=C3=9Fschuh <thomas=2Eweissschuh@linutronix=
=2Ede>");
>> +MODULE_DESCRIPTION("Provide vDSO debug information at runtime");
>>=20
>> ---
>> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
>> change-id: 20260624-vdso-sysfs-abfd14fde5a7
>>=20
>> Best regards,
>> -- =20
>> Thomas Wei=C3=9Fschuh <thomas=2Eweissschuh@linutronix=2Ede>
>>=20
>

Why stuff them into a tarball?

