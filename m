Return-Path: <linux-kbuild+bounces-5719-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 40845A31088
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 17:02:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 883EB1882B9F
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Feb 2025 15:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 786142566F0;
	Tue, 11 Feb 2025 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BLym5K5y"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B43B254AEA;
	Tue, 11 Feb 2025 15:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739289546; cv=none; b=OEbxgzvbz9QL48oJh4m2g3WF4wLHAdbX7NxNfvY5sPcGqCHcucrMN5hgmVLfoMo4mf+ZQ12jA47/CoASTzMZTyL62q+nb10gfNBVlUxXAOytjZHnwzR9dr+qIMiZ5WOdxY6sWSNgkw3L9tX5GcEYzmRmidN5RPZuqEJvom86dmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739289546; c=relaxed/simple;
	bh=QOkxN9z10V8zzjGozLOHFgjU4k/qJwDqa62nwSaqLms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UuL5RLPYFI/0nG0qflxgF3KvHXhBHk27SsLaDIc87Xbec868ztyVWKJldRK/TOSDOIjT6FSY7HmhbJCl1pPhwCjCRVsLgmr3zCwZz7qHSlOe3TS+t5+sp/8Lb71acCkAo0VKaJeg6WFq21f7bIOzjVf4Fog13gxO8Vt+1jc8klQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BLym5K5y; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392A7C4CEDD;
	Tue, 11 Feb 2025 15:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739289546;
	bh=QOkxN9z10V8zzjGozLOHFgjU4k/qJwDqa62nwSaqLms=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=BLym5K5yvCiqM460Wy8LsCe5uBmAUoUsHqOGfmy9LgQgevQPGYgNQXjtNTb24kRT5
	 Hc61hfr85nVdqililZXJwdnyvVtFvpTK0BPPMeafU4bDCtuywHrFySM3IYwB4SWUyh
	 ESYS1ZYa7TozHMd8XMG85ocGHFaI0vqV1Ep0LG2lw/IJa505zKlSnBm++Npsg2HK1A
	 2g67FjpbTp4dhHE3363JepdmYB4sugj/VtESo2xPrOuJyO71/SFowUUEGZyhp5buVf
	 fmrSIPSukHDbvKtdjqb7o5cqHcGoxE5N5BYfqKPcUlI5gHXbtLi2Fmvp0oWfbVLfI2
	 fbR5oULWaUOlg==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 11 Feb 2025 16:57:36 +0100
Subject: [PATCH v6 2/6] rust: str: implement `Index` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-module-params-v3-v6-2-24b297ddc43d@kernel.org>
References: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
In-Reply-To: <20250211-module-params-v3-v6-0-24b297ddc43d@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=983; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=QOkxN9z10V8zzjGozLOHFgjU4k/qJwDqa62nwSaqLms=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnq3NyuNFJuVu1Dz8XbnHqnIYRa7T4brhyLKeZq
 5rDIPMnB/OJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6tzcgAKCRDhuBo+eShj
 d8fbD/9aSq2fjwCchNjP+OSpo3mdFF3mmk6WsQy+PgP3dElhNCaMYnVgIWMhSYiGna4Fga/i4KY
 JJzgWg2q+CBm3WoZG/Rrph0FYW0LmGmuvAPS9iFN2LDFuJtITVho28SPeKkPYZzi97T4LPswTRu
 Rg06sDnD593uPNp+fdhuaC00kA69PItT0rh8qsQURqMGh/8DtZ70zR0UcKB95BXUZoe0/9kkq7o
 xs6DM8ck+6t/YrevSGamyMubNdZxymJyf605z7zFr3DLaSyvB/q+7fohS+vQFdmdnteyrETYC9r
 q9MzEwOk4/ubnMSpqWm5yq0M/j8HWBY5f9h0S6f8BU2hjxIfSRkIs1QrobXXWJLJPOooA5SEAHb
 MFpmDGhZZfoYgq+W6SYrcIogSfzcDx9XqJXWCOeF3kWIGkV3DEIBoIfbAdZpvWt+T0vzsWjNWOD
 93WOCrQWAGA92d0VG+AzJORE4wdxjpgLAIWJmVph2bA6ldg6zO20o43ssXbA54LIVX9x73vF/X9
 65Nr6DV0jKd3m2UXcu0rj/nL+oERXCL98wmmufUZ72OM/gXZAU/eoCjZPN+zoH88iBMvNJs3E+Z
 rEn28cxo+tUzx/yoEUnL8C6wqSPynUrsXmc/0ioDMtnl1nIcV6rBnKubHmamFstjU/9UG1DkaNx
 bYVBfmpgWo2hCMw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The `Index` implementation on `BStr` was lost when we switched `BStr` from
a type alias of `[u8]` to a newtype. This patch adds back `Index` by
implementing `Index` for `BStr` when `Index` would be implemented for
`[u8]`.

Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 002dcddf7c768..1eb945bed77d6 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
     }
 }
 
+impl<Idx> Index<Idx> for BStr
+where
+    Idx: core::slice::SliceIndex<[u8], Output = [u8]>,
+{
+    type Output = Self;
+
+    fn index(&self, index: Idx) -> &Self::Output {
+        BStr::from_bytes(&self.0[index])
+    }
+}
+
 /// Creates a new [`BStr`] from a string literal.
 ///
 /// `b_str!` converts the supplied string literal to byte string, so non-ASCII

-- 
2.47.0



