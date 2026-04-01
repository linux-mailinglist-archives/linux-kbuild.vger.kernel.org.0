Return-Path: <linux-kbuild+bounces-12475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gFbpFyoIzWl/ZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12475-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:57:30 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CC94D379FA3
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 13:57:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E7A3D31410A7
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:47:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 735F0402437;
	Wed,  1 Apr 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IC7ucAQn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C7CF401A06;
	Wed,  1 Apr 2026 11:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043999; cv=none; b=Qqlx6r5odYAzw1qSTXzi04OgW8m/22XeBYNDORqvamHpLwXYu8uio1s5Ag6d/p8tC85brEZMcapUX7WyFgfCsYCjeNo3gxGnpwRW+C8JpVUPFiQ1Ifk3AzJvnx4lBqcg/Hp9mk8jDhPfDHEjFte1OkkJZhTgLCN2zfjZWI2m9Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043999; c=relaxed/simple;
	bh=mx6ZzwYZD/l+CT6smdZwRkePe/ogwpikx6oQbCZtXnE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=D9vKQDKSRCoiPkvnTwUCJIIev1UBxsG1fUqsgPXALgIcJ8PhCf9Q6ycxF4Jyi24aRjhpewavzssHh5rqmrsb55E1wlwPx/F6ADqKJbr2IsqveLsv12gwHdLZpDlUEATlx7JtQs+V2Zw2K/UTTB0dDdFRUIi0fuN0pv11wRmClFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IC7ucAQn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA9D4C116C6;
	Wed,  1 Apr 2026 11:46:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775043999;
	bh=mx6ZzwYZD/l+CT6smdZwRkePe/ogwpikx6oQbCZtXnE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IC7ucAQnVkndR7ChPPc0lrrY93rjZt8+FXlKYow5FhPAUcgRIJ6vkDf1B97slIFSF
	 rjhuIH7tqMm7bMjMtan4SHkTNIYJO4WYYQsOdwTJQaA2JEj8puX36B/Jv6MvnDT+Jj
	 FyETPXeepd1WLVhdSUOO/mLj/ukokooeVmCujRO5BPBFgA6K3rftlGfEbR+ZOgh8iX
	 diigcnBbQUlQcWklv2ABotZPDZct8rOw9kSKePGAwqiC89bbfWfMFV3jp29aCp47R0
	 sWWBc17mT0LMstHWxRcNniaUHF/vI1dTtIZL59bASZjnri6+Om3XyWc14QOHjUyxZQ
	 o2GgSZLrfRn/A==
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
Subject: [PATCH 03/33] rust: simplify `RUSTC_VERSION` Kconfig conditions
Date: Wed,  1 Apr 2026 13:45:10 +0200
Message-ID: <20260401114540.30108-4-ojeda@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[49];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org,oracle.com,gmail.com,lists.infradead.org,ghiti.fr,lists.freedesktop.org,googlegroups.com,google.com,lists.linux.dev,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-12475-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.985];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: CC94D379FA3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the Rust version bump in place, several Kconfig conditions based on
`RUSTC_VERSION` are always true.

Thus simplify them.

The minimum supported major LLVM version by our new Rust minimum version
is now LLVM 18, instead of LLVM 16. However, there are no possible
cleanups for `RUSTC_LLVM_VERSION`.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 arch/Kconfig       | 3 +--
 arch/arm64/Kconfig | 8 --------
 arch/riscv/Kconfig | 3 ---
 init/Kconfig       | 2 --
 4 files changed, 1 insertion(+), 15 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 102ddbd4298e..84089e80584b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -968,10 +968,9 @@ config HAVE_CFI_ICALL_NORMALIZE_INTEGERS
 config HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	def_bool y
 	depends on HAVE_CFI_ICALL_NORMALIZE_INTEGERS
-	depends on RUSTC_VERSION >= 107900
 	depends on ARM64 || X86_64
 	# With GCOV/KASAN we need this fix: https://github.com/rust-lang/rust/pull/129373
-	depends on (RUSTC_LLVM_VERSION >= 190103 && RUSTC_VERSION >= 108200) || \
+	depends on RUSTC_LLVM_VERSION >= 190103 || \
 		(!GCOV_KERNEL && !KASAN_GENERIC && !KASAN_SW_TAGS)
 
 config CFI_PERMISSIVE
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 38dba5f7e4d2..c91130c7fba1 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -291,14 +291,6 @@ config ARM64
 config RUSTC_SUPPORTS_ARM64
 	def_bool y
 	depends on CPU_LITTLE_ENDIAN
-	# Shadow call stack is only supported on certain rustc versions.
-	#
-	# When using the UNWIND_PATCH_PAC_INTO_SCS option, rustc version 1.80+ is
-	# required due to use of the -Zfixed-x18 flag.
-	#
-	# Otherwise, rustc version 1.82+ is required due to use of the
-	# -Zsanitizer=shadow-call-stack flag.
-	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200 || RUSTC_VERSION >= 108000 && UNWIND_PATCH_PAC_INTO_SCS
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE_WITH_ARGS
 	def_bool CC_IS_CLANG
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 90c531e6abf5..ddc534402400 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -232,9 +232,6 @@ config RISCV
 config RUSTC_SUPPORTS_RISCV
 	def_bool y
 	depends on 64BIT
-	# Shadow call stack requires rustc version 1.82+ due to use of the
-	# -Zsanitizer=shadow-call-stack flag.
-	depends on !SHADOW_CALL_STACK || RUSTC_VERSION >= 108200
 
 config CLANG_SUPPORTS_DYNAMIC_FTRACE
 	def_bool CC_IS_CLANG
diff --git a/init/Kconfig b/init/Kconfig
index 36d32ea44594..b8a1ab0d49d4 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -2193,9 +2193,7 @@ config RUST
 	depends on !DEBUG_INFO_BTF || (PAHOLE_HAS_LANG_EXCLUDE && !LTO)
 	depends on !CFI || HAVE_CFI_ICALL_NORMALIZE_INTEGERS_RUSTC
 	select CFI_ICALL_NORMALIZE_INTEGERS if CFI
-	depends on !CALL_PADDING || RUSTC_VERSION >= 108100
 	depends on !KASAN_SW_TAGS
-	depends on !(MITIGATION_RETHUNK && KASAN) || RUSTC_VERSION >= 108300
 	help
 	  Enables Rust support in the kernel.
 
-- 
2.53.0


