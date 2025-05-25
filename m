Return-Path: <linux-kbuild+bounces-7259-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C2E67AC35B9
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 May 2025 18:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9ABB7A8724
	for <lists+linux-kbuild@lfdr.de>; Sun, 25 May 2025 16:39:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D90619D09C;
	Sun, 25 May 2025 16:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="esiQ+9SU"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD3C481A3
	for <linux-kbuild@vger.kernel.org>; Sun, 25 May 2025 16:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748191235; cv=none; b=lqoApB0/zKJd40ftp5tl9jNOyGuwA++H9wzKjmRcxjneZyq4ItSwXyv6JPjnoiTLR4GUKL0bMf81NnvrqjCfawnpOG+hJHOiFx7tmHkE7EVf7JLn69UWUR0j5anwWVuvHWK969atw1B1sjmbgOF3Fh8qG2eucdUVUtqG/KuLog4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748191235; c=relaxed/simple;
	bh=L7RI9xTWiqXwzOXwkF8NYM+0+67yKexHCEGsQErub/A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=XL7iO0FEDZlRKCA7+OVwRKTRD2KkECF+1cI0dSPCzkEK35EmT3UKuUijYTw/+6u2nR8Ypc0p3atkOqoQm9EMN3aN5YSG+nsxccloGDOUWDcIPKGZVBdTBvzqWSsa13YgSjCuFmH92rrG4POoLJU4KtSGl3Wezm4JCn1M4yNzolY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=esiQ+9SU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-742c2ed0fe1so1353441b3a.1
        for <linux-kbuild@vger.kernel.org>; Sun, 25 May 2025 09:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748191232; x=1748796032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TI24cX0J3zBqtkzlqqgWgj7by8Nng9PYNQ78S+6NnSg=;
        b=esiQ+9SUTG7eRWXqblVD/uVVGPWz2colbpEOyFPlXNJ7tINYK0udEpKAzPbEew7JA8
         bk6a54Y538aqdhz1YswJs+j+JE+QPnRaiXWHD2x9Gr934PJc366MQLoXxiAC4aiLxNVh
         JhYrNyE7IXG6XURlNozORtyU+Q+36xRmE6skQqjqteqUke24bG0thzXfCovaiw3Hsam7
         3wpTp6xhEYFuWKSOrFhHNaw1bDocWlXAy2BkD5RqftVr4Yg8suwwun5GOBwP72RlsGgq
         KnYFsBDAd2x7Y4oVNKkPc7mgYajv479TXvGQ3RdY9Jl545NNDW5cPS/wT8fCT1kdJQOm
         YnCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748191232; x=1748796032;
        h=content-transfer-encoding:mime-version:reply-to:message-id:date
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TI24cX0J3zBqtkzlqqgWgj7by8Nng9PYNQ78S+6NnSg=;
        b=fXEgcre/LkloOAIAh2IEXVjC7ANy4T57wYKK/2TXiLs3U14gXExO33Y1M9IrTnrgMM
         vVHt8loRKvN1fmqHpLyXuC0kq6VzPRC7PLccXv146lGlQy+iakeUUYjraJn++MZHycIy
         78MTq0GDDYvrAvzJzmFyGNrdVXMSfJI7oCygD/pNSWxnk3hL5tY8brRfKqf5KXMoQ/M3
         HFMEiLZFgq++yOOlfC7HZbSS8T7Kve4hLvaowTEs4FVbaD+QPlq25YFBTjZKsBrueMVN
         6BlLJt2Uq3e9egDSJVa3w3lEeiQTzUoGua5LzI06ZxCbePt1nMq2dp2YsyOq4i6mQJ5t
         iC6w==
X-Gm-Message-State: AOJu0Ywt7HN67SE/zNcJVm5J9K5dk3fUMp0blQDs9T3iXmUKzsQqUcbs
	Cvm46WNlSex8XiSA5DT6pK9QiHB2qzr8C8Z64J0tRnsNf4155j1IpBmIeEnH+g==
