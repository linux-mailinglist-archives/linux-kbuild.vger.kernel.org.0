Return-Path: <linux-kbuild+bounces-8343-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D12BB211ED
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 18:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1BC356E180E
	for <lists+linux-kbuild@lfdr.de>; Mon, 11 Aug 2025 16:22:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8D4D4C7F;
	Mon, 11 Aug 2025 16:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mZDIUKGT"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-181.mta1.migadu.com (out-181.mta1.migadu.com [95.215.58.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119D417993
	for <linux-kbuild@vger.kernel.org>; Mon, 11 Aug 2025 16:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754929063; cv=none; b=k0mAOWhREzelo7+DZ7CDTcX3DBjHpsb/q80okoGTn/lj5o/B0MAM/mu/HSKQ01AXaJapsK4B9icJ95oUqLY0N66iUAp9X6umNgTNBttG25EujP67WLICzr4DeaxxdT5OnWblv4b55gFGVeFlcHQYdIY+e65OrArMZisLOhvYQOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754929063; c=relaxed/simple;
	bh=oDJkOf2OFbbJhHt2UdZksaVjQyH5sfc332YdaM4dfL8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oyiIgo5MXCCgy2VcEaLjUAmYXIPwcPuUF1nMVWRdHUES0OuCyRwZLE2d0GHdwlgrbyW4Qww304I84Sn+NP7FD92Tg/TuidTbbwJ08n0ZMRg0rq/nskFfWCiGtyjxpj/cH7jFYGACJ7FGf/zPZK1FCWFDYtyzvbJqk1PIboEXEXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mZDIUKGT; arc=none smtp.client-ip=95.215.58.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1754929060;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mHQ/a0CthfEXl2ijTSBdG30bk5vJh+MoGrFojXiA1Sk=;
	b=mZDIUKGTPzRri050s5PkMEeiAochcDlsl66j4V5B9jTmW9CrWFom3XGR3mbQN45oZt3U0O
	nvGuna6YQKo2d8cugyYIgCOybPJKAlQ3kbeu8TRQxalaDju5IeUwQwB8OV/Oeh+14wO82t
	OS01LPMh8hwHDZd9j91e9YXJAhcFEm8=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shankari Anand <shankari.ak0208@gmail.com>,
	Nicolas Schier <nicolas.schier@linux.dev>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: nconf: Format and print 'line' without a temporary copy
Date: Mon, 11 Aug 2025 18:16:48 +0200
Message-ID: <20250811161650.37428-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Use "%.*s" as the format specifier and supply the 'line' length 'len' to
mvwprintw() to format and print each line without making a temporary
copy. Remove the temporary buffer.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 scripts/kconfig/nconf.gui.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 7206437e784a..2d097bc7ef1a 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -173,12 +173,10 @@ void fill_window(WINDOW *win, const char *text)
 	/* do not go over end of line */
 	total_lines = min(total_lines, y);
 	for (i = 0; i < total_lines; i++) {
-		char tmp[x+10];
 		const char *line = get_line(text, i);
-		int len = get_line_length(line);
-		strncpy(tmp, line, min(len, x));
-		tmp[len] = '\0';
-		mvwprintw(win, i, 0, "%s", tmp);
+		int len = min(get_line_length(line), x);
+
+		mvwprintw(win, i, 0, "%.*s", len, line);
 	}
 }
 
-- 
2.50.1


