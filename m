Return-Path: <linux-kbuild+bounces-13505-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id oIxCDLYTH2p/fAAAu9opvQ
	(envelope-from <linux-kbuild+bounces-13505-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:32:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C39CA630BBF
	for <lists+linux-kbuild@lfdr.de>; Tue, 02 Jun 2026 19:32:37 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Bm6xdHGD;
	spf=pass (mail.lfdr.de: domain of "linux-kbuild+bounces-13505-lists+linux-kbuild=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-kbuild+bounces-13505-lists+linux-kbuild=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A539E3054204
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Jun 2026 17:30:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9ADAC3FADE2;
	Tue,  2 Jun 2026 17:29:47 +0000 (UTC)
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D3983EAC84;
	Tue,  2 Jun 2026 17:29:44 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780421387; cv=none; b=RSDVWLjAKSsX8ovYnhSJwQwCYe4KJ5op2o1ZQ0MUwxPhN6kcHCpjnd2Iv89CO0a9mmExmSErk3lBNTKml1fjnc5SQAqQrRwYhM6+zylXPbmaZ6SNFLA/kaSKta/y7ccZ6N6zrvpSkX3AcYfC7LpPRzWLTJbICaKp4U9JnF0Jdbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780421387; c=relaxed/simple;
	bh=M5TQNyZY7jnJqKkBLBhhZmsnRkR944MiGZ6ruZ0Nc0s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QrYXYQThqwqtcCC1arue3QLCXDcy7j2DC/8lkFHfylbWIP8jA1LqYbXwkv1nE0918nEzUvCI1FFQ2OJl+PaLt8n5+6avWJ/9Jf3isyM4KVNOqFJt+eG4Ctf/3NqDEtblqDigITjDm2uCjxbFrK8uEeXYmJyJ55iTkyyFcUS282s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bm6xdHGD; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7976C1F00893;
	Tue,  2 Jun 2026 17:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780421384;
	bh=AVjsF/w2zUOey2nZedMcDxRMUVjQTpWSVYopBEmVozg=;
	h=From:To:Cc:Subject:Date;
	b=Bm6xdHGDw54Pea+J3NJmsIPkd0CmizSMoea2lizffXPjSfNa2QNRFh01cL3rhePVm
	 e3xWUWrhseoPUW5wpGpLIxOq/4EN7tuFhvQFlhjXUtTFg51A0rmklVGSA7h3JlgpdB
	 j23kW9XymLqw9GP/ddPCRNyqSgT+IlxuL7tws2pVEM1xnzd5tbOJeRbYRlgubOoz7j
	 B++RvXew6AEbaMUSlrlR82Qh5qF3v0mJ8w4IQkat7NkbaQS5Dp+carJe5Q6ZOPhzKf
	 U6IcvLGrsnsCp6x80bMgeh7HKSHRDKfV5pFWXM9U24/Prud3XfPWPiDMv7Ea/r6MOk
	 LzpL+TuuiQUkA==
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
	Jack Wrenn <jswrenn@amazon.com>
Subject: [PATCH 00/18] `zerocopy` support
Date: Tue,  2 Jun 2026 19:29:01 +0200
Message-ID: <20260602172920.30342-1-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org,amazon.com];
	TAGGED_FROM(0.00)[bounces-13505-lists,linux-kbuild=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:ojeda@kernel.org,m:nathan@kernel.org,m:nsc@kernel.org,m:boqun@kernel.org,m:gary@garyguo.net,m:bjorn3_gh@protonmail.com,m:lossin@kernel.org,m:a.hindborg@kernel.org,m:aliceryhl@google.com,m:tmgross@umich.edu,m:dakr@kernel.org,m:rust-for-linux@vger.kernel.org,m:linux-kbuild@vger.kernel.org,m:joshlf@google.com,m:jswrenn@amazon.com,s:lists@lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,vger.kernel.org:from_smtp,crates.io:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C39CA630BBF

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

Miguel Ojeda (18):
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
  gpu: nova-core: firmware: parse `FalconUCodeDescV2` via `zerocopy`

 Makefile                                      |    2 +
 drivers/gpu/nova-core/firmware.rs             |    5 +-
 drivers/gpu/nova-core/vbios.rs                |    4 +-
 rust/Makefile                                 |   91 +-
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
 250 files changed, 38711 insertions(+), 27 deletions(-)
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


base-commit: 025fd4b4fd382112bd4489e5b4437a295934fc19
--
2.54.0

