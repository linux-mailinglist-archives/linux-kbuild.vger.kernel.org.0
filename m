Return-Path: <linux-kbuild+bounces-12667-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4HdyJvb30mnjcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12667-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:01:58 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BAA3A0B05
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:01:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 612E13007AEF
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28E5738551F;
	Sun,  5 Apr 2026 23:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="llFqKXX3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03EA6385517;
	Sun,  5 Apr 2026 23:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433443; cv=none; b=WRECv2qym/gXUs74R/Ojm3flcxvEVNh7/c6+5hdPn07ApQcPUTrqCR+Dn9wCGohXFHfN4nyf3OFA/LMko9DoXFdVVGVhYcHcJXxMw0iScWVWXauoG6cPpw2+048MS8USK2+PeHMAkQ+8isaMdZvIbrNZPqjrhPRNuveAL5j3HPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433443; c=relaxed/simple;
	bh=XZyHv6AFE6cmv/ci+lWKAs2VwcRp1H9PWrMqDiQ41HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z1yA+OC8FbCaccgKjmhie+DbZ0zytb2QWmOYpEB/mMh+0hp6lhpgx3fp57F0NskmjfLJEQGUJjI13148rdMri7pm5z5bQtsdvgsG7DqiRT9ObTeh9XRkS2QjOpmYw9y7r2WGlqWMEMdlkDJpCM84XODil6XXgVh4MML8PqI4ZIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=llFqKXX3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10949C2BCB3;
	Sun,  5 Apr 2026 23:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433442;
	bh=XZyHv6AFE6cmv/ci+lWKAs2VwcRp1H9PWrMqDiQ41HQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=llFqKXX3BZhcl6VND0xHYadZ8I90nL/Woj5hHanZbnt3IKcLSOJsHvkq4HpI4Wt7r
	 bZVadLLw+nnOLT+Z2kB4ju6MGNAxV0aRKH0P0af8CkwUh6tmO6LXNHSVs5GNb61qHF
	 QSf81p6n8bjtPRo9I+2JrQqrY5n0gUQDEpxwa7TktFW2aRXbee3+U3ZbrFE0Swi4dh
	 fPLZy9FLAI1gPwoqHIz4FoVb/FnJGCdo/fsjAJIgXd//f8g4wp69/OmOZNIf0VClpz
	 e6MvHJFjTyYnZMvfpSV6wxeUhIliIUyz92jABICZcbEVHbnfcORnj/PLOyNgZUpnUX
	 UXHG6CWkmko4g==
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
Subject: [PATCH v2 21/33] rust: kbuild: remove "dummy parameter" workaround for `bindgen` < 0.71.1
Date: Mon,  6 Apr 2026 01:52:57 +0200
Message-ID: <20260405235309.418950-22-ojeda@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-12667-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 13BAA3A0B05
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Until the version bump of `bindgen`, we needed to pass a dummy parameter
to avoid failing the `--version` call.

Thus remove it.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 init/Kconfig                 | 7 +------
 scripts/rust_is_available.sh | 8 +-------
 2 files changed, 2 insertions(+), 13 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index f9fac458e4d4..d9b795f70a38 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2211,12 +2211,7 @@ config RUSTC_VERSION_TEXT
 config BINDGEN_VERSION_TEXT
 	string
 	depends on RUST
-	# The dummy parameter `workaround-for-0.69.0` is required to support 0.69.0
-	# (https://github.com/rust-lang/rust-bindgen/pull/2678) and 0.71.0
-	# (https://github.com/rust-lang/rust-bindgen/pull/3040). It can be removed
-	# when the minimum version is upgraded past the latter (0.69.1 and 0.71.1
-	# both fixed the issue).
-	default "$(shell,$(BINDGEN) --version workaround-for-0.69.0 2>/dev/null)"
+	default "$(shell,$(BINDGEN) --version 2>/dev/null)"
 
 #
 # Place an empty function call at each tracepoint site. Can be
diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index cefc456c2503..551f1ebd0dcb 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -121,14 +121,8 @@ fi
 # Check that the Rust bindings generator is suitable.
 #
 # Non-stable and distributions' versions may have a version suffix, e.g. `-dev`.
-#
-# The dummy parameter `workaround-for-0.69.0` is required to support 0.69.0
-# (https://github.com/rust-lang/rust-bindgen/pull/2678) and 0.71.0
-# (https://github.com/rust-lang/rust-bindgen/pull/3040). It can be removed when
-# the minimum version is upgraded past the latter (0.69.1 and 0.71.1 both fixed
-# the issue).
 rust_bindings_generator_output=$( \
-	LC_ALL=C "$BINDGEN" --version workaround-for-0.69.0 2>/dev/null
+	LC_ALL=C "$BINDGEN" --version 2>/dev/null
 ) || rust_bindings_generator_code=$?
 if [ -n "$rust_bindings_generator_code" ]; then
 	echo >&2 "***"
-- 
2.53.0


