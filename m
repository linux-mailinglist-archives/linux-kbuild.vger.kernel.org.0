Return-Path: <linux-kbuild+bounces-12488-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4NdcJ/YHzWl/ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12488-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:56:38 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C84379F64
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:56:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 11631306D69B
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAABF402438;
	Wed,  1 Apr 2026 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DVz4TB/V"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2523E6DEB;
	Wed,  1 Apr 2026 11:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044152; cv=none; b=mbHYpQ2mSfpC2VF7CEVEEP0NO5ctL+yfDNPeyjfSeYIab23wHOqubP+YJvUj66m3MzQlwpT18zMyw9xlPAvvPvKAXcn2vCN5ABpOZZ0ZQfILEM5ILViI0vqdpm5SKyIE2DJikwH1X22k+/p4NwQ+7FJznm9888M6cWc2tgaoQeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044152; c=relaxed/simple;
	bh=AX5z3xpzFua6mAQIK+U/8xMTb4ZIuLJsG4n5Y91N4RI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fs4JGhsJp/841STBDmnK51RUOrhRVrfHlE7t0ZWkAMrYWrR0MKTcetSQu45UImh9OhEu0Dzpwsl/vAwCeNCEmJ2miV8yvR++p4rXn2WlZ7txzOXET8h3/IsqNoCml5MraZhqX0HasI7F4jZHw32HV2hxBhCww+mTnX6IIpbLJRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DVz4TB/V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F511C4CEF7;
	Wed,  1 Apr 2026 11:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044152;
	bh=AX5z3xpzFua6mAQIK+U/8xMTb4ZIuLJsG4n5Y91N4RI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DVz4TB/VU+zyZ2i/W6mzrSFi2feuGR6qmqoAvmg2H+aTnIrx+rI9QbMhxIGO0Fy4d
	 XEUrIjhZb1p4mHwos1ynOfsPYSKde1p0FX+M1Sy2SPqq2wYJ6sjVhPoccfaZVduWbn
	 wrrNGXFWfNEkrtdQ/i2hpujBUGZziz/KixuYY2LjLo97z5Dk4nuqnde2AEIcecPZq7
	 GaKGi955ChQdu/AiuzZxLwHqBt1S71Q7OAJpI2N3lXFXqySy73PaDukQke2WGFgjjS
	 PONEdcAu9t8e6olmo0f30HBhqmyw+l+pebpQt/3V8sgHdUpeCZ8WS4h4OvaSsKvE0l
	 4LcqeuoQH8epQ==
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
Subject: [PATCH 16/33] rust: rust_is_available: remove warning for < 0.69.5 && libclang >= 19.1
Date: Wed,  1 Apr 2026 13:45:23 +0200
Message-ID: <20260401114540.30108-17-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12488-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.984];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 29C84379F64
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It is not possible anymore to fall into the issue that this warning was
alerting about given the `bindgen` version bump.

Thus simplify by removing the machinery behind it, including tests.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 scripts/rust_is_available.sh                  | 15 --------
 ...ust_is_available_bindgen_libclang_concat.h |  3 --
 scripts/rust_is_available_test.py             | 34 +------------------
 3 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 scripts/rust_is_available_bindgen_libclang_concat.h

diff --git a/scripts/rust_is_available.sh b/scripts/rust_is_available.sh
index 77896e31dab5..cefc456c2503 100755
--- a/scripts/rust_is_available.sh
+++ b/scripts/rust_is_available.sh
@@ -214,21 +214,6 @@ if [ "$bindgen_libclang_cversion" -lt "$bindgen_libclang_min_cversion" ]; then
 	exit 1
 fi
 
-if [ "$bindgen_libclang_cversion" -ge 1900100 ] &&
-	[ "$rust_bindings_generator_cversion" -lt 6905 ]; then
-	# Distributions may have patched the issue (e.g. Debian did).
-	if ! "$BINDGEN" $(dirname $0)/rust_is_available_bindgen_libclang_concat.h | grep -q foofoo; then
-		echo >&2 "***"
-		echo >&2 "*** Rust bindings generator '$BINDGEN' < 0.69.5 together with libclang >= 19.1"
-		echo >&2 "*** may not work due to a bug (https://github.com/rust-lang/rust-bindgen/pull/2824),"
-		echo >&2 "*** unless patched (like Debian's)."
-		echo >&2 "***   Your bindgen version:  $rust_bindings_generator_version"
-		echo >&2 "***   Your libclang version: $bindgen_libclang_version"
-		echo >&2 "***"
-		warning=1
-	fi
-fi
-
 # If the C compiler is Clang, then we can also check whether its version
 # matches the `libclang` version used by the Rust bindings generator.
 #
