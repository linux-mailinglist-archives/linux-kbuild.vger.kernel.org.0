Return-Path: <linux-kbuild+bounces-12478-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFeuAk4JzWm3ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12478-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:02:22 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4FD37A0E3
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:02:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 100173015E1F
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:47:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D81E3402432;
	Wed,  1 Apr 2026 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ht/pJf8b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BCB324B16;
	Wed,  1 Apr 2026 11:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044034; cv=none; b=XLBOFgl6jTGu/dzASG7SJ/Z59j+ZOcpVy7KAlzFwYys6GWjX88vMj3+NBZD3Z8dzHZEyh6GzUp1hluqVtnqM60sNIcMtmPGc6+rAO3BCWfB+pVDfYE/zHh27lUhz8EwHt7KqHjWRoUpkzeq6NXGC9r6mdn+DhyCP/MmDb3jZoHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044034; c=relaxed/simple;
	bh=4gM8Ng4dI5voGspd2MW/G8qAzYExygP7OS8buaoRZDg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rsekS2W0BRtVHZky3zdzksU1FFSS/kBPfpb0bv072yDRl8bdc8ovCaG3vLrxbKygp+hnc4I3ao6aB71E54DDthVM04vaHCO2OEjA+AUwIeJPqzI9kkVqKUeuYg2Dkskx8iGxOsKIN+VBqW0vfY12CWEUGyn7Z6R0WFXU/Fof9VE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ht/pJf8b; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 439C6C4CEF7;
	Wed,  1 Apr 2026 11:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044034;
	bh=4gM8Ng4dI5voGspd2MW/G8qAzYExygP7OS8buaoRZDg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ht/pJf8bo8MwxgismJjbcH0DxRn7Lj//fl6ay0HnlmCjRYtIgG8EVgO1pndmfJvmX
	 knXYuXYh9VlrrWlM4STAZn3sQOBumFGD85l8NUcLqK6B4M8x67BxO2fXILzhN4B2BU
	 awW9tkXIImmGo6T6kf3CMLsydwKRFrCShSbshmJZdMTwdZlS8hx070+c6T0k/sjoJA
	 qrli+3YzdEjOuYYWmi7/eX+fS3nR0X9qLxqa7lkA0sqbxR7ZpQRP16hFBijOa7+Glw
	 UKfSOaXg7JBTS7dRCgMgcJxLilLRa8EraZkF2TMfGDuB2LngUIWnuMKHmQ5S0tMkkv
	 QSVzdTlSUbKJw==
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
Subject: [PATCH 06/33] rust: kbuild: remove skipping of `-Wrustdoc::unescaped_backticks`
Date: Wed,  1 Apr 2026 13:45:13 +0200
Message-ID: <20260401114540.30108-7-ojeda@kernel.org>
In-Reply-To: <20260401114540.30108-1-ojeda@kernel.org>
References: <20260401114540.30108-1-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12478-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.997];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B4FD37A0E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Back in Rust 1.82.0, I cleaned the `rustdoc::unescaped_backticks` lint in
upstream Rust and added tests so that hopefully it would not regress [1].

Thus we can remove it from our side given the Rust minimum version bump.

Link: https://github.com/rust-lang/rust/pull/128307 [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/Makefile | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 5eca6a817966..212759b5eb7d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -75,8 +75,7 @@ core-edition := $(if $(call rustc-min-version,108700),2024,2021)
 
 core-skip_flags := \
     --edition=2021 \
-    -Wunreachable_pub \
-    -Wrustdoc::unescaped_backticks
+    -Wunreachable_pub
 
 core-flags := \
     --edition=$(core-edition) \
@@ -213,8 +212,6 @@ rustdoc-macros: $(src)/macros/lib.rs rustdoc-clean rustdoc-proc_macro2 \
     rustdoc-quote rustdoc-syn FORCE
 	+$(call if_changed,rustdoc)
 
-# Starting with Rust 1.82.0, skipping `-Wrustdoc::unescaped_backticks` should
-# not be needed -- see https://github.com/rust-lang/rust/pull/128307.
 rustdoc-core: private skip_flags = $(core-skip_flags)
 rustdoc-core: private rustc_target_flags = $(core-flags)
 rustdoc-core: $(RUST_LIB_SRC)/core/src/lib.rs rustdoc-clean FORCE
-- 
2.53.0


