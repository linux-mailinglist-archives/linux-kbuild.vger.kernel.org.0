Return-Path: <linux-kbuild+bounces-10765-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aJ/fNhG7cGmWZQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-10765-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:40:01 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7077056212
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 12:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 365F43E0CBB
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 Jan 2026 11:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D14642F25E4;
	Wed, 21 Jan 2026 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dHnrDbhe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CE13DABE3;
	Wed, 21 Jan 2026 11:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768995328; cv=none; b=kt//+iVCCqR1vD+2uI2WrtnfCD2+9FkQCtI8yOb/EzbIzY6Wjn5m2lwv5kSiPFmN9wySFoegMw8LlP9UD387gauVuCExLxJSLIw3BTXjPAZYO0rHTMDzNaMbQQdBP3oIv3AIeMcJR+2AHEHyu7MfmA7yVrXuSMF8CWZ1GCXmSJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768995328; c=relaxed/simple;
	bh=AbA4654CpnBYO9FJCyDPqJ9d3LXH3BmWbfyk/n4OCtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jpb25B6DLV5bVJXARJuS6adOlXyBd+IoYyLTB0ZewyjKJLFMzzLhL9JYOffe+YxaVplaf32M9tv/rqZO7iGQKdXPBQVDZazcGzQ1wlGf2hjeHM5XTnowYvPo2ByOZDSWFOqJLNQmxpgiEFDNiJgl2cbw+v15tl7tlH2ZpMJqB3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dHnrDbhe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6384C116D0;
	Wed, 21 Jan 2026 11:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768995328;
	bh=AbA4654CpnBYO9FJCyDPqJ9d3LXH3BmWbfyk/n4OCtI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHnrDbhe/3BO7N/BMeiWSE/a2S0KXfWVPeZPn77sXEp3qfXamN0/0dAhknW7hZDAz
	 3ldBU5JVqKhOttTdOsYDNJNxMoQXNTt52jv4Hz0gonCTeCPyQ6B0vwiW5+VUfdu3og
	 io4fAda4cRB+HArx96be+xPv097Ofx27AlZ4XhCUFC6kywY4YvrlzluRjx87S35Do4
	 GHr+Bj77oxwk3C0Ib8+Bwq19lyHRk3zCKwFOWy/+kMX+7zRKvt7YxheJ2jqTiI30F6
	 ppPvyIkRC843W0u8HWo1qOBiMK2z1H1iy+WE9FwcfKc48tYfkouh28TVKG00Lxc239
	 v/okIPh99V8kg==
Date: Wed, 21 Jan 2026 12:17:04 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Vineet Gupta <vgupta@kernel.org>, Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 0/5] uapi: fix remaining kconfig leaks in UAPI headers
Message-ID: <aXC1sL5V9oqzT0ey@derry.ads.avm.de>
Mail-Followup-To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	linux-snps-arc@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Nathan Chancellor <nathan@kernel.org>, linux-kbuild@vger.kernel.org
References: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260112-headers_install-config-leak-v2-0-4d8084444603@linutronix.de>
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-10765-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,derry.ads.avm.de:mid,linutronix.de:email]
X-Rspamd-Queue-Id: 7077056212
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

[Cc+=linux-kbuild, nathan]

On Mon, Jan 12, 2026 at 08:58:28AM +0100, Thomas Weiﬂschuh wrote:
> A few UAPI headers still contained references to kconfig symbols.
> Clean them all up and afterwards remove the now useless exception
> machinery in headers_install.sh.
> 
> Intended to be routed through the kbuild tree.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
> Changes in v2:
> - Drop ARC_HAS_SWAPE kconfig option, use ARCH_USE_BUILTIN_BSWAP
> - Drop PSR_ENDSTATE from the ARM ptrace.h header.
> - Drop nios2 uapi asm/swab.h.
> - Link to v1: https://lore.kernel.org/r/20251230-headers_install-config-leak-v1-0-efba5c58073d@linutronix.de
> 
> ---
> Thomas Weiﬂschuh (5):
>       ARC: Always use SWAPE instructions and enable ARCH_USE_BUILTIN_BSWAP
>       ARM: uapi: Drop PSR_ENDSTATE
>       nios2: uapi: Remove custom asm/swab.h from UAPI
>       x86/uapi: Stop leaking kconfig references to userspace
>       scripts: headers_install.sh: Remove config leak ignore machinery
> 
>  arch/arc/Kconfig                         |  6 +-
>  arch/arc/Makefile                        |  3 +-
>  arch/arc/include/uapi/asm/swab.h         | 99 --------------------------------
>  arch/arm/include/asm/processor.h         |  3 +-
>  arch/arm/include/uapi/asm/ptrace.h       |  9 ---
>  arch/arm/kernel/signal.c                 |  3 +-
>  arch/nios2/include/{uapi => }/asm/swab.h |  0
>  arch/x86/include/uapi/asm/auxvec.h       |  2 +-
>  scripts/headers_install.sh               | 30 +---------
>  9 files changed, 9 insertions(+), 146 deletions(-)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251229-headers_install-config-leak-b8a9219d8b3c
> 
> Best regards,
> -- 
> Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>

Thanks a lot for the cleanup, much appreciated!

Reviewed-by: Nicolas Schier <nsc@kernel.org> # kbuild

Kind regards,
Nicolas

