Return-Path: <linux-kbuild+bounces-7339-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C1200ACACD1
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 12:55:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8AF5717E701
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Jun 2025 10:56:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CFD4204C2F;
	Mon,  2 Jun 2025 10:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WiUdmHzH"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F27841E0083;
	Mon,  2 Jun 2025 10:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748861755; cv=none; b=FKYbsvG3aH3db8Zya3HWUZr+ta1IsjiyBeVj1WOrzRgeSPmHsmzmHZeDr861XADFpckgiMMZYdZx6L/UCS5NsQgu1kTbpJPCFdmg2NBFb8TsmjlqWq4iRFv3DsiUve8Y02T2dNRV1t7dyQ7oWDr+KFaodljd95yPSh8Zu4OSAjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748861755; c=relaxed/simple;
	bh=diBNoycsWZbCPBMZfTRaPIyrQ7LdBRUIphqw7oH8gMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=G2wO5SKDjGUr9wn5aieWOcomPx+czBOE77lOnibXB23kwuPAW8thhmsKL0gLXuaUi2i4Ce8mBu/y5/HtM/CNmf3lb2I0fD1uuNyZ5BmqtSjQgiUfNUKSlR8gAZivtKXxcaocb+fUGl9a5D50cjcP33lRnyWWi+dzM7iDf5AxoOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WiUdmHzH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE6BC4CEF1;
	Mon,  2 Jun 2025 10:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748861754;
	bh=diBNoycsWZbCPBMZfTRaPIyrQ7LdBRUIphqw7oH8gMA=;
	h=From:To:Cc:Subject:Date:From;
	b=WiUdmHzHMnlzDKAatkPMxSfGyT1+SVwfSelfW5s4tOZPTI4F22FTo/Hwo91tS+lps
	 K+M/M6VYUhmL+8R4irbKwgMLTnh1Jf5SRj1y1pHxVVaI6AbHI1HvRGvnEFs/GKQgZY
	 H6spbHBOCQ1gT6QnJ7B6Knl8d/NzqT7PqFqpQbWiiOhIUaqIcxg4rOF0tog4dtcd49
	 SFZUe3NA5NyUwAdvPS8EhaS0wSwTmUSRNGDUxLLnxn/JEIEysrb/3UqTwCmRVaDY3N
	 Hg0arEASBkTbc8GTYh7fQ0lOmDUG2m9IEIGSUBYZiVWMzDD4B7kHW5jdWSA67WdNEV
	 sE7u3/bcFgkDg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Daniel Gomez <da.gomez@samsung.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	linux-modules@vger.kernel.org
Subject: [PATCH] module: make __mod_device_table__* symbols static
Date: Mon,  2 Jun 2025 19:55:36 +0900
Message-ID: <20250602105539.392362-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The __mod_device_table__* symbols are only parsed by modpost to generate
MODULE_ALIAS() entries from MODULE_DEVICE_TABLE().

Therefore, these symbols do not need to be globally visible, or globally
unique.

If they are in the global scope, we would worry about the symbol
uniqueness, but modpost is fine with parsing multiple symbols with the
same name.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 include/linux/module.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/module.h b/include/linux/module.h
index 8050f77c3b64..92e1420fccdf 100644
--- a/include/linux/module.h
+++ b/include/linux/module.h
@@ -249,8 +249,8 @@ struct module_kobject *lookup_or_create_module_kobject(const char *name);
 #ifdef MODULE
 /* Creates an alias so file2alias.c can find device table. */
 #define MODULE_DEVICE_TABLE(type, name)					\
-extern typeof(name) __mod_device_table__##type##__##name		\
-  __attribute__ ((unused, alias(__stringify(name))))
+static typeof(name) __mod_device_table__##type##__##name		\
+  __attribute__ ((used, alias(__stringify(name))))
 #else  /* !MODULE */
 #define MODULE_DEVICE_TABLE(type, name)
 #endif
-- 
2.43.0


