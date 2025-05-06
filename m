Return-Path: <linux-kbuild+bounces-6973-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03FD8AAC51E
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 15:06:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 766CE3BA7EF
	for <lists+linux-kbuild@lfdr.de>; Tue,  6 May 2025 13:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C1A1280300;
	Tue,  6 May 2025 13:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="loVvBnNg"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE6CA27FD67;
	Tue,  6 May 2025 13:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536575; cv=none; b=DneJ4h1l7IQx8z+qTKq/U+4pKJJiqUF0qxlq5g/j2dR9+eUwvLS1TDhegBy/sCuibFPoF34L3JOVAQh8Wwz7HTtoqSu0R2vxU5UjQBoQ+KBIDdJW8LU7Zo88hpLzX4VWuBSl/CvZy6AQWn466PNT/m3stwaabW9obbvnUeumIBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536575; c=relaxed/simple;
	bh=Y298LSzWv3GbHqmcvO2wI8CypYsGzuXwta1YgsS7xr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bbuWJE1xsujP1g5R7qL1ndYYxyJG4bgpAT7l7UHCocMHDV/xaWR8SnmqJ3rE/dtohncCBLxUtwdonCuUzlmKWJliTdxyMD100MUb+Vc74447r+enVuGzfGzIaCt6J9nHRZIx2u3Q7R022gF3lUv10bsiWOglYwIVrLbxl51sPKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=loVvBnNg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF17BC4CEEE;
	Tue,  6 May 2025 13:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746536574;
	bh=Y298LSzWv3GbHqmcvO2wI8CypYsGzuXwta1YgsS7xr8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=loVvBnNgwgxE/yYv/cBF6p+Z8c5hTfgCHOhi2b2cfCCHYYCsEe4aZyeo5NhE7HPQp
	 0AxneBY1qnQYYHVF8feQXRJwLnYzaVfaKflMhR104dWmszK2HrsCNZfhtYvqJOvA/7
	 2uGthOdKW3m7eNDNScD0DAvuKwyN+ARbQU5dSi5icVzCUBBqY8O0YYdEuhJZw7+egR
	 TYexvg3MmIC7aTnnyROvrdChf1Dz9NgBZ7Xyue8X6b8H/k83px4ptcFofFq70cURB8
	 4uLHn8iZFoPsepDraWIMA4vrI6Jt0obewdScsU1IgTJ22VlLvGIqjKfpu66an8TP7v
	 gBtM01qQKXE0g==
From: Andreas Hindborg <a.hindborg@kernel.org>
Date: Tue, 06 May 2025 15:02:30 +0200
Subject: [PATCH v12 3/3] modules: add rust modules files to MAINTAINERS
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-module-params-v3-v12-3-c04d80c8a2b1@kernel.org>
References: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
In-Reply-To: <20250506-module-params-v3-v12-0-c04d80c8a2b1@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=808; i=a.hindborg@kernel.org;
 h=from:subject:message-id; bh=Y298LSzWv3GbHqmcvO2wI8CypYsGzuXwta1YgsS7xr8=;
 b=owEBbQKS/ZANAwAIAeG4Gj55KGN3AcsmYgBoGghpxcYnOXHBFqzBWj7e8LWmafqdOOufyaOZB
 qSnEM/5cVCJAjMEAAEIAB0WIQQSwflHVr98KhXWwBLhuBo+eShjdwUCaBoIaQAKCRDhuBo+eShj
 d/ckEACXRXgQpIe09b6cFYawOQap0Gb23Yw+XiMpwt07282Qdm6do2xri8zpphzOWf+SmanLyEo
 WpKCX9R+a+CMgaMDRa8qDklQS+iu7KSWwZJ2HSuaYWPR5MQ+wzjziE9VXNQxtds56DFMm3DFQNg
 rbA0L+DsPiszAfVxYNbsHnvUCTmJz3nuoc83lCYyELatHsE/t3ByAntxyT48/vyB7yX98gikGrJ
 MQ+pXePD1OwnrhKzP6Xe9I8BY+0+OhTcugOOZXCg3u4ngGxlxUp4afUx7xtxPY1vLswBrSv/0Wm
 E6Zb6AA55KbLwVO3BCMl/0Qg4CzIqB6og2h8vSxYZmQcPVj17WZYgNOY3GUf3PxcB0b9I+nZTF3
 8jXp+uJA8wvjGTBYslDpCZMDtqhxt1BBBqAWbppPneVJCeGnxqFOSjX3BezmQZ+nJK1U1POQx7t
 JXpLaTACEt1uQbfD63S0rlPmt/G8jdkv6ni3qfTslzKq+quQbP8bZU4NPNKLnSwSndsCPh0Z4lr
 /V+k6RxtsWPlRiJIA/RRvjD8oncyKfdV2kHGVTPqEOctGlm/NSo6kBeBUXjZDpAAxVg54b3hbVR
 gCwMnX65VGLK9x2fSj9kvc8KBLeEeMhyNJtYViLae8jA5OYcafRFO0keUKDJMv1ynnOXPOLS0xD
 s2UTsyk+FQsIwRA==
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



