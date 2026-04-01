Return-Path: <linux-kbuild+bounces-12483-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uE7qJ+oKzWnhZgYAu9opvQ
	(envelope-from <linux-kbuild+bounces-12483-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:09:14 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 632B737A2E7
	for <lists+linux-kbuild@lfdr.de>; Wed, 01 Apr 2026 14:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A96E93183D27
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2026 11:49:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4CCD3E4C85;
	Wed,  1 Apr 2026 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BctafedQ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF76E3A380D;
	Wed,  1 Apr 2026 11:48:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775044093; cv=none; b=A4bu9C2gLhlnnYfmejohDl5Ab+A9mPPCv8J8f2LB+P/O/ZALDztu3eIRiALygZYSRnHbYPdEzUg0gOIdAM4Ar4JZu4FvDrBS3ETmnhUhSWeH1joeXLjBpWcAfyynigSbjJudWs28UK8GJZ6zqSySrTtXRTX0i33hGNgmt8JPg6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775044093; c=relaxed/simple;
	bh=Pc5ewSafnPFxKHksepcgeyeiYuBuOzddWiUYOLo44fc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hZnusRmSCoAsNr09RvlbEP22aLd4/SqFoQbAPvl/+07rFvu825GPmfL55HSVV4Gbh39W7iOG/5l1N1yAW0mvmAq5NpOui2Q4VTMmHiNXqzgq2ttli9QuC9ZgCJac5Tx6pT7sy7CissEoEG8CyhWnrQB3EVRN9rz5pNXnUsRlnf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BctafedQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F73C4CEF7;
	Wed,  1 Apr 2026 11:48:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775044093;
	bh=Pc5ewSafnPFxKHksepcgeyeiYuBuOzddWiUYOLo44fc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BctafedQl739LjER8MXut5f/UHQmwOMgY8eiBY9GPjZTa6UhwF33xTqKAsv/k9Jpr
	 UXZVhOtcmmlzZOYf7Vb8QT5b+Sj/g3QrIBGXZxTM3uNlk/xWwz3doBmOs5UrfpKtV3
	 BYeIBH88Jfn81A8lOQUe/b7L+LFkxTKWrdN5PeuA4bvB3G5atuDiVtTQLpJHRcGIi8
	 078hXEr/7kYFNT7XsI7KvwhnIDxnv/Nf9IHI6ZwVq+LPtCR1GNMcpgdXOerf3ytBI9
	 Tm7z4+ydsRwNHDCQkzUS7eKrnLuo9suwO47RZoBJZ7m1nD1AfOYKE0TTcQdbVpDSUj
	 Rk7BTlqek9WZw==
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
Subject: [PATCH 11/33] rust: alloc: simplify with `NonNull::add()` now that it is stable
Date: Wed,  1 Apr 2026 13:45:18 +0200
Message-ID: <20260401114540.30108-12-ojeda@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-12483-lists,linux-kbuild=lfdr.de];
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
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-kbuild,lkml];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 632B737A2E7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently we need to go through raw pointers and then re-create the
`NonNull` from the result of offsetting the raw pointer.

Thus, now that we bump the Rust minimum version, simplify using
`NonNull::add()` and clean the TODO note.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/alloc/allocator/iter.rs | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/rust/kernel/alloc/allocator/iter.rs b/rust/kernel/alloc/allocator/iter.rs
index 5759f86029b7..e0a70b7a744a 100644
--- a/rust/kernel/alloc/allocator/iter.rs
+++ b/rust/kernel/alloc/allocator/iter.rs
@@ -42,15 +42,9 @@ fn next(&mut self) -> Option<Self::Item> {
             return None;
         }
 
-        // TODO: Use `NonNull::add()` instead, once the minimum supported compiler version is
-        // bumped to 1.80 or later.
-        //
         // SAFETY: `offset` is in the interval `[0, (self.page_count() - 1) * page::PAGE_SIZE]`,
         // hence the resulting pointer is guaranteed to be within the same allocation.
-        let ptr = unsafe { self.buf.as_ptr().add(offset) };
-
-        // SAFETY: `ptr` is guaranteed to be non-null given that it is derived from `self.buf`.
-        let ptr = unsafe { NonNull::new_unchecked(ptr) };
+        let ptr = unsafe { self.buf.add(offset) };
 
         // SAFETY:
         // - `ptr` is a valid pointer to a `Vmalloc` allocation.
-- 
2.53.0


