Return-Path: <linux-kbuild+bounces-11972-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gA42IoVEuGmLbAEAu9opvQ
	(envelope-from <linux-kbuild+bounces-11972-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:57:25 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 832F329EA6A
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 18:57:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3B8383020FD2
	for <lists+linux-kbuild@lfdr.de>; Mon, 16 Mar 2026 17:56:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FDE33CE88;
	Mon, 16 Mar 2026 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kcM+ccPB"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6F233C1B2;
	Mon, 16 Mar 2026 17:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773683810; cv=none; b=lNyYSy/u9DtaIxKMTjMIkjjhq8IArjRXWN0kmunVcGpdXSSvtIG3oJ2EzWKt9KPEwqBuN6GJ28I72YWDrTAb7hzobsPkayESctW+H974lnkGeoaizSLW2Go1QTcz5f8j7vWDTLuN6wzP6RLXfvq2Rw13FwsCUE3q426hNetYW9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773683810; c=relaxed/simple;
	bh=QsvI7xh+xmuVKe0toI6okbDwY6fJwH4DKn5xR2ODfgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m5XYNvzWAVBxa7uKpjpWWm504NOEEChBSoKL5lEF+H4/KwwG9UV1CN1i2+acaFyAQgzC31riYVqNeipE55x1cXNg4jSVHbRVn0sEtM4/V260hFwdjmyK7VwFLb+uWbSUrXt1c/fbpbHjNIgtg1GPbp5vXVJS5s9HZa5jph/S0hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kcM+ccPB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D633C19421;
	Mon, 16 Mar 2026 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773683810;
	bh=QsvI7xh+xmuVKe0toI6okbDwY6fJwH4DKn5xR2ODfgI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kcM+ccPBGh7N4ro6gnNhIsFjjtEtWhVRcNdHs2DLYgX8hl7QPmv9Tfvs9mJbvwlLQ
	 oynayt0GbizqFxrD8PqPJ3olyhlI+tgZ01RpL6SbpyHzZ1BQBDPcYBN7vVv5Ri1BOA
	 vu5HX6yAtqiPjehXhZV/SO/tAGFQSb7TwkIV+XeFkPsiu49TKoXJ+PVO9vhufFno99
	 Ay8JB4CSnvE+mn6r/XXw6afL/kDwgAhpiuw9B/azIHKmj4YMB4L/Sj3A+8oidL0OaT
	 Q+6pex4wR81B5kiFbhnkACxGt3YLpAclxbRV0eXEHCmztUncFMwRwuP6s9ARsFByIQ
	 avTHcHOnFl8TA==
Date: Mon, 16 Mar 2026 18:52:10 +0100
From: Nicolas Schier <nsc@kernel.org>
To: Rong Xu <xur@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
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
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v5 1/2] kbuild: move vmlinux.a build rule to
 scripts/Makefile.vmlinux_a
Message-ID: <abhDSrgevNJl-AUh@levanger>
Mail-Followup-To: Nicolas Schier <nsc@kernel.org>, Rong Xu <xur@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
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
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev,
	Arnd Bergmann <arnd@arndb.de>
References: <20251028182822.3210436-1-xur@google.com>
 <20251028182822.3210436-2-xur@google.com>
 <abgGnfO5ZrpOUza7@levanger>
 <CANiq72mCpc9=2TN_zC4NeDMpFQtPXAFvyiP+gRApg2vzspPWmw@mail.gmail.com>
 <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF1bQ=RarMBKd2KhBje9de-ymjPf+tKUVpgPxspJPm0yTao2Mw@mail.gmail.com>
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-11972-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,google.com,linutronix.de,redhat.com,ellerman.id.au,csgroup.eu,cachyos.org,vger.kernel.org,lists.linux.dev,arndb.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nsc@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 832F329EA6A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 16, 2026 at 05:27:01PM +0000, Rong Xu wrote:
> I think the problem was $(AR) mPi and llvm-ar <= 14 do work correctly
> in preserving the orders for "thin" archives without --thin.
> 
> We can either
> (1) Bump the LLVM version to 15 and remove the --thin flag, or
> (2) Implement a condition, as the --thin flag is only required for
> llvm-ar. I assume the reported error was using gcc? (can someone send
> a link for the failure?)
> 
> I think (2) is less involved. I can prepare a updated patch.

Great, thanks!  Yes, the report was using gcc.

The report is at https://lore.kernel.org/linux-next/476507c9-a371-4864-9e87-572c1ecae82d@linux.ibm.com/

Kind regards,
Nicolas

