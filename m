Return-Path: <linux-kbuild+bounces-6829-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB88AA5BB0
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 09:55:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C21313BF643
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 May 2025 07:55:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81B6C27B51D;
	Thu,  1 May 2025 07:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="grfY9sdN"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E145277804;
	Thu,  1 May 2025 07:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746086100; cv=none; b=CG25nzAiyiqrKeCBaaTLCtqxv1oWkF2eSzhYQ8zt176QCMgrRTKOLO+2tbPxC1TKoXUKycdassAn4CorPHrCsUfiOmiOoWd2N9ai5FlLHUy+HqKwfbSHSbs6isXoUx3lwY66SB4iIjnRPexP1LBj57qgZePdV/yt3swZ9oryFf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746086100; c=relaxed/simple;
	bh=S9xpT5II4HEFQ7Pcgab/h1zpYjOY04rscXr6GialsmY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PQMbAcbHCR45m9JWXmRgFfQX6QgtVPB7FJl1DtFVS29BItXdNqf60Ppqme/0kTnHhXhkPV5OmpErHvKljGWs38RjbnthwQysqaQlOzDsjnOvTezYy8Do29P5EbR13kZLcHu1Iz6RTHRs+rKmtJlLZBVhNVvTnQYL2E6hTM9X9ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=grfY9sdN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BB55C4CEE9;
	Thu,  1 May 2025 07:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746086099;
	bh=S9xpT5II4HEFQ7Pcgab/h1zpYjOY04rscXr6GialsmY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=grfY9sdN7qDgv3JJkaiOxtOme3Uu9rVKvIWI26iiwMC/WaVvG9HJXu8GFyHKm8OFB
	 nok4lpRutvZos21kw8pCWCrve5hFNDPcq5GSQ30WxP1WTXR43JfP6zEsLL0617tMNU
	 bROW+Uq85yj0F7xg0pl8DgWDihG9NCFivQNWfrrqFvqjCcSS+NGytwNJ7MYA33wlPL
	 JiueabGOZvuc+HXbmWnp4vSiukoITOn9Ko0KxHYsPqcowIFGnSE5Bxf0u28B5ShOA2
	 E1L83lgFGI+p9HGM5qu3og0auSTWL/BwYdCHjyvRx32UwP1m1cwW9/K5K7ydScgA5V
	 mX6KOg5CkTe1g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Thu, 01 May 2025 09:53:39 +0200
Subject: [PATCH v10 3/3] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-module-params-v3-v10-3-4da485d343d5@kernel.org>
References: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org>
In-Reply-To: <20250501-module-params-v3-v10-0-4da485d343d5@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
 Masahiro Yamada <masahiroy@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Nicolas Schier <nicolas.schier@linux.dev>
Cc: Trevor Gross <tmgross@umich.edu>, 
 Adam Bratschi-Kaye <ark.email@gmail.com>, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 Petr Pavlu <petr.pavlu@suse.com>, Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Simona Vetter <simona.vetter@ffwll.ch>, 
 Greg KH <gregkh@linuxfoundation.org>, Fiona Behrens <me@kloenk.dev>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 linux-modules@vger.kernel.org, Andreas Hindborg <a.hindborg@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=806; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=S9xpT5II4HEFQ7Pcgab/h1zpYjOY04rscXr6GialsmY=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoEyifLNUYAuGx2+zg86wvduBI31WF8mL9vgnux
 SXClZzYfICJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBMonwAKCRDhuBo+eShj
 d+nyEAC97FGAW+RVhA2rzIHarhy9B3tPwKSFY0t4IjvbB3Cofa5F1pxDT3gaxsQCgOZPDS74kop
 1Mojt2ZJCSqYPfdpPek2GQ6nt619gzbOAtklgfkdCxVTXIGNBbtnADgCzqTqDAYsZ4Npjd2wRfs
 yzNXHOEFa9ee0XimbmQXxQn/uKTYIzPhHdZCnCVabzK6hsr1CdcTj0UTeLhTvfXnp03g9dQHkLb
 LTIn4AcUB5+3ZrMuYLOt+w9oCMXwbtrnXv0YxgS+vpHsJL/i65zhFwVKt2sgbK8KNEztxhTbn4g
 O2q71Gc2L6MBWWNVdlJ/A1W8QZVP3DibCKw+p0Fnue1cze8kCJOSUqglIihRPdQ2jnaWAoeIdoZ
 hxFNQA+VHK2hJFkhhEKnYTUfkN8rhot8QLvvbzy5Huf1BoXq2GlG0+Evg6MRXpCEmqGwbA2r0oL
 F8YxVmTSEND5PQkHJ7l6yfNHWhpxBixeUJ0BClHTUOvgFaEA5OLypcdrPT60xh80UAlkujmeh2K
 c/WNuXntfXraKGWTCoL0egiro0sTAjNC+ejyZwLY4kA8Gx7I7RTuTpFxxWAIDmKAMisAqZITBid
 syU3MqkDgIdmbOTcOWYLJglKevoFkgSuVzMfcgnvSsSmfO1f1hRGHhBFolmQWzcxODPoNXMWUVD
 E0YvbqQtLDETyhw==
X-Developer-Key: i=a.hindborg@kernel.org; a=openpgp;
 fpr=3108C10F46872E248D1FB221376EB100563EF7A7

The module subsystem people agreed to maintain rust support for modules
[1]. Thus, add entries for relevant files to modules entry in MAINTAINERS.

Link: https://lore.kernel.org/all/0d9e596a-5316-4e00-862b-fd77552ae4b5@suse.com/ [1]
Acked-by: Daniel Gomez <da.gomez@samsung.com>
Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3cbf9ac0d83f..d283874843a0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16395,6 +16395,8 @@ F:	include/linux/module*.h
 F:	kernel/module/
 F:	lib/test_kmod.c
 F:	lib/tests/module/
+F:	rust/kernel/module_param.rs
+F:	rust/macros/module.rs
 F:	scripts/module*
 F:	tools/testing/selftests/kmod/
 F:	tools/testing/selftests/module/

-- 
2.47.2