diff --git a/scripts/rust_is_available_bindgen_libclang_concat.h b/scripts/rust_is_available_bindgen_libclang_concat.h
deleted file mode 100644
index efc6e98d0f1d..000000000000
--- a/scripts/rust_is_available_bindgen_libclang_concat.h
+++ /dev/null
@@ -1,3 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#define F(x) int x##x
-F(foo);
diff --git a/scripts/rust_is_available_test.py b/scripts/rust_is_available_test.py
index b66fa5933844..d6d54b7ea42a 100755
--- a/scripts/rust_is_available_test.py
+++ b/scripts/rust_is_available_test.py
@@ -54,23 +54,16 @@ else:
 """)
 
     @classmethod
-    def generate_bindgen(cls, version_stdout, libclang_stderr, libclang_concat_patched=False):
+    def generate_bindgen(cls, version_stdout, libclang_stderr):
         if libclang_stderr is None:
             libclang_case = f"raise SystemExit({cls.bindgen_default_bindgen_libclang_failure_exit_code})"
         else:
             libclang_case = f"print({repr(libclang_stderr)}, file=sys.stderr)"
 
-        if libclang_concat_patched:
-            libclang_concat_case = "print('pub static mut foofoo: ::std::os::raw::c_int;')"
-        else:
-            libclang_concat_case = "pass"
-
         return cls.generate_executable(f"""#!/usr/bin/env python3
 import sys
 if "rust_is_available_bindgen_libclang.h" in " ".join(sys.argv):
     {libclang_case}
-elif "rust_is_available_bindgen_libclang_concat.h" in " ".join(sys.argv):
-    {libclang_concat_case}
 else:
     print({repr(version_stdout)})
 """)
@@ -255,31 +248,6 @@ else:
         result = self.run_script(self.Expected.FAILURE, { "BINDGEN": bindgen })
         self.assertIn(f"libclang (used by the Rust bindings generator '{bindgen}') is too old.", result.stderr)
 
-    def test_bindgen_bad_libclang_concat(self):
-        for (bindgen_version, libclang_version, expected_not_patched) in (
-            ("0.69.4", "18.0.0", self.Expected.SUCCESS),
-            ("0.69.4", "19.1.0", self.Expected.SUCCESS_WITH_WARNINGS),
-            ("0.69.4", "19.2.0", self.Expected.SUCCESS_WITH_WARNINGS),
-
-            ("0.69.5", "18.0.0", self.Expected.SUCCESS),
-            ("0.69.5", "19.1.0", self.Expected.SUCCESS),
-            ("0.69.5", "19.2.0", self.Expected.SUCCESS),
-
-            ("0.70.0", "18.0.0", self.Expected.SUCCESS),
-            ("0.70.0", "19.1.0", self.Expected.SUCCESS),
-            ("0.70.0", "19.2.0", self.Expected.SUCCESS),
-        ):
-            with self.subTest(bindgen_version=bindgen_version, libclang_version=libclang_version):
-                cc = self.generate_clang(f"clang version {libclang_version}")
-                libclang_stderr = f"scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version {libclang_version} [-W#pragma-messages], err: false"
-                bindgen = self.generate_bindgen(f"bindgen {bindgen_version}", libclang_stderr)
-                result = self.run_script(expected_not_patched, { "BINDGEN": bindgen, "CC": cc })
-                if expected_not_patched == self.Expected.SUCCESS_WITH_WARNINGS:
-                    self.assertIn(f"Rust bindings generator '{bindgen}' < 0.69.5 together with libclang >= 19.1", result.stderr)
-
-                bindgen = self.generate_bindgen(f"bindgen {bindgen_version}", libclang_stderr, libclang_concat_patched=True)
-                result = self.run_script(self.Expected.SUCCESS, { "BINDGEN": bindgen, "CC": cc })
-
     def test_clang_matches_bindgen_libclang_different_bindgen(self):
         bindgen = self.generate_bindgen_libclang("scripts/rust_is_available_bindgen_libclang.h:2:9: warning: clang version 999.0.0 [-W#pragma-messages], err: false")
         result = self.run_script(self.Expected.SUCCESS_WITH_WARNINGS, { "BINDGEN": bindgen })
-- 
2.53.0


