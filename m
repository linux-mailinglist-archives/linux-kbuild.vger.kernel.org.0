Return-Path: <linux-kbuild+bounces-12878-lists+linux-kbuild=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AOWbBmck7mn0qwAAu9opvQ
	(envelope-from <linux-kbuild+bounces-12878-lists+linux-kbuild=lfdr.de@vger.kernel.org>)
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Apr 2026 16:42:47 +0200
X-Original-To: lists+linux-kbuild@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1455B46A5FA
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Apr 2026 16:42:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A6A91300601F
	for <lists+linux-kbuild@lfdr.de>; Sun, 26 Apr 2026 14:42:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E84C367F3D;
	Sun, 26 Apr 2026 14:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="By1XQ8Dn"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE54C2D781B;
	Sun, 26 Apr 2026 14:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214543; cv=none; b=blKHqFZymVjdQa8J1iNqpkvq3oiuso7LNhG8ZeuUhjAEgpe9N27kzmk7b7f/zY9VKxtqQKQlvOa988cnC2LVAMzcUVwVmoiyvjuCh3tcTJCJN+EbFI9134Ps5cx8EtWK3MQqBsX0kji+GgTI9dM897qkfV5vyZ+2mppvN4ZsR38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214543; c=relaxed/simple;
	bh=saau16NEjftuafvXPe1PUmRePrjs0Fiv6u3j/eddlTs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z9gMDAiusODi2MqBAYT61F3JOZvGEJV+AXiz32Mz4LB1UPEpguhriolst6pouitacp10A8wYDd11upiXdZZZ9ZkTcQnUuHyQjiUy5RHP/sUQ8NmTNpOrtzbZpeUuziYFIKPu2fwGdNV90tFRM8v6M/6NXt0SYzRC5w68ca7Epn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=By1XQ8Dn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 339E8C2BCAF;
	Sun, 26 Apr 2026 14:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777214543;
	bh=saau16NEjftuafvXPe1PUmRePrjs0Fiv6u3j/eddlTs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=By1XQ8DnKQ0f4pHxqRTkctJQeLEGhvlcB0ks7BG1bXBeF2U9jhjavSlS/4mxzJC8x
	 aRHHs6zeyADwSNXpyqpem2Y0ugJpkSrVUVjYUW3IaMW9I9QxRqS+LE5h2IgnAGIz05
	 VvCNpBx896z8agAHgeT1mICenPlSlxbEN/50xhdEWEuqRnQJuhsZKIEcFB5nHK3ipW
	 Lw3KNb+WmzuxqJ2Qd0FQowuOzHXaf5bUsK4Qm/Kizdz96GgVxjwgsQGXiX7AUyrDDd
	 SOdzgVQDntTZlMxioIntpJ/lnIwvy5JCmmoATiJnH3bYSIygpVNDqyMIRfrIpquHFR
	 nL5L85Cn2a9Lg==
From: Miguel Ojeda <ojeda@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
	Todd Kjos <tkjos@android.com>,
	Christian Brauner <christian@brauner.io>,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>
Cc: Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kbuild@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 2/2] rust: allow `clippy::collapsible_if` globally
Date: Sun, 26 Apr 2026 16:42:01 +0200
Message-ID: <20260426144201.227108-2-ojeda@kernel.org>
In-Reply-To: <20260426144201.227108-1-ojeda@kernel.org>
References: <20260426144201.227108-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1455B46A5FA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,umich.edu,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-12878-lists,linux-kbuild=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,garyguo.net:email,rust-lang.github.io:url]

Similar to `clippy::collapsible_match` (globally allowed in the previous
commit), the `clippy::collapsible_if` lint [1] can make code harder to
read in certain cases.

Thus just let developers decide on their own.

In addition, remove the existing `expect` we had.

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned in older LTSs).
Suggested-by: Gary Guo <gary@garyguo.net>
Link: https://lore.kernel.org/rust-for-linux/DGROP5CHU1QZ.1OKJRAUZXE9WC@garyguo.net/
Link: https://rust-lang.github.io/rust-clippy/master/index.html#collapsible_if [1]
Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 Makefile                                    | 1 +
 drivers/android/binder/range_alloc/array.rs | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index e2a810bc4409..d0a515b661a0 100644
--- a/Makefile
+++ b/Makefile
@@ -486,6 +486,7 @@ export rust_common_flags := --edition=2021 \
 			    -Wclippy::as_ptr_cast_mut \
 			    -Wclippy::as_underscore \
 			    -Wclippy::cast_lossless \
+			    -Aclippy::collapsible_if \
 			    -Aclippy::collapsible_match \
 			    -Wclippy::ignored_unit_patterns \
 			    -Aclippy::incompatible_msrv \
diff --git a/drivers/android/binder/range_alloc/array.rs b/drivers/android/binder/range_alloc/array.rs
index ada1d1b4302e..081d19b09d4b 100644
--- a/drivers/android/binder/range_alloc/array.rs
+++ b/drivers/android/binder/range_alloc/array.rs
@@ -204,7 +204,6 @@ pub(crate) fn reservation_abort(&mut self, offset: usize) -> Result<FreedRange>
         // caller will mark them as unused, which means that they can be freed if the system comes
         // under memory pressure.
         let mut freed_range = FreedRange::interior_pages(offset, size);
-        #[expect(clippy::collapsible_if)] // reads better like this
         if offset % PAGE_SIZE != 0 {
             if i == 0 || self.ranges[i - 1].endpoint() <= (offset & PAGE_MASK) {
                 freed_range.start_page_idx -= 1;
-- 
2.53.0


