Return-Path: <linux-kbuild+bounces-12646-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UHdHGQH20mmLcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12646-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:53:37 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A356B3A04F1
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:53:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AA5CC300252D
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:53:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C6B34253B;
	Sun,  5 Apr 2026 23:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FW6z9J1N"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1B317A30A;
	Sun,  5 Apr 2026 23:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433209; cv=none; b=gxOvvkwVW51hSVwgxqkUGazMR2kwXtRt004DgJq8h7HPQJQWPxscdCAA6rvia9/iUsqBGkuzYi9++o58WwO6l7waHFRrpJ+p/88ou8J5mqhv3bfAMm/mE///B43ZX0oKnbM/TB4JsQluIFu5MIBP55rf/waeR+TLHxznxhy0yxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433209; c=relaxed/simple;
	bh=JAgJZFrMOloqmqyTb3ysTwYFFmGQXVklMDUj4fGUfVo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JbL3pkF+uDdex8WyAosmSU37gyvG49DM31+hzKWHla/t7Xu7PJVj6sGu7jmhf3gEZSBIS6o1vfBBdgZpxjyyyUNSU8Aoq+SMyjqbrlgWHLhGWx+MkuQ8qoABbAs4eo724BN849lvZGZIAjd7nZadvUwbz2gaE8ytxNbsKm5OHD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FW6z9J1N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49DA1C116C6;
	Sun,  5 Apr 2026 23:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433208;
	bh=JAgJZFrMOloqmqyTb3ysTwYFFmGQXVklMDUj4fGUfVo=;
	h=From:To:Cc:Subject:Date:From;
	b=FW6z9J1N/hUJ0BeVzTBIhlbqevS07zFml8CRLdT0rW/zH88ihAk0pUy+w0G1GfFEX
	 n5ab3kkEG0K4k7PxOUY/h8Bq2q/zWhCqsvPLdjpxOIj3D/0Mr+vn6eQcZs+HLXhIbs
	 PHJkvyyo1e71xVAw68Tk2LiW2uWqyCWEA92GAhgpKPJlvuDnuDN/yKeTJ+Wy82e9Sz
	 Y33dDioEDQduesWsl7o/C9suZFqKR2eo2ZK7AkEoxj4xw1Q1ms9xa1UoCTcOx9ZAVy
	 vLQm6kEC7entkKZRd7IbqPmAhcDzrGbl6LB1YLuU9CV6JUuVSk4R/KEy9saT8OUx9T
	 pTjTV4GlNb6pg==
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
Subject: [PATCH v2 00/33] rust: bump minimum Rust and `bindgen` versions
Date: Mon,  6 Apr 2026 01:52:36 +0200
Message-ID: <20260405235309.418950-1-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12646-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lwn.net:url,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A356B3A04F1
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

  - A few cleanups that can be performed before the bumps.
  - The Rust bump (and its cleanups).
  - The `bindgen` bump (and its cleanups).
  - Documentation updates.
  - The `cfi_encoding` patch, added here, which needs the bump.
  - The per-version flags support and a Clippy cleanup on top.

