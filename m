Return-Path: <linux-kbuild+bounces-9001-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E03BBCC1B
	for <lists+linux-kbuild@lfdr.de>; Sun, 05 Oct 2025 22:53:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4949F347D5D
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Oct 2025 20:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1331C9DE5;
	Sun,  5 Oct 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od9wYGu0"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2DA189F20;
	Sun,  5 Oct 2025 20:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759697622; cv=none; b=qS56G0Bau22vI2ePfGsnqOvIgJOxvxjazpjPS5TXBl773qtpmzQYdxmVsRQC5GJcbn3dtEjMamVKj6PYmVyOT7TvG6OUvdGs5nFVQuznqONq9SMmP4rME1s0gIv4DJV8KaafN8+YpUw3zso7DQZuGqEU2lmvrJEPUVBu2Q6ERdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759697622; c=relaxed/simple;
	bh=ZD6JLg3KrZgfGi/1eaPkNK2H/VSQ1r+ZOetHeCSLRhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pxKbYFso+DVRC9FOFiUeCRzjO5dBFE3D4DzVG4qVHAr/rEBDivQj1GaldM80qxXlAf4z97AsrhN2BSN3/lcFzNqN21ebrOhVlKRA8wbDazv+T+tMSjIkexx79hlta8WFVP35Rn4MWY4ynQ/3ROmQ+gq/V0Ls11TnzM7rXuLGxgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od9wYGu0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E5AC4CEF4;
	Sun,  5 Oct 2025 20:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759697622;
	bh=ZD6JLg3KrZgfGi/1eaPkNK2H/VSQ1r+ZOetHeCSLRhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Od9wYGu0ppjoge+u2bGm5ofHQpyFvInbTisvOJlrC5mFNjx7FMIEY8FgOMPbmWHZD
	 W5lPutki1QaO8+PcmbhJI6j/qab/DdDMHm1Trqc4HJPlKgUwvAXUqf8LdHKaqVGp4Q
	 n43hSxs5i3Zi6JdWiW7XgV+02DVtljqRxDyaBDx3aJaPu3vEWiraInVn991zqjIoQR
	 CaRAkPmUzS8TMNyjKEgltShg7zpS2f8bQ2BkMckSwhkSlcQV6FJxe59ChhNcB73CiK
	 D9GGtC0Ai4t3DSQHSoCaYu7oFFD47ypzn6wHPUg0L2kqWQnPJTmN3lXid26pxzXPB+
	 LuQinR7aGSSsg==
Date: Sun, 5 Oct 2025 13:53:35 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Askar Safin <safinaskar@gmail.com>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nsc@kernel.org>
Cc: a.hindborg@kernel.org, alex.gaynor@gmail.com, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org,
	gary@garyguo.net, linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org, lossin@kernel.org, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, sam@gentoo.org
Subject: Re: [PATCH v2 6/6] kbuild: enable -Werror for hostprogs
Message-ID: <20251005205335.GA2561157@ax162>
References: <20250814-kbuild-werror-v2-6-c01e596309d2@linutronix.de>
 <20251005011100.1035272-1-safinaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251005011100.1035272-1-safinaskar@gmail.com>

Hi Askar,

On Sun, Oct 05, 2025 at 04:10:47AM +0300, Askar Safin wrote:
> "Thomas Weiﬂschuh" <thomas.weissschuh@linutronix.de>:
> > Enable -Werror unconditionally
> 
> Please, drop this patch.

This is already merged into Linus's tree so it cannot be dropped, it
would need to be reverted. However...

> Never enable -Werror unconditionally for any part of build.
> 
> I often bisect Linux. And to do this, I often need to build very old
> Linux commits (with modern compiler). Unconditional -Werror will make
> this impossible.
> 
> For example, recently I found this regression:
> 
> https://lore.kernel.org/regressions/197f290e30b.eaadc7bc7913.7315623184036672946@zohomail.com/T/#u
> 
> The regression caused by commits happened in 2019.
> 
> So to bisect it, I had to build 2019 trees using modern compiler.

I do my fair share of bisecting old Linux trees with a modern compiler,
so I do understand that pain. While it is easy enough to avoid this
behavior with HOSTCFLAGS=-Wno-error or HOSTCFLAGS=-w and there are other
places that the kernel enables -Werror unconditionally, I do not want
this to be a major pain point for random people doing bisected,
especially when the host tools are fairly battle tested so warnings may
not be a big deal.

In looking further into this, I noticed that in its current state,
-Werror is not getting applied to scripts/basic/fixup or
scripts/kconfig/*.o files (seems $(include-y) happens to late?), which
was one of the reasons to avoid making it depend on CONFIG_WERROR or
W=e. If that's the case, we could probably make it opt in like the rest
of the warnings for the kernel, which should be a fair compromise
between wanting to make potential issues more obvious while not
impacting people who build old sources with new compilers.

Thomas and Nicolas, thoughts?

Cheers,
Nathan

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index 1434cb6208cb..1a29598cf7cb 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -223,9 +223,11 @@ KBUILD_USERCFLAGS	+= -Werror
 KBUILD_USERLDFLAGS	+= -Wl,--fatal-warnings
 KBUILD_RUSTFLAGS	+= -Dwarnings
 
-endif
-
-# Hostprog flags are used during build bootstrapping and can not rely on CONFIG_ symbols.
+# While hostprog flags are used during build bootstrapping (thus can not use on
+# CONFIG_ symbols), -Werror should be opted into, so only apply -Werror to
+# hostprogs built after the initial Kconfig bootstrap.
 KBUILD_HOSTCFLAGS	+= -Werror
 KBUILD_HOSTLDFLAGS	+= -Wl,--fatal-warnings
 KBUILD_HOSTRUSTFLAGS	+= -Dwarnings
+
+endif

