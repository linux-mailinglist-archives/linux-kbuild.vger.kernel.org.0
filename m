Return-Path: <linux-kbuild+bounces-2179-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EFFCF90C98A
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 13:32:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9D09C1F22825
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Jun 2024 11:32:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D871C14F9D0;
	Tue, 18 Jun 2024 10:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0o37cf/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD88314F9C3;
	Tue, 18 Jun 2024 10:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718706952; cv=none; b=nFhHzoUYEYp2bw7/t1nvuAGFIPQLvrnm5eYubBsMGjsVjRzTdqSu/fdMG5aY9xToQ5adGyg0vbuMVUlBh6ceHXRDz4Bpfa1R8MI+hr95vnBza1KbubytNpCnbrRfmgDDPEpbRzbKnX2MI7gE1jYGO8PwBUMawF+XZW6qlbet980=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718706952; c=relaxed/simple;
	bh=jnSOvlzF0h2gnOAIpy2oumGDldbLWqTa4jILWoQc9Zo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mJJI43hv2ODTkZ/myiF4juhUJOr+4iFzbf6rJgOrGw6zafTeSsBKP0mrYJ/zh8ZxWPEwliVPY771XMHu1mIxfGpVmL8JhmbjRi0SXQ6ZWaqlkyEQORQPT/9p5o7HRaiGHE9BdYVf4Wiofcgp3Y7XFmog8kWjXqBJuHuZn/4rFFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0o37cf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C2A3C4AF1D;
	Tue, 18 Jun 2024 10:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718706952;
	bh=jnSOvlzF0h2gnOAIpy2oumGDldbLWqTa4jILWoQc9Zo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P0o37cf/gZ2qZuyFJD3KrEpE6+FCMixDvmaLyz8NbYxabvbFoB3BlTP9ZFozymbX2
	 9oAJ53WKRke0tgpcuRX44ycNeI5HrbwLsEZUNdbgfZ5z0Y2CAvM02GkBZWos1xSQpt
	 GAH7COhL88klay/2WGfmftO9yCxMN41b11I507e+F2Rg/iCONgCUY6BxyzP4jT4gul
	 KZlz67spfo8a/xrlrUSpExGQQeAtUwW+DivjxwlPyI+w17KTBtqhFwwA4zZU030Jya
	 J4g6IVWeDzHudg+obp1PxDZUrkPYMtpDySCHdSjK8CGtNrgS7oF78GV6MqRPIm2jk3
	 acoPldSxkjR4w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 04/12] kconfig: remove conf_unsaved in conf_read_simple()
Date: Tue, 18 Jun 2024 19:35:23 +0900
Message-ID: <20240618103541.3508486-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240618103541.3508486-1-masahiroy@kernel.org>
References: <20240618103541.3508486-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This variable is unnecessary. Call conf_set_changed(true) directly.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

(no changes since v1)

 scripts/kconfig/confdata.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 05823f85402a..4359fbc9255b 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -477,7 +477,6 @@ int conf_read_simple(const char *name, int def)
 int conf_read(const char *name)
 {
 	struct symbol *sym;
-	int conf_unsaved = 0;
 
 	conf_set_changed(false);
 
@@ -508,11 +507,11 @@ int conf_read(const char *name)
 		} else if (!sym_has_value(sym) && !(sym->flags & SYMBOL_WRITE))
 			/* no previous value and not saved */
 			continue;
-		conf_unsaved++;
+		conf_set_changed(true);
 		/* maybe print value in verbose mode... */
 	}
 
-	if (conf_warnings || conf_unsaved)
+	if (conf_warnings)
 		conf_set_changed(true);
 
 	return 0;
-- 
2.43.0


