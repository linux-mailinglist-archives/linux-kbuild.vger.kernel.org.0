Return-Path: <linux-kbuild+bounces-2345-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68989927772
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:49:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EEB9CB22F7B
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 13:49:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 093D21AEFEA;
	Thu,  4 Jul 2024 13:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCfMxJk/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3611AEFE6;
	Thu,  4 Jul 2024 13:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100922; cv=none; b=ecTf57M48LC9tIHK5tOZCg6S9mK9Pe5S0co6VQAGBdZ0DabpWmckZDN1w+VIj1LidmvTBSE/5FGFlVWy99VYnLlI21DStZFWcU8wO5XISWs8sPFqyE4S2gM2oWSStYNV26Tjd4V/ogNSBT4QzKpTDIi2GLph0jn/sOX5sqPAUb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100922; c=relaxed/simple;
	bh=vZKpYpTh2JeJUK2HgtA2t0L6Ui24+o0AztKYIPhIvew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUGlykCvpl1+XSF+1eiB5csMFbdXF71u1KuBfIx6boYfFjlA5nWJR5RubhJNYKGtpPMyz1f7a3grd9t6R6YDcd9SLxs93VNc8hdtCiZ39d0s8q1qkzm+ern48p7vfXvEMbD3tjTwI8gJBQVRP13Ut0KoWfhNHjJ3UMKcWE1Sz8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCfMxJk/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AECC4C3277B;
	Thu,  4 Jul 2024 13:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720100922;
	bh=vZKpYpTh2JeJUK2HgtA2t0L6Ui24+o0AztKYIPhIvew=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WCfMxJk/sEb2DXwyz6hW0wloehiyjLbgYaOPYkRzX3dXNSrXxiUIjYbtMxXrUBTAG
	 J5fT67v2ekEmsOcOe06K5YOaaN2oraC9hQdLrNi3Yp4hwJjgWBOAM+Wv5yLvqxVrza
	 s6BIdJYP1bnNU11MPDzaWRjXaLqndhrMPECEJIu96gq3JPipv9g9uayCWGHynjmq/r
	 fz078UO4Yiz1dYCg8OZ6T8d5GVfCAH6b5l4vg4OJi4x32f7hqesTdkAQ5Z/GICpmlc
	 FaS7pwattr+BwOAhJnrYKn3NdTS9xRAlEyB7+sjFe3HqchAdtVhTZ1QeCAP0aYrQGC
	 QlRlasIOu9E0Q==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 3/3] modpost: rename R_ARM_THM_CALL to R_ARM_THM_PC22
Date: Thu,  4 Jul 2024 22:47:57 +0900
Message-ID: <20240704134812.1511315-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240704134812.1511315-1-masahiroy@kernel.org>
References: <20240704134812.1511315-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

R_ARM_THM_CALL does not exist in /usr/include/elf.h, which originates
from the Glibc project.

Instead, the following line exists:

  #define R_ARM_THM_PC22          10      /* PC relative 24 bit (Thumb32 BL).  */

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index e9aae1b7ff77..3e5313ed6065 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1168,10 +1168,6 @@ static Elf_Addr addend_386_rel(uint32_t *location, unsigned int r_type)
 	return (Elf_Addr)(-1);
 }
 
-#ifndef	R_ARM_THM_CALL
-#define	R_ARM_THM_CALL		10
-#endif
-
 static int32_t sign_extend32(int32_t value, int index)
 {
 	uint8_t shift = 31 - index;
@@ -1232,7 +1228,7 @@ static Elf_Addr addend_arm_rel(void *loc, Elf_Sym *sym, unsigned int r_type)
 				       ((lower & 0x07ff) << 1),
 				       20);
 		return offset + sym->st_value + 4;
-	case R_ARM_THM_CALL:
+	case R_ARM_THM_PC22:
 	case R_ARM_THM_JUMP24:
 		/*
 		 * Encoding T4:
-- 
2.43.0


