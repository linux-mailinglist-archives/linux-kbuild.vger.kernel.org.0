Return-Path: <linux-kbuild+bounces-7704-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35145AE8E0A
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 21:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79B53164B89
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Jun 2025 19:10:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77C002D8DA9;
	Wed, 25 Jun 2025 19:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UpRcc1nv"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B732E0B56
	for <linux-kbuild@vger.kernel.org>; Wed, 25 Jun 2025 19:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878427; cv=none; b=KdXGdySNaT4eBWNN4xkjppcmTViXfmu4WbUbwDWG05AcfiiWSJw/NkWbRuzamDwxW5VIMj0ek3EOl5yfH7ojadnoTH7VL8iputoJsGnjgWwrXjmLoTXvXdRiWtczL7N5Vcg3Yqbt5wYo2cJgmib0v4KxkRss+ieaa79qxCS2E2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878427; c=relaxed/simple;
	bh=V4KsQqm4Paylzc18K0gUxzeW7gSvPKSRVxIFGGs/J/4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=AaQ5J011jYjI9uU6t78+Ca4bqBGjzYb/mcyf/DtvQZJ42See+IYxtJ7zB+O0lHU3t2ywgBZxhRzQXOAif2piKlk1hzXXW+XgqygoU2hP06mw4/F+gzJflavFvyCH84s7yntbKbWyB26mGF92AmYMmQTuaiR6ITad9md/fU4F0DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UpRcc1nv; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-234bfe37cccso3755795ad.0
        for <linux-kbuild@vger.kernel.org>; Wed, 25 Jun 2025 12:07:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750878425; x=1751483225; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xo3HE1vteRqKIFP2QNNj/X721w2rJV8qf1lUOrQkH5Q=;
        b=UpRcc1nv6MqiKDyeMj2+9CyVzUYu7lLii6YyHaFfe+nYFrpyDG954T1PoKF+HkRLXO
         tfR4y06wVR9FS9pgtR3ZrF4vOoxdZbXQTY3TV+mDEyS/DPOsJLoWOyk5zyi4dDE3seQb
         GzINbAu/HbmZNcVRnZR7CyaT+QIxkvlx5fBBTzApBckUscI0doIPB5Hf93XOYk8OIXEi
         +CJyP1v03RHEPjC/2QRSZI+3wzzPCMSdd18Lloapwn2tdkNA8UDB+ITxLyC3dfl1G9P5
         siZNo3CdXAotqPqOXK0oj9KWou73cv/toDFbFQem57gDIOA6RjPjDG1lZqKhugWnGVXX
         BrNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750878425; x=1751483225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xo3HE1vteRqKIFP2QNNj/X721w2rJV8qf1lUOrQkH5Q=;
        b=vykuSq0FYtNxRRH0OvC97rchXnNS2xfjzYNIiQLugy6ggDhWzrlD6n7eyKOnbxna0o
         94pOWoP3DDqXHRcEjBasrV/h+DG0MN5At/a0eh+qAVE2UvPgCiqfsEimuHfPfvbZ6wIe
         n4HSWEFvQEnFS7ywhLR0yUP97+fs9KRquEKtRLKmPuXGVFRT00129Vwc+kMFwV6Awbon
         p7jTVdw8PmVbvhSfj5JBi5F5ZZzc/AN+MCIyDNMGkeRIRZEkIip8NZ2Vfxr4PEgW7cHi
         iT7vy97DYeOIIf4fy/3Ngo0SRAQrcdmBwYjGwkUNZlJYsyjOo5n6lCPVsoUlknGXUNEe
         uI5w==
X-Gm-Message-State: AOJu0YwRt/RzVYE1HXm3yV7zZzDzhZUy/W2Y8YUJt4H0YGfgWa1Z5OPh
	5bZ0PxNjrBKTRs1T2PqChCFThU3beVMC2M6toyuRvQGiCGWLZDui1bz0Z8gJb2wg
