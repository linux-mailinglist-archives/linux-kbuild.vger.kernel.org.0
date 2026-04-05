Return-Path: <linux-kbuild+bounces-12665-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mO/SE6H30mmzcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12665-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:00:33 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD083A0AAD
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 02:00:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1391230131C2
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:57:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BEBD38552A;
	Sun,  5 Apr 2026 23:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZiwyuKsC"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E87FC382365;
	Sun,  5 Apr 2026 23:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433421; cv=none; b=IMGLUY3yPRkyOSm5+ORD2Cu0yahOXI4V2WsOVLOqj+NPInIDhxbOl/XLsFXUaj3LVjXHo1ajKnd/xWGhUI7VXKnIDxiFBh4r+PrBH5pN1M0OqN2OITfyj4IqKIhnu6MpHIdZy3gqmqjmrNjUCtlY/wluP2cKryXffblsojYB8q0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433421; c=relaxed/simple;
	bh=vrwAV7Bl6fj3wm5bdA1SVbLh83q3Kq+DPrhsVUmDW5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=le7XYEZAMBC9REx4UwDmxSc0TmYnsMe8mJpXdcH4VIyuF1KoFUA5cCVVaIaXvJGRMb5aeIBBdfaJaH9RGA7OXlDLnBGIWv+QYy7ykjU/dSwgWpyJKo12HUG5NGAmo3aU1ifqGaxiiCQZsv8aZKDpC1i5x5lUcVSANElINfeRp8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZiwyuKsC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B153CC19425;
	Sun,  5 Apr 2026 23:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433420;
	bh=vrwAV7Bl6fj3wm5bdA1SVbLh83q3Kq+DPrhsVUmDW5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZiwyuKsCF/ioWYt/NU05o38dAFYnn7AcopnYIUawB69WLhy7XUSsc1QkcPxQTz5NB
	 Nv59AN39BWOY6GvSMoLn/qG3TYbCTyf449BK0i5ys4oUhcYAJ6THwXleoHmn+GNVwT
	 l+R+0Qvf1Tdj8vgB0GvIcL4wKcAcN94vrKqH91GKOnVJXkBylCRfUCh7v4kw938t0f
	 e+TnxHa1aSvsYnW3UVvLAZGP42Fn+4nOOTtLxAW15o0YhdPIrNPoWXBLUeIyLmced1
	 /IN2BPutIO9yCe3kCWcarPLQl4/DtUxCuq+Rhyk0ZoQF9S3QLNwDBd7p0XhsPMzRTK
	 BTzlmBwyK7CPQ==
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
Subject: [PATCH v2 19/33] rust: rust_is_available: remove warning for `bindgen` < 0.69.5 && libclang >= 19.1
Date: Mon,  6 Apr 2026 01:52:55 +0200
Message-ID: <20260405235309.418950-20-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-12665-lists,linux-kbuild=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: EAD083A0AAD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

It is not possible anymore to fall into the issue that this warning was
alerting about given the `bindgen` version bump.

Thus simplify by removing the machinery behind it, including tests.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
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


