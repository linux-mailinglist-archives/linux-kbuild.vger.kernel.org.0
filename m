Return-Path: <linux-kbuild+bounces-3595-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4E397B13D
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 16:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 435661F231DE
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Sep 2024 14:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D59AB18D624;
	Tue, 17 Sep 2024 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbWqWCsX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC34917AE11;
	Tue, 17 Sep 2024 14:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726582668; cv=none; b=khsyr2voekBkXaHxW0IwbRKEdC8Jzo5UgHG21HaJf1q1Vk1Lg96SCa82LDnMhgnLRO94ymYutFwYLLBuUN8w/KCwSotENSGQBJxHjx35w8dYVZoydeJrUdsP1MySSrnWV1OnGapP/DidCzXj/Lfjlx8059lJ1T+iWS6vW+Myj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726582668; c=relaxed/simple;
	bh=n8IL6UM3AlOmJPnvqYyhhURelp40V5xK3Ka0wCaa2Q8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fUxUkpRhnMRWfoynG+WtYJk/1Hp8pCXfL0wYuGvXRRYFTvTH1IwnpEoSKcm2Vm4u7xmbiBqYCtkN+7ZAdo2z3syg3hhTZn6LGs5mvsftasOLzso6iFzbiWM6cz0MXOgQbF8v5aJDJN90r3tZcDVJhJZdYlFbvYnXZ3y+/3X+wug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbWqWCsX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B188FC4CECD;
	Tue, 17 Sep 2024 14:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726582668;
	bh=n8IL6UM3AlOmJPnvqYyhhURelp40V5xK3Ka0wCaa2Q8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tbWqWCsXC+BMGDSCr1VxGr9145xEILy0CqXIockESg7e+uDliCAdp6aWgKYYtTPXa
	 jRw1khQ8xp3jkiUDjqi01iIBmDhQx8vBChhrcNMuve/BqYQzKwCXQ5yKLGNsOu8zdk
	 mcZx7mqV4e1H4TAHWwfXai+ILxNk4EQJD30nOI/twKx8/gBCiUlfKm6npi/Uffr1Cd
	 SP41JPqy3gjab5DlV24aPr7ogjc6dyJntjG63bDJcZe9fThoJCIu0I5zHRIwBl7PZW
	 leoUd2dHWyvsvsC6iQzDjWNaUwVGCtGiyeATybuSpqIa/cQeTwlli0WGqv/zA1Tb6v
	 0JyFgAzA+ZUmw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 08/23] kbuild: simplify find command for rustfmt
Date: Tue, 17 Sep 2024 23:16:36 +0900
Message-ID: <20240917141725.466514-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240917141725.466514-1-masahiroy@kernel.org>
References: <20240917141725.466514-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current 'find' command does not prune the rust/test directory
itself, requiring an additional 'grep -Fv' command to exclude it.
This is cumbersome.

The correct use of the -prune option can be seen in the 'make clean'
rule.

[Current command]

  $ find . -type f -name '*.rs' -o -path ./rust/test -prune | wc
       70      70    1939
  $ find . -type f -name '*.rs' -o -path ./rust/test -prune | grep rust/test
  ./rust/test

[Improved command]

  $ find . -path ./rust/test -prune -o -type f -name '*.rs' -print | wc
       69      69    1927
  $ find . -path ./rust/test -prune -o -type f -name '*.rs' -print | grep rust/test

With the improved 'find' command, the grep command is no longer needed.

There is also no need to use the absolute path, so $(abs_srctree) can be
replaced with $(srctree).

The pruned directory rust/test must be prefixed with $(srctree) instead
of $(objtree). Otherwise, 'make O=... rustfmt' would visit the stale
rust/test directory remaining in the source tree.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 5b16e0605a77..4992b2895dd5 100644
--- a/Makefile
+++ b/Makefile
@@ -1740,9 +1740,8 @@ PHONY += rustfmt rustfmtcheck
 # when matching, which is a problem when e.g. `srctree` is `..`.
 # We `grep` afterwards in order to remove the directory entry itself.
 rustfmt:
-	$(Q)find $(abs_srctree) -type f -name '*.rs' \
-		-o -path $(abs_objtree)/rust/test -prune \
-		| grep -Fv $(abs_objtree)/rust/test \
+	$(Q)find $(srctree) -path $(srctree)/rust/test -prune \
+		-o -type f -name '*.rs' -print \
 		| grep -Fv generated \
 		| xargs $(RUSTFMT) $(rustfmt_flags)
 
-- 
2.43.0


