Return-Path: <linux-kbuild+bounces-3321-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A5B968C77
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 18:56:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 45715B21C9D
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Sep 2024 16:56:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B8911AB6DF;
	Mon,  2 Sep 2024 16:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dNYewnXT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29A2018028;
	Mon,  2 Sep 2024 16:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725296158; cv=none; b=oH6073g2Anp2uI2Y8psASSD1ew+VVpXWbYh0dU/mPySxqlUYBE8YoZCvZo1lBaS+iOpG+xAPzE1/ftY4Jq+SfV5Ev15PpHSbwlb4iB6Hja/r7IkODUfgFrkXb8A1/WdHGpfp6n0LIS0ZEbcg4rUXYJlCBjRWLDWIXr/B4q+nj/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725296158; c=relaxed/simple;
	bh=rtcqF7W/MMRkTLjjcWtuh5ol+p6ZUb57+Fro8P1y9BE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=dDqBy6hR6BUsObh1sibViyIfWHtFwJq/3hcAyZIEScle1jrUmu8VVQUhFFL2MmhB+JB8wJJtj4uc77+ZeAEfsR9CNmKNpTVCiyWZ7YQJpkckCc6VeKrRgqTciIAD/ydtw3jdUe5UN1cu3DwHop8RebkFRXj0XI08IV8twoPWHyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dNYewnXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845E6C4CEC2;
	Mon,  2 Sep 2024 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725296157;
	bh=rtcqF7W/MMRkTLjjcWtuh5ol+p6ZUb57+Fro8P1y9BE=;
	h=From:To:Cc:Subject:Date:From;
	b=dNYewnXTHks2DgdjB9ITo5jvU/FTsD89uJFPUazQBzQv+kYKVzycX0CT+eT0jZ4J4
	 TC+TVkrhz6/8hZFuowWE+8G47Ka5ToQMBiYxZLeXNueX8lAxU3Ofc59iwDsTnHNk+n
	 ffUjDO6lGlkCi9Q2oHh29uRtCyZChNh2RC7r4nDHFf/bn2oa9zTQaLYDgGhOJ1J0c/
	 u9+j1KAOBOYxNIZCSX+nOu8yZRYX/L3+g16bEkwQnF7qJPkwDg/k8C/nomGXGgxpqE
	 VQAjhGX/r2Da3zyXG+Z1LWpfU5xFZcm++L/z7JBVbIykUUHv1yHsFwvw4heGKy4goz
	 Og1ViTBuKO5Gw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	rust-for-linux@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev
Subject: [PATCH v2 0/6] `RUSTC_VERSION` and re-config/re-build support on compiler change
Date: Mon,  2 Sep 2024 18:55:27 +0200
Message-ID: <20240902165535.1101978-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series mainly adds support for `CONFIG_RUSTC_VERSION` (which is needed for
other upcoming series) as well as support for rebuilding the kernel when the
Rust compiler version text changes, plus other secondary improvements.

v1: https://lore.kernel.org/rust-for-linux/20240808221138.873750-1-ojeda@kernel.org/
v2:

  - Dropped patch #2 "kbuild: rust: make command for `RUSTC_VERSION_TEXT` closer
    to the `CC` one" (Masahiro, Björn).

    In other words, now the `RUSTC_VERSION_TEXT` command is kept as it
    was, without `LC_ALL=1` nor `| head -n1`.

  - Replaced `macros` crate dependency with a comment in the code that `fixdep`
    will find, since we can do it for that one, unlike `core` (Masahiro,
    Nicolas).

  - Added patch (here #5) to add a warning when the Rust compiler used to build
    the kernel differs from the one used to build an out-of-tree module, like
    the C side does (Nicolas).

    If the patch is not wanted, then it can be skipped without much loss, since
    anyway Rust will fail to compile in that case. However, it would be nice to
    have to prevent potentially unexpected situations and to clarify the errors
    that `rustc` would emit later. See the commit message for more details.

  - Rewrapped comment to stay under 80 lines (Nicolas).

  - Picked up a couple tags that could more or less be reasonably taken given
    the changes to v2. Re-runs of tests welcome!

Miguel Ojeda (6):
  kbuild: rust: add `CONFIG_RUSTC_VERSION`
  kbuild: rust: re-run Kconfig if the version text changes
  kbuild: rust: rebuild if the version text changes
  kbuild: rust: replace proc macros dependency on `core.o` with the
    version text
  kbuild: rust: warn if the out-of-tree compiler differs from the kernel
    one
  docs: rust: include other expressions in conditional compilation
    section

 Documentation/rust/general-information.rst |  8 +++++++
 Makefile                                   | 18 ++++++++++-----
 init/Kconfig                               | 11 ++++++++-
 rust/Makefile                              |  7 +++---
 rust/macros/lib.rs                         |  4 ++++
 scripts/rustc-version.sh                   | 26 ++++++++++++++++++++++
 6 files changed, 64 insertions(+), 10 deletions(-)
 create mode 100755 scripts/rustc-version.sh


base-commit: a335e95914046c6bed45c0d17cabcd483682cf5e
--
2.46.0

