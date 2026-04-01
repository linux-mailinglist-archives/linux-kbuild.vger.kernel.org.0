Return-Path: <linux-kbuild+bounces-12472-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEv0BKkKzWnhZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12472-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:08:09 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEBA37A265
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1A55F31218B3
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:46:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 297D43C3443;
	Wed,  1 Apr 2026 11:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKtBIcp6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051B7324B16;
	Wed,  1 Apr 2026 11:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043964; cv=none; b=huYkLE7xUpgETqZao41+HwvCAxgqFX2v6Qb3zRT+JEo0Ca2U3/h0oWS4nke6skBTdlkmmRqHfSUmKS+FEBicUSCCmMnDl7aFb0IaaQG2GXWEpjePnpKIgTnkbPhmZdZYhLJwquQvzzRQtXiz7EyTtHHVtwCu/n7faHhWUh4POKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043964; c=relaxed/simple;
	bh=apDv3G69tLYZxT0bsmSXFtUS1fsRBTuuV0MdIXy1tSE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=C2wecqBOSfspzKjW0re64KNfBu7Z/+GtoDBC2hFbivp7HkOUY8eB2+7on0AOVE03t4V3Cc625oNreRnl2RDm1WgiIdCyKrH38HOp8MeWypdpvDJxkpbH0lXlF3nQs40Ow/42hVwQ7dYd4ucdUxNs3ot+Lz7yL8zlSKk8P+EBGEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKtBIcp6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3116EC116C6;
	Wed,  1 Apr 2026 11:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043963;
	bh=apDv3G69tLYZxT0bsmSXFtUS1fsRBTuuV0MdIXy1tSE=;
	h=From:To:Cc:Subject:Date:From;
	b=UKtBIcp6XElrr1armeetFGSTEl8V4WONvd6rK4wvltL6YwavS1wFRnN7GpYLEHceN
	 1WbY+wtKHDLemajvmizAsRcZNLu6IBBbkMjRD+ZxpQHOYdzxmcTRqUrQPNLkHG9G1I
	 JhbACz6m0h9hIYsdf6/u0BqrMh/IzmOVno+iZyKwE9XuciKRg3kRCdpMGJRHL+z75U
	 gf+thvdBUY8rXoqFg5PKG9M0+8tFcZiB9pPlGXEEBqnrgJTFOZevdkklUbnUWAQbOW
	 A3Okudgp0+6IACGDs+Fy3Mfyl2ug75BV8kmRZaKVtZzx9GCX2MnTESl/o9lq/ct0OO
	 wSZvnFKBbOrQQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	linux-block@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers),
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	Rae Moar <raemoar63@gmail.com>,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH 00/33] rust: bump minimum Rust and `bindgen` versions
Date: Wed,  1 Apr 2026 13:45:07 +0200
Message-ID: <20260401114540.30108-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12472-lists,linux-kbuild=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,lwn.net:url]
X-Rspamd-Queue-Id: 7CEBA37A265
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As proposed in the past in e.g. LPC 2025 and the Maintainers Summit [1],
we are going to follow Debian Stable's Rust versions as our minimum
supported version.

Debian Trixie was released with a Rust 1.85.0 toolchain [2], which it
still uses to this day [3] (i.e. no update to Rust 1.85.1).

Debian Trixie was released with `bindgen` 0.71.1, which it also still
uses to this day [4].

Debian Trixie's release happened on 2025-08-09 [5], which means that a
fair amount of time has passed since its release for kernel developers
to upgrade.

Thus bump the minimum to the new versions, i.e.

  - Rust: 1.78.0 -> 1.85.0
  - bindgen: 0.65.1 -> 0.71.1

There are a few main parts to the series, in this order:

  - The Rust bump (and cleanups).
  - The bindgen bump (and cleanups).
  - Documentation updates.
  - The `cfi_encoding` patch, added here, which needs the bump.
  - The per-version flags support and a Clippy cleanup on top.

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
Link: https://packages.debian.org/trixie/rustc [3]
Link: https://packages.debian.org/trixie/bindgen [4]
Link: https://www.debian.org/releases/trixie/ [5]
---
The cleanups should cover most of it -- there may be more we can do
later e.g. in linux-next.

Most patches are optional, so if there are concerns with any, they can
be dropped or be done later. Most are straightforward, though, and e.g.
a couple of them update TODO comments to keep the series even simpler.

The patches have been split as much as possible to be able to add as
much context as possible and to make it easier to review and to drop any
if needed.

All in all, it is a nice `--stat` of deletions I think :)

