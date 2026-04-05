Return-Path: <linux-kbuild+bounces-12654-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJMHNVX20mmzcgcAu9opvQ
	(envelope-from <linux-kbuild+bounces-12654-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:55:01 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDD43A0627
	for <lists+linux-kbuild@lfdr.de>; Mon, 06 Apr 2026 01:55:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADBC1300578F
	for <lists+linux-kbuild@lfdr.de>; Sun,  5 Apr 2026 23:54:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55B043845CB;
	Sun,  5 Apr 2026 23:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkarVOMv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E85342538;
	Sun,  5 Apr 2026 23:54:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775433298; cv=none; b=ajcMwYp7ecb8KyQf5/idw1YFvZ+aOvo8NYOAqW+oe5E2YMEKT9AMLpFAZO7uFpLclXyaPbKkQ61se01PspVVGNHnuxT7hhDd/ooWRMJ4aQVjVNLrx56yLE2cw/z2duQOD0D6KumpcsPRx39TFO7/CkFQ1W99qQK09ZOVaykoe8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775433298; c=relaxed/simple;
	bh=zEAiIku4X7Y0hc7v9DxS7dQT5lhAUdf4bcfA9WafsEM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BxmdDFRWTOfrnQBRnX0NxNxzVW5n8r5QxuNJcrTwg07qHCjXMLK9eclauj4MG1i0zR9qWP3IzHshveOWQoSIxQWkexOBpMkBwnGqH0ZbUzGJRr2IRSObPgqJ18xOVCrNMoaUIZ42wdWpAXxgd156S2qNZ64f81k1wNevqIkTA9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkarVOMv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B6AC19425;
	Sun,  5 Apr 2026 23:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775433297;
	bh=zEAiIku4X7Y0hc7v9DxS7dQT5lhAUdf4bcfA9WafsEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkarVOMv/eAWnbZswNfp2WIVyzZhZOaVT1moxhBROgr7XlggS7b9KhTq1UgpP++Zx
	 Alotrr0bPvvYyo4kq6FyVc9YElH+P1TTlCs4ZJDoaQatZbjqXB+wmP3owqg14Of61w
	 QgM2JYhZrkhdKFrFlvY2f4jGUHLEFksjOsoVEnBASEJqGV2AarC0Em5BCe5CzlS47S
	 j5Wd5drcDjr9h3/HuN0p6YfhD8sEk6Y7iHcXTD8oeWf04xG4U8DAtYM0tEKntTSdCh
	 MkAPdwq8G2+AFZ7GM7tcJHA678KuZN10hpC7WsUXu2VGc3XKFcIpwDOF2q8lXJJmsT
	 bPpndWVVj+S2Q==
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
Subject: [PATCH v2 08/33] rust: simplify `RUSTC_VERSION` Kconfig conditions
Date: Mon,  6 Apr 2026 01:52:44 +0200
Message-ID: <20260405235309.418950-9-ojeda@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-12654-lists,linux-kbuild=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,garyguo.net:email]
X-Rspamd-Queue-Id: 2CDD43A0627
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

With the Rust version bump in place, several Kconfig conditions based on
`RUSTC_VERSION` are always true.

Thus simplify them.

The minimum supported major LLVM version by our new Rust minimum version
is now LLVM 18, instead of LLVM 16. However, there are no possible
cleanups for `RUSTC_LLVM_VERSION`.

Reviewed-by: Tamir Duberstein <tamird@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
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


