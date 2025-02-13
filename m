Return-Path: <linux-kbuild+bounces-5741-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F8BA348F2
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 17:05:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A7117161EF9
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2025 16:04:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C3918784A;
	Thu, 13 Feb 2025 16:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="MZU3rLrK"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC26519D092
	for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 16:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739462683; cv=none; b=L/FCemEBKZgenOf3g7ki9rWTd5DgrzPH4PC+qidHXtt9zwsFxXD3N9KuqS2p2xYyLi8b9DBmu6qloS/etAFxJCHlregWeUrJDSPDprFYKfYkieoY8oy2slat0Nv2hkgBE3ruLONJ/qIzX2XHobAihTO//qLLxVKM4hZ82aa5ebA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739462683; c=relaxed/simple;
	bh=GabBB/XO4AMFto6/6PP9NaekvK6Eev5NPIae5xOo9VE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=qeQWbkeG7QDXpJIxb4Lpq8YTZiuoXS2nAZZaZ9Ye9MAhd6vg4FdFFwlmJmF1BNZbmHcfI0R9GHKzAJFUxsD6Adyz9Ayrfcjt2eXL23TUMBNF1Qb53vc+rPhBqyjYFudKMl963d2UQ9pFFiGpFIvfpdEGv4dbb/SDt9b0CtCAKec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=MZU3rLrK; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4394a823036so11846315e9.0
        for <linux-kbuild@vger.kernel.org>; Thu, 13 Feb 2025 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739462679; x=1740067479; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ScXkYd1lWroAt8TZyrWs1EkWrcjKhcOM78p2vgMw4Ic=;
        b=MZU3rLrKGeTtvAoNt1iBt/j7ngn5KzIG3iIYS8MSKDDMszcpzIsmS+iavgGvviTE9t
         +pL9hevuHjO6cEwbkYgErZ06seRcGzFD+ai9DMb3DwIxlb/hL0n7DGqSK+yKrFdjqnLw
         d+vCBefMbDctH0zD42BrpaiMEBOEdAXJprCD8J/wiAuVL8WKzmNCMh/8j3oxk4vob0eE
         yP7RjTzQoydMrVL5RUWVTNMzpzyHrP5U9MPniCaEDztOa36vaGTuGjimceFCJlmSe0ID
         NTZXcIXV9n7kMs+x+7BbGpqfXbUSqOJo7R3V0fOg711NOGrNVgS8xVgxGqUwPw409Z7Z
         fIAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739462679; x=1740067479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ScXkYd1lWroAt8TZyrWs1EkWrcjKhcOM78p2vgMw4Ic=;
        b=RFFFFbauLg3pxYjIEcwOpEr+jCFAtYI+580UwKKlKd0YVA4yhQr0Si8lJSgLZKB46M
         nVtvC629sSwCjf9vrjuJqJLeyG5mlCJjuUdW0eV/zYEgI0tjrXF4zzijIWOrS78OW8b6
         4r2hxnAN7iWkGonRwEjgc19FPrh5OCLQZgRjMXkHAs5OX2L0l0VLTt6Vf3Cc3xD6mC7k
         2FBfCxKtv+iuQZz1coTNCLgy69xlBfKcNQrzEQDKML7YrI4E96J9QAKIB8Vq+xjgyf2X
         KG6//AkFZ15J2oBazheD25yb7i045JXVjEQ/JlvRWXHYlA+VEwOGhw+9aWaZfKousGui
         W5cg==
X-Forwarded-Encrypted: i=1; AJvYcCVOb4/9uaP3Dcl5H3JX7gD1/ckapcZXJu1CGheMuW9CdSSlgBN0dqMPiEvfaeTGfMWeOCLsvXKo5uCIdjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywn87I7rDuCohG6D2GPoWAGukTvmFkQnv0FuwHrOOPI0SrCBstz
	IR7zNDsV3rgdk19UOioZD2bBb/U5kCDBx5ENiSTAzdKdQgMm5tjCgcrOFPXNKsA=
X-Gm-Gg: ASbGncuw3FKau7BrTfyYHQ5Lomsc2NqNTxO4WScssqPah3dA/n6gCKzX9ESdxtr1czY
	345x8PRlEZEB1Wc02NwXB57AHwSv0sxdRlIPe9HnWFSyLOlr+M2LJbJ+fDuhhpPqGB+sX1jlZP5
	o0bn/uJW+tCjD5Yi7FvKULppueQEK0JCxOP1PtH/AfUHQP9jd/lNM85svnX94y8FaCAslKJsgMr
	7FNb8Rguj0ftsQbQd/HOOQ3JWLxi3G+7ONJomegxYhR+in/WEYpD5OOuB8rI1FMHy5rnOye+C8J
	yhn9JJYU8l5qVxpAs2X/3D54VWJXBPfx3Hs+BeOLTxPLMr/Hgm23h+uQRQ==
X-Google-Smtp-Source: AGHT+IEPznaqabtzhdRx+CNhBSWhT+zuSELyNefBcm+310ijz6rx1O9S7Omk0UNmeK4z8pMNvrYD6A==
X-Received: by 2002:a05:6000:2a6:b0:38a:88ac:f115 with SMTP id ffacd0b85a97d-38dea2e98d1mr8209846f8f.34.1739462678718;
        Thu, 13 Feb 2025 08:04:38 -0800 (PST)
Received: from localhost (p200300f65f083b0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f08:3b04::1b9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d8dd6sm2276595f8f.62.2025.02.13.08.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 08:04:38 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH] modpost: Fix a few typos in a comment
Date: Thu, 13 Feb 2025 17:04:29 +0100
Message-ID: <20250213160430.104118-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=899; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=GabBB/XO4AMFto6/6PP9NaekvK6Eev5NPIae5xOo9VE=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBnrhgPA9TSuASBaF5k7yiJ5T5YYOcds4fWQfQTJ GcUTZmsNh2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZ64YDwAKCRCPgPtYfRL+ TtY0B/4trq7NOu7i8SqR0LY+oozYJRFSGZ81gmaORkvP0OxxnUAKfW/FrkCWKeO/7rvXx0bijsD 9ME3op7lmPhHFARKIYezG+ABQDG3HwRHVrg32FP1SknDNkpIRGz2rBLTa/0R6Tpmz6yA17IkuS0 24eUnA/9+6TB4HwcjNNLR3eln9sQmeMnpkBY6SibXN8k4hBevZPo/wWMUBsw6YPJ60c6TmDz8fx LrpfeJdYTrGWbQ52F1AQtLUjF9uxgwty8ej0gCIz6LRf+Ao8W8CRHZb//jL4q+5PyOVp2tlh5Ok HVWlNUOo5lr7Yxdled2986WvIr8QajOn8Pj6nBi/QlLdc6he
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Namely: s/becasue/because/ and s/wiht/with/ plus an added article.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 scripts/mod/modpost.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 36b28987a2f0..c35d22607978 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -190,8 +190,8 @@ static struct module *new_module(const char *name, size_t namelen)
 
 	/*
 	 * Set mod->is_gpl_compatible to true by default. If MODULE_LICENSE()
-	 * is missing, do not check the use for EXPORT_SYMBOL_GPL() becasue
-	 * modpost will exit wiht error anyway.
+	 * is missing, do not check the use for EXPORT_SYMBOL_GPL() because
+	 * modpost will exit with an error anyway.
 	 */
 	mod->is_gpl_compatible = true;
 

base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
-- 
2.47.1


