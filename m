Return-Path: <linux-kbuild+bounces-13796-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Oat5Lf+kMmqH3AUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13796-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 15:45:35 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id ACEDF69A3AC
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 15:45:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=none;
	dmarc=fail reason="SPF not aligned (relaxed), No valid DKIM" header.from=fritz.com (policy=quarantine);
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13796-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13796-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 9535A300F616
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jun 2026 13:45:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA61B3FD15E;
	Wed, 17 Jun 2026 13:45:28 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail.avm.de (mail.avm.de [212.42.244.120])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0D33F0AB1;
	Wed, 17 Jun 2026 13:45:23 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703928; cv=none; b=nbTIxbm6ddIDRyn1oltAwD+l9uO8Z6T04F1IwsjB4k6+du8ujysnw+Rgi7y2CPJjftSCij5SGmOrAjzDrwr3Xx24H03qc9E9utrSyYVVLGZ93zzRU01DVcKbarLLU0pYaUKN9bkSkfxviKfxxiJbs+oA4320/xL7eM7Tqml0hjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703928; c=relaxed/simple;
	bh=gVnKEw8OvLosTDc5C7UgxqGyeDiB9xYUYxl2c/2uX3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8t3IjkqHskAlyIwn3Clxr7YfvgvhJ8xq2Kr22h/d0GP8RmgNwRh+/tRT3gbzTw8N9txK2vEGCeTH9FDixKB5vaiuSrSuaXPScCM5+gNo4RCUFE0h99tbaDvYjoe+OTxyfJMbnaWurmaFkjR8toPGR56dyDn3Jh9chMjB1qATos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fritz.com; spf=pass smtp.mailfrom=fritz.com; arc=none smtp.client-ip=212.42.244.120
Received: from [212.42.244.78] (helo=mail.avm.de)
	by mail.avm.de with ESMTP (eXpurgate 4.56.1)
	(envelope-from <n.schier@fritz.com>)
	id 6a32a4ef-044e-7f0000032729-7f000001d0a0-1
	for <multiple-recipients>; Wed, 17 Jun 2026 15:45:19 +0200
Received: from mail-auth.fritz.com (unknown [212.42.244.78])
	by mail.avm.de (Postfix) with ESMTPS;
	Wed, 17 Jun 2026 15:45:19 +0200 (CEST)
Date: Wed, 17 Jun 2026 15:45:19 +0200
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
Subject: Re: [PATCH v5 4/7] bootconfig: clean build-time tools/bootconfig
 from make clean
Message-ID: <20260617-heavy-zircon-marmot-9e7fa0@l-nschier-aarch64>
References: <20260617-bootconfig_using_tools-v5-0-fd589a9cc5e3@debian.org>
 <20260617-bootconfig_using_tools-v5-4-fd589a9cc5e3@debian.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260617-bootconfig_using_tools-v5-4-fd589a9cc5e3@debian.org>
Organization: FRITZ! Technology GmbH
x-ms-reactions: disallow
X-purgate-ID: 149429::1781703919-06FFB962-6AB146B2/0/0
X-purgate-type: clean
X-purgate-size: 2377
X-purgate: This mail is considered clean (visit https://www.eleven.de for further information)
X-purgate: clean
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.54 / 15.00];
	DMARC_POLICY_QUARANTINE(1.50)[fritz.com : SPF not aligned (relaxed), No valid DKIM,quarantine];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-13796-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:leitao@debian.org,m:mhiramat@kernel.org,m:akpm@linux-foundation.org,m:nathan@kernel.org,m:paulmck@kernel.org,m:nsc@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:linux-kernel@vger.kernel.org,m:linux-trace-kernel@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:bpf@vger.kernel.org,m:kernel-team@meta.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[n.schier@fritz.com,linux-kbuild@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,fritz.com:from_mime,fritz.com:email,l-nschier-aarch64:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: ACEDF69A3AC

On Wed, Jun 17, 2026 at 04:23:36AM -0700, Breno Leitao wrote:
> The previous patch builds tools/bootconfig during 'make prepare' to
> render the embedded bootconfig cmdline, but nothing removes it on
> 'make clean', leaving the compiled tool and its objects behind.
> 
> Wire a bootconfig_clean hook into the top-level clean target so the
> compiled tool and its objects are removed by make clean, matching the
> prepare-wired tools/objtool and tools/bpf/resolve_btfids.
> 
> The hook runs tools/bootconfig's Makefile via $(MAKE), which the kernel
> build invokes with -rR (MAKEFLAGS += -rR). -rR drops the built-in $(RM)
> variable, so the existing "$(RM) -f ..." clean recipe would expand to a
> bare "-f ..." and fail. Spell the recipe with a literal "rm -f" so it
> keeps working both standalone and when invoked from Kbuild.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  Makefile                  | 13 ++++++++++++-
>  tools/bootconfig/Makefile |  2 +-
>  2 files changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/Makefile b/Makefile
> index a7abb3f9a6264..a6e13fa1c1dc1 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1586,6 +1586,17 @@ ifneq ($(wildcard $(objtool_O)),)
>  	$(Q)$(MAKE) -sC $(abs_srctree)/tools/objtool O=$(objtool_O) srctree=$(abs_srctree) $(patsubst objtool_%,%,$@)
>  endif
>  
> +PHONY += bootconfig_clean
> +
> +bootconfig_O = $(abspath $(objtree))/tools/bootconfig
> +
> +# tools/bootconfig is only built (via the prepare hook above) when
> +# CONFIG_BOOT_CONFIG_EMBED_CMDLINE is set; skip its clean otherwise.

The wildcard below matches for all in-source builds and also for all 
out-of-source builds that _once_ built bootconfig (as the directory will 
never be removed).  I'd like the comment to be removed, it's obvious 
enough what is happening here.

> +bootconfig_clean:
> +ifneq ($(wildcard $(bootconfig_O)),)
> +	$(Q)$(MAKE) -sC $(srctree)/tools/bootconfig O=$(bootconfig_O) clean
> +endif
> +

Some additional bike-shedding:  I'd rather keep it here as short and 
simple altogether:


PHONY += bootconfig_clean
bootconfig_clean: bootconfig_O = $(abs_output))/tools/bootconfig
	$(Q)$(MAKE) -sC $(srctree)/tools/bootconfig O=$(bootconfig_O) clean


Nevertheless, for kbuild:

Reviewed-by: Nicolas Schier <n.schier@fritz.com>



Kind regards,
Nicolas

