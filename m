Return-Path: <linux-kbuild+bounces-2220-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8924990E352
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 08:21:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F2505B20D17
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jun 2024 06:21:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC77F6F067;
	Wed, 19 Jun 2024 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSUWAWRT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323F1E495;
	Wed, 19 Jun 2024 06:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718778110; cv=none; b=mnByXXJJaLoLEqhb/aZ7Gf4kTzlLm4qvCscYYnAxppoNw+QjDqJHq6d7bDODMLOnvxu2yXJYDiBRyZOpu3ErPwZcawWKrSk5sx410bAYJLnFosyJ1OgR4oSU7zpF6JHtNPJe85NjkDAopMDkkhwIZybcfX8eBxX/LMo2804yUCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718778110; c=relaxed/simple;
	bh=EmR12WsXhp4ilz/r/ixMrtuMagCSxHq2cogzAc62jUw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z2Bl3Wo36rGHdvXO5D6MwetAUn1jcHAoEi855Z6CcAdAXtc750ibKFxK2Xid2RZhJXLWWbuPf6okI1GPGRaE7t8MKkmEt1cqfKQqTTJg7WaxdCsy7owA/41GAeDKtyRVENJn1FF9GEM+1DW7B9u/NzCGELZxwOgVbZYyKSVhKQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSUWAWRT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BD08C2BBFC;
	Wed, 19 Jun 2024 06:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718778110;
	bh=EmR12WsXhp4ilz/r/ixMrtuMagCSxHq2cogzAc62jUw=;
	h=From:To:Cc:Subject:Date:From;
	b=GSUWAWRTA6l6qYNtrZifXJlyzTgEI3E/1FRxJQ31sBBdXRQGWoBxHiFB7i6SB5H0W
	 T3EcgFHT50QSF6Ka026btVvOCs7YJos329Rxi1Nw39uLTCwINejIeiMEhGPSebVM6O
	 o4CMML2Wo8iPEN1uXx1XvI3myT2fsibb85SPCYDQyv6V5mhsd1JsTBAg2PEOxwqApY
	 AbfpjYOu+yfbDD1pOJgMJYQ1isjXJoqGPre2b0Ru7mK6qix5ySK3Hwwby8WQLCk7sH
	 +FmQttsuJl5eH/w0hnOGDH8DLThCJJ5jVzLYxXUYfZ5cjHJSCpfctTmfBcl7yanioZ
	 Ly3SrtNtvG4ug==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@redhat.com>,
	linux-kernel@vger.kernel.org,
	Sami Tolvanen <samitolvanen@google.com>,
	Brian Norris <briannorris@chromium.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH] Makefile: add comment to discourage tools/* addition for kernel builds
Date: Wed, 19 Jun 2024 15:21:42 +0900
Message-ID: <20240619062145.3967720-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Kbuild provides scripts/Makefile.host to build host programs used for
building the kernel. Unfortunately, there are two exceptions that opt
out of Kbuild. The build system under tools/ is a cheesy replica, and
is always a disaster. I was recently poked about a problem in the tools
build issue, which I do not maintain (and nobody maintains). [1]

Without a comment, somebody might believe this is the right location
because that is where objtool lives, even when a more robust Kbuild
syntax satisfies their needs. [2]

[1]: https://lore.kernel.org/linux-kbuild/ZnIYWBgrJ-IJtqK8@google.com/T/#m8ece130dd0e23c6f2395ed89070161948dee8457
[2]: https://lore.kernel.org/all/20240618200501.GA1611012@google.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Makefile | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Makefile b/Makefile
index 471f2df86422..ba070596ad4e 100644
--- a/Makefile
+++ b/Makefile
@@ -1331,6 +1331,11 @@ prepare: tools/bpf/resolve_btfids
 endif
 endif
 
+# README
+# The tools build system is not a part of Kbuild. Before adding yet another
+# tools/* here, please consider if the standard "hostprogs" syntax satisfies
+# your needs.
+
 PHONY += resolve_btfids_clean
 
 resolve_btfids_O = $(abspath $(objtree))/tools/bpf/resolve_btfids
-- 
2.43.0