X-Gm-Gg: ASbGnctqDzCJO6WxLHebgphgkAHrxc/jeGt3RzVWdzV4+0aAj324FZM3r3RwNuDyh8P
	Q6gM/PyrwaKbVVWPO0rF9k2WBBDVA2k6smnAy0E6S+5xM3e/Ys3F/UXnxa4m+qaDTn1blNKy7Nm
	uPl9bT9VRrxN2x1IIwImm8GFeJJzkH+DLRU8w8v6h8RnW8LGeiFqxX1opZcGEw9/FTy9IxSc6QY
	Nl6h1O9RvuEgLevjbGcBNsnkSOa3wFd0TqdwzaX8qkDblo/fUNsntuir2jTxcYLr11tnnH9fCPt
	Jo8KUb9otq0St4IwfIq0gU3ofWWx9dyCuGO4VGQzoaOh033JVXSA9OgG3FBFU7j9Dj4=
X-Google-Smtp-Source: AGHT+IGgV3n2FyAmW+cctCvStG3jjB09cn5WLZCJ0w8Vo2ft1M+KFaj9L7ooEDbRfRFhvwZTPcUoVg==
X-Received: by 2002:a05:6a00:1149:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-745fe0515b7mr10905336b3a.18.1748191232526;
        Sun, 25 May 2025 09:40:32 -0700 (PDT)
Received: from shankari-IdeaPad.. ([103.24.60.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a98a471bsm15688359b3a.180.2025.05.25.09.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 09:40:32 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	skhan@linuxfoundation.org,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf() for safe string copy
Date: Sun, 25 May 2025 22:10:14 +0530
Message-Id: <20250525164014.1558750-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Reply-To: <CAK7LNAQgb5u-+FEp1PjSxT7whNbW8YoiYt41m01M6yrt+=PXrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch replaces deprecated strncpy() calls with snprintf() in nconf.c and nconf.gui.c,
which are part of the userspace Kconfig frontend.
The affected functions are: item_add_str() in nconf.c, fill_window() and dialog_inputbox() in nconf.gui.c

strscpy() is not available in userspace; using snprintf() ensures safe, null-terminated string copying
while avoiding undefined behavior. This improves code safety and maintains compatibility with userspace builds.

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---

Tested with:
make nconfig
Verified successful build of the nconf binary and usage in the menu configuration UI.
Also confirmed no compiler warnings related to string copy functions.

 scripts/kconfig/nconf.c     | 6 +++---
 scripts/kconfig/nconf.gui.c | 5 ++---
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index 67ee33fe16ef..42a78f0baf16 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -589,9 +589,9 @@ static void item_add_str(const char *fmt, ...)
 	va_end(ap);
 	snprintf(tmp_str, sizeof(tmp_str), "%s%s",
 			k_menu_items[index].str, new_str);
-	strscpy(k_menu_items[index].str,
-		tmp_str,
-		sizeof(k_menu_items[index].str));
+	snprintf(k_menu_items[index].str,
+		sizeof(k_menu_items[index].str),
+		"%s", tmp_str);
 
 	free_item(curses_menu_items[index]);
 	curses_menu_items[index] = new_item(
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index a1306fafd07f..d55518268f45 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -176,8 +176,7 @@ void fill_window(WINDOW *win, const char *text)
 		char tmp[x+10];
 		const char *line = get_line(text, i);
 		int len = get_line_length(line);
-		strscpy(tmp, line, min(len, x));
-		tmp[len] = '\0';
+		snprintf(tmp, sizeof(tmp), "%.*s", min(len, x), line);
 		mvwprintw(win, i, 0, "%s", tmp);
 	}
 }
@@ -358,7 +357,7 @@ int dialog_inputbox(WINDOW *main_window,
 	y = (lines-win_lines)/2;
 	x = (columns-win_cols)/2;
 
-	strscpy(result, init, *result_len);
+	snprintf(result, *result_len, "%s", init);
 
 	/* create the windows */
 	win = newwin(win_lines, win_cols, y, x);
-- 
2.34.1


