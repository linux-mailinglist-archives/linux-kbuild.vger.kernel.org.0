Return-Path: <linux-kbuild+bounces-8270-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD79B189E5
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 02:27:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C0284AA452E
	for <lists+linux-kbuild@lfdr.de>; Sat,  2 Aug 2025 00:27:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDFCC171D2;
	Sat,  2 Aug 2025 00:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ma1nRjr/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1F13207;
	Sat,  2 Aug 2025 00:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754094462; cv=none; b=CnwoMgp9VReXj2ZaBSr/Un8xFZb4vYusKEm5CuU6ghLlScKB9fD6FU5UX9wacSrnZYA+2Hd01t0ftfuiK8vUuFsvcdi0PJPzHBAPQZr+WQATSZBCf73Kq5FSYy04P852E9dAa7W9Wv0qYHgDNhG7u11aQ2ZBdDbhYZvqN3wWIZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754094462; c=relaxed/simple;
	bh=oQM6ezRz2buuwS+Ypcv6PUWbsI0rlUmpS3mnFU7pAJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dmnPYlN7vSQHTMX/spzoY3QG4NPWuFtMKefpIR20I+aDvyeQcA10skNdn39K7YDGENPU9FyzcalbMJO51zOFDuP3lRvBrzzGSbVQNny7bHf4mS9dmHrBO5eDsEVCQ9lOMx6chRlYDX/zso2DtqW12IYndi6w6fP2eMO30MpvF1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ma1nRjr/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A435C4CEE7;
	Sat,  2 Aug 2025 00:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754094462;
	bh=oQM6ezRz2buuwS+Ypcv6PUWbsI0rlUmpS3mnFU7pAJw=;
	h=From:To:Cc:Subject:Date:From;
	b=ma1nRjr/uqDVSJ5lVdyMEAvgoEUuI0AwQhWzzPdDjf8iAjawkN8eLzAI+rq+1S1ct
	 3kyVWBTR/32gmMY2lf++bbZXNGVYiDic1qtwmkv7e3QJS/nKT2llsHc746lNH65N+n
	 nXIYndaGII/DKmUc6gKcTC7jEjiIGj/GIdlHyN2tzsBtXPAYh/HxdtdlS34f18H7qA
	 etQ1cI83DX0ZFOppn31acFDW5a8EXormhSu5wYYAvv5XrKlwZ1Ers1C/NCMG5KfoyJ
	 YraxGzTpwXcFvXlA8KyIpdH1TlABtu0nMpl/KRqDeDc42agjpLBN9UVcF4KfIyAQQK
	 mtAQmvRK0LW1Q==
From: Kees Cook <kees@kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	linux-kbuild@vger.kernel.org,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH] kbuild: Re-enable -Wunterminated-string-initialization
Date: Fri,  1 Aug 2025 17:27:40 -0700
Message-Id: <20250802002733.work.941-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1265; i=kees@kernel.org; h=from:subject:message-id; bh=oQM6ezRz2buuwS+Ypcv6PUWbsI0rlUmpS3mnFU7pAJw=; b=owGbwMvMwCVmps19z/KJym7G02pJDBm90TV3FJ5tc1u4f0dqkejubEdm4feHXoZsrknq4rwTw Fob1HO5o5SFQYyLQVZMkSXIzj3OxeNte7j7XEWYOaxMIEMYuDgFYCI9lQz/DHbKs1bHTD/MKHjH 1H7ZqzUsCYV5c2o+sZz1PNrVvftsBiND97qlq53fvHni7Jfy5I9s76S2j1V3mvPnsK/niTnu830 HKwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
Content-Transfer-Encoding: 8bit

With the few remaining fixes now landed, we can re-enable the option
-Wunterminated-string-initialization for GCC. (Clang does not yet fully
understand the "nonstring" attribute.)

Signed-off-by: Kees Cook <kees@kernel.org>
---
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nicolas.schier@linux.dev>
Cc: <linux-kbuild@vger.kernel.org>
---
 scripts/Makefile.extrawarn | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index dca175fffcab..7ab8549485a4 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -78,8 +78,10 @@ KBUILD_CFLAGS += $(call cc-option, -Wcast-function-type)
 KBUILD_CFLAGS-$(CONFIG_CC_NO_STRINGOP_OVERFLOW) += $(call cc-option, -Wno-stringop-overflow)
 KBUILD_CFLAGS-$(CONFIG_CC_STRINGOP_OVERFLOW) += $(call cc-option, -Wstringop-overflow)
 
+ifdef CONFIG_CC_IS_CLANG
 # Currently, disable -Wunterminated-string-initialization as broken
 KBUILD_CFLAGS += $(call cc-option, -Wno-unterminated-string-initialization)
+endif
 
 # The allocators already balk at large sizes, so silence the compiler
 # warnings for bounds checks involving those possible values. While
-- 
2.34.1


