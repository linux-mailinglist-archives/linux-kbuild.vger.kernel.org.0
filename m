Return-Path: <linux-kbuild+bounces-11882-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KPVYKjOfsmkOOQAAu9opvQ
	(envelope-from <linux-kbuild+bounces-11882-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 12:10:43 +0100
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603F270ABC
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 12:10:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A208530175D4
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Mar 2026 11:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBC1D26D4CD;
	Thu, 12 Mar 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iaSymw0h"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987A223B63E;
	Thu, 12 Mar 2026 11:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773313839; cv=none; b=UHViGxl7SnyaJSXEbn7SZtRWaMIN37/LIrfCyPaSsS5wcwQnJhNFQvEt+AdJW0QfTbpE9S4FPAuk7Bah8Yb7FJNU2tP8WhD/xMuemJFb8N5sSvMbVNceyClD8ZNWoqV/tKxEnBNWdr+m1rRnulrtyIuPL47vVmuruCTbAKwXqao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773313839; c=relaxed/simple;
	bh=ESJNxdPcEwLq6t+v5MnDRt0e0zR2rwxTiCZ+s4anKgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PI1+6Y0Zxp/rHT5Or0FezVVcRqpzi1UnK5yPU0l8+IDNENI5A3yK0KP+xL495DoxnLW/LZVEF15eeyQ0K1TZtEs3h0X46yAwYqeZ4RAwvQHpQrQGAtxE6EMeV3QpxLT+5NfZ7Zl9DpOJOQPe3D4pkDrzB4IHQYLLGIiROS6mjEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iaSymw0h; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07533C19424;
	Thu, 12 Mar 2026 11:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773313839;
	bh=ESJNxdPcEwLq6t+v5MnDRt0e0zR2rwxTiCZ+s4anKgk=;
	h=From:To:Cc:Subject:Date:From;
	b=iaSymw0h0Mnr4xowek9H5v6glCMJCq0UOSShartUzo6JWlqAegyMxeEIbnKEd01wb
	 R8TymV9Q6eyBquHj+W+rw2AnaHevIkuhYwk1xdhxWgd9BNNuYbdJHWSBX3dbPU8+Sb
	 t/nW8u1k6xMyWyVv/hGzyUuq9k/BhL4OkSORdimzGowmwTa2pWna8ek3kE+JhiyEhO
	 3CfCZpyLBAFBZzPavO8lflW5QBtyiT/xsGE38T6ZbHqZCCsnVH5AxgQ4vnew7LRIL5
	 V0zb9TtxlxcoVO15QakuC+nGGmx4cFK6fmDufN1ZgT4xG3xmWfwITeO1cgZNHtt7sI
	 AO8PaImj6gebQ==
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
	stable@vger.kernel.org
Subject: [PATCH] rust: kbuild: allow `unused_features`
Date: Thu, 12 Mar 2026 12:10:14 +0100
Message-ID: <20260312111014.74198-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-11882-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5603F270ABC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Starting with the upcoming Rust 1.96.0 (to be released 2026-05-28),
`rustc` introduces the new lint `unused_features` [1], which warns [2]:

    warning: feature `used_with_arg` is declared but not used
     --> <crate attribute>:1:93
      |
    1 | #![feature(asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg)]
      |                                                                                             ^^^^^^^^^^^^^
      |
      = note: `#[warn(unused_features)]` (part of `#[warn(unused)]`) on by default

The original goal of using `-Zcrate-attr` automatically was that there
is a consistent set of features enabled and managed globally for all
Rust kernel code (modulo exceptions like the `rust/` crated).

While we could require crates to enable features manually (even if we
still keep the `-Zallow-features=` list, i.e. removing the `-Zcrate-attr`
list), it is not really worth making all developers worry about it just
for a new lint.

The features are expected to eventually become stable anyway (most already
did), and thus having to remove features in every file that may use them
is not worth it either.

Thus just allow the new lint globally.

The lint actually existed for a long time, which is why `rustc` does
not complain about an unknown lint in the stable versions we support,
but it was "disabled" years ago [3], and now it was made to work again.

For extra context, the new implementation of the lint has already been
improved to avoid linting about features that became stable thanks to
Benno's report and the ensuing discussion [4] [5], but while that helps,
it is still the case that we may have features enabled that are not used
for one reason or another in a particular crate.

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Link: https://github.com/rust-lang/rust/pull/152164 [1]
Link: https://github.com/Rust-for-Linux/pin-init/pull/114 [2]
Link: https://github.com/rust-lang/rust/issues/44232 [3]
Link: https://github.com/rust-lang/rust/issues/153523 [4]
Link: https://github.com/rust-lang/rust/pull/153610 [5]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 73a39592f112..587345f16c97 100644
--- a/Makefile
+++ b/Makefile
@@ -476,6 +476,7 @@ KBUILD_USERLDFLAGS := $(USERLDFLAGS)
 export rust_common_flags := --edition=2021 \
 			    -Zbinary_dep_depinfo=y \
 			    -Astable_features \
+			    -Aunused_features \
 			    -Dnon_ascii_idents \
 			    -Dunsafe_op_in_unsafe_fn \
 			    -Wmissing_docs \

base-commit: 487f9b3dc6e507a982f1b984aa6bfbd9dc4b0567
-- 
2.53.0


