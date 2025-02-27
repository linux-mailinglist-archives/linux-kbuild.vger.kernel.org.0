Return-Path: <linux-kbuild+bounces-5926-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B8041A48202
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 15:50:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3801F19C4DAD
	for <lists+linux-kbuild@lfdr.de>; Thu, 27 Feb 2025 14:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EAEC238163;
	Thu, 27 Feb 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWlRcwVO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D758236435;
	Thu, 27 Feb 2025 14:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740667181; cv=none; b=NDI1HvmnR0GgpQb2aqls/zvH3fWq4kwTg0AfdqJhTP4+PPV9hIo2kGw5YTkLn4Fxo/dBrwaSA9lkQxK+2fXfq1oWmyns85gFDh602OMO0PaASPd/dx70AkijpapQpKs+J0eu1M6JGOZv5ZOHc9wQlFAgUlaWEwCSXqLvym/Tx2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740667181; c=relaxed/simple;
	bh=M5A9CbtSctHEgOcj2zrV2KphF+Jjyb2nnPlybeaE3OM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fluFVVb6cVT4rd32BScaCuSympPwTNIkaC+SKXbhHpd3PwdjtLAm6wrEQkVEPvx6m8XJHAjmc6SH0tGcvyxyU9FWc6MKlk5+i4tRld/d7hDiN9PiQyZu6ul+drvOGfWq4Slnw+n6eKs7FaHlgzWtUYJVRBRjsVPjjRfWJNJSQXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWlRcwVO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A02C3C4CEDD;
	Thu, 27 Feb 2025 14:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740667181;
	bh=M5A9CbtSctHEgOcj2zrV2KphF+Jjyb2nnPlybeaE3OM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=IWlRcwVOc+TAmjwEZ/ByAfglNpcGDzR0g5rAtA87u3IMoWG9uwJnT0jBzMes/E+XC
	 0ilVNKkc6d7FPF9jmweEqogNpMgX6mpK2smUdu6MrJtM7BcE7s7oed994K4Idmulb2
	 2VB2FxZnGDI+8DXpelhu5znImKhqdd7SO8zlaBGmp3JsNovA1Z6mNd9vYqdK96x/2j
	 VSmsEH/gc0Y7RwWQGdEVVGcOxZaizoDcymE1u99dR+FFE8GqoLw9vWJJZiAtGtCrCL
	 X9jmHPXhSPVAIevxab/7EtgIwushl4SRR75PBrgBWjE2HRroqLq2FeWqviU8N68CnX
	 6zkUI2GaXuoBQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 27 Feb 2025 15:38:08 +0100
Subject: [PATCH v8 2/7] rust: str: implement `Index` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250227-module-params-v3-v8-2-ceeee85d9347@kernel.org>
References: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
In-Reply-To: <20250227-module-params-v3-v8-0-ceeee85d9347@kernel.org>
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
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=M5A9CbtSctHEgOcj2zrV2KphF+Jjyb2nnPlybeaE3OM=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnwHjRKeyyfaKxrJbA8R7hdevR5EtBatPUaJ8f8
 TQQ2HJ746OJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ8B40QAKCRDhuBo+eShj
 d33KD/wOboHDofwhau5kg5su/fiNGZfBgeG0XU9/kRdFP3NwMTcuPJbbVAodbO87uTyklTIpYxy
 0GsTHOGYiwkpe0IeXljHKblDXE3Hv9ThWS/qafNOIHFsqUkqKIjS5CaBi3Wna6quc7uNIS/mEmf
 WL1d9RvG/07doamWa3DZF08FztimRJiDe/lKLNX7NdDr2D2iE08JfIb7HHZctjXz1LXj/b7G4J7
 KIZONs4P80Mw5R9zivGIYuJwRIUaV9x+C9iSRXHDuM/8V8FN6WHK7oK1Fe2ZhfE4dPEgyUANR/6
 BMgtIFY4QmYFzM+7XUQou2r8rt3FOc4aq841pb2YtClTvezDqUj2q2fd1KdGda0LdaeX4HjeX/Q
 PeffS3ZO9L5BjUJhahlcL3al9wutq9TxFPPLI8CDjzmb14VMijDXbdm2ud2sd+xeHjNXqD1qAm0
 n2cqjSr4gJ/limNoZUAyScZJAKyR9lfWZ2DeS+rmZiiYFMNW+afG/WKwK80QHDnhNKVxkdRzYvv
 mHVfPHYEFIYlCr2SaVZ82OU/lRldacD52DJrpqftoUGC8Dg57zSv+eTTUSJdfFPBGSKTgJlehQ1
 5VhI7kzKjwSe2U/TOU/X+mdPKmyYs/PIwxwyypHCOfFfLcDLEqtQ07eDGU6yha3J0EKspgYE882
 ywZqbSnKXInVbaQ==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The `Index` implementation on `BStr` was lost when we switched `BStr` from
a type alias of `[u8]` to a newtype. Add back `Index` by implementing
`Index` for `BStr` when `Index` would be implemented for `[u8]`.

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Tested-by: Daniel Almeida <daniel.almeida@collabora.com>
Reviewed-by: Fiona Behrens <me@kloenk.dev>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 002dcddf7c76..ba6b1a5c4f99 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -114,6 +114,17 @@ fn eq(&self, other: &Self) -> bool {
     }
 }
 
+impl<Idx> Index<Idx> for BStr
+where
+    [u8]: Index<Idx, Output = [u8]>,
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



