Return-Path: <linux-kbuild+bounces-2582-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 05096934240
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 20:28:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2F3731C2101B
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2024 18:28:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24E961822D7;
	Wed, 17 Jul 2024 18:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lawwK3IZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25E6ED8;
	Wed, 17 Jul 2024 18:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721240916; cv=none; b=tauBdrnQAlF563hP/urbEYjsURVSGog3F9j7/C3uAMqQmryfhLRtLdGQgGuXvbg5Yepw19sI0dkSLJFdpIaGr/tnKqpYLlP3TLZ9kKIej1pMI+vM+K7v8jFyQ4Rmd+nZyTS+aKrKY+uIKZM7urzDQatNBbZe3o4Eatu4sWuEOEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721240916; c=relaxed/simple;
	bh=UZpCEbToQJ3KFWM2aFPU88s+kqE5td/SuF15FNPL7q4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgygG2VMnQ+vKERCaanTcTB4HbRumMEFySE2vM1zm5RlSzACds8uL8aJlLuD2XAhVePb+jV+XDGhqCcTfUd7LKfIOLZXwxthXHolMpOCG5jVJkbyNQLceh1rzqE54Ng/GHj2RF1QatlRjUpsmvx2YKbXUysrN22BT66Wp7W1I+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lawwK3IZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A423C2BD10;
	Wed, 17 Jul 2024 18:28:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721240915;
	bh=UZpCEbToQJ3KFWM2aFPU88s+kqE5td/SuF15FNPL7q4=;
	h=From:To:Cc:Subject:Date:From;
	b=lawwK3IZiZ9G6x27GGupr5WNc2V97481AN3WgoAhUE34jbygOnJQuU7wizHDDAARu
	 5+C2vCuiODM22BW5l6ai8ITi8qqyo+ANhCPBr8TM70v9NKZaOfFYySCOc0AZTAlKL3
	 M7W/7nYi8mfeJ5zrBbJvsdg9tXTzuVn4IBGE9VW8azN87E0HESoqZaMkPpoIDC/Aiu
	 sgNd35nIcBejeHTy9bu2xiv7PeKmvRVDMlFOX1UTl3tv5D0kxBzj9SnosOFamo+8wh
	 6NGSK1jr8sHJneeBbUBs5NV1AO/ElbQz0kv+cZ79dicIJ3IYEJt+rwLb2tIGBF+rZK
	 HCvtwzFT0YXsQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Jiri Olsa <jolsa@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Brian Norris <briannorris@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] Makefile: add comment to discourage tools/* addition for kernel builds
Date: Thu, 18 Jul 2024 03:28:19 +0900
Message-ID: <20240717182828.1527504-1-masahiroy@kernel.org>
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
cause issues. I was recently poked about a problem in the tools build
system, which I do not maintain (and nobody maintains). [1]

Without a comment, people might believe this is the right location
because that is where objtool lives, even if a more robust Kbuild
syntax satisfies their needs. [2]

[1]: https://lore.kernel.org/linux-kbuild/ZnIYWBgrJ-IJtqK8@google.com/T/#m8ece130dd0e23c6f2395ed89070161948dee8457
[2]: https://lore.kernel.org/all/20240618200501.GA1611012@google.com/

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Acked-by: Nicolas Schier <nicolas@fjasle.eu>
Reviewed-by: Brian Norris <briannorris@chromium.org>
---

Changes in v2:
  - rephase the comment for clarification

 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 768d3dc107f8..943899656977 100644
--- a/Makefile
+++ b/Makefile
@@ -1328,6 +1328,12 @@ prepare: tools/bpf/resolve_btfids
 endif
 endif
 
+# The tools build system is not a part of Kbuild and tends to introduce
+# its own unique issues. If you need to integrate a new tool into Kbuild,
+# please consider locating that tool outside the tools/ tree and using the
+# standard Kbuild "hostprogs" syntax instead of adding a new tools/* entry
+# here. See Documentation/kbuild/makefiles.rst for details.
+
 PHONY += resolve_btfids_clean
 
 resolve_btfids_O = $(abspath $(objtree))/tools/bpf/resolve_btfids
-- 
2.43.0


