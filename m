Return-Path: <linux-kbuild+bounces-56-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E777EFE63
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 08:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3671D1C2094F
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 07:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 83DED3FED;
	Sat, 18 Nov 2023 07:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dO8nnAy9"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66A3B110F
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 07:59:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A797C433C9;
	Sat, 18 Nov 2023 07:59:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700294360;
	bh=JYJrXNFpHjgM9hzobfa0oay+OYFkHJDCeKRYtYSm0BA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dO8nnAy9OwYrA+7yb/7/G7ZlgLeEt/p5iY39MO0KMnqweiduZpzpDiySsbNtIuris
	 3XRqXgjRWjdHgJ/yB+xjvPAdfA9KZQ6lk+V33CWAdWFeOFC4Ku25rt1uPTxijl0vFO
	 3HzJHG3iWTcWokJY1ON/H0qoZQjNL1YMOzOd3LBOlaOdMyfyomdlJUlxI1GP2qd4w8
	 3I+tv5NxJrGgUIjhD3u872dZjB3kohUSIEYOcGvcYEkrfi3OkFS4c0s+vQURYryrIr
	 td0ypwhWx4E4vvqOn7LEqzCZDhuqpyO/2BS9uTBeLL/zzA+dIfsLiaSS2QGaoJepZ9
	 qyQJJlqox5B6g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 5/6] kconfig: require an exact match for "is not set" to disable CONFIG option
Date: Sat, 18 Nov 2023 16:59:11 +0900
Message-Id: <20231118075912.1303509-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231118075912.1303509-1-masahiroy@kernel.org>
References: <20231118075912.1303509-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, any string starting "is not set" disables a CONFIG option.

For example, "# CONFIG_FOO is not settled down" is accepted as valid
input, functioning the same as "# CONFIG_FOO is not set". It is a
long-standing oddity.

Check the line against the exact pattern "is not set".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 795ac6c9378f..958be12cd621 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -454,7 +454,7 @@ int conf_read_simple(const char *name, int def)
 			if (!p)
 				continue;
 			*p++ = 0;
-			if (strncmp(p, "is not set", 10))
+			if (strcmp(p, "is not set"))
 				continue;
 
 			val = "n";
-- 
2.40.1


