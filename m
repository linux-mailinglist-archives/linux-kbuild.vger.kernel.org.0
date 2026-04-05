Return-Path: <linux-kbuild+bounces-12664-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGtCIU730mnjcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12664-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:59:10 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D113A09CF
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:59:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 79D58302A1B8
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C646E38551F;
	Sun,  5 Apr 2026 23:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J75yujqh"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979D1382365;
	Sun,  5 Apr 2026 23:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433409; cv=none; b=jv3UxXVdclOjOkliF35wBTz4nb7AtzGTYE9KGbm0VP0htKGLv1dv8MMWl+iIUUOZuXjdbyzGj49iYEOblv+yTosZcQdSZqFwXsvVjSHd7E8yjSwdu4tUiqbAmmuyJGlESRDStS+2xCG8/jNmv0evLTX2WVGaIHYTHbbmbRv0DqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433409; c=relaxed/simple;
	bh=sQUuqsYWoQQDl9yxEE9Az9YtqbQefhrhSP8rhldIqmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I0LLGM+ooY4iTIxeuK+Chry8RsQppMu2PZjscCQPXouF4ruHLUTcPx4b2OJZHWRu2DeNXRCZUzAUV605fo/R0Ck2/0emest+zkqJbs4Dagz5maLqSdu9tyT32P/DPeCcoRsUY+uCl3lCdhlZ4j6BAqeL4e0rRRYXUC+f7sIO2hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J75yujqh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B450C116C6;
	Sun,  5 Apr 2026 23:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433409;
	bh=sQUuqsYWoQQDl9yxEE9Az9YtqbQefhrhSP8rhldIqmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J75yujqhKFFuRX3GexxH2MvDnyBAcdTMIKhI0rNoTW15zw9TzUSxe27UepZvWE18X
	 sub3LugioC9w0xL+97ng102uzKndH8Ef/fjF5HpT6cFS3fEq4Egi4GCNsRUa5Zu7mF
	 ghvVrRnth7f8i1zaluS9EMfBoMQ6edcxRkjuwMamJd6VVZq13aoqCDwQFlUnwhXXER
	 Qli7u2f6YsZ6TrACIbajwtOLeo23srQOGUoscbrDvlMePGirOBgt0tq/xfktxKtt3s
	 F2UVROBeYqdnAEr10BJqZbI75EHII4oVRwiT7p2M42R6Wiky1MPlMLBmszZvTLKzsu
	 NMb1Zpm8DdMBw==
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
Subject: [PATCH v2 18/33] rust: rust_is_available: remove warning for `bindgen` 0.66.[01]
Date: Mon,  6 Apr 2026 01:52:54 +0200
Message-ID: <20260405235309.418950-19-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12664-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 42D113A09CF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It is not possible anymore to fall into the issue that this warning was
alerting about given the `bindgen` version bump.

Thus simplify by removing the machinery behind it, including tests.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/rust_is_available.sh             | 13 ------------
 scripts/rust_is_available_bindgen_0_66.h |  2 --
 scripts/rust_is_available_test.py        | 26 +++---------------------
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 scripts/rust_is_available_bindgen_0_66.h

diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index d2323de0692c..77896e31dab5 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -163,19 +163,6 @@ if [ "$rust_bindings_generator_cversion" -lt "$rust_bindings_generator_min_cvers
 	echo >&2 "***"
 	exit 1
 fi
-if [ "$rust_bindings_generator_cversion" -eq 6600 ] ||
-	[ "$rust_bindings_generator_cversion" -eq 6601 ]; then
-	# Distributions may have patched the issue (e.g. Debian did).
-	if ! "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_0_66.h >/dev/null; then
-		echo >&2 "***"
-		echo >&2 "*** Rust bindings generator '$BINDGEN' versions 0.66.0 and 0.66.1 may not"
-		echo >&2 "*** work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2567),"
-		echo >&2 "*** unless patched (like Debian's)."
-		echo >&2 "***   Your version:     $rust_bindings_generator_version"
-		echo >&2 "***"
-		warning=1
-	fi
-fi
 
 # Check that the `libclang` used by the Rust bindings generator is suitable.
 #
diff --git a/scripts/rust_is_available_bindgen_0_66.h b/scripts/rust_is_available_bindgen_0_66.h
deleted file mode 100644
index c0431293421c..000000000000
--- a/scripts/rust_is_available_bindgen_0_66.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#define A "\0"
diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_available_test.py
index 4fcc319dea84..b66fa5933844 100755
--- a/scripts/rust_is_available_test.py
+++ b/scripts/rust_is_available_test.py
@@ -54,17 +54,12 @@ else:
 """)
 
     @classmethod
-    def generate_bindgen(cls, version_stdout, libclang_stderr, version_0_66_patched=False, libclang_concat_patched=False):
+    def generate_bindgen(cls, version_stdout, libclang_stderr, libclang_concat_patched=False):
         if libclang_stderr is None:
             libclang_case = f"raise SystemExit({cls.bindgen_default_bindgen_libclang_failure_exit_code})"
         else:
             libclang_case = f"print({repr(libclang_stderr)}, file=sys.stderr)"
 
-        if version_0_66_patched:
-            version_0_66_case = "pass"
-        else:
-            version_0_66_case = "raise SystemExit(1)"
-
         if libclang_concat_patched:
             libclang_concat_case = "print('pub static mut foofoo: ::std::os::raw::c_int;')"
         else:
@@ -74,8 +69,6 @@ else:
 import sys
 if "rust_is_available_bindgen_libclang.h" in " ".join(sys.argv):
     {libclang_case}
-elif "rust_is_available_bindgen_0_66.h" in " ".join(sys.argv):
-    {version_0_66_case}
 elif "rust_is_available_bindgen_libclang_concat.h" in " ".join(sys.argv):
     {libclang_concat_case}
 else:
@@ -83,8 +76,8 @@ else:
 """)
 
     @classmethod
-    def generate_bindgen_version(cls, stdout, version_0_66_patched=False):
-        return cls.generate_bindgen(stdout, cls.bindgen_default_bindgen_libclang_stderr, version_0_66_patched)
+    def generate_bindgen_version(cls, stdout):
+        return cls.generate_bindgen(stdout, cls.bindgen_default_bindgen_libclang_stderr)
 
     @classmethod
     def generate_bindgen_libclang_failure(cls):
@@ -245,19 +238,6 @@ else:
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
         self.assertIn(f"Rust bindings generator '{bindgen}' is too old.", result.stderr)
 
-    def test_bindgen_bad_version_0_66_0_and_0_66_1(self):
-        for version in ("0.66.0", "0.66.1"):
-            with self.subTest(version=version):
-                bindgen = self.generate_bindgen_version(f"bindgen {version}")
-                result = self.run_script(self.Expected.SUCCESS_WITH_WARNINGS, { "BINDGEN": bindgen })
-                self.assertIn(f"Rust bindings generator '{bindgen}' versions 0.66.0 and 0.66.1 may not", result.stderr)
-
-    def test_bindgen_bad_version_0_66_0_and_0_66_1_patched(self):
-        for version in ("0.66.0", "0.66.1"):
-            with self.subTest(version=version):
-                bindgen = self.generate_bindgen_version(f"bindgen {version}", True)
-                result = self.run_script(self.Expected.SUCCESS, { "BINDGEN": bindgen })
-
     def test_bindgen_libclang_failure(self):
         bindgen = self.generate_bindgen_libclang_failure()
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
-- 
2.53.0


