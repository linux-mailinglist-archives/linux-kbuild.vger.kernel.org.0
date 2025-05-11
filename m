Return-Path: <linux-kbuild+bounces-7075-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1B7AB26D1
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 08:02:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A3373BC3AD
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 May 2025 06:02:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 22E59194080;
	Sun, 11 May 2025 06:02:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="LaX/wMJl"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1983C17799F;
	Sun, 11 May 2025 06:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746943366; cv=none; b=Igwbjef49C9wTYpzVGMG4m32Xei7Vm/mp58G8UiA7sIcOsLh8CultsWO3orLep6FGiXl1L2iKnW+HfIZo6zkqLzpoPvF6X5Rf4dTE33cLUTokji5LfmzC4P6uX1vMWYY4m1TsI2nydtpLVfoqVrDipqsjETkdoKLGU4gqWhTlMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746943366; c=relaxed/simple;
	bh=N2GVtWYLauUphYnMdi6ccJKdoOwSZ5CKaq4fIoZuIRc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D+pN/FMCDJ7LViDZdUqGAgNWmQ7Eihnvm0rIvZh1QA3pcFlrKB8nUASQEBqZLBDOhDSnlOy/kgT1mJV0acgw2zN/8We+hHayEVfMi/QyIsmZckH/4MQsSAepmZBzgiLbV1RqhSRacL7J4bGzfiaBM88lpN9UC9PD5zrmA00738I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=LaX/wMJl; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1746943360;
	bh=N2GVtWYLauUphYnMdi6ccJKdoOwSZ5CKaq4fIoZuIRc=;
	h=From:Subject:Date:To:Cc:From;
	b=LaX/wMJlMiK4KR3dW3iQXSriiltTiZcg8n1ooFSIkPK6DUo8OqCUD7WR6Owa3St/N
	 hmOZyEiGUTSI1NAR1Agj3oWrNfwy2yU/UgO/B33ijeoTlfoelUcm1QnqsTkxw1XRYm
	 +92Es6Om4Xm+nlyIZwQEVwQ2pDIavvHZQUxupnOM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/2] kbuild: revert relative paths in compiler outputs
Date: Sun, 11 May 2025 08:02:26 +0200
Message-Id: <20250511-kbuild-revert-file-prefix-map-v1-0-9ba640c8411e@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAHI9IGgC/yWMSQqAMAwAvyI5G7DFIvgV8VBNqsGttCqC+HeLH
 ocZ5obIQThCnd0Q+JQo25pA5Rn0o10HRqHEoAttCqMUTt0hM2FqOezoZGb0gZ1cuFiPJXFpyFm
 ylYH0+NX3b9rneQGV5xWCbwAAAA==
X-Change-ID: 20250511-kbuild-revert-file-prefix-map-4de45dfada75
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>, Jonathan Corbet <corbet@lwn.net>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Matthieu Baerts <matttbe@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746943359; l=849;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=N2GVtWYLauUphYnMdi6ccJKdoOwSZ5CKaq4fIoZuIRc=;
 b=upTtQdPzRtEopqB0GhidTj7IyGKTCFrmrfobMNIAD3FFMVrUgv50yk8fHxt/z1IU+VlBy6BPe
 ABDDdCT5nRcDQ47pPqvTgv6mUaYS59YBsbnAlpF/4NsHkPZEE23bu7J
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

-ffile-prefix-map/--remap-path-prefix break the ability of debuggers to
find the source file corresponding to object files. As there is no
simple or uniform way to specify the source directory explicitly, this
breaks developers workflows.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (2):
      Revert "kbuild: make all file references relative to source root"
      Revert "kbuild, rust: use -fremap-path-prefix to make paths relative"

 Documentation/kbuild/reproducible-builds.rst | 17 +++++++++++++++++
 Makefile                                     |  3 +--
 2 files changed, 18 insertions(+), 2 deletions(-)
---
base-commit: 3ce9925823c7d6bb0e6eb951bf2db0e9e182582d
change-id: 20250511-kbuild-revert-file-prefix-map-4de45dfada75

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


