Return-Path: <linux-kbuild+bounces-13875-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lAssNO+aO2oQaQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13875-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 10:53:03 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 344A96BCB38
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 10:53:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=D02WJZsE;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13875-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13875-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BDE6C31560C1
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 08:47:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F15F7397B17;
	Wed, 24 Jun 2026 08:47:22 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45B8399004;
	Wed, 24 Jun 2026 08:47:21 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290842; cv=none; b=D83yb23PqoJAtt7BnOJxJTpuOmld3OM5Qrl6HP5MiTvOZtbmbd4wX1/pm0fk6ODLnYBO3RxkNHqA3XhAbEnBc3UoSPxeS+wH1QAQqTP2v0DcxynAQewUIpQeeyEbZjdCS0X1fiP/OlIYenwfrlrd5thzK2/KQE9VEICJtS4lL3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290842; c=relaxed/simple;
	bh=jE3gcUhZN5QjpxvUi4aBQycrshUHzLYz8Pu/BFvb4mc=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=UMirwwO0VMcqaG2h30vz7/geFR6KrK+bdf6wnaBUsIa7BfqexiJykgPyHHACi/+OXnfUxkKyTHgx61Xp7CYxnRWzMIvnK6XnxSRIdszhqpw5I0fnSd2lCOJtW6HJ0ObhO4HpGfg5zNmT/EyVNdPjnsxF91DeUTB4pNHi0vOcN/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D02WJZsE; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B22711F00A3A;
	Wed, 24 Jun 2026 08:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782290841;
	bh=06XkZ5y3O4hhqWJxqfZyjIWWTZjCTfUMB2iMcf/ToR8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=D02WJZsEa+kSPjocd0o/QLIlV9uqWdqi7pYolOxa+PleLrxk3CM9+TRfO33s00L/9
	 fp/QGrlGY4kwceOZ33LlBpz8QvkGYDdeHBtRIHMC0UXvRHSgnv6OIeTOiE+NqePXfC
	 4bKTWrzRm9Bbv0YkvKsfc7yr06aUTcHEEzg5385LDMd6QRzjVvc65ZwZB+hE+eIoJV
	 rHgmIlNv6VZw7ZeYYs0EJp0Cvs2fwJApX2eqbQzfk/OPkAd7NRQ9vICKGYsy13fqd4
	 3Jk1XwnjwC87j9gSxbzFBDpeqdNJn5rUVieBN+Jr1wCRqaR7g+Y7SDjozY8iIGjmyk
	 kTZGNmYlkSMEg==
Date: Wed, 24 Jun 2026 17:47:17 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Breno Leitao <leitao@debian.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor
 <nathan@kernel.org>, paulmck@kernel.org, Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Thomas Gleixner
 <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
 <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 bpf@vger.kernel.org, llvm@lists.linux.dev, linux-doc@vger.kernel.org,
 kernel-team@meta.com
Subject: Re: [PATCH v6 8/8] x86/setup: prepend embedded bootconfig cmdline
 before parse_early_param
