Return-Path: <linux-kbuild+bounces-11883-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCoTM8iosmnwOQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11883-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 12:51:36 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 470A12714B1
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 12:51:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 08EF03021B03
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 11:46:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1A5B2ED848;
	Thu, 12 Mar 2026 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZXUUnyV"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D5271471;
	Thu, 12 Mar 2026 11:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773315982; cv=none; b=PlrEwBP2ZZp7Fcyq8fbHClcye6SVjzKrfDChk5zol01f/3kithxDhdu7OEr7zw9/w6OgiiEg6I8EUshbHWfqnwYJRhagYlBeVFqAXU4h0mh8I6IbEuSKQ/KYOIpWosbYriVO3oKHaxMdDqgi/so77Uc1tGYTEMKtdU5dNrnbx1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773315982; c=relaxed/simple;
	bh=jtK8dDtUft4/ENJDBV0ud3J6ohGSG6+qs6EFqSMBhvI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W+jy3Xm7dpcpsD5mtxKBgaApX69YMMF8h5hApykXS5vdQD7oVZe3qoS3FT6RNGuAW9NHFyGtMBrvvasB8BLfeAAwwbbruQarb5b6s9V9i/KHafgwb0aXg0nuIADK4kru7WVGJXlw8weQpWHCmasmQntQdfllmenmXDyB0U0LMmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZXUUnyV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA820C4CEF7;
	Thu, 12 Mar 2026 11:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773315982;
	bh=jtK8dDtUft4/ENJDBV0ud3J6ohGSG6+qs6EFqSMBhvI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZXUUnyV3P/yfYnBvbNTdP9S9ELy+NCg5I4wCNuJDtVPC2GoQGzZzS7709Q/y/y1F
	 Nn98lG0hCj8nFakpbrY0FpBwyz6Ri8f9IU6W2zDm/Z7cO8xuF6FCAvMw4VgVh6knj0
	 bPdwVH5fQPaa5/+LgQsbj5Fsq26PTJmV5IbGNuk8BuV4en6El2O7vUsZ5p2cthQq0W
	 krc37S0WpO8hR1W8rakhvHFFR8IdWSUZ37/8FMfjdTdVN/jzvUduB8it0/klLcNvLl
	 bN4mcQCT9/CdOwpTRDXfc9u0Qkwba6xXTchjwDh03jGo3jmsDK0xgVaAbW+r4A5OtP
	 ddSg1vWEyXBQQ==
Date: Thu, 12 Mar 2026 12:45:42 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: xur@google.com, Masahiro Yamada <masahiroy@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alice Ryhl <aliceryhl@google.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Rafael Aquini <aquini@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Stafford Horne <shorne@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Piotr Gorski <piotrgorski@cachyos.org>,
	Teresa Johnson <tejohnson@google.com>, linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH v5 0/2] kbuild: distributed build support for Clang
 ThinLTO
Message-ID: <abKnZrHleb-XKR_a@derry.ads.avm.de>
References: <20251028182822.3210436-1-xur@google.com>
 <20260312082502.GA790897@ax162>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260312082502.GA790897@ax162>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11883-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[google.com,kernel.org,gmail.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev];
	RCPT_COUNT_TWELVE(0.00)[20];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,derry.ads.avm.de:mid]
X-Rspamd-Queue-Id: 470A12714B1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Mar 12, 2026 at 01:25:02AM -0700, Nathan Chancellor wrote:
> Hi Nicolas,
> 
> On Tue, Oct 28, 2025 at 06:28:20PM +0000, xur@google.com wrote:
> > From: Rong Xu <xur@google.com>
> > 
> > ChangeLog:
> > 
> > V5: Handle single quote escaping in echo _c_flags to fix
> >     Piotr Gorski's reported error.
> > 
> > V4: This is based on the reimplementation provided by Masahiro Yamada
> > on May 26. The difference is that this version now saves the compiler
> > flags (_c_flags) from the Front-End (FE) compilation and re-uses them
> > for the subsequent Back-End (BE) compilation.
> >  
> > Rong Xu (2):
> >   kbuild: move vmlinux.a build rule to scripts/Makefile.vmlinux_a
> >   kbuild: distributed build support for Clang ThinLTO
> > 
> >  .gitignore                 |  2 +
> >  Makefile                   | 25 +++++-------
> >  arch/Kconfig               | 19 +++++++++
> >  scripts/Makefile.lib       |  7 ++++
> >  scripts/Makefile.thinlto   | 40 ++++++++++++++++++
> >  scripts/Makefile.vmlinux_a | 83 ++++++++++++++++++++++++++++++++++++++
> >  scripts/mod/modpost.c      | 15 +++++--
> >  7 files changed, 174 insertions(+), 17 deletions(-)
> >  create mode 100644 scripts/Makefile.thinlto
> >  create mode 100644 scripts/Makefile.vmlinux_a
> 
> I have been running this for a few months locally and I have not noticed
> any problems with it (at least for the two distribution configurations I
> regularly test). I think this looks good overall and seems fairly well
> contained thanks to Masahiro's work on the earlier revisions. Could this
> be picked up in kbuild-next-unstable so it can bake in -next for a
> little bit? It should still be applicable.
> 
> Reviewed-by: Nathan Chancellor <nathan@kernel.org>
> Tested-by: Nathan Chancellor <nathan@kernel.org>

Thanks!  Sure, I will pick the series up.

Kind regards,
Nicolas

