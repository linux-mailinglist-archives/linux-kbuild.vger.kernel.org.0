Return-Path: <linux-kbuild+bounces-7465-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEBAAD696C
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 09:48:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D84233AD759
	for <lists+linux-kbuild@lfdr.de>; Thu, 12 Jun 2025 07:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B05A01E51EB;
	Thu, 12 Jun 2025 07:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OWxqHHF/"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBAD86342
	for <linux-kbuild@vger.kernel.org>; Thu, 12 Jun 2025 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749714501; cv=none; b=GvBlYT4HXbT+HVUzdZLVww9bltzywKA22Yul2UJdkr3XfLufC732GSoYu88o547bG7RBIo6R4s7AWtUNW6eu4RRSTfJWY9Px9r0s0jkfW34ewo4YbwM19MPrLafI5AtJ9HsYOfV9DtrkQpXUbaQwSRchI4zLszu6MEOH4MRIdYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749714501; c=relaxed/simple;
	bh=GtilcvAJNHM5vbTWmpkWxbXci2dL8BtXWeI/rpZlPJ8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EcFVRTMr0jEGSHJt/hvPNKacdOQn+ARJcR6tAAnBFwZpXfOwE+KxJDp0cwT681CHJip4kty88tApJQJgcs3qP1mKhfBfp6K0W5ognqw8JQ0sYXTdsEKI3T60wUm4Z3CW0pJ60QEG0OpHDQEIQX/hhESwZcgoZzN+Purg5wY+9Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OWxqHHF/; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234fcadde3eso8103855ad.0
        for <linux-kbuild@vger.kernel.org>; Thu, 12 Jun 2025 00:48:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749714498; x=1750319298; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mvO3b46BkUqIsO+KHkU4j53x5MtU1vOQWo2LLcFmREs=;
        b=OWxqHHF/mqFeXZmB7r6JSMnBKXbIvamQnQMhEYjn4VUMzrAQLtzHucG7FKJ9xNHQWD
         LduB+sZ5rk1ciU0dQnrKwtLWRW/MXyoIEo4Oty13UpkoELOaFoIDqQIV08OVSZRs5Ktr
         +xULvVDFw3ZWH21YOI9zOOHljCvF0cyJTwO32AZ/lhcZ4KLzEXKJBpvC+vJEBVFGcT8T
         jzdjUnIH9ZdHBwC9J+16P4l5xH585zpSwJyt89lJjQNkqxZWaG+yOvjOMnQCfDFpOYu6
         tZi0TZXNh5RUTsPKO7AOYkIp56Y9l0r2rQ9YFIA6UhDVIIaePmE6zr+LwBnhy0WoeUCp
         FVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749714498; x=1750319298;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mvO3b46BkUqIsO+KHkU4j53x5MtU1vOQWo2LLcFmREs=;
        b=AAOwdcew3t0X5CAxqEs2IeCLhGXSA1XQX+SL/TbvjksBwl/hDGkEDSy7VmAcgGWS9m
         AEbDS5E+XUoHgQQHoK1ttyMLU05DAbHV5UDgTPCdtWdnCd1VHfcoNmVnln64+vaBMdjm
         Ro/5zBZ+BFt9V1qnHYsS95/IRdI0JB/qlisQJ+jgb2I0rO5VCBfziTHB5crn3DGcjGp+
         +Y8fkxs9Ll3SphxIsBLURQI7JaBZdt9Yl8zJikexDvg41UH1y8SSoNzN0Dw0WihJWfAK
         2PJwjAjmfZ94fc2B1JED6ZUCluITUdnTmiO6bpq4px6wHZ+CGopzRT7LZaeg8Vazywf/
         Zhdw==
X-Gm-Message-State: AOJu0YxifINiKdZxd1z5QLmyITvJNzrIAg/3OS4HpOxZmvfFTn1y6DZY
	2E5iUTw3gacFPeCaXzs0wRdRd/+RS78MrAVITM4MzT99yenyEMcBRVJTZvzU+kO4
X-Gm-Gg: ASbGncu6j43W3i2BlWgOi5coOl9m4lrMOeilZ4cnbG4sYwFE2auz76FJHnT0D2JxZBU
	vOgvvZqHLdVGF3UpXUwfqxeR7RQcefetxpPEX15AaIsrwXg/1bpa01ebEN0//dyxk9V+VqoyW5a
	PHXrW3+NgWIxQTu/6+3CSiunBkhON9UZSYboWyXYIfjsqBflW56/dUeiUsHT084XspTi9sTrZzh
	wGhsJ1dys4DL2KfaVMWtw2GArnKv7nFNggORQroEUOqOE8Uymx+uG3tly9jmMnA2rm7jkRpyCaL
	f2lVwRWTQgyY31hci2k9fYiPJXMi//zAHhNdh8BKzssG0ptJIdr9Idc0oD6zh+m2JdUCpTKOQVo
	9o3YZag==
X-Google-Smtp-Source: AGHT+IHv88Xn1g7MkihPyjqsmEgqq16wSJ8h5vEjWwdG6MqMeSExNP/NVm0lkgD8eiJLypaQ4ExdMw==
X-Received: by 2002:a17:903:283:b0:224:23be:c569 with SMTP id d9443c01a7336-2364d66027cmr33777035ad.22.1749714498297;
        Thu, 12 Jun 2025 00:48:18 -0700 (PDT)
Received: from shankari-IdeaPad.. ([2409:4080:d3b:b88c:e03b:f4a8:ba59:f99b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2364e6fa2f5sm7756115ad.170.2025.06.12.00.48.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 00:48:17 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kbuild@vger.kernel.org,
	masahiroy@kernel.org
Cc: Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v2] kconfig/nconf: Replace strncpy() with snprintf()
Date: Thu, 12 Jun 2025 13:18:02 +0530
Message-Id: <20250612074802.900256-2-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250612074802.900256-1-shankari.ak0208@gmail.com>
References: <20250612074802.900256-1-shankari.ak0208@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strncpy() calls with snprintf() in nconf.c and nconf.gui.c,
which are part of the userspace Kconfig frontend.
The affected functions are - item_add_str() in nconf.c, 
fill_window() and dialog_inputbox() in nconf.gui.c

As strscpy is not supported in userspace, snprintf can be used.

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
v1 -> v2 : Changed strscpy to snprintf as strscpy is not supported in user-space
---
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
-	strncpy(k_menu_items[index].str,
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
-		strncpy(tmp, line, min(len, x));
-		tmp[len] = '\0';
+		snprintf(tmp, sizeof(tmp), "%.*s", min(len, x), line);
 		mvwprintw(win, i, 0, "%s", tmp);
 	}
 }
@@ -358,7 +357,7 @@ int dialog_inputbox(WINDOW *main_window,
 	y = (lines-win_lines)/2;
 	x = (columns-win_cols)/2;
 
-	strncpy(result, init, *result_len);
+	snprintf(result, *result_len, "%s", init);
 
 	/* create the windows */
 	win = newwin(win_lines, win_cols, y, x);
-- 
2.34.1


