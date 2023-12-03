Return-Path: <linux-kbuild+bounces-251-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E399980227C
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 11:25:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8C89D1F21034
	for <lists+linux-kbuild@lfdr.de>; Sun,  3 Dec 2023 10:25:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63A6328FE;
	Sun,  3 Dec 2023 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cO6Viyxe"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0419AB654
	for <linux-kbuild@vger.kernel.org>; Sun,  3 Dec 2023 10:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A04F0C433C8;
	Sun,  3 Dec 2023 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701599140;
	bh=Lnc3/O+6CGAEAS2bB5Go5eHeE+xwqLvuu2/DPt0BL5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cO6ViyxeBuYd4k0wYeSUZ2wRRCgCArk8SlgrIlhwtkOCQuajWRfPbcE/PA68owivB
	 qzSGcHRasVodTIV5akKFFbHJJerXJTboGgemSWzDxbcQWyj2BEUVp6Iytzg+doS3ci
	 ChiV5qQaogDbCC4R/vZTLgoXSxUVHmqzpD1NO94CUSyUrtvWsVnCTVXSr1m0dyFhZc
	 XBQwGJl7icuvWAQ3CSoyGadulYrl3B8bt+pFfA4qfQmW6GmZqNF2bT9ZtuSQM3p5gB
	 AR4QDeP2XKfr5Fe3QfTWUWV8UGFNa1FeIapCUTirBFC+D+sr6GWALN7w/7cghSoXf2
	 r48aKdBWseT4g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/6] kconfig: remove redundant NULL pointer check before free()
Date: Sun,  3 Dec 2023 19:25:28 +0900
Message-Id: <20231203102528.1913822-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231203102528.1913822-1-masahiroy@kernel.org>
References: <20231203102528.1913822-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing NULL to free() is allowed and is a no-op.

Remove redundant NULL pointer checks.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/confdata.c | 3 +--
 scripts/kconfig/util.c     | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/scripts/kconfig/confdata.c b/scripts/kconfig/confdata.c
index bd14aae1db58..f1197e672431 100644
--- a/scripts/kconfig/confdata.c
+++ b/scripts/kconfig/confdata.c
@@ -432,8 +432,7 @@ int conf_read_simple(const char *name, int def)
 		case S_INT:
 		case S_HEX:
 		case S_STRING:
-			if (sym->def[def].val)
-				free(sym->def[def].val);
+			free(sym->def[def].val);
 			/* fall through */
 		default:
 			sym->def[def].val = NULL;
diff --git a/scripts/kconfig/util.c b/scripts/kconfig/util.c
index b78f114ad48c..92e5b2b9761d 100644
--- a/scripts/kconfig/util.c
+++ b/scripts/kconfig/util.c
@@ -42,8 +42,7 @@ struct gstr str_new(void)
 /* Free storage for growable string */
 void str_free(struct gstr *gs)
 {
-	if (gs->s)
-		free(gs->s);
+	free(gs->s);
 	gs->s = NULL;
 	gs->len = 0;
 }
-- 
2.40.1


