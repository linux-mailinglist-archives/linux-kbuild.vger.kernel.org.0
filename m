Return-Path: <linux-kbuild+bounces-13620-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lWC3F93QJmoSlAIAu9opvQ
	(envelope-from <linux-kbuild+bounces-13620-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:25:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D4C5F657249
	for <lists+linux-kbuild@lfdr.de>; Mon, 08 Jun 2026 16:25:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=jN5ywbWH;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13620-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13620-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id ADD0C305FC5B
	for <lists+linux-kbuild@lfdr.de>; Mon,  8 Jun 2026 14:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 008FB3CBE66;
	Mon,  8 Jun 2026 14:15:20 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A31AD3CB2D2;
	Mon,  8 Jun 2026 14:15:17 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780928119; cv=none; b=iq1jDw25WgT/APYdRc25y0bK9Q7HR1+dtUIXmAwb5NKs1r/mAUI3Wz9S3+dcvSzzWi3Tjk1hMpvWssxwIgisjeE7HIm+Vfc8VnGgK34zjm6XMwXvO1nknifvL6+gr2PMTsnn0pAWgxOWGhi8Dxo7CeK5p+YC6GcB3UfoxD2FII0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780928119; c=relaxed/simple;
	bh=OhYjuL3a6RByQn/fLy+YV9TeOhUXnti6ZGlHM5tdreM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Iu2MWpDGUIykiU5RhmRvwj1AYgx7ytrJGq+xn2BdJluoshQOu9LVgyC3COpDaGqCbG3wQSgzdWqOu4D/Vi3Z8wfZD+vtyBR7NROsPwd7MF1X/T85arBixjvFCrq1WWQDzYsZg2IPbx1GMlmS6mIBX/d4tf1mOv4Itgf955D2BI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jN5ywbWH; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B4A71F00893;
	Mon,  8 Jun 2026 14:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780928117;
	bh=qPPfxcXEqqSIVQzD5Ic3EJyALBV3ZKlJPzkHVk6d2Mg=;
	h=From:To:Cc:Subject:Date;
	b=jN5ywbWHeFK8tGaDaV83Y6P9fkJgFKleQsyJvzUW5G7clLZo77U/7cTCNaTPhFrJD
	 zxkyXxqmCBMcnmGsXn7b0GgqM/AMzBKNoxf+wNY5dZRbo/1Tp7pz/mwFcFy7D/5s4W
	 YAt3pBs3EMwb4pAkSU/+OvJHPeTQbYAwkqYZpIPeMp72PSHD7BrNGl7rKPou3zZwY7
	 NJMnLdv+VFowyVxKx4S3mvnur8FPLqRMq56uK5ezAPjhMXtDxoG/cbhkgi201fGqvx
	 JTTMMt+2wIKzqp2BZR8YuGhR2VwL9C4x14OBzcNzsSH+guHX+1zb2PABfbqH7IBmm5
	 8RY0sD1mDTWng==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	Joshua Liebow-Feeser <joshlf@google.com>,
	Jack Wrenn <jswrenn@google.com>
Subject: [PATCH v2 00/19] `zerocopy` support
Date: Mon,  8 Jun 2026 16:14:19 +0200
Message-ID: <20260608141439.182634-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-13620-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@google.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,crates.io:url,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D4C5F657249

This patch series introduces support for `zerocopy`:

    Fast, safe, compile error. Pick two.

    Zerocopy makes zero-cost memory manipulation effortless. We write
    `unsafe` so you don't have to.

It essentially provides derivable traits (e.g. `FromBytes`) and macros
(e.g. `transmute!`) for safely converting between byte sequences and
other types. Having such support allows us to remove some `unsafe` code.

It is among the most downloaded Rust crates (top #50 recent, top #100
all-time downloads; according to crates.io), and it is also used by the
Rust compiler itself.

The series starts with a few preparation commits, then the `zerocopy`
and `zerocopy-derive` crates are added. Finally, an example patch using
it is on top, removing one `unsafe impl`.

I had to adapt the crates slightly (just +2/-3 lines), but both patches
could potentially be provided upstream eventually. Please see the
commits for details.

In total, it is about ~39k lines added, ~32k without counting `benches/`
which are just for documentation purposes.

See the cover letter for `syn` for some more details about depending on
third-party crates in commit 54e3eae85562 ("Merge patch series "`syn`
support"").

The codegen of an isolated example function similar to the patch on top
is essentially identical. It also turns out that (for that particular
case) `zerocopy`'s version, even under `debug-assertions` enabled, has
no remaining panics, unlike a few in the current code (because the
compiler can prove the remaining `ub_checks` statically).

So their "fast, safe" does indeed check out -- at least in that case.

P.S. This version of `zerocopy` has already the unstable `Ptr{,Inner}`
types -- to play with them, please use:

    make ... KRUSTFLAGS=--cfg=zerocopy_unstable_ptr

---
I will apply v2 for tomorrow's linux-next.

v2:
  - Added `zerocopy{,_derive}::FromBytes` to prelude (new commit).
  - Avoid qualified names in the nova-core example as discussed.
  - Add `rustc_target_envs` to more commands for completeness.
  - Simplify using dictionary unpacking.
  - Added details and links about the upstream issues and PRs filed and
    the latest state on the discussion around our crate tweaks.
  - Update Jack's email.

v1: https://lore.kernel.org/rust-for-linux/20260602172920.30342-1-ojeda@kernel.org/

Miguel Ojeda (19):
  scripts: generate_rust_analyzer: support passing env vars
  rust: kbuild: show the right `quiet_cmd_rustc_procmacrolibrary`
  rust: kbuild: remove unused variable
  rust: kbuild: define `procmacro-name` function
  rust: kbuild: define `procmacro-extension` variable
  rust: kbuild: support per-target environment variables
  rust: kbuild: support `skip_clippy` for `rustc_procmacro`
  rust: zerocopy: import crate
  rust: zerocopy: add SPDX License Identifiers
  rust: zerocopy: remove float `Display` support
  rust: zerocopy: add `README.md`
  rust: zerocopy: enable support in kbuild
  rust: zerocopy-derive: import crate
  rust: zerocopy-derive: add SPDX License Identifiers
  rust: zerocopy-derive: avoid generating non-ASCII identifiers
  rust: zerocopy-derive: add `README.md`
  rust: zerocopy-derive: enable support in kbuild
  rust: prelude: add `zerocopy{,_derive}::FromBytes`
  gpu: nova-core: firmware: parse `FalconUCodeDescV2` via `zerocopy`

 Makefile                                      |    2 +
 drivers/gpu/nova-core/firmware.rs             |    5 +-
 drivers/gpu/nova-core/vbios.rs                |    6 +-
 rust/Makefile                                 |   96 +-
 rust/kernel/prelude.rs                        |    6 +
 rust/zerocopy-derive/README.md                |   14 +
 rust/zerocopy-derive/derive/from_bytes.rs     |  192 +
 rust/zerocopy-derive/derive/into_bytes.rs     |  164 +
 rust/zerocopy-derive/derive/known_layout.rs   |  350 +
 rust/zerocopy-derive/derive/mod.rs            |  132 +
 rust/zerocopy-derive/derive/try_from_bytes.rs |  765 ++
 rust/zerocopy-derive/derive/unaligned.rs      |   80 +
 rust/zerocopy-derive/lib.rs                   |  146 +
 rust/zerocopy-derive/repr.rs                  |  851 ++
 rust/zerocopy-derive/util.rs                  |  845 ++
 rust/zerocopy/README.md                       |   14 +
 .../zerocopy/benches/as_bytes_dynamic_size.rs |    9 +
 .../benches/as_bytes_dynamic_size.x86-64      |    5 +
 .../benches/as_bytes_dynamic_size.x86-64.mca  |   47 +
 rust/zerocopy/benches/as_bytes_static_size.rs |    9 +
 .../benches/as_bytes_static_size.x86-64       |    4 +
 .../benches/as_bytes_static_size.x86-64.mca   |   45 +
 rust/zerocopy/benches/extend_vec_zeroed.rs    |    9 +
 .../zerocopy/benches/extend_vec_zeroed.x86-64 |   60 +
 .../benches/extend_vec_zeroed.x86-64.mca      |  147 +
 .../benches/formats/coco_dynamic_padding.rs   |   24 +
 .../benches/formats/coco_dynamic_size.rs      |   27 +
 .../benches/formats/coco_static_size.rs       |   27 +
 rust/zerocopy/benches/insert_vec_zeroed.rs    |   13 +
 .../zerocopy/benches/insert_vec_zeroed.x86-64 |   79 +
 .../benches/insert_vec_zeroed.x86-64.mca      |  183 +
 rust/zerocopy/benches/new_box_zeroed.rs       |    9 +
 rust/zerocopy/benches/new_box_zeroed.x86-64   |    7 +
 .../benches/new_box_zeroed.x86-64.mca         |   51 +
 ...w_box_zeroed_with_elems_dynamic_padding.rs |   11 +
 ...x_zeroed_with_elems_dynamic_padding.x86-64 |   24 +
 ...roed_with_elems_dynamic_padding.x86-64.mca |   81 +
 .../new_box_zeroed_with_elems_dynamic_size.rs |    9 +
 ..._box_zeroed_with_elems_dynamic_size.x86-64 |   22 +
 ..._zeroed_with_elems_dynamic_size.x86-64.mca |   77 +
 rust/zerocopy/benches/new_vec_zeroed.rs       |    9 +
 rust/zerocopy/benches/new_vec_zeroed.x86-64   |   40 +
 .../benches/new_vec_zeroed.x86-64.mca         |  113 +
 rust/zerocopy/benches/new_zeroed.rs           |    9 +
 rust/zerocopy/benches/new_zeroed.x86-64       |    3 +
 rust/zerocopy/benches/new_zeroed.x86-64.mca   |   43 +
 rust/zerocopy/benches/read_from_bytes.rs      |    7 +
 rust/zerocopy/benches/read_from_bytes.x86-64  |   15 +
 .../benches/read_from_bytes.x86-64.mca        |   65 +
 rust/zerocopy/benches/read_from_prefix.rs     |   10 +
 rust/zerocopy/benches/read_from_prefix.x86-64 |   14 +
 .../benches/read_from_prefix.x86-64.mca       |   63 +
 rust/zerocopy/benches/read_from_suffix.rs     |   10 +
 rust/zerocopy/benches/read_from_suffix.x86-64 |   15 +
 .../benches/read_from_suffix.x86-64.mca       |   65 +
 .../benches/ref_from_bytes_dynamic_padding.rs |    7 +
 .../ref_from_bytes_dynamic_padding.x86-64     |   22 +
 .../ref_from_bytes_dynamic_padding.x86-64.mca |   77 +
 .../benches/ref_from_bytes_dynamic_size.rs    |    7 +
 .../ref_from_bytes_dynamic_size.x86-64        |   20 +
 .../ref_from_bytes_dynamic_size.x86-64.mca    |   75 +
 .../benches/ref_from_bytes_static_size.rs     |    7 +
 .../benches/ref_from_bytes_static_size.x86-64 |    8 +
 .../ref_from_bytes_static_size.x86-64.mca     |   53 +
 ...f_from_bytes_with_elems_dynamic_padding.rs |   10 +
 ...om_bytes_with_elems_dynamic_padding.x86-64 |   19 +
 ...ytes_with_elems_dynamic_padding.x86-64.mca |   71 +
 .../ref_from_bytes_with_elems_dynamic_size.rs |   10 +
 ..._from_bytes_with_elems_dynamic_size.x86-64 |   16 +
 ...m_bytes_with_elems_dynamic_size.x86-64.mca |   65 +
 .../ref_from_prefix_dynamic_padding.rs        |   10 +
 .../ref_from_prefix_dynamic_padding.x86-64    |   22 +
 ...ref_from_prefix_dynamic_padding.x86-64.mca |   77 +
 .../benches/ref_from_prefix_dynamic_size.rs   |   10 +
 .../ref_from_prefix_dynamic_size.x86-64       |   17 +
 .../ref_from_prefix_dynamic_size.x86-64.mca   |   67 +
 .../benches/ref_from_prefix_static_size.rs    |   10 +
 .../ref_from_prefix_static_size.x86-64        |    8 +
 .../ref_from_prefix_static_size.x86-64.mca    |   53 +
 ..._from_prefix_with_elems_dynamic_padding.rs |   13 +
 ...m_prefix_with_elems_dynamic_padding.x86-64 |   26 +
 ...efix_with_elems_dynamic_padding.x86-64.mca |   85 +
 ...ref_from_prefix_with_elems_dynamic_size.rs |   13 +
 ...from_prefix_with_elems_dynamic_size.x86-64 |   22 +
 ..._prefix_with_elems_dynamic_size.x86-64.mca |   77 +
 .../ref_from_suffix_dynamic_padding.rs        |   10 +
 .../ref_from_suffix_dynamic_padding.x86-64    |   23 +
 ...ref_from_suffix_dynamic_padding.x86-64.mca |   79 +
 .../benches/ref_from_suffix_dynamic_size.rs   |   10 +
 .../ref_from_suffix_dynamic_size.x86-64       |   13 +
 .../ref_from_suffix_dynamic_size.x86-64.mca   |   63 +
 .../benches/ref_from_suffix_static_size.rs    |   10 +
 .../ref_from_suffix_static_size.x86-64        |   13 +
 .../ref_from_suffix_static_size.x86-64.mca    |   61 +
 ..._from_suffix_with_elems_dynamic_padding.rs |   13 +
 ...m_suffix_with_elems_dynamic_padding.x86-64 |   27 +
 ...ffix_with_elems_dynamic_padding.x86-64.mca |   85 +
 ...ref_from_suffix_with_elems_dynamic_size.rs |   13 +
 ...from_suffix_with_elems_dynamic_size.x86-64 |   23 +
 ..._suffix_with_elems_dynamic_size.x86-64.mca |   77 +
 .../benches/split_at_dynamic_padding.rs       |   12 +
 .../benches/split_at_dynamic_padding.x86-64   |   12 +
 .../split_at_dynamic_padding.x86-64.mca       |   59 +
 .../zerocopy/benches/split_at_dynamic_size.rs |   12 +
 .../benches/split_at_dynamic_size.x86-64      |   12 +
 .../benches/split_at_dynamic_size.x86-64.mca  |   59 +
 .../split_at_unchecked_dynamic_padding.rs     |   12 +
 .../split_at_unchecked_dynamic_padding.x86-64 |    6 +
 ...it_at_unchecked_dynamic_padding.x86-64.mca |   49 +
 .../split_at_unchecked_dynamic_size.rs        |   12 +
 .../split_at_unchecked_dynamic_size.x86-64    |    6 +
 ...split_at_unchecked_dynamic_size.x86-64.mca |   49 +
 .../split_via_immutable_dynamic_padding.rs    |   11 +
 ...split_via_immutable_dynamic_padding.x86-64 |   14 +
 ...t_via_immutable_dynamic_padding.x86-64.mca |   65 +
 .../split_via_immutable_dynamic_size.rs       |   11 +
 .../split_via_immutable_dynamic_size.x86-64   |   13 +
 ...plit_via_immutable_dynamic_size.x86-64.mca |   63 +
 ...split_via_runtime_check_dynamic_padding.rs |   11 +
 ...t_via_runtime_check_dynamic_padding.x86-64 |   22 +
 ...a_runtime_check_dynamic_padding.x86-64.mca |   79 +
 .../split_via_runtime_check_dynamic_size.rs   |   11 +
 ...plit_via_runtime_check_dynamic_size.x86-64 |   13 +
 ..._via_runtime_check_dynamic_size.x86-64.mca |   63 +
 .../split_via_unchecked_dynamic_padding.rs    |   11 +
 ...split_via_unchecked_dynamic_padding.x86-64 |   14 +
 ...t_via_unchecked_dynamic_padding.x86-64.mca |   65 +
 .../split_via_unchecked_dynamic_size.rs       |   11 +
 .../split_via_unchecked_dynamic_size.x86-64   |   13 +
 ...plit_via_unchecked_dynamic_size.x86-64.mca |   63 +
 rust/zerocopy/benches/transmute.rs            |   16 +
 rust/zerocopy/benches/transmute.x86-64        |    3 +
 rust/zerocopy/benches/transmute.x86-64.mca    |   43 +
 .../benches/transmute_ref_dynamic_size.rs     |   16 +
 .../benches/transmute_ref_dynamic_size.x86-64 |    4 +
 .../transmute_ref_dynamic_size.x86-64.mca     |   45 +
 .../benches/transmute_ref_static_size.rs      |   15 +
 .../benches/transmute_ref_static_size.x86-64  |    3 +
 .../transmute_ref_static_size.x86-64.mca      |   43 +
 rust/zerocopy/benches/try_read_from_bytes.rs  |    7 +
 .../benches/try_read_from_bytes.x86-64        |   23 +
 .../benches/try_read_from_bytes.x86-64.mca    |   79 +
 rust/zerocopy/benches/try_read_from_prefix.rs |   10 +
 .../benches/try_read_from_prefix.x86-64       |   16 +
 .../benches/try_read_from_prefix.x86-64.mca   |   67 +
 rust/zerocopy/benches/try_read_from_suffix.rs |   10 +
 .../benches/try_read_from_suffix.x86-64       |   18 +
 .../benches/try_read_from_suffix.x86-64.mca   |   71 +
 .../try_ref_from_bytes_dynamic_padding.rs     |    7 +
 .../try_ref_from_bytes_dynamic_padding.x86-64 |   24 +
 ..._ref_from_bytes_dynamic_padding.x86-64.mca |   81 +
 .../try_ref_from_bytes_dynamic_size.rs        |    7 +
 .../try_ref_from_bytes_dynamic_size.x86-64    |   22 +
 ...try_ref_from_bytes_dynamic_size.x86-64.mca |   79 +
 .../benches/try_ref_from_bytes_static_size.rs |    7 +
 .../try_ref_from_bytes_static_size.x86-64     |   13 +
 .../try_ref_from_bytes_static_size.x86-64.mca |   59 +
 ...f_from_bytes_with_elems_dynamic_padding.rs |   10 +
 ...om_bytes_with_elems_dynamic_padding.x86-64 |   21 +
 ...ytes_with_elems_dynamic_padding.x86-64.mca |   75 +
 ..._ref_from_bytes_with_elems_dynamic_size.rs |   10 +
 ..._from_bytes_with_elems_dynamic_size.x86-64 |   18 +
 ...m_bytes_with_elems_dynamic_size.x86-64.mca |   69 +
 .../try_ref_from_prefix_dynamic_padding.rs    |   10 +
 ...try_ref_from_prefix_dynamic_padding.x86-64 |   29 +
 ...ref_from_prefix_dynamic_padding.x86-64.mca |   91 +
 .../try_ref_from_prefix_dynamic_size.rs       |   10 +
 .../try_ref_from_prefix_dynamic_size.x86-64   |   22 +
 ...ry_ref_from_prefix_dynamic_size.x86-64.mca |   77 +
 .../try_ref_from_prefix_static_size.rs        |   10 +
 .../try_ref_from_prefix_static_size.x86-64    |   15 +
 ...try_ref_from_prefix_static_size.x86-64.mca |   63 +
 ..._from_prefix_with_elems_dynamic_padding.rs |   13 +
 ...m_prefix_with_elems_dynamic_padding.x86-64 |   30 +
 ...efix_with_elems_dynamic_padding.x86-64.mca |   91 +
 ...ref_from_prefix_with_elems_dynamic_size.rs |   13 +
 ...from_prefix_with_elems_dynamic_size.x86-64 |   26 +
 ..._prefix_with_elems_dynamic_size.x86-64.mca |   83 +
 .../try_ref_from_suffix_dynamic_padding.rs    |   10 +
 ...try_ref_from_suffix_dynamic_padding.x86-64 |   26 +
 ...ref_from_suffix_dynamic_padding.x86-64.mca |   85 +
 .../try_ref_from_suffix_dynamic_size.rs       |   10 +
 .../try_ref_from_suffix_dynamic_size.x86-64   |   18 +
 ...ry_ref_from_suffix_dynamic_size.x86-64.mca |   71 +
 .../try_ref_from_suffix_static_size.rs        |   10 +
 .../try_ref_from_suffix_static_size.x86-64    |   16 +
 ...try_ref_from_suffix_static_size.x86-64.mca |   67 +
 ..._from_suffix_with_elems_dynamic_padding.rs |   13 +
 ...m_suffix_with_elems_dynamic_padding.x86-64 |   32 +
 ...ffix_with_elems_dynamic_padding.x86-64.mca |   95 +
 ...ref_from_suffix_with_elems_dynamic_size.rs |   13 +
 ...from_suffix_with_elems_dynamic_size.x86-64 |   28 +
 ..._suffix_with_elems_dynamic_size.x86-64.mca |   87 +
 rust/zerocopy/benches/try_transmute.rs        |   16 +
 rust/zerocopy/benches/try_transmute.x86-64    |    9 +
 .../zerocopy/benches/try_transmute.x86-64.mca |   55 +
 .../benches/try_transmute_ref_dynamic_size.rs |   18 +
 .../try_transmute_ref_dynamic_size.x86-64     |    6 +
 .../try_transmute_ref_dynamic_size.x86-64.mca |   49 +
 .../benches/try_transmute_ref_static_size.rs  |   17 +
 .../try_transmute_ref_static_size.x86-64      |    5 +
 .../try_transmute_ref_static_size.x86-64.mca  |   47 +
 .../zerocopy/benches/write_to_dynamic_size.rs |    9 +
 .../benches/write_to_dynamic_size.x86-64      |   21 +
 .../benches/write_to_dynamic_size.x86-64.mca  |   77 +
 .../benches/write_to_prefix_dynamic_size.rs   |   12 +
 .../write_to_prefix_dynamic_size.x86-64       |   21 +
 .../write_to_prefix_dynamic_size.x86-64.mca   |   77 +
 .../benches/write_to_prefix_static_size.rs    |   12 +
 .../write_to_prefix_static_size.x86-64        |   11 +
 .../write_to_prefix_static_size.x86-64.mca    |   57 +
 rust/zerocopy/benches/write_to_static_size.rs |    9 +
 .../benches/write_to_static_size.x86-64       |   11 +
 .../benches/write_to_static_size.x86-64.mca   |   57 +
 .../benches/write_to_suffix_dynamic_size.rs   |   12 +
 .../write_to_suffix_dynamic_size.x86-64       |   22 +
 .../write_to_suffix_dynamic_size.x86-64.mca   |   79 +
 .../benches/write_to_suffix_static_size.rs    |   12 +
 .../write_to_suffix_static_size.x86-64        |   11 +
 .../write_to_suffix_static_size.x86-64.mca    |   57 +
 rust/zerocopy/benches/zero_dynamic_padding.rs |    9 +
 .../benches/zero_dynamic_padding.x86-64       |    7 +
 .../benches/zero_dynamic_padding.x86-64.mca   |   51 +
 rust/zerocopy/benches/zero_dynamic_size.rs    |    9 +
 .../zerocopy/benches/zero_dynamic_size.x86-64 |    5 +
 .../benches/zero_dynamic_size.x86-64.mca      |   47 +
 rust/zerocopy/benches/zero_static_size.rs     |    9 +
 rust/zerocopy/benches/zero_static_size.x86-64 |    4 +
 .../benches/zero_static_size.x86-64.mca       |   45 +
 rust/zerocopy/rustdoc/style.css               |   57 +
 rust/zerocopy/src/byte_slice.rs               |  434 +
 rust/zerocopy/src/byteorder.rs                | 1564 ++++
 rust/zerocopy/src/deprecated.rs               |  281 +
 rust/zerocopy/src/error.rs                    | 1350 +++
 rust/zerocopy/src/impls.rs                    | 2389 ++++++
 rust/zerocopy/src/layout.rs                   | 2225 +++++
 rust/zerocopy/src/lib.rs                      | 7612 +++++++++++++++++
 rust/zerocopy/src/macros.rs                   | 1825 ++++
 rust/zerocopy/src/pointer/inner.rs            |  754 ++
 rust/zerocopy/src/pointer/invariant.rs        |  298 +
 rust/zerocopy/src/pointer/mod.rs              |  410 +
 rust/zerocopy/src/pointer/ptr.rs              | 1586 ++++
 rust/zerocopy/src/pointer/transmute.rs        |  522 ++
 rust/zerocopy/src/ref.rs                      | 1358 +++
 rust/zerocopy/src/split_at.rs                 | 1090 +++
 rust/zerocopy/src/util/macro_util.rs          | 1310 +++
 rust/zerocopy/src/util/macros.rs              | 1067 +++
 rust/zerocopy/src/util/mod.rs                 |  938 ++
 rust/zerocopy/src/wrappers.rs                 | 1034 +++
 scripts/Makefile.build                        |    1 +
 scripts/generate_rust_analyzer.py             |   38 +-
 251 files changed, 38724 insertions(+), 27 deletions(-)
 create mode 100644 rust/zerocopy-derive/README.md
 create mode 100644 rust/zerocopy-derive/derive/from_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/into_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/known_layout.rs
 create mode 100644 rust/zerocopy-derive/derive/mod.rs
 create mode 100644 rust/zerocopy-derive/derive/try_from_bytes.rs
 create mode 100644 rust/zerocopy-derive/derive/unaligned.rs
 create mode 100644 rust/zerocopy-derive/lib.rs
 create mode 100644 rust/zerocopy-derive/repr.rs
 create mode 100644 rust/zerocopy-derive/util.rs
 create mode 100644 rust/zerocopy/README.md
 create mode 100644 rust/zerocopy/benches/as_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/as_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/as_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/as_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/as_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/as_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/extend_vec_zeroed.rs
 create mode 100644 rust/zerocopy/benches/extend_vec_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/extend_vec_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/formats/coco_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/formats/coco_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/formats/coco_static_size.rs
 create mode 100644 rust/zerocopy/benches/insert_vec_zeroed.rs
 create mode 100644 rust/zerocopy/benches/insert_vec_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/insert_vec_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_box_zeroed.rs
 create mode 100644 rust/zerocopy/benches/new_box_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/new_box_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/new_box_zeroed_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_vec_zeroed.rs
 create mode 100644 rust/zerocopy/benches/new_vec_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/new_vec_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/new_zeroed.rs
 create mode 100644 rust/zerocopy/benches/new_zeroed.x86-64
 create mode 100644 rust/zerocopy/benches/new_zeroed.x86-64.mca
 create mode 100644 rust/zerocopy/benches/read_from_bytes.rs
 create mode 100644 rust/zerocopy/benches/read_from_bytes.x86-64
 create mode 100644 rust/zerocopy/benches/read_from_bytes.x86-64.mca
 create mode 100644 rust/zerocopy/benches/read_from_prefix.rs
 create mode 100644 rust/zerocopy/benches/read_from_prefix.x86-64
 create mode 100644 rust/zerocopy/benches/read_from_prefix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/read_from_suffix.rs
 create mode 100644 rust/zerocopy/benches/read_from_suffix.x86-64
 create mode 100644 rust/zerocopy/benches/read_from_suffix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_bytes_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_prefix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/ref_from_suffix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_at_unchecked_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_immutable_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_runtime_check_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/split_via_unchecked_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/transmute.rs
 create mode 100644 rust/zerocopy/benches/transmute.x86-64
 create mode 100644 rust/zerocopy/benches/transmute.x86-64.mca
 create mode 100644 rust/zerocopy/benches/transmute_ref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/transmute_ref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/transmute_ref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/transmute_ref_static_size.rs
 create mode 100644 rust/zerocopy/benches/transmute_ref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/transmute_ref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_read_from_bytes.rs
 create mode 100644 rust/zerocopy/benches/try_read_from_bytes.x86-64
 create mode 100644 rust/zerocopy/benches/try_read_from_bytes.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_read_from_prefix.rs
 create mode 100644 rust/zerocopy/benches/try_read_from_prefix.x86-64
 create mode 100644 rust/zerocopy/benches/try_read_from_prefix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_read_from_suffix.rs
 create mode 100644 rust/zerocopy/benches/try_read_from_suffix.x86-64
 create mode 100644 rust/zerocopy/benches/try_read_from_suffix.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_bytes_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_prefix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_ref_from_suffix_with_elems_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_transmute.rs
 create mode 100644 rust/zerocopy/benches/try_transmute.x86-64
 create mode 100644 rust/zerocopy/benches/try_transmute.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_static_size.rs
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/try_transmute_ref_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_prefix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_prefix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_prefix_static_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_prefix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_prefix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_static_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_suffix_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_suffix_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/write_to_suffix_static_size.rs
 create mode 100644 rust/zerocopy/benches/write_to_suffix_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/write_to_suffix_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/zero_dynamic_padding.rs
 create mode 100644 rust/zerocopy/benches/zero_dynamic_padding.x86-64
 create mode 100644 rust/zerocopy/benches/zero_dynamic_padding.x86-64.mca
 create mode 100644 rust/zerocopy/benches/zero_dynamic_size.rs
 create mode 100644 rust/zerocopy/benches/zero_dynamic_size.x86-64
 create mode 100644 rust/zerocopy/benches/zero_dynamic_size.x86-64.mca
 create mode 100644 rust/zerocopy/benches/zero_static_size.rs
 create mode 100644 rust/zerocopy/benches/zero_static_size.x86-64
 create mode 100644 rust/zerocopy/benches/zero_static_size.x86-64.mca
 create mode 100644 rust/zerocopy/rustdoc/style.css
 create mode 100644 rust/zerocopy/src/byte_slice.rs
 create mode 100644 rust/zerocopy/src/byteorder.rs
 create mode 100644 rust/zerocopy/src/deprecated.rs
 create mode 100644 rust/zerocopy/src/error.rs
 create mode 100644 rust/zerocopy/src/impls.rs
 create mode 100644 rust/zerocopy/src/layout.rs
 create mode 100644 rust/zerocopy/src/lib.rs
 create mode 100644 rust/zerocopy/src/macros.rs
 create mode 100644 rust/zerocopy/src/pointer/inner.rs
 create mode 100644 rust/zerocopy/src/pointer/invariant.rs
 create mode 100644 rust/zerocopy/src/pointer/mod.rs
 create mode 100644 rust/zerocopy/src/pointer/ptr.rs
 create mode 100644 rust/zerocopy/src/pointer/transmute.rs
 create mode 100644 rust/zerocopy/src/ref.rs
 create mode 100644 rust/zerocopy/src/split_at.rs
 create mode 100644 rust/zerocopy/src/util/macro_util.rs
 create mode 100644 rust/zerocopy/src/util/macros.rs
 create mode 100644 rust/zerocopy/src/util/mod.rs
 create mode 100644 rust/zerocopy/src/wrappers.rs


base-commit: 4fedd76393580ecc61603a986ff4322bf3858dd7
--
2.54.0

