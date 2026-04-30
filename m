Return-Path: <linux-kbuild+bounces-12946-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFjwDQrM8mmWuQEAu9opvQ
	(envelope-from <linux-kbuild+bounces-12946-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 05:27:06 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F2F49CD6D
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 05:27:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F3256303B5EC
	for <lists+linux-kbuild@lfdr.de>; Thu, 30 Apr 2026 03:25:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E598346771;
	Thu, 30 Apr 2026 03:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="V5dcZx5w"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2F6344DBD;
	Thu, 30 Apr 2026 03:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777519546; cv=none; b=ipkCa7dVbTX8kjEc/d1Nhw7m56VODeCR1S4NkFAFDp3htkU65m0E5IqGtPkBs1u95Dlc0GtAcQqHHVi/iMwrLyURnKsBXAhJxd6VhPGRaHkRSeGTbSImiB7uLNiePWTnBY7el8WLXkJg5TFRe7n0NoiPUYspeczSn2u28YQrGVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777519546; c=relaxed/simple;
	bh=Ut5G69bc29PiPzWoT/741NVv5Kk/lOmdOdb5wKBmZHY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=oMJPoul8PNqJN8qxyXzoDt53j74wHJg6kb+2ZS0hgqpWdjZGNbOH1It4TJf2ivzRj3tb7vyNx2vyMDZNuY+0yONyH7UOzjDDXVpxGQ9PrY2dHQEyawfmOkUyKSBWQa1B3GsGLAZ5UOKFYciaQK/rWsrPoxF1IimFm8pwH1T2tAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=V5dcZx5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEFFC2BCB9;
	Thu, 30 Apr 2026 03:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777519545;
	bh=Ut5G69bc29PiPzWoT/741NVv5Kk/lOmdOdb5wKBmZHY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=V5dcZx5w6ZsNbkLQRDMzB2RWL/aoneaFsqWWBCOjQU9YtIWRYDD+T+yLL0c1uuBhY
	 qEq09wxP51HP2ucG5VcbFYEWu1xwrI3mLVWalChYNFLQKJVV2/uPNO5bNsVTmGtBYW
	 y+MFexZXsUKBzIR9VcaG11CGAPdXCh5mrQ4ITyVmu2dzJeTpqYPZZKRQaFN8mTUumj
	 qe1015WQ5bGNHETaFFAMkfQbXS+479tE5rufj5GTm7FfEY/F/wwiBzlApZyMLXQ7Xj
	 eN4jVc9crSFreUj8YqywmtdyQ9MC4GHMaLaL9pIVAuwmWk3hGgC+ZxtKtJbApg/ERF
	 YZVQLUUCYw1Pw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id DA1FF3809A07;
	Thu, 30 Apr 2026 03:25:01 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177751950055.2274119.12088060080551439561.git-patchwork-notify@kernel.org>
Date: Thu, 30 Apr 2026 03:25:00 +0000
References: <20260405235309.418950-1-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
Cc: linux-riscv@lists.infradead.org, nathan@kernel.org, nsc@kernel.org,
 dakr@kernel.org, a.hindborg@kernel.org, catalin.marinas@arm.com,
 will@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 acourbot@nvidia.com, airlied@gmail.com, simona@ffwll.ch,
 brendan.higgins@linux.dev, david@davidgow.net, gregkh@linuxfoundation.org,
 arve@android.com, tkjos@android.com, christian@brauner.io,
 cmllamas@google.com, aliceryhl@google.com, corbet@lwn.net, boqun@kernel.org,
 gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org,
 tmgross@umich.edu, rust-for-linux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, lorenzo.stoakes@oracle.com, vbabka@kernel.org,
 Liam.Howlett@oracle.com, urezki@gmail.com, linux-block@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, alex@ghiti.fr,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 raemoar63@gmail.com, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, nick.desaulniers+lkml@gmail.com,
 morbo@google.com, justinstitt@google.com, llvm@lists.linux.dev,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 linux-doc@vger.kernel.org
X-Rspamd-Queue-Id: C8F2F49CD6D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-12946-lists,linux-kbuild=lfdr.de,linux-riscv];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,ghiti.fr,lists.freedesktop.org,googlegroups.com,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linux-kbuild@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FROM_NO_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hello:

This series was applied to riscv/linux.git (fixes)
by Miguel Ojeda <ojeda@kernel.org>:

On Mon,  6 Apr 2026 01:52:36 +0200 you wrote:
> As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
> we are going to follow Debian Stable's Rust versions as our minimum
> supported version.
> 
> Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
> still uses to this day [3] (i.e. no update to Rust 1.85.1).
> 
> [...]

