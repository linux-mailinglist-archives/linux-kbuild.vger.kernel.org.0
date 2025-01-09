Return-Path: <linux-kbuild+bounces-5409-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DD476A073E3
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 11:56:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7686B1889BBC
	for <lists+linux-kbuild@lfdr.de>; Thu,  9 Jan 2025 10:57:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC9372165F8;
	Thu,  9 Jan 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pQvLR6TW"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9012163AB;
	Thu,  9 Jan 2025 10:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736420183; cv=none; b=Te0WTJRGJhNoOBH8K5moQ4zyTavhRC/3HdKvXS/4Ah+ECknz59nSe2dYcvBsfVn1ttjWz5K6ma4h+VJHy4YYZ3VSxym/DT8eg2eFJGL8mDSXqkKxEzq9wb/fKqQ6J2EyjciszWHOU0cVa3CNSJUBCx2jzoBvLA3+qVhDTcVATcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736420183; c=relaxed/simple;
	bh=PQh7gi5LDDzekiROzXHh4yXB+03ry8mMFRR1lHgFddE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwF+dazm26oQoFMj1ICVsAw7TaGeD6PSp7hMr2JkZ3zxinAarWcnB1g4jxCPSOWVA7+seky0ejZvUPk+E6fCU9rJm+NrYF8YS7Tq9KyRBWM4d7auyTGDRwsIGVEXQMtnrE+TEVGO1b3k4ZBggFD5nWwZOiIFGAyn+jO4lhFm008=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pQvLR6TW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2C2C4CEE3;
	Thu,  9 Jan 2025 10:56:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736420183;
	bh=PQh7gi5LDDzekiROzXHh4yXB+03ry8mMFRR1lHgFddE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pQvLR6TWBZC/+787SEbj9ZooTf0+5ICwODcmCiKu45dVdKlwBvvd8vhJ+Y3XC3+2x
	 +4VFa72S6WB4Dqp9eXwY22oCx+grxoZgh9UkVhMP0kWkv82HErQw0NqfSAxi9/NwA1
	 rwfuDxWV2AU1UHsWfZ/zkpmqywnwii1H8PNNRiHpWv0zTR7cqpCUlVlRX0PVfUqXtW
	 6tpQpyeD8vwMcfpvxPbq0HaR0H88Yhwf8OBZ8SxFn4tPq1WL/6LKk9gYVs9QUV1CHu
	 irYVN+nxfTeqQwhKKw6Rh/amHPd0PJWRMvhGSC5tfrcUxvjxL7oQL+iQsXOiXSSNwk
	 eBg7U9LL1rHBA==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 09 Jan 2025 11:54:56 +0100
Subject: [PATCH v4 1/4] rust: str: implement `PartialEq` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250109-module-params-v3-v4-1-c208bcfbe11f@kernel.org>
References: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
In-Reply-To: <20250109-module-params-v3-v4-0-c208bcfbe11f@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, 
 Luis Chamberlain <mcgrof@kernel.org>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, linux-modules@vger.kernel.org, 
 Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=807; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=PQh7gi5LDDzekiROzXHh4yXB+03ry8mMFRR1lHgFddE=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnf6sbwYSVWyBS99iiUpHpkpFCttvCoNsgE15Mf
 iMbCC14gZiJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ3+rGwAKCRDhuBo+eShj
 d6W9EAC0l+wvOATtCMVJZG/c3H02SYDJtr1PTlH+BCem0J6vXRo7sQvDDiY9RO85YNvYU1PAtHQ
 TxT2UAMjgE4n1GbBp5eppn8SCMPLXXZzshMmdhSdWYalIZvcIR4l0Wepg2qirDanIVflVVoZp72
 REH5li5fkp8TI2WkPlCE4L/8qJmz64I+qrLJN1yF56BbMLUsBt7SNOiXDVPVz/Y0O7zjgl2VFnb
 4zIzzLihE9dvYIBPtkoqw823ySLG9bRVquE92tD0NWQ7KSAI/9gCus8+N0r6kn4dqoHM/ISa6j1
 6ioqqW6jseBwCOZWhsenzYYneEd+MONnpdOgyEg3zRMqvk9Lq/NnK3kXdaLmyGBgpa+wHoYGG/U
 9pdHbrFArBvpbqKicNKwxNz0CfLGCPV2dVY6BwqT2YwHdY+NfOU6wh3NO0flIDUUPa/kfdW8nzP
 gfdtMuAjauzFI0iN8D4+LHsa2q3yoReyoU0nt8b9qAUJgsugMRuQDmPiTMGyc8QDQ3hBVK5QJrj
 CHPBUeAR4I5aI/FSMrxSclstlg2VTGa60CRHTzqKoB7DSqRvUcW+jJNPsx8OErhiVlbJ8c1DyAY
 gm3hEckNbP8AoO8myIM60neqSn7smyakAWzNKjam9hSxBO3rVYJl0XDOtBivkpdGJ+W4JqLD3Yr
 EETeBePiIX5vCAw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `PartialEq` for `BStr` by comparing underlying byte slices.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index d04c12a1426d1c1edeb88325bcd9c63bf45f9b60..c441acf76ebd1f14919b6d233edffbbbbf944619 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -106,6 +106,12 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl PartialEq for BStr {
+    fn eq(&self, other: &Self) -> bool {
+        self.deref().eq(other.deref())
+    }
+}
+
 /// Creates a new [`BStr`] from a string literal.
 ///
 /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

-- 
2.47.0



