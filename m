Return-Path: <linux-kbuild+bounces-5640-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 731A6A297E4
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 18:48:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 699241627C9
	for <lists+linux-kbuild@lfdr.de>; Wed,  5 Feb 2025 17:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4CD4F1FECA4;
	Wed,  5 Feb 2025 17:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N9XQXxOc"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21DC31FFC4B;
	Wed,  5 Feb 2025 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738777554; cv=none; b=XLpxVmTTVSnhnF/ej1N2o7Iqx6wvUwXDmWgStrDI3GyxkxY0x2epFfCfZLJPLCZhX60dRZvsbCFzcQRdiK5fubVNp6Kt1keKd2NhxB9VM6IMk/iBD189rsfsqtRZ4TSL7vtqQnRFdQD4VjvRbrA76Be+vNSlKuoWJFWaZZDOsDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738777554; c=relaxed/simple;
	bh=DloXDP91H1NJBEjBL2k+1uRmcDXD/yuVdI5mEma577Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J5GYEJBLHEun1MCc756tbXRxWxMPAq4pSYzshhwh3LjqPfnyQJ5PL9ypyDWEPPLe5Rohc/rjsBhQRFv+NGWVuTipmrNtdnBjNQleKxi2kY3XQ/jEg5zApPCjp+gsB/juVQr8VyE96cGa36o9zwh1TshoYg18ZDYk5pVPt4kWO68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N9XQXxOc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B264C4CED1;
	Wed,  5 Feb 2025 17:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738777553;
	bh=DloXDP91H1NJBEjBL2k+1uRmcDXD/yuVdI5mEma577Y=;
	h=From:To:Cc:Subject:Date:From;
	b=N9XQXxOcJ/RHb5o/GMj646dtzzysQ4hKqN0WJeMtbMs8el07eixW87juFWvV92zm7
	 d/hsR/Svcp9rEqkgCj3oNVfjuU8EbgkAlGg+DVxnVHgGSFozEWHEeGbPh/z2nnjhGr
	 5XuRuyhun71thFGCvKz1NJYWUw1VSxzajxj0LwfgyxhAwf8c4/uMH/m7dRsS0j1UXi
	 yuqzZOAuhfLwIwmLjvNKrWBYVnCJuxo18RT3rgCHUY+1WKwNv8KSQxTcIjKsdyt1QL
	 aWyoF2B7KxVRsyanTElH4H0jrDKwCyV8PZMRzeNu3sMuz9U+MuenNwBhMnvrcTcJob
	 +Tv0b3pxwqAlQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] genksyms: factor out APP for the ST_NORMAL state
Date: Thu,  6 Feb 2025 02:45:28 +0900
Message-ID: <20250205174532.3495435-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the ST_NORMAL state, APP is called regardless of the token type.
Factor it out.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/genksyms/lex.l | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/scripts/genksyms/lex.l b/scripts/genksyms/lex.l
index 22aeb57649d9..f81033af1528 100644
--- a/scripts/genksyms/lex.l
+++ b/scripts/genksyms/lex.l
@@ -176,10 +176,10 @@ repeat:
   switch (lexstate)
     {
     case ST_NORMAL:
+      APP;
       switch (token)
 	{
 	case IDENT:
-	  APP;
 	  {
 	    int r = is_reserved_word(yytext, yyleng);
 	    if (r >= 0)
@@ -224,13 +224,11 @@ repeat:
 	  break;
 
 	case '[':
-	  APP;
 	  lexstate = ST_BRACKET;
 	  count = 1;
 	  goto repeat;
 
 	case '{':
-	  APP;
 	  if (dont_want_brace_phrase)
 	    break;
 	  lexstate = ST_BRACE;
@@ -238,12 +236,10 @@ repeat:
 	  goto repeat;
 
 	case '=': case ':':
-	  APP;
 	  lexstate = ST_EXPRESSION;
 	  break;
 
 	default:
-	  APP;
 	  break;
 	}
       break;
-- 
2.43.0


