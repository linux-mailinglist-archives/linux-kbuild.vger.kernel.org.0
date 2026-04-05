Return-Path: <linux-kbuild+bounces-12666-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uJgHL8z30mnjcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12666-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:01:16 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 352253A0AD4
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:01:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D27263025D01
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:57:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D165F38553C;
	Sun,  5 Apr 2026 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjMfFJzy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A835D38552A;
	Sun,  5 Apr 2026 23:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433431; cv=none; b=cevobHQhG3oC/FoAH73VmcX7AJn2WVMXLTCEiQFgIFFS/ixg+jRkNMpF4cpHGKggzewzWA0SWQSBOQeLgQYj9WJ3JFHHLdBMmfFOiZgS/yFOem4LDCUy0ygrVVccDrM+JmOMxmZrpOAw7e+m3Bp6s4x9nz/hB1nra5H5+14nEO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433431; c=relaxed/simple;
	bh=IRt9MhYeBO0++hWWCjmyX0eYSozz5sufq57E0UcpLrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jXmKhWD3bHUjlazR7KAnfwHR0lsMgMHNPhNOkOv3YK/cnWPHA3L+aakDWjtTfQEdZC6JvFJ/ZZ1k6oNIZZ2prF/0vI2Q+GY45jDn20Fkja8uu/Hh8ZC4g0vNcZzJlRjGMOs3gUZ3QD9+Fv2gIahywgW6HojILDo6LfeIJfyaXu0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjMfFJzy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D849BC2BC9E;
	Sun,  5 Apr 2026 23:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433431;
	bh=IRt9MhYeBO0++hWWCjmyX0eYSozz5sufq57E0UcpLrc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sjMfFJzy5gkgRHkNpL+Rrzg29TE6lfhKgKvGE/mRM4pSeUJKdNXGRzwTBpSsWjZxF
	 5TcuobtvROn3nG8N8jTFVTYyBbdd4WJ8k3PoxaWn2JRFtEayqFJJ+TyEHWBr4ixb6d
	 huAo6J2g/V9pJIndQG8BbX2FDy7/Swlfqo0yCCLL/nqEuQWO4h8ZB2UTc/+FCi6TKn
	 J53d7PSkxc/4XOykjk3qZn9OAY3uq5SdOumTONU7QLdwZfA78JXqUAWFOHTcTMeC/8
	 ZZ4WD6SNGpjWYRUf1wSyCCrmyZscYQRP2ps7rZ7YD2RE4RNR0qpCl4FKzDJ9XT5JWN
	 orKj9ro+iCbvw==
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
	linux-doc@vger.kernel.org,
	Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 20/33] rust: kbuild: update `bindgen --rust-target` version and replace comment
Date: Mon,  6 Apr 2026 01:52:56 +0200
Message-ID: <20260405235309.418950-21-ojeda@kernel.org>
In-Reply-To: <20260405235309.418950-1-ojeda@kernel.org>
References: <20260405235309.418950-1-ojeda@kernel.org>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12666-lists,linux-kbuild=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,arm.com,dabbelt.com,eecs.berkeley.edu,nvidia.com,gmail.com,ffwll.ch,linux.dev,davidgow.net,linuxfoundation.org,android.com,brauner.io,google.com,lwn.net];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[ojeda@kernel.org,linux-kbuild@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	TO_DN_SOME(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zulipchat.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 352253A0AD4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

As the comment in the `Makefile` explains, previously, we needed to
limit ourselves to the list of Rust versions known by `bindgen` for its
`--rust-target` option [1].

In other words, we needed to consult the versions known by the minimum
version of `bindgen` that we supported.

Now that we bumped the minimum version of `bindgen`, that limitation
does not apply anymore since `bindgen` 0.71.0 [2].

Thus replace the comment and simply write our minimum supported Rust
version there, which is much simpler.

See commit 7a5f93ea5862 ("rust: kbuild: set `bindgen`'s Rust target
version") for more details.

Link: https://rust-lang.zulipchat.com/#narrow/channel/425075-rust-for-linux/topic/rust.20version.20on.20generated.20bindings/near/484087179 [1]
Link: https://github.com/rust-lang/rust-bindgen/pull/2993 [2]
Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 54498cb5b851..866f9afc1b7f 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -441,22 +441,10 @@ endif
 # architecture instead of generating `usize`.
 bindgen_c_flags_final = $(bindgen_c_flags_lto) -fno-builtin -D__BINDGEN__
 
-# Each `bindgen` release may upgrade the list of Rust target versions. By
-# default, the highest stable release in their list is used. Thus we need to set
-# a `--rust-target` to avoid future `bindgen` releases emitting code that
-# `rustc` may not understand. On top of that, `bindgen` does not support passing
-# an unknown Rust target version.
-#
-# Therefore, the Rust target for `bindgen` can be only as high as the minimum
-# Rust version the kernel supports and only as high as the greatest stable Rust
-# target supported by the minimum `bindgen` version the kernel supports (that
-# is, if we do not test the actual `rustc`/`bindgen` versions running).
-#
-# Starting with `bindgen` 0.71.0, we will be able to set any future Rust version
-# instead, i.e. we will be able to set here our minimum supported Rust version.
+# `--rust-target` points to our minimum supported Rust version.
 quiet_cmd_bindgen = BINDGEN $@
       cmd_bindgen = \
-	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.68 \
+	$(BINDGEN) $< $(bindgen_target_flags) --rust-target 1.85 \
 		--use-core --with-derive-default --ctypes-prefix ffi --no-layout-tests \
 		--no-debug '.*' --enable-function-attribute-detection \
 		-o $@ -- $(bindgen_c_flags_final) -DMODULE \
-- 
2.53.0


