Return-Path: <linux-kbuild+bounces-4734-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 327419D311F
	for <lists+linux-kbuild@lfdr.de>; Wed, 20 Nov 2024 00:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC0E7283F5B
	for <lists+linux-kbuild@lfdr.de>; Tue, 19 Nov 2024 23:57:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 597081D417B;
	Tue, 19 Nov 2024 23:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XqVMXPQk"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F63D1D416A;
	Tue, 19 Nov 2024 23:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732060633; cv=none; b=oAqDJoZSKGGA0PVs/dyn/HbvSOnFAZvxQvOrpW/DRtQy3nCBdd0sPkDI3VKxkqlhpZVK4frdshDbMy9FBB2rrQyxM49vGbKYiwuObfoQTFiefzclKAsCa36D08qSYHvx2A562zldIqBjmYk2Zj8hw9tRCD3dpFvONtejTcLsb/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732060633; c=relaxed/simple;
	bh=1R1KuOLQwu0JBV+qDO/hqjP72lYtvycGXqAGNLZOjaw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IDNmSjcKfss0BPb5/Mf/nxj3qROYkm4hEVzcCFdbgGSpZza05bA5jYA2/lwSv0BicbXY5jJsJk0/jqfSUmW5d5Yon0ImS1X4XTqOCUdpQgcwN0+nhrDEi3KBxwHnjDrXZ31r4BO5cLnHWhcR2PxpzQYZoCxWuajffcqaR3wH8FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XqVMXPQk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BA73C4CED2;
	Tue, 19 Nov 2024 23:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732060632;
	bh=1R1KuOLQwu0JBV+qDO/hqjP72lYtvycGXqAGNLZOjaw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XqVMXPQkyS7D7VyIPmJraiMsleQceyGGeu+3iyzTUwJfWmYBXKs0ByfRiZ6G5KG/d
	 4jz7xiUeUMIdyTgv21+F6ZwRpe0z+qhqNnhA2Khg0ToAUdLEGKNkJk6Wehqe6PTtLD
	 4UCUeFwevwuIyoqm36UrD5vYvxWi4Ow98vUK5sKZR9BprBsFWRHcp8yMxvCxAXJz0R
	 fadSdoPv6lpcBJDxPubOeRYgzC/ka3FOV9/g+zWyntH76epfXoF8nUSxFG3131yCp7
	 jLDXbraO0vLTM/bSn6WZdQWWWe1efYWxRijW/OeZUzyAj9F89zbUiCFCLpbUM+yfB5
	 YGdJ9ZgfdezCg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 02/15] modpost: remove unnecessary check in do_acpi_entry()
Date: Wed, 20 Nov 2024 08:56:40 +0900
Message-ID: <20241119235705.1576946-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241119235705.1576946-1-masahiroy@kernel.org>
References: <20241119235705.1576946-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'id' pointer is never NULL since it has the same address as
'symval'.

Also, checking (*id)[0] is simpler than calling strlen().

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index 634e40748287..34678ed40fdb 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -570,7 +570,7 @@ static int do_acpi_entry(const char *filename,
 	DEF_FIELD(symval, acpi_device_id, cls);
 	DEF_FIELD(symval, acpi_device_id, cls_msk);
 
-	if (id && strlen((const char *)*id))
+	if ((*id)[0])
 		sprintf(alias, "acpi*:%s:*", *id);
 	else {
 		int i, byte_shift, cnt = 0;
-- 
2.43.0


