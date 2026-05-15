Return-Path: <linux-kbuild+bounces-13173-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id BW7qDpeIB2ol7gIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13173-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 22:56:55 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6EC557943
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 22:56:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6629630128CA
	for <lists+linux-kbuild@lfdr.de>; Fri, 15 May 2026 20:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80AD535E1BF;
	Fri, 15 May 2026 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dt5TkGt3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D29F413D6C;
	Fri, 15 May 2026 20:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778878612; cv=none; b=LezwDNWwUhKzQzWBb4eh8YLCaPHpvhiWmKsX4ISlpBDz+lFyS+S+Rbd336qSEIq1hJcboBHqkSY6pQeVpzlx2R3YRKN7jPL2E1DSIG2IOb4JBqJXruMlunCwEAR+aWUbMNPYDC26gfYOV6AyQ/px+jdQmfgdBNhhPblcwD8frtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778878612; c=relaxed/simple;
	bh=NakMRS46W1oL9mqbKvNepb8mTvQx3uQdatcK6E5xQD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CZD76a7aGGQTvfZqyCASOe283Kw229aD7VrvlctKlzkhWF8Db9PZh0gP1uBfB+VWgMmJLO6IDQnKCg9ZE6LEwQiIvOq97PNq6mGaTNNCvSqnES4v7qZEG//Mf6GBBkX9H388+RF1kbEv08fdH/WvzTjMnJk48+e3xh66RGl1bQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dt5TkGt3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E107C2BCB0;
	Fri, 15 May 2026 20:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778878612;
	bh=NakMRS46W1oL9mqbKvNepb8mTvQx3uQdatcK6E5xQD8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dt5TkGt39ZtVjDyH9NqztBlMdcQ9g678kION37ACp00mHIhB5JTmHFXdL4Uhiq/6C
	 msqNy3bCtbyVcKP5oClpR7TqvTflTd4F8DSkn93XSMYyMrzWn44QGL1CJUveu3UE68
	 58aMCQeSrXUrdsZUTIjdWo8pCYUYlJdMic7yXEBRGLLFbq00QGVVTnnON6/IDK0Dbt
	 K6xg8bC7174Upc6+q79jqCJSORlFiibUbv5Bs6GECqchO/MVP9lhKs2sxoaRJZ9SFy
	 So/+HDZXkueSsqvlhQBYGQYMXqvvD3VJyUZhFoDed+xuLQkSFVivEd++Ho+Ox7IsuG
	 Ed4fR9Nof9gvw==
From: Thomas Gleixner <tglx@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>, Will Deacon <will@kernel.org>, Joerg
 Roedel <joro@8bytes.org>, Miguel Ojeda <ojeda@kernel.org>, Andrew Morton
 <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
 stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>, Kees Cook
 <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section
 mismatch warnings
In-Reply-To: <20260513145425.1579430-1-arnd@kernel.org>
References: <20260513145425.1579430-1-arnd@kernel.org>
Date: Fri, 15 May 2026 22:56:47 +0200
Message-ID: <87mry0xugg.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Rspamd-Queue-Id: 8C6EC557943
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13173-lists,linux-kbuild=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linux-foundation.org:email]
X-Rspamd-Action: no action

On Wed, May 13 2026 at 16:53, Arnd Bergmann wrote:
> Link: https://lore.kernel.org/all/abRB6g-48ZX6Yl2r@willie-the-truck/
> Cc: Will Deacon <will@kernel.org>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Miguel Ojeda <ojeda@kernel.org>
> Cc: linux-kbuild@vger.kernel.org
> Cc: stable@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: I merged both patches into one, to simplify the dependency
> on the new compiler_attributes.h macro.

Which you could have split into 'provide macro', fix A, fix B ..., but
that's just pedantry :)

But seriously, this is way more palatable than the other hacks!

Acked-by: Thomas Gleixner <tglx@kernel.org>