Here is the summary with links:
  - [v2,01/33] rust: kbuild: remove `--remap-path-prefix` workarounds
    https://git.kernel.org/riscv/c/c8cbe2fc22e4
  - [v2,02/33] rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
    https://git.kernel.org/riscv/c/518b9ad2fab3
  - [v2,03/33] rust: kbuild: remove unneeded old `allow`s for generated layout tests
    https://git.kernel.org/riscv/c/92cc022f044f
  - [v2,04/33] gpu: nova-core: bindings: remove unneeded `cfg_attr`
    https://git.kernel.org/riscv/c/341c51ee3293
  - [v2,05/33] rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
    https://git.kernel.org/riscv/c/f32fb9c58a5b
  - [v2,06/33] rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
    https://git.kernel.org/riscv/c/b6cfba436623
  - [v2,07/33] rust: allow globally `clippy::incompatible_msrv`
    https://git.kernel.org/riscv/c/7ed188605e1d
  - [v2,08/33] rust: simplify `RUSTC_VERSION` Kconfig conditions
    https://git.kernel.org/riscv/c/b28711ac98e8
  - [v2,09/33] rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
    https://git.kernel.org/riscv/c/9b398d056543
  - [v2,10/33] rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
    https://git.kernel.org/riscv/c/4ab22c543f18
  - [v2,11/33] rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
    https://git.kernel.org/riscv/c/0f6e1e0705f0
  - [v2,12/33] rust: kbuild: remove `feature(...)`s that are now stable
    https://git.kernel.org/riscv/c/d1aa40daa777
  - [v2,13/33] rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
    https://git.kernel.org/riscv/c/f309a6edda53
  - [v2,14/33] rust: alloc: simplify with `NonNull::add()` now that it is stable
    https://git.kernel.org/riscv/c/161dd7b51e96
  - [v2,15/33] rust: macros: simplify code using `feature(extract_if)`
    https://git.kernel.org/riscv/c/42ec980024f0
  - [v2,16/33] rust: block: update `const_refs_to_static` MSRV TODO comment
    https://git.kernel.org/riscv/c/961b72d45ae4
  - [v2,17/33] rust: bump `bindgen` minimum supported version to 0.71.1 (Debian Trixie)
    https://git.kernel.org/riscv/c/c3a00a3f31ff
  - [v2,18/33] rust: rust_is_available: remove warning for `bindgen` 0.66.[01]
    https://git.kernel.org/riscv/c/41cfbb4295cf
  - [v2,19/33] rust: rust_is_available: remove warning for `bindgen` < 0.69.5 && libclang >= 19.1
    https://git.kernel.org/riscv/c/ae64324ad5c1
  - [v2,20/33] rust: kbuild: update `bindgen --rust-target` version and replace comment
    https://git.kernel.org/riscv/c/276ed30c558e
  - [v2,21/33] rust: kbuild: remove "dummy parameter" workaround for `bindgen` < 0.71.1
    https://git.kernel.org/riscv/c/93553d9922b0
  - [v2,22/33] docs: rust: quick-start: openSUSE provides `rust-src` package nowadays
    https://git.kernel.org/riscv/c/53c9647c0a48
  - [v2,23/33] docs: rust: quick-start: update Ubuntu versioned packages
    https://git.kernel.org/riscv/c/982e1aa6de73
  - [v2,24/33] docs: rust: quick-start: update minimum Ubuntu version
    https://git.kernel.org/riscv/c/6767147cb941
  - [v2,25/33] docs: rust: quick-start: add Ubuntu 26.04 LTS and remove subsection title
    https://git.kernel.org/riscv/c/780f847e1419
  - [v2,26/33] docs: rust: quick-start: remove Gentoo "testing" note
    https://git.kernel.org/riscv/c/99c672426aed
  - [v2,27/33] docs: rust: quick-start: remove Nix "unstable channel" note
    https://git.kernel.org/riscv/c/b69a14650009
  - [v2,28/33] docs: rust: quick-start: remove GDB/Binutils mention
    https://git.kernel.org/riscv/c/a4392ed1c8b9
  - [v2,29/33] docs: rust: general-information: simplify Kconfig example
    https://git.kernel.org/riscv/c/9375ea727d7e
  - [v2,30/33] docs: rust: general-information: use real example
    https://git.kernel.org/riscv/c/86c5d1c6740c
  - [v2,31/33] rust: declare cfi_encoding for lru_status
    https://git.kernel.org/riscv/c/9e5946de3a38
  - [v2,32/33] rust: kbuild: support global per-version flags
    https://git.kernel.org/riscv/c/b2aa1535ecdd
  - [v2,33/33] rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0
    https://git.kernel.org/riscv/c/2e2f8b5a0656

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



