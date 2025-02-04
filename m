Return-Path: <linux-kbuild+bounces-5618-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9FAA270F9
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 13:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 75D7D3A86C0
	for <lists+linux-kbuild@lfdr.de>; Tue,  4 Feb 2025 12:06:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5855A20D4FB;
	Tue,  4 Feb 2025 12:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCboyeFO"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB8F20D4FC;
	Tue,  4 Feb 2025 12:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738670683; cv=none; b=OEZKBbf6rjqAiaxvqMw9zSz1vKV59g96+FoO+5ZADc6ApGq+ANo7vIG82xww4C7i6LhfBFUCYZxttXdrEtKP2QIZRtWeHjGFNATolAwzXVXg9JGDyHvWS2r25CuI9zUc9v51DO59p89tKk/stijApew71B6mn69FBLvClGWs8vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738670683; c=relaxed/simple;
	bh=0arBoyu3Hidy2Bd0UioU3I9Dhsom6btci9xWGQw7wPM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tAeXbykwNCw4aRpNyImsSX4O1gmzVN9PqGemoRAvMu29KkhMGoYRKyWeTU2JmlfoPLqS4cmFFXj0W+WAM5WJw3/DYDiqtXbPLwGbX0iYIu8ud5ooPtz9IXK9QJdvADyJUpaJzBlWgM0+GTPt5PuRRtj07CvDL+04Xv7cjxMpvcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCboyeFO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FF92C4CEDF;
	Tue,  4 Feb 2025 12:04:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738670682;
	bh=0arBoyu3Hidy2Bd0UioU3I9Dhsom6btci9xWGQw7wPM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WCboyeFO93OyLDaB3BQ3LHgMLQ+n+0bkkVBDXvlC4y7scGqZtGlIBtWMhFEQH2JH8
	 mMDRiJRK4A5pVK+iyzZLKXHfb3J7Y8Xx/IWX7hkc6fziAPDfv7papkGxnrYCPJaCXW
	 dQkRMZJIcbQrkg3Xvwxl85qTxKJKuj4Y5lZKJG/DgNSvjxqvpUKutI6aM4jvKbyATe
	 nYyRH3F9Au5ZWkvv/Kglred5uf15ZzPWpso83fPj8Cruee/bTnbATg8N0vIo+fzdCE
	 sYD4XIWvWgudArQ1F5v/Txwf6xJhVGOQGR+36l6v1iYQMEqKLqw1d2WERSXQuTNumD
	 wrQsnj8c3Xw/w==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 04 Feb 2025 13:02:08 +0100
Subject: [PATCH v5 1/5] rust: str: implement `PartialEq` for `BStr`
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-module-params-v3-v5-1-bf5ec2041625@kernel.org>
References: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
In-Reply-To: <20250204-module-params-v3-v5-0-bf5ec2041625@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=849; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=0arBoyu3Hidy2Bd0UioU3I9Dhsom6btci9xWGQw7wPM=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBnogHXYEu6tWoU6mU3Vx+FudFkvhTU7P/pK4Lhf
 FdL32HTc6KJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCZ6IB1wAKCRDhuBo+eShj
 d2K0EAChe2kjKfA+M7h37KcqfhRdnBKojjgbo0udmJQyrFXOUmd+BGUichd/0//xlok3X+M1h/D
 PsPeOg9A4Nwg8EtZASUxLe62hDnv9RURMzSmjUbGKeW9kz1kLxfsehE4NrCUFRBWxU7wfD8c3PU
 9GXAXTK8ay3XB9vDSaDQ6E8TBa3JgNSUJb9qLsqW1Y3VCM9pCFDotT9D5vRVvrj4nZnmzUcjEEA
 HIaP0R3BvbfLhmHBY1kzCKtf6V1FPga9CnUXZqzOf5JYUAogJqXhkOuieEVGrku79il08SXiMDA
 QgfJc0FhxhHX2WcRzpZsuwa0D44esIfe7fmPqSKm9T2lGrKiRkN8O7WiVfCcR8I9pGYHY+BAu6G
 DtwFpiOT2fQgVqSD2EDzpTQNCMww2bMOQqjipjgcA0//ZsxzZpFqYuOiiRO3RXlCQa1H65rLCc+
 wHa1wSp8iJ33Mbkv2TXaXpwX7D9M2zoPR8ln/JkzN2ic91ML2bsjKvzz9d4TRtBhlx9xcSFOtnR
 BBIkMFVtZHmVfEHZjsZADbgR9qkZLUzRADdw2A67bbemlPRbL/TzguR34LpISLs+Hz+F8rNCgBU
 OJ3itTvKv8slpikH+E3FXwggBE4J8tctfs3Q+tOamsB4Vp/4zytXdk198t+f9PFR4qf9J6A1JKE
 ZHSGGzSns1mkPbA==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

Implement `PartialEq` for `BStr` by comparing underlying byte slices.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 rust/kernel/str.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/rust/kernel/str.rs b/rust/kernel/str.rs
index 28e2201604d67800f8d6b8f69065dc32710b891e..002dcddf7c7687522a0acbff3ce6f65fa890e216 100644
--- a/rust/kernel/str.rs
+++ b/rust/kernel/str.rs
@@ -108,6 +108,12 @@ fn deref(&self) -> &Self::Target {
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



