Return-Path: <linux-kbuild+bounces-7656-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 35485AE6A5C
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:14:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BAB2C5A1D31
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:12:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D7132E6D34;
	Tue, 24 Jun 2025 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BaKt3QGX"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C372D3A8C;
	Tue, 24 Jun 2025 15:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777698; cv=none; b=gRjSbuzF35Bc0mU5WapwPyKiVzJoVxn+xqfrVRWYL9lke5nVZjY7qiMq0pWiiCzzGURm6b36ZCXiXHzHY+u4gRlJrrHEyuWIssZD2vv+OaNSrX1mrYdsJ04NDOY0otVOzfww/s4tqeXAaq2PcOm/28/sb9WV3AYB3MewjzOYdlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777698; c=relaxed/simple;
	bh=lQOXS5XkltNaHpRChFfbCSkSPUttaa14aTnxpjQhsUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GdItSTjAhDEB8BJ8KWx3M8bW0WHfu+seI7b8zDUki8jgycrqQcU6RtKxOPIW5OkOUmiE0NzZUaw7LVdziYjRT0oFdSnPe+CmR8hgbiUxZko/BRllh22WZ0LhnLNwHQD/BvrutL32cL2h60CfCmgiZARZ9Oomp6sfu/NDW9SRxBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BaKt3QGX; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 075BCC4CEE3;
	Tue, 24 Jun 2025 15:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777698;
	bh=lQOXS5XkltNaHpRChFfbCSkSPUttaa14aTnxpjQhsUk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=BaKt3QGXpi6YjTdDXLnstbuJZx4TRUipgR/8OYL5+WU8aaYjADx3WbmHsrw4/8lBx
	 4EX0yRGvIgTHM0vtUZdIlnlxBb+OG3PMppOrg3J5GPB/tVhmBXAnxRmt58j8j8pdbC
	 rNmQS8NGo/hRzruWF9KYb1R3HYq7YkZ3DAX0ojVshp/vFc9wP+PadGfkJgKAaJ8lwh
	 1OMpr5u13f8khc/jdU/xc5f3BHr7+iCr5Iecttm47iV21uP1Tux7xZtX9qV+g5B9DQ
	 ulqhgYfy1saarvvZlOl6GSYgKomJfSWmbt5ya2Ifm3HhUpMrUY1jt2KczPIacgBYB4
	 PF7BAA+MLS0hQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 30/66] kconfig: gconf: remove glade_xml_signal_autoconnect() call
Date: Wed, 25 Jun 2025 00:05:18 +0900
Message-ID: <20250624150645.1107002-31-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250624150645.1107002-1-masahiroy@kernel.org>
References: <20250624150645.1107002-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Now that all signals are connected manually, this is no longer
unnecessary.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index 02bbb7ce4c4a..09537245213a 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -1120,7 +1120,6 @@ static void init_main_window(const gchar *glade_file)
 	xml = glade_xml_new(glade_file, "window1", NULL);
 	if (!xml)
 		g_error("GUI loading failed !\n");
-	glade_xml_signal_autoconnect(xml);
 
 	main_wnd = glade_xml_get_widget(xml, "window1");
 	g_signal_connect(main_wnd, "destroy",
-- 
2.43.0