Link: https://lwn.net/Articles/1050174/ [1]
Link: https://www.debian.org/releases/trixie/release-notes/whats-new.en.html#desktops-and-well-known-packages [2]
Link: https://packages.debian.org/trixie/rustc [3]
Link: https://packages.debian.org/trixie/bindgen [4]
Link: https://www.debian.org/releases/trixie/ [5]
---
v1: https://lore.kernel.org/rust-for-linux/20260401114540.30108-1-ojeda@kernel.org/
v2:
  - Added patch to globally allow `incompatible_msrv` and removed the
    last instance.

  - Replaced `--remap-path-prefix` patches with one that drops the
    workaround entirely (and place it as the first one) and summarizes
    the discussion.

    I also noticed that `--remap-path-prefix` for `rustdoc` is still
    unstable (unlike `rustc`'s one), so I added it to our list as usual
    (https://github.com/Rust-for-Linux/linux/issues/2). There does not
    seem to be a tracking issue, so I asked upstream about it.

    We will need these two lines as the resolution for the conflict:

        $(RUSTDOC) $(filter-out $(skip_flags) --remap-path-scope=%,$(if $(rustdoc_host),$(rust_common_flags),$(rust_flags))) \

        $(RUSTDOC) --test $(filter-out --remap-path-scope=%,$(rust_flags)) \

  - Reworked the `extract_if` patch to use it (unstably). The feature
    last major change happened in Rust 1.85.0, so that is fine.

  - Moved `$(HOSTRUSTFLAGS)` below so that per-version flags (like
    lints) can be overridden too. Please see the details in the commit
    and my reply to v1.

  - Added `feature(extract_if)` and `feature(non_null_convenience)`
    items to https://github.com/Rust-for-Linux/linux/issues/1223.

    Then reworded the commits accordingly to include the references
    to tracking issues and PRs.

  - Other rewords, e.g. the "beyond" typo.

  - Rebased on top of `rust-next`.

  - Picked up tags.

Alice Ryhl (1):
  rust: declare cfi_encoding for lru_status

Miguel Ojeda (32):
  rust: kbuild: remove `--remap-path-prefix` workarounds
  rust: kbuild: remove "`try` keyword" workaround for `bindgen` < 0.59.2
  rust: kbuild: remove unneeded old `allow`s for generated layout tests
  gpu: nova-core: bindings: remove unneeded `cfg_attr`
  rust: bump Rust minimum supported version to 1.85.0 (Debian Trixie)
  rust: bump Clippy's MSRV and clean `incompatible_msrv` allows
  rust: allow globally `clippy::incompatible_msrv`
  rust: simplify `RUSTC_VERSION` Kconfig conditions
  rust: remove `RUSTC_HAS_SLICE_AS_FLATTENED` and simplify code
  rust: remove `RUSTC_HAS_COERCE_POINTEE` and simplify code
  rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
  rust: kbuild: remove `feature(...)`s that are now stable
  rust: transmute: simplify code with Rust 1.80.0 `split_at_*checked()`
  rust: alloc: simplify with `NonNull::add()` now that it is stable
  rust: macros: simplify code using `feature(extract_if)`
  rust: block: update `const_refs_to_static` MSRV TODO comment
  rust: bump `bindgen` minimum supported version to 0.71.1 (Debian
    Trixie)
  rust: rust_is_available: remove warning for `bindgen` 0.66.[01]
  rust: rust_is_available: remove warning for `bindgen` < 0.69.5 &&
    libclang >= 19.1
  rust: kbuild: update `bindgen --rust-target` version and replace
    comment
  rust: kbuild: remove "dummy parameter" workaround for `bindgen` <
    0.71.1
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
 Makefile                                      | 12 +++-
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
 rust/Makefile                                 | 31 ++--------
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
 rust/macros/helpers.rs                        |  1 -
 rust/macros/kunit.rs                          |  9 +--
 rust/macros/lib.rs                            |  3 +
 rust/uapi/lib.rs                              |  5 +-
 scripts/Makefile.build                        |  6 +-
 scripts/min-tool-version.sh                   |  4 +-
 scripts/rust_is_available.sh                  | 36 +-----------
 scripts/rust_is_available_bindgen_0_66.h      |  2 -
 ...ust_is_available_bindgen_libclang_concat.h |  3 -
 scripts/rust_is_available_test.py             | 58 +------------------
 39 files changed, 83 insertions(+), 451 deletions(-)
 delete mode 100644 drivers/android/binder/page_range_helper.c
 delete mode 100644 drivers/android/binder/page_range_helper.h
 delete mode 100644 rust/kernel/slice.rs
 delete mode 100644 scripts/rust_is_available_bindgen_0_66.h
 delete mode 100644 scripts/rust_is_available_bindgen_libclang_concat.h


base-commit: 36f5a2b09e650b82d7b2a106e3b93af48c2010d9
--
2.53.0

