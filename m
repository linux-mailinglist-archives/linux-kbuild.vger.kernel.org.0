Return-Path: <linux-kbuild+bounces-11009-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDLGJYN1gmm+UwMAu9opvQ
	(envelope-from <linux-kbuild+bounces-11009-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 23:24:03 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EF0E0DF327
	for <lists+linux-kbuild@lfdr.de>; Tue, 03 Feb 2026 23:24:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3CBD332051D6
	for <lists+linux-kbuild@lfdr.de>; Tue,  3 Feb 2026 22:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CEBC36E48E;
	Tue,  3 Feb 2026 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USm5cm8L"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566983242D2;
	Tue,  3 Feb 2026 22:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770156751; cv=none; b=e2TUFrzpf+q9hV/IxOdV2mgJHk6RnAnR4M0AlCTBYiSVfzPWHBYgsgF7LEkQLfMmVkndGa6waOjXREpdBd5op3ZOxTvOwCMtIxwCGDM997IInqEYnNgg69M+X1wOQa5bBDaD4j/2D1iUklQOWUwUw0l1Il4kIgzly4sArTQ9MEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770156751; c=relaxed/simple;
	bh=lZ8fLajBaBKfxqRgm1/CsQg35IImhyp3WoJlRneemVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i8KYgOUJ0ZziqKJnYMbDIVzIxif/pWCOJm/PHVrubRuwz+JvJZTNePqNfcOrVIrSUURFdJrq4BWPovmqkkD1Ctljq4C1QPJabpr0OVRCnUkV9b+2XoD0pFVLYDJ+gvBh0WOj++cQFZEicV9Q69bz3JO8GPeP3Hl6Vd3hXTSDwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USm5cm8L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4123AC116D0;
	Tue,  3 Feb 2026 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770156750;
	bh=lZ8fLajBaBKfxqRgm1/CsQg35IImhyp3WoJlRneemVQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USm5cm8LNFz7Zpvvr/WC/z9iJEDDkb8V3Cyxo1LI1WmLyMzXA4oKVJZyuas1CgaKY
	 PpMNh1Sk0dn/mxa0vbvjKHD7DCXnllbVOXBghDQ+IRdfOyz0akw1SIoy6ZAA6Jwnd4
	 hGupHwZer3dXRy35+1tEXGlqppADY/e9s4OtvqvIQ870n1Wib0lRq6k7Dwt/eNxreK
	 FOAdrcppaWnJVqKFD2ilNl+0NixHLyQHch5hyk48aIDJv+c6hmhCRUHOFUMdJLYPlH
	 rFpLsbmNIY/dXx0G1KpSDlWfi7DJ349Q3wgxtTWnAZk/Cl2KsTJvTbb2WeQEEhML7h
	 UOrs0pL4FLJ7Q==
Date: Tue, 3 Feb 2026 15:12:24 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: HeeSu Kim <mlksvender@gmail.com>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun@google.com, charmitro@posteo.net, dakr@kernel.org,
	gary@garyguo.net, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, lossin@kernel.org,
	miguel.ojeda.sandonis@gmail.com, nsc@kernel.org, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu,
	stable@vger.kernel.org
Subject: Re: [PATCH v4] rust: Makefile: bound rustdoc workaround to affected
 versions
Message-ID: <20260203221224.GA2703490@ax162>
References: <20260203005627.GB52989@ax162>
 <20260203234843.2834885-1-mlksvender@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203234843.2834885-1-mlksvender@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-11009-lists,linux-kbuild=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nathan@kernel.org,linux-kbuild@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,google.com,protonmail.com,posteo.net,garyguo.net,vger.kernel.org,gmail.com,umich.edu];
	TAGGED_RCPT(0.00)[linux-kbuild];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: EF0E0DF327
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 08:48:43AM +0900, HeeSu Kim wrote:
> The `-Cunsafe-allow-abi-mismatch=fixed-x18` workaround was added to
> handle a rustdoc bug where target modifiers were not properly saved [1].
> 
> This bug was fixed in Rust 1.90.0 [2]. Restrict the workaround to only
> apply for Rust 1.88.x and 1.89.x versions that are affected by the
> bug, preserving ABI compatibility checks on newer compiler versions.
> 
> Add `rustc-max-version` macro to `scripts/Makefile.compiler` for
> version upper bound checks, mirroring the existing `rustc-min-version`.
> 
> Link: https://github.com/rust-lang/rust/issues/144521 [1]
> Link: https://github.com/rust-lang/rust/pull/144523 [2]
> Suggested-by: Gary Guo <gary@garyguo.net>
> Link: https://lore.kernel.org/rust-for-linux/DG4JM9PU51M0.1YRGM9HVTY24U@garyguo.net/
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://lore.kernel.org/rust-for-linux/CANiq72n39eU9WE=Yh0_yJzmqMxo=QAaU2pN0UqP9jZ7bT7rhgA@mail.gmail.com/
> Cc: stable@vger.kernel.org # Useful in 6.18.y and later.
> Signed-off-by: HeeSu Kim <mlksvender@gmail.com>