Alice Ryhl (1):
  rust: declare cfi_encoding for lru_status

Miguel Ojeda (32):
  rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
  rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
  rust: simplify `RUSTC_VERSION` Kconfig conditions
  rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
  rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
  rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
  rust: kbuild: remove `feature(...)`s that are now stable
  rust: kbuild: simplify `--remap-path-prefix` workaround
  rust: kbuild: make `--remap-path-prefix` workaround conditional
  rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
  rust: alloc: simplify with `NonNull::add()` now that it is stable
  rust: macros: update `extract_if` MSRV TODO comment
  rust: block: update `const_refs_to_static` MSRV TODO comment
  rust: bump `bindgen` minimum supported version to 0.71.1 (Debian
    Trixie)
  rust: rust_is_available: remove warning for 0.66.[01] buggy versions
  rust: rust_is_available: remove warning for < 0.69.5 && libclang >=
    19.1
  rust: kbuild: update `bindgen --rust-target` version and replace
    comment
  rust: kbuild: remove "dummy parameter" workaround for `bindgen` <
    0.71.1
  rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
  rust: kbuild: remove unneeded old `allow`s for generated layout tests
  gpu: nova-core: bindings: remove unneeded `cfg_attr`
  docs: rust: quick-start: openSUSE provides `rust-src` package nowadays
  docs: rust: quick-start: update Ubuntu versioned packages
  docs: rust: quick-start: update minimum Ubuntu version
  docs: rust: quick-start: add Ubuntu 26.04 LTS and remove subsection
    title
  docs: rust: quick-start: remove Gentoo "testing" note
  docs: rust: quick-start: remove Nix "unstable channel" note
  docs: rust: quick-start: remove GDB/Binutils mention
  docs: rust: general-information: simplify Kconfig example
  docs: rust: general-information: use real example
  rust: kbuild: support global per-version flags
  rust: kbuild: allow `clippy::precedence` for Rust < 1.86.0

 .clippy.toml                                  |  2 +-
 Documentation/process/changes.rst             |  4 +-
 Documentation/rust/general-information.rst    |  4 +-
 Documentation/rust/quick-start.rst            | 52 +++++++----------
 Makefile                                      |  9 +++
 arch/Kconfig                                  |  3 +-
 arch/arm64/Kconfig                            |  8 ---
 arch/riscv/Kconfig                            |  3 -
 drivers/android/binder/Makefile               |  3 +-
 drivers/android/binder/page_range.rs          |  6 +-
 drivers/android/binder/page_range_helper.c    | 24 --------
 drivers/android/binder/page_range_helper.h    | 15 -----
 drivers/gpu/nova-core/gsp/cmdq.rs             |  6 +-
 drivers/gpu/nova-core/gsp/fw/r570_144.rs      |  3 -
 init/Kconfig                                  | 15 +----
 rust/Makefile                                 | 36 ++++--------
 rust/bindgen_parameters                       |  8 +--
 rust/bindings/bindings_helper.h               |  1 -
 rust/bindings/lib.rs                          |  5 +-
 rust/kernel/alloc/allocator/iter.rs           |  8 +--
 rust/kernel/alloc/kbox.rs                     | 29 +---------
 rust/kernel/block/mq/gen_disk.rs              |  4 +-
 rust/kernel/lib.rs                            | 30 +---------
 rust/kernel/list/arc.rs                       | 22 +------
 rust/kernel/prelude.rs                        |  3 -
 rust/kernel/ptr.rs                            |  1 -
 rust/kernel/slice.rs                          | 49 ----------------
 rust/kernel/sync/arc.rs                       | 21 +------
 rust/kernel/transmute.rs                      | 35 ++---------
 rust/macros/kunit.rs                          |  2 +-
 rust/uapi/lib.rs                              |  5 +-
 scripts/Makefile.build                        |  6 +-
 scripts/min-tool-version.sh                   |  4 +-
 scripts/rust_is_available.sh                  | 36 +-----------
 scripts/rust_is_available_bindgen_0_66.h      |  2 -
 ...ust_is_available_bindgen_libclang_concat.h |  3 -
 scripts/rust_is_available_test.py             | 58 +------------------
 37 files changed, 79 insertions(+), 446 deletions(-)
 delete mode 100644 drivers/android/binder/page_range_helper.c
 delete mode 100644 drivers/android/binder/page_range_helper.h
 delete mode 100644 rust/kernel/slice.rs
 delete mode 100644 scripts/rust_is_available_bindgen_0_66.h
 delete mode 100644 scripts/rust_is_available_bindgen_libclang_concat.h

--
2.53.0

