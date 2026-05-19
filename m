Return-Path: <linux-kbuild+bounces-13277-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iPuXEb5TDGr6fQUAu9opvQ
	(envelope-from <linux-kbuild+bounces-13277-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 14:12:46 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B977A57E679
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 14:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BAC053004C0E
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 May 2026 12:07:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B4D4C6F18;
	Tue, 19 May 2026 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="q3oCDcW+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1B64B8DED;
	Tue, 19 May 2026 12:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779192425; cv=none; b=BUu6zW0z848CoDEjmvJ741xYB1Ie1bGgEnC+291KcvI5C6w4aIl5c39M03LAsftwO0EpbJLdokvlY1oKrQ+i9wLKb86maCCskuO/dZW1P/9SGyyyjcxmJoFf0tYrN9HB+0OR0JslPIcTCCJxHE+hslTQcK47keuqJy34F3IQWW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779192425; c=relaxed/simple;
	bh=DJY95g0ZmUO/h+FGNqx68XzzoKPdsYRRU7J5WDRm+ws=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6VMZyZC7+dHpG4OKPOPV5Ct4pMQmyp9lr1twQ1p0SwrSfASKGoWHW2KbKFPZD6jJZ8UlehKUMRaDUFG2517BJPC7K1iZD1WwrVZ3JyV6FimM8680XSVuQlxKhnJRcPlOMGxCLQowoqhQjr0vOuVyBMeFdvoJixST+eAp+7JhRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=q3oCDcW+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36CFEC2BCB3;
	Tue, 19 May 2026 12:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779192424;
	bh=DJY95g0ZmUO/h+FGNqx68XzzoKPdsYRRU7J5WDRm+ws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=q3oCDcW+sCdTzW8lCRMorld9sc9qwpqK6QWGt3aVnLkJ0uLmsDYwx2KnSlZbovXJv
	 lz3nRwxeNA49VZKeNVJKIYcOODXiJPFbbkZG9/Vzdpifx6C4plYR9WYefDq7QVu7tW
	 eG/RMMruCk9MSbvTkTBr+jkbGMzjGS5VMSF37XkRQm5cmLBOSdPz7mgdL6T3jHhXN6
	 r5/Ck12n8PAsB8oR5cLryIQnwReRyokbEDkIB+s6fLWQRBuudP75Nb2Y7U+uJ3+bKf
	 XIDMdWEUDUZBfUoivtPhBlF6jl3yIr2EF/ke+Nw5yo2KoQYoM8H56qoKpuNpO0kajn
	 rU6sqcMx9805w==
Date: Tue, 19 May 2026 13:06:59 +0100
From: Will Deacon <will@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Joerg Roedel <joro@8bytes.org>, Miguel Ojeda <ojeda@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org,
	stable@vger.kernel.org, Robin Murphy <robin.murphy@arm.com>,
	Kees Cook <kees@kernel.org>, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] [v2] iommu, debugobjects: avoid gcc-16.1 section
 mismatch warnings
Message-ID: <agxSY-BnTXv2TQWo@willie-the-truck>
References: <20260513145425.1579430-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260513145425.1579430-1-arnd@kernel.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-13277-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[will@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: B977A57E679
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, May 13, 2026 at 04:53:54PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> gcc-16 has gained some more advanced inter-procedual optimization
> techniques that enable it to inline the dummy_tlb_add_page() and
> dummy_tlb_flush() function pointers into a specialized version of
> __arm_v7s_unmap:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: __arm_v7s_unmap+0x2cc (section: .text) -> dummy_tlb_add_page (section: .init.text)
> ERROR: modpost: Section mismatches detected.
> 
> From what I can tell, the transformation is correct, as this is only
> called when __arm_v7s_unmap() is called from arm_v7s_do_selftests(),
> which is also __init. Since __arm_v7s_unmap() however is not __init,
> gcc cannot inline the inner function calls directly.
> 
> In debug_objects_selftest(), the same thing happens. Both the
> caller and the leaf function are __init, but the IPA pulls
> it into a non-init one:
> 
> WARNING: modpost: vmlinux: section mismatch in reference: lookup_object_or_alloc+0x7c (section: .text.lookup_object_or_alloc) -> is_static_object (section: .init.text)
> 
> Marking the affected functions as not "__init" would reliably avoid this
> issue but is not a good solution because it removes an otherwise correct
> annotation. I tried marking the functions as 'noinline', but that ended
> up not covering all the affected configurations.
> 
> With some more experimenting, I found that marking these functions as
> __attribute__((noipa)) is both logical and reliable.
> 
> In order to keep the syntax readable, add a custom macro for this in
> include/linux/compiler_attributes.h next to other related macros and
> use it to annotate both files.
> 
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
> ---
>  drivers/iommu/io-pgtable-arm-v7s.c  | 18 ++++++++++++------
>  include/linux/compiler_attributes.h | 11 +++++++++++
>  lib/debugobjects.c                  |  2 +-
>  3 files changed, 24 insertions(+), 7 deletions(-)

For the io-pgtable change:

Acked-by: Will Deacon <will@kernel.org>

Thanks, Arnd.

Will