Acked-by: Nathan Chancellor <nathan@kernel.org>

I assume Miguel will pick this up.

> ---
> Changes in v4:
> - Add rustc-max-version macro for cleaner version bounds
> - Use rustc-max-version instead of test-lt for readability
> 
> Changes in v3:
> - Remove Fixes: tag (this is a feature, not a fix)
> - Use full URLs with Link: tags instead of GitHub-style references
> - Add Link: to lore.kernel.org for Suggested-by attribution
> - Add Cc: stable for potential backporting to 6.18.y
> 
> Changes in v2:
> - Change approach: bound to affected Rust versions instead of ARM64-only
>   (the flag is simply ignored on non-ARM64 architectures)
> 
>  rust/Makefile             | 3 ++-
>  scripts/Makefile.compiler | 4 ++++
>  2 files changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/Makefile b/rust/Makefile
> index 5c0155b83454..1e8a75bc2878 100644
> --- a/rust/Makefile
> +++ b/rust/Makefile
> @@ -136,7 +136,8 @@ pin_init-flags := \
>  
>  # `rustdoc` did not save the target modifiers, thus workaround for
>  # the time being (https://github.com/rust-lang/rust/issues/144521).
> -rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),-Cunsafe-allow-abi-mismatch=fixed-x18)
> +# The bug was fixed in Rust 1.90.0, so only apply for 1.88.x and 1.89.x.
> +rustdoc_modifiers_workaround := $(if $(call rustc-min-version,108800),$(if $(call rustc-max-version,108999),-Cunsafe-allow-abi-mismatch=fixed-x18))
>  
>  # Similarly, for doctests (https://github.com/rust-lang/rust/issues/146465).
>  doctests_modifiers_workaround := $(rustdoc_modifiers_workaround)$(if $(call rustc-min-version,109100),$(comma)sanitizer)
> diff --git a/scripts/Makefile.compiler b/scripts/Makefile.compiler
> index ef91910de265..85268f6f1494 100644
> --- a/scripts/Makefile.compiler
> +++ b/scripts/Makefile.compiler
> @@ -71,6 +71,10 @@ clang-min-version = $(call test-ge, $(CONFIG_CLANG_VERSION), $1)
>  # Usage: rustc-$(call rustc-min-version, 108500) += -Cfoo
>  rustc-min-version = $(call test-ge, $(CONFIG_RUSTC_VERSION), $1)
>  
> +# rustc-max-version
> +# Usage: rustc-$(call rustc-max-version, 109000) += -Cfoo
> +rustc-max-version = $(call test-le, $(CONFIG_RUSTC_VERSION), $1)

Minor meta comment: It is generally perferred to add a macro like this
in a separate change to make it easier to backport if it is needed in
the future.

>  # ld-option
>  # Usage: KBUILD_LDFLAGS += $(call ld-option, -X, -Y)
>  ld-option = $(call try-run, $(LD) $(KBUILD_LDFLAGS) $(1) -v,$(1),$(2),$(3))
> -- 
> 2.52.0
> 

