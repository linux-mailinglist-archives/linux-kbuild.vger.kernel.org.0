Return-Path: <linux-kbuild+bounces-5241-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FC29FC5E9
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 16:34:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55200163581
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Dec 2024 15:34:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 882051B87C9;
	Wed, 25 Dec 2024 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SaaKfLaP"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6072D1B87C4;
	Wed, 25 Dec 2024 15:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735140846; cv=none; b=dnXuDbgNu04I+V/pWUUnyzjvD6+v/HGfY5Vm1lVjPYQDXnpEZJ2g9E8RDv6CKVfwLxg3D12CmnC4WNIieQ2JrS2XqWD5hqGhecQQ+kPbQspvCJzHjZsEyKhM/SQAgd5osdtpZhmCZP5vI20RtqFwjdgFDJ8sQuZ7/nvFGc/g7x0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735140846; c=relaxed/simple;
	bh=YXN+ZbzF3iUhuFL6Fu/VQPkuKYExYWWPVHWqrBfCSAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZCnczUuIRiiLZZgI/CE1kjet8TlOUZbudCTWTkDZ2PfrismmdIvd6lrjvyUfY09uGT2M4KlXX9qIfMwM3CsYNsJa4FGu3DugkRHVUcRXA4XnPtjfndTqH/XiQEoF1KmzwMzF7JXZBd8ZLdSZ1sauEyfRUauEw4OJ24o7e9q1q+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SaaKfLaP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F9B2C4CECD;
	Wed, 25 Dec 2024 15:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735140846;
	bh=YXN+ZbzF3iUhuFL6Fu/VQPkuKYExYWWPVHWqrBfCSAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SaaKfLaPG9bxpLdCXnQhtDShFIHONpJBSlfOJ9g9Mvbr1BuhohZX5UgK45ld6BJBY
	 q8ZWByh/y/LcZmF5MqcwDd1HnGCAOpJRV6kiOPKoQVLicAbe28TOcs1vuGKhdX003s
	 bh+4tycF1tDXHH5tt9Db0jpxya5Y1jn4Sx7hHeEwDujhPtyaZm72j16meH7XHKK95J
	 HO7Fn5YMjYwOjkhArP2yM2yH1WA5lIBexi5daesZRPPBRWMp/8x64KcfoEar0OIK1M
	 U5FT4V52q9sq4RJZtf8/u4yWlaxd+fszfD/DnoF7qWajLKM6aEoQbEpQFMz8pX7M58
	 OJ2byBy8TMYGg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/3] modpost: refactor do_vmbus_entry()
Date: Thu, 26 Dec 2024 00:33:36 +0900
Message-ID: <20241225153343.134590-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241225153343.134590-1-masahiroy@kernel.org>
References: <20241225153343.134590-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Optimize the size of guid_name[], as it only requires 1 additional byte
for '\0' instead of 2.

Simplify the loop by incrementing the iterator by 1 instead of 2.

Remove the unnecessary TO_NATIVE() call, as the guid is represented as
a byte stream.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/file2alias.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/mod/file2alias.c b/scripts/mod/file2alias.c
index ff263c285977..2c7b76d4e8ec 100644
--- a/scripts/mod/file2alias.c
+++ b/scripts/mod/file2alias.c
@@ -812,15 +812,13 @@ static void do_virtio_entry(struct module *mod, void *symval)
  * Each byte of the guid will be represented by two hex characters
  * in the name.
  */
-
 static void do_vmbus_entry(struct module *mod, void *symval)
 {
-	int i;
 	DEF_FIELD_ADDR(symval, hv_vmbus_device_id, guid);
-	char guid_name[(sizeof(*guid) + 1) * 2];
+	char guid_name[sizeof(*guid) * 2 + 1];
 
-	for (i = 0; i < (sizeof(*guid) * 2); i += 2)
-		sprintf(&guid_name[i], "%02x", TO_NATIVE((guid->b)[i/2]));
+	for (int i = 0; i < sizeof(*guid); i++)
+		sprintf(&guid_name[i * 2], "%02x", guid->b[i]);
 
 	module_alias_printf(mod, false, "vmbus:%s", guid_name);
 }
-- 
2.43.0