Message-Id: <20260624174717.7230a3e18e2f8f7d3698055a@kernel.org>
In-Reply-To: <20260623-bootconfig_using_tools-v6-8-640c2f587a3c@debian.org>
References: <20260623-bootconfig_using_tools-v6-0-640c2f587a3c@debian.org>
	<20260623-bootconfig_using_tools-v6-8-640c2f587a3c@debian.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MV_CASE(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13875-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:llvm@lists.linux.dev,m:linux-doc@vger.kernel.org,m:kernel-team@meta.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mhiramat@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,kernel.org,gmail.com,google.com,lwn.net,linuxfoundation.org,redhat.com,alien8.de,linux.intel.com,zytor.com,vger.kernel.org,lists.linux.dev,meta.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 344A96BCB38

On Tue, 23 Jun 2026 09:15:35 -0700
Breno Leitao <leitao@debian.org> wrote:

> Call xbc_prepend_embedded_cmdline() in setup_arch() right after the
> CONFIG_CMDLINE merge and before strscpy(command_line, ...) so the
> build-time-rendered embedded bootconfig "kernel" subtree is part of
> boot_command_line by the time parse_early_param() runs. early_param()
> handlers (mem=, earlycon=, loglevel=, ...) now see values supplied via
> CONFIG_BOOT_CONFIG_EMBED_FILE without parsing bootconfig at runtime.
> 
> Gate the prepend on the same opt-in the runtime parser uses: prepend
> when "bootconfig" is present on the command line, or when
> CONFIG_BOOT_CONFIG_FORCE is set. Detect it with parse_args(), exactly
> as setup_boot_config() does, so both agree on what counts as opt-in:
> any "bootconfig" key regardless of value (bare, =0, =1, ...), and only
> before the "--" that separates init arguments. Sharing the parser keeps
> the early and late paths from diverging -- e.g. "bootconfig=0" or a
> "-- bootconfig" meant for init must not apply the embedded keys early
> while the runtime parser skips them.
> 
> The prepend necessarily runs before setup_boot_config() detects an
> initrd bootconfig, so an initrd cannot override the embedded "kernel"
> keys for early_param(). This is intentional: the embedded cmdline acts
> like a build-time CONFIG_CMDLINE. An initrd bootconfig's "kernel" keys
> never reached early_param() anyway (they apply late via
> extra_command_line), so nothing is lost -- the initrd keys still apply
> late, with last-wins keeping the embedded values in effect.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  arch/x86/Kconfig        |  1 +
>  arch/x86/kernel/setup.c | 43 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
> index 0de23e6471973..8ab11199c16d5 100644
> --- a/arch/x86/Kconfig
> +++ b/arch/x86/Kconfig
> @@ -127,6 +127,7 @@ config X86
>  	select ARCH_SUPPORTS_NUMA_BALANCING	if X86_64
>  	select ARCH_SUPPORTS_KMAP_LOCAL_FORCE_MAP	if NR_CPUS <= 4096
>  	select ARCH_SUPPORTS_CFI		if X86_64
> +	select ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG
>  	select ARCH_USES_CFI_TRAPS		if X86_64 && CFI
>  	select ARCH_SUPPORTS_LTO_CLANG
>  	select ARCH_SUPPORTS_LTO_CLANG_THIN
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index 46882ce79c3a4..c973a2cebcd04 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -6,6 +6,7 @@
>   * parts of early kernel initialization.
>   */
>  #include <linux/acpi.h>
> +#include <linux/bootconfig.h>
>  #include <linux/console.h>
>  #include <linux/cpu.h>
>  #include <linux/crash_dump.h>
> @@ -881,6 +882,37 @@ static void __init x86_report_nx(void)
>   * Note: On x86_64, fixmaps are ready for use even before this is called.
>   */
>  
> +#ifdef CONFIG_CMDLINE_FROM_BOOTCONFIG
> +static int __init bootconfig_optin(char *param, char *val,
> +				   const char *unused, void *arg)
> +{
> +	if (!strcmp(param, "bootconfig"))
> +		*(bool *)arg = true;
> +	return 0;
> +}
> +
> +/*
> + * Did the user opt in to bootconfig on the kernel command line? Use
> + * parse_args() so this matches setup_boot_config() exactly, including
> + * stopping at the "--" that separates init arguments.
> + */
> +static bool __init bootconfig_cmdline_requested(void)
> +{
> +	static char tmp_cmdline[COMMAND_LINE_SIZE] __initdata;
> +	bool found = false;
> +
> +	if (IS_ENABLED(CONFIG_BOOT_CONFIG_FORCE))
> +		return true;
> +
> +	strscpy(tmp_cmdline, boot_command_line, COMMAND_LINE_SIZE);
> +	if (IS_ERR(parse_args("bootconfig", tmp_cmdline, NULL, 0, 0, 0,
> +			      &found, bootconfig_optin)))
> +		return false;
> +
> +	return found;
> +}

It seems that this should be placed in a common place because it will
be used from other architectures (and init/main.c too). Maybe we can
introduce something like this?

bool __init bootconfig_cmdline_requested(const char *boot_cmdline, int *end_offset);

Thanks,

> +#endif
> +
>  void __init setup_arch(char **cmdline_p)
>  {
>  #ifdef CONFIG_X86_32
> @@ -924,6 +956,17 @@ void __init setup_arch(char **cmdline_p)
>  	builtin_cmdline_added = true;
>  #endif
>  
> +#ifdef CONFIG_CMDLINE_FROM_BOOTCONFIG
> +	/*
> +	 * Prepend the build-time-rendered embedded "kernel" keys here so
> +	 * parse_early_param() below sees them, gating on the same opt-in
> +	 * as the runtime parser (see bootconfig_cmdline_requested()).
> +	 */
> +	if (bootconfig_cmdline_requested())
> +		xbc_prepend_embedded_cmdline(boot_command_line,
> +					     COMMAND_LINE_SIZE);
> +#endif
> +
>  	strscpy(command_line, boot_command_line, COMMAND_LINE_SIZE);
>  	*cmdline_p = command_line;
>  
> 
> -- 
> 2.53.0-Meta
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

