Return-Path: <linux-kbuild+bounces-7210-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CD6ABFD9B
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 21:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 79AC31BA474A
	for <lists+linux-kbuild@lfdr.de>; Wed, 21 May 2025 19:59:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 440AE230BEB;
	Wed, 21 May 2025 19:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZ9vd0EM"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4B322E
	for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 19:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747857533; cv=none; b=kvFDSPzXPYGfrZ5bnMYWm7zb7x495EwMtGUJMxh6+8ddSADJmbpfdc0YMnu18j0BggM937euORnxlZYmQFzLGBMcHkgPsL624QSrpdk2n85nqDztOJgNRlcUWRCzMJVtiTyjQ58duDcFfxfk4HnEzHhbW6flNITJ1J0yfLCHQfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747857533; c=relaxed/simple;
	bh=XG3X1q1rr8nKvrLd48Upk1dSlK7f0X5ZwUJDW/krPE4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=MiBBSPT7iIzONPawyrhNiHchtsSmX9focESRg59Tjl6tAQ/mTB2zB2YyjntPFned8SPw669tidmnDNcA/mpf5+hmj7gyPPqTeOjaAgn6GD0iLnqqi+yACWU384CEZ27t+FUWjmjyifYI4/uANYd44z68qf8rbPOKfUIXCly/AFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZ9vd0EM; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so6821625b3a.0
        for <linux-kbuild@vger.kernel.org>; Wed, 21 May 2025 12:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747857531; x=1748462331; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y6sFZqIM/CcoaA2Tj0TifwCaLCAqOUrt3LgURrAaozs=;
        b=LZ9vd0EM3P0mxURyTR5r4k4tEySzrkhELIzL9K0Q4uA90PSg0BRLgeGrM0U+xQfwC7
         3xbYxwwDxojjky1ywAJH8Me1UbBJP41xPsXUn8arFNZJnz5E7chdttB9eA90sKVeKbzB
         UXuzu0uxZl7wasuibiMihfPryax14eSDE9Nk0TsZ1m0cTLLq+VtYbztoV6HeRhmonn2F
         ZaTGUZEgcoSgZH9VxXqhRTfLdozCifqtVgcGuc1pr0xM8Cmv+ND6SGYDXijvgmrZwoL1
         SnChYp9/0V+kVV6cbqGsuJ96VlJvnPC5drwoa/1FxZpOcLx+b8RZeECh94Ev+Ro/bfW3
         2kyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747857531; x=1748462331;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y6sFZqIM/CcoaA2Tj0TifwCaLCAqOUrt3LgURrAaozs=;
        b=DaAxOa1FiK/rlwinPIFWbUMavOqieQ0hh9mjD12N57lrmkYisAPYS1IBmzRSaTZXqT
         u9ht6fR1cHsnw4hROeeYLjwiSL7E9sZfGdV70jaahmqzvX8RVOncjvga15D+tOUC8ap8
         XSsPt0BVz0gUFUeScuTrXLlqprUeJXz9Be1d8B0AFGt5aLLIqzNRcUVv2wltld+An6LM
         hZ66q3g3NM17yvtsyoLpfkcqd3e9kJbIHiK9+gUK9nPEkeb7CiOhJlOQAD7QgNxXdiQ2
         SqyNLnkIOjD1gxFo1jniEB8GgI2vT+zTG4/OuugbS1n2pjY9Yt+vpLX4smy/g+c4Rh+b
         SByg==
X-Gm-Message-State: AOJu0YyWjRRE0/L+3IoWgG0xwZXieiK5g/jtU3rdRu5SqXkAPeTDnDff
	KS21TXbID0sDVmTZ8LGHIPxRdhmXbNcOqDaNrwzE1QcUcHKyd7VIitIt90d/wYAz
X-Gm-Gg: ASbGncsIm1SrQMFx1B9sicswrFPQmq6nLcvFd13qr3Uo+Jny1V811B/2m70DKzQJSuK
	XTOeDF843eSho8vvhvjObYXOaBK3jVepOwJ1tWRrNmfGN/1+MqfRzr/7ApZZPJropl9xjNEBo+X
	PimRgHVYfjWBmJNyr73615PraYSI/qGlHhe6HKc6oY98ud2nd/S97vx7hODRsao9YRSqnr1g2qN
	rYOXjNaMLRb8JsVw5QDvPEvyS9+aLWPyL6nRzJYy4+UnGSIiVwJawtA4F13+zERcZzqWAs0U1qL
	Tv7Ww7F+BmimovChX5DVaVwpK/rI3gLSK2hPIeh/j0OGaTUm1P6PaOley9p+PDBXA1w=
X-Google-Smtp-Source: AGHT+IFZxQVKfYv58wgHF3EIEPv0vkgernGGGG5Rf0g8SdcGWaVvS0dvwyT8v2dEip/EKvsiw2g4Fg==
X-Received: by 2002:a05:6a20:401d:b0:216:2111:7d68 with SMTP id adf61e73a8af0-216211196famr23869252637.18.1747857530759;
        Wed, 21 May 2025 12:58:50 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.247])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eb0a0120sm10090820a12.63.2025.05.21.12.58.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 12:58:50 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	skhan@linuxfoundation.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH] kconfig/nconf: Replace deprecated strncpy() with strscpy()
Date: Thu, 22 May 2025 01:28:40 +0530
Message-Id: <20250521195840.3915171-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncpy() with strscpy() in fill_window() and dialog_inputbox() to ensure safe, null-terminated string copies.
The changes follow kernel guidelines deprecating strncpy() due to its undefined behavior on non-null-terminated output.
Buffer sizes are correctly handled and strscpy() is sufficient for both cases. (See: https://docs.kernel.org/process/deprecated.html#strcpy)

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
 scripts/kconfig/nconf.gui.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 4bfdf8ac2a9a..a1306fafd07f 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -176,7 +176,7 @@ void fill_window(WINDOW *win, const char *text)
 		char tmp[x+10];
 		const char *line = get_line(text, i);
 		int len = get_line_length(line);
-		strncpy(tmp, line, min(len, x));
+		strscpy(tmp, line, min(len, x));
 		tmp[len] = '\0';
 		mvwprintw(win, i, 0, "%s", tmp);
 	}
@@ -358,7 +358,7 @@ int dialog_inputbox(WINDOW *main_window,
 	y = (lines-win_lines)/2;
 	x = (columns-win_cols)/2;
 
-	strncpy(result, init, *result_len);
+	strscpy(result, init, *result_len);
 
 	/* create the windows */
 	win = newwin(win_lines, win_cols, y, x);
-- 
2.34.1


