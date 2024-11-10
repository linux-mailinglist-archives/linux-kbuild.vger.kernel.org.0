Return-Path: <linux-kbuild+bounces-4612-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 013D89C305C
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 02:39:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AD46C1F21765
	for <lists+linux-kbuild@lfdr.de>; Sun, 10 Nov 2024 01:39:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E4EF1537CB;
	Sun, 10 Nov 2024 01:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FYpHijwk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D75C3153573;
	Sun, 10 Nov 2024 01:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731202631; cv=none; b=IQ2pv1VOil6u+Gp+1YYXasrokP5lvOXGFB/8S434yDEWPvPpaUtIHmv6+xU2RqyixmGSYDDbBRG2n9W0V6Gdz/edSvfEAuQ5hbndW8iHF7UgQZRotZJjE8nm7lY07E9bCr0472lM0v6NhYy9lqtNWlRV29uakgJW2aUqF7q52yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731202631; c=relaxed/simple;
	bh=us5XMqVwdbsYqray5sAUkCpHJq/PzlTni1SE6suosWA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qdCxgChqVYUem7cpkQYCKLAhe0oYXLQrDp+/fJK24+FU8bsfzrXNrMdE4ylfpQl91yXPucdLQVSmOqKJ1UUYAWWD5hm0lSq6dYgfHumZt2i8eNQZbUjK2wnIFrzt4AW+jqlTajFoyIa1aJKF7A0bDvmJaYjGZSEdMmFviMjJ5ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FYpHijwk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70568C4CED2;
	Sun, 10 Nov 2024 01:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731202631;
	bh=us5XMqVwdbsYqray5sAUkCpHJq/PzlTni1SE6suosWA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FYpHijwk9mcoVCtK/bAUiFUeeUIfQf92dIktH/Ui4EM0+1FbLTrjZKR8ZDDZWsG8R
	 3tdxMA9KnbGlYbhUQoCkE3K/POCpboPw+Tsj8vHCI3RcxuB5dR0DL155C80qzwUqFa
	 LflcVEYQv/FONuhc6bx14auG8qGNtGBwrxL5Z73IrBNDp4teVkkwgILQpFk1uqSihY
	 hYnx4j3hz4//F5pxW0welWeNGSBQBr78iNnllRAmzWQQE7qyLqutK/JYjOeXc0u1QJ
	 6860ZflHe8fte6sr/phGtKskgwCDD3qWGZ4rRIzRALRMWDg9ZDbtMmBIVHbZCVUAL+
	 k0lEGg/1Euv5g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	cocci@inria.fr,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2 08/11] kbuild: support -fmacro-prefix-map for external modules
Date: Sun, 10 Nov 2024 10:34:36 +0900
Message-ID: <20241110013649.34903-9-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241110013649.34903-1-masahiroy@kernel.org>
References: <20241110013649.34903-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit makes -fmacro-prefix-map work for external modules built in
a separate output directory. It improves the reproducibility of external
modules and provides the benefits described in commit a73619a845d5
("kbuild: use -fmacro-prefix-map to make __FILE__ a relative path").

When building_out_of_srctree is not defined (e.g., when the kernel or
external module is built in the source directory), this option is
unnecessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---

Changes in v2:
  - Check building_out_of_srctree instead of VPATH

 Makefile | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 38ce19747728..5488aa96b46b 100644
--- a/Makefile
+++ b/Makefile
@@ -1041,8 +1041,10 @@ ifdef CONFIG_CC_IS_GCC
 KBUILD_CFLAGS   += -fconserve-stack
 endif
 
-# change __FILE__ to the relative path from the srctree
-KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+# change __FILE__ to the relative path to the source directory
+ifdef building_out_of_srctree
+KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srcroot)/=)
+endif
 
 # include additional Makefiles when needed
 include-y			:= scripts/Makefile.extrawarn
-- 
2.43.0


