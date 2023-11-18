Return-Path: <linux-kbuild+bounces-57-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 745057EFE66
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 08:59:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2A7631F233FD
	for <lists+linux-kbuild@lfdr.de>; Sat, 18 Nov 2023 07:59:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90118110F;
	Sat, 18 Nov 2023 07:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bYhntA+b"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739A24F8AD
	for <linux-kbuild@vger.kernel.org>; Sat, 18 Nov 2023 07:59:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55CCEC433C7;
	Sat, 18 Nov 2023 07:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700294362;
	bh=ltXpZxzZisF0fheB2Pyv5Oadd/1xNAmgjgKDKLE8PmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bYhntA+bM5EgGMr+Y1nx358VbjA5Rv+51e6CcZ80YMxkhU4lpcKO0p/3dXATjkqjV
	 /A1qhJ7XQkypaUyXWtwXiCmMBogTlAQtzTj4GhE0d6JAn48m0X7xA1JtoIT+0mxmaO
	 xLlQdKJPc5vBZsuV/S/WrCVEPfl2eD2/Xxfo25ky6sqqDeAOgQzKXzhBtyKiIFY5d/
	 FvVHKy7p8qFn1VA9K5Et/c2VCYldtOXiadTCumf/TzhQYwkisLzvhsM8Js4cT59mjk
	 08gXBP+1qpMPsNY66BX4/pCAn+uMqbwPBVt8eB6+HkBKA1+r5/1CLv9FlWlKHEB3vU
	 xU+XFBgSIXhQQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 6/6] kconfig: massage the loop in conf_read_simple()
Date: Sat, 18 Nov 2023 16:59:12 +0900
Message-Id: <20231118075912.1303509-6-masahiroy@kernel.org>
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

Make the while-loop code a little more readable.

The gain is that "CONFIG_FOO" without '=' is warned as unexpected data.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 19 +++++++++++++------
 1 file changed, 13 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index 958be12cd621..bd14aae1db58 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -443,6 +443,10 @@ int conf_read_simple(const char *name, int def)
 
 	while (getline_stripped(&line, &line_asize, in) != -1) {
 		conf_lineno++;
+
+		if (!line[0]) /* blank line */
+			continue;
+
 		if (line[0] == '#') {
 			if (line[1] != ' ')
 				continue;
@@ -458,17 +462,20 @@ int conf_read_simple(const char *name, int def)
 				continue;
 
 			val = "n";
-		} else if (memcmp(line, CONFIG_, strlen(CONFIG_)) == 0) {
+		} else {
+			if (memcmp(line, CONFIG_, strlen(CONFIG_))) {
+				conf_warning("unexpected data: %s", line);
+				continue;
+			}
+
 			sym_name = line + strlen(CONFIG_);
 			p = strchr(sym_name, '=');
-			if (!p)
+			if (!p) {
+				conf_warning("unexpected data: %s", line);
 				continue;
+			}
 			*p = 0;
 			val = p + 1;
-		} else {
-			if (line[0] != '\0')
-				conf_warning("unexpected data: %s", line);
-			continue;
 		}
 
 		sym = sym_find(sym_name);
-- 
2.40.1


