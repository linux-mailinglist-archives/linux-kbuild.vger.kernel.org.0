Return-Path: <linux-kbuild+bounces-2344-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 613EA927770
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 15:48:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 929331C23302
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jul 2024 13:48:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 633AA1AEFC1;
	Thu,  4 Jul 2024 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CTHfL/JT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3673F1AED5E;
	Thu,  4 Jul 2024 13:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720100920; cv=none; b=ejv/KKYu3QnNoP6H38trrDgc58zDMFfIlibA96aCQSanP+L3cdXFN7Nt12wFX/M4dSwzr9bcYEsfKWYwHfnGLYf5rv6fU7bDPDk5hvJ02CWfdMDBBkQbC5CZOpa9e7Nko21j76zUD1A6od6RE83a/gQdlxTflALmwTbepAYFjuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720100920; c=relaxed/simple;
	bh=opXwWickx4rx1GhIoIovHA7DJlyCrscafcIg4XeWn80=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EVtLK+j7E256srb0AYVT2svQKEC3AGPwlunuJC0j7hWzrusMMyYu5Pt4NU5LQ6y0P/g8xdRXHy0J2E0CEdNTL2B9gRJ543pcrX6AbohpHSs2LlagQLpc+Z6h2fL2sgsoSoXRu7JUyvEOum89Tk7jx/SYeCWgUceydU7jnVUZb18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CTHfL/JT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B752C3277B;
	Thu,  4 Jul 2024 13:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720100920;
	bh=opXwWickx4rx1GhIoIovHA7DJlyCrscafcIg4XeWn80=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CTHfL/JTYTnePjTUDvNywUILWSwRuGYy8TiZ+ug149TgDDqSlki/8yVw0Rc83t4lm
	 IRHZrehsBDJVwQxXQiLHLhFdVvJ0tz+GYrsDxy+qhyiUk1/dG1ZCQ0NatcwtrbAGdm
	 h8IM6l9vCIzyUwh9sMR8Le6FZDDidoway0n1/sZ7STlkpjKJQAu6VGiZTWO/KbyNAT
	 V/HkhEvy4U3nQoiJtfDnnTZfjsmaGLjVfw0JnXRKQCsgQysrew2kwDhwCa/+0DRDHi
	 dvyyiVXNf/2jwpNjjp08HPdyYAV5nnA3OPuAt0P7mCHm8TtQ6nk0cSyDIujvDe24sY
	 R8fOU+2iBLm3g==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH 2/3] modpost: remove self-definitions of R_ARM_* macros
Date: Thu,  4 Jul 2024 22:47:56 +0900
Message-ID: <20240704134812.1511315-2-masahiroy@kernel.org>
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

Commit f5983dab0ead ("modpost: define more R_ARM_* for old
distributions") added self-definitions for the R_ARM_* macros to fix
build errors on CentOS 7.

RHEL/CentOS 7 were retired at the end of June.

Remove all the R_ARM_* definitions (except for R_ARM_THM_CALL), which
should be available in recent distributions.

Glibc added most of R_ARM_* macros in 2013. [1]

[1]: https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=08cbd996d33114ca50644d060fbe3a08260430fb

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/mod/modpost.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 11731fc62140..e9aae1b7ff77 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -1168,39 +1168,9 @@ static Elf_Addr addend_386_rel(uint32_t *location, unsigned int r_type)
 	return (Elf_Addr)(-1);
 }
 
-#ifndef R_ARM_CALL
-#define R_ARM_CALL	28
-#endif
-#ifndef R_ARM_JUMP24
-#define R_ARM_JUMP24	29
-#endif
-
 #ifndef	R_ARM_THM_CALL
 #define	R_ARM_THM_CALL		10
 #endif
-#ifndef	R_ARM_THM_JUMP24
-#define	R_ARM_THM_JUMP24	30
-#endif
-
-#ifndef R_ARM_MOVW_ABS_NC
-#define R_ARM_MOVW_ABS_NC	43
-#endif
-
-#ifndef R_ARM_MOVT_ABS
-#define R_ARM_MOVT_ABS		44
-#endif
-
-#ifndef R_ARM_THM_MOVW_ABS_NC
-#define R_ARM_THM_MOVW_ABS_NC	47
-#endif
-
-#ifndef R_ARM_THM_MOVT_ABS
-#define R_ARM_THM_MOVT_ABS	48
-#endif
-
-#ifndef	R_ARM_THM_JUMP19
-#define	R_ARM_THM_JUMP19	51
-#endif
 
 static int32_t sign_extend32(int32_t value, int index)
 {
-- 
2.43.0