X-Gm-Gg: ASbGncsjL/br82mcf69JpA41YhUnSEUiSvP061k1vuRG+cgYBir96WY6cfgOmdP0SRv
	qQ7QTcUpXQjobCoXRRgo+Lt/1RB5WOOLnkacrxlJ4g6BodriIyBiflkLgztdG1hyo21J8oQjizS
	o8BR6fQOSTefZWcueNkq9+vqpAzxTUhbrCuhrIyU9ZFYdQbz4VYqCf6Gnr6sY8ad/oue/ZdaBmq
	6aIWp1b7koezxNKA5kp7hbivngMUtVyrGOWRQotikC+I5nR3NuQ9SFg2AaSXNCkY4OXMc8Rjxxk
	Emp3WDujKnH2UhHy5Q1XjQtYeTRhqrwGS6NLfaKutAPcAw4IfvIGD0uqFzYxbglXKEsTI1rIMbQ
	Qzu8=
X-Google-Smtp-Source: AGHT+IHyhBSWg2KIahSEL9KtAfUipapDrwG9wvafOMJmpU1YT6XgWqO2ENcpb38kV2oSR/DnjpqsFw==
X-Received: by 2002:a17:902:c403:b0:235:2403:779f with SMTP id d9443c01a7336-2382424be14mr76918935ad.29.1750878424828;
        Wed, 25 Jun 2025 12:07:04 -0700 (PDT)
Received: from shankari-IdeaPad.. ([49.128.169.113])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d866b000sm139058615ad.162.2025.06.25.12.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 12:07:04 -0700 (PDT)
From: Shankari Anand <shankari.ak0208@gmail.com>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Shankari Anand <shankari.ak0208@gmail.com>
Subject: [PATCH v3] kconfig/nconf: Ensure null termination where strncpy is used
Date: Thu, 26 Jun 2025 00:36:54 +0530
Message-Id: <20250625190654.313652-1-shankari.ak0208@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

strncpy() does not guarantee null-termination
if the source string is longer than the destination buffer.
Ensure the buffer is explicitly null-terminated to prevent
potential string overflows or undefined behavior.

Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
---
v2 -> v3: Remove the replacement to snprint and instead terminate the buffer explicitly.
---
 scripts/kconfig/nconf.c     | 2 ++
 scripts/kconfig/nconf.gui.c | 3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/nconf.c b/scripts/kconfig/nconf.c
index c0b2dabf6c89..cfa4d395dcd4 100644
--- a/scripts/kconfig/nconf.c
+++ b/scripts/kconfig/nconf.c
@@ -592,6 +592,8 @@ static void item_add_str(const char *fmt, ...)
 	strncpy(k_menu_items[index].str,
 		tmp_str,
 		sizeof(k_menu_items[index].str));
+
+	k_menu_items[index].str[sizeof(k_menu_items[index].str) - 1] = '\0';
 
 	free_item(curses_menu_items[index]);
 	curses_menu_items[index] = new_item(
diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 4bfdf8ac2a9a..475a403ab8ba 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -177,7 +177,7 @@ void fill_window(WINDOW *win, const char *text)
 		const char *line = get_line(text, i);
 		int len = get_line_length(line);
 		strncpy(tmp, line, min(len, x));
-		tmp[len] = '\0';
+		tmp[sizeof(tmp) - 1] = '\0';
 		mvwprintw(win, i, 0, "%s", tmp);
 	}
 }
@@ -359,6 +359,7 @@ int dialog_inputbox(WINDOW *main_window,
 	x = (columns-win_cols)/2;
 
 	strncpy(result, init, *result_len);
+	result[*result_len - 1] = '\0';
 
 	/* create the windows */
 	win = newwin(win_lines, win_cols, y, x);

base-commit: c4dce0c094a89b1bc8fde1163342bd6fe29c0370
-- 
2.34.1


