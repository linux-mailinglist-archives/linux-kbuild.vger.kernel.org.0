Return-Path: <linux-kbuild+bounces-13876-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id OihnCPuaO2oSaQgAu9opvQ
	(envelope-from <linux-kbuild+bounces-13876-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 10:53:15 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 730576BCB3F
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 10:53:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b="S/jTbya3";
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13876-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13876-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 428E63088E03
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2026 08:47:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A812039150D;
	Wed, 24 Jun 2026 08:47:42 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B2E25B092;
	Wed, 24 Jun 2026 08:47:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782290862; cv=none; b=Ts7qa0D45Jm2CyF01/1arDbd9jc51bW6JUKKOQJl9d3GRLX8ks9h7IpuWWkFwH3y/PkkijyMvv7d5A4kyVvOoAc/eRD9uAu1n2FgkhPp31tz8wADXOA0sg9dGWDrsmtTURCig52khc3dEXKUHy4BI+eOjV+LOl8q+CZSDVTBHXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782290862; c=relaxed/simple;
	bh=b116FrQSfFgK6uDYvZxPIGTwSn7qgoOY6QcZ7jz/mRQ=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aZzOllbz9Ih9LuHESLFFmJjXRt2QAWU8lgWihSX6AA7Z0on37q3/RHh3A/h0JjYtbwIVsyJJ1OlDMbldyyacjy5RIQuKJkDnrfHXVBsmJdeqh3AyIhugqpkaMrdsUUfx4SqfJwQmg4So4zIOEkQ5tL9qZUD3Lqu15tGfyWXnKVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S/jTbya3; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB841F000E9;
	Wed, 24 Jun 2026 08:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782290861;
	bh=kryu94ZiuoJZhJYlAoyQe46C2YsO062c3BH0CTq4xAk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=S/jTbya37hcllfQ/CxBn33/dgOBxA+WxIvjKnDnL5VrDy3rR4TbPCQS/s+EJC0Pd8
	 3YxRplgdwuSJqtLfUYbQGnbPI2CSumWWF+SQ2bmE9RFfqL8egDaNqH34Ipejrdx+c/
	 xgxXEx4whOK+FbZhHHIkQMsTCkPlv8Y/ER+efHSScdC2bpNybRlUmsXK4Fkd6TBfqS
	 yNYK0Rv3clLc0LnDsiJTEaCjeis1gbt5MvbFRb9ge4CzH+lBvVJMta9xNEKhBKeiM1
	 4R7vXShuMfu/KWCQqDrcUHHC+eF3hkFvvSI0rW4xKh1OxlSYAkuLpI3I/me+4mM4fa
	 w5AR4ihTcPLvg==
Date: Wed, 24 Jun 2026 17:47:37 +0900
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
Subject: Re: [PATCH v6 6/8] Documentation: bootconfig: document build-time
 cmdline rendering
Message-Id: <20260624174737.a4862dcd86f3d746b788d197@kernel.org>
In-Reply-To: <20260623-bootconfig_using_tools-v6-6-640c2f587a3c@debian.org>
References: <20260623-bootconfig_using_tools-v6-0-640c2f587a3c@debian.org>
	<20260623-bootconfig_using_tools-v6-6-640c2f587a3c@debian.org>
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
	TAGGED_FROM(0.00)[bounces-13876-lists,linux-kbuild=lfdr.de];
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
X-Rspamd-Queue-Id: 730576BCB3F

On Tue, 23 Jun 2026 09:15:33 -0700
Breno Leitao <leitao@debian.org> wrote:

> Add a section describing CONFIG_CMDLINE_FROM_BOOTCONFIG: what it
> does (renders the embedded "kernel" subtree to a flat cmdline at
> build time so early_param() handlers see the values), what it
> requires (BOOT_CONFIG_EMBED, a non-empty BOOT_CONFIG_EMBED_FILE,
> and ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG -- currently x86 only),
> the bootconfig opt-in semantics, the initrd-vs-embedded precedence,
> and the soft-error overflow behavior.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  Documentation/admin-guide/bootconfig.rst | 81 ++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/Documentation/admin-guide/bootconfig.rst b/Documentation/admin-guide/bootconfig.rst
> index f712758472d5c..349cefbb2bbcd 100644
> --- a/Documentation/admin-guide/bootconfig.rst
> +++ b/Documentation/admin-guide/bootconfig.rst
> @@ -234,6 +234,87 @@ Kconfig option selected.
>  Note that even if you set this option, you can override the embedded
>  bootconfig by another bootconfig which attached to the initrd.
>  
> +Rendering Embedded kernel.* Keys at Build Time
> +----------------------------------------------
> +
> +By default, the embedded bootconfig (``CONFIG_BOOT_CONFIG_EMBED=y``) is
> +parsed at runtime, after ``parse_early_param()`` has already run. Early
> +parameter handlers (``mem=``, ``earlycon=``, ``loglevel=``, ...) therefore
> +cannot see values supplied via the embedded ``kernel`` subtree.
> +
> +``CONFIG_CMDLINE_FROM_BOOTCONFIG`` resolves this by rendering the
> +``kernel`` subtree of ``CONFIG_BOOT_CONFIG_EMBED_FILE`` into a flat cmdline
> +string at kernel build time (via ``tools/bootconfig -C``) and prepending
> +it to ``boot_command_line`` during early architecture setup, so the keys
> +are visible to ``parse_early_param()``.
> +
> +The option requires ``CONFIG_BOOT_CONFIG_EMBED=y``, a non-empty
> +``CONFIG_BOOT_CONFIG_EMBED_FILE``, and an architecture that selects
> +``CONFIG_ARCH_SUPPORTS_CMDLINE_FROM_BOOTCONFIG``. Currently only x86
> +selects it; on other architectures the embedded bootconfig still works,
> +but only through the late runtime parser.

As commented by Sashiko, here we need to mention that this option requires
CONFIG_CMDLINE to be empty. This means user can NOT set both option
at once (This also means user doesn't have to worry about configuration
conflicts.)

Thanks,



-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

