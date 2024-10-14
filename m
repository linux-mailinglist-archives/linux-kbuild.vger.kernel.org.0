Return-Path: <linux-kbuild+bounces-4077-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF41299C575
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 11:22:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7BC431F23D1D
	for <lists+linux-kbuild@lfdr.de>; Mon, 14 Oct 2024 09:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F5F2170A03;
	Mon, 14 Oct 2024 09:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="XNZqVbGx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF11C158548
	for <linux-kbuild@vger.kernel.org>; Mon, 14 Oct 2024 09:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728897570; cv=none; b=tKk6ol8rGhWnXRbSCYx193bq6ff3Pn69rQCYIzw6w01bB5LgZepYUnM4IfLEDb1fW20PZGU3aJG5LeTLTuTu3ET6i4ZTwiJ2uXGsPyqjBCBP/on+FtET4hPSgzMbkUsPHnFRs9OojyvwJLid7+Erlnz3ya+azcxq+cb+R/LVEZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728897570; c=relaxed/simple;
	bh=wVNYUbvUl3sPG53le+WJDckMtDV+JM8zWMYsaYz1umk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KUY1noqsS5IzP4G/VgqC8pdnv4k5bNWMOblJ+VoxLgXFwFmAMLY+mCkRsGBwDZbKPTl7ABNQ0xWB6vukj2NwPAjtnA+PdXMkDCyJcgp9Euz2hGxetD2lz6Sm5bVmxfQ06oMAynGXd5+SRjBRO6l9De36VIy1hFezPgsZLfoA9so=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=XNZqVbGx; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1728897560;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Dj7fxHIiOkLjML343LBKlVwG31MU/qAIpzhZyO5s5uo=;
	b=XNZqVbGxPAt4UpWQJEvW9S6vOheuiEE+d+ckHEJ4Dkn0nJ7iFM5gbzGHS7oVKxebT+Jm8e
	v2r2JQHQFi9t+gamFt0DGppufz9iJZIM0gcBrUB72qlywyg0N8gIFjQyG1Bg4nFNwHxXa6
	6BFmFUv4Q9+At1ZRicReL7Zj9QvROPE=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kconfig: nconf: Use TAB to cycle thru dialog buttons
Date: Mon, 14 Oct 2024 11:18:28 +0200
Message-ID: <20241014091828.23446-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add the ability to cycle through dialog buttons with the TAB key.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 scripts/kconfig/nconf.gui.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/scripts/kconfig/nconf.gui.c b/scripts/kconfig/nconf.gui.c
index 72b605efe549..aeac9e5b06ee 100644
--- a/scripts/kconfig/nconf.gui.c
+++ b/scripts/kconfig/nconf.gui.c
@@ -277,6 +277,15 @@ int btn_dialog(WINDOW *main_window, const char *msg, int btn_num, ...)
 		case KEY_RIGHT:
 			menu_driver(menu, REQ_RIGHT_ITEM);
 			break;
+		case 9: /* TAB */
+			if (btn_num > 1) {
+				/* cycle through buttons */
+				if (item_index(current_item(menu)) == btn_num-1)
+					menu_driver(menu, REQ_FIRST_ITEM);
+				else
+					menu_driver(menu, REQ_NEXT_ITEM);
+			}
+			break;
 		case 10: /* ENTER */
 		case 27: /* ESCAPE */
 		case ' ':
-- 
2.47.0


