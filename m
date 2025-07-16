Return-Path: <linux-kbuild+bounces-8021-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAED7B08102
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Jul 2025 01:26:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4C0563A3EBD
	for <lists+linux-kbuild@lfdr.de>; Wed, 16 Jul 2025 23:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3C322F272D;
	Wed, 16 Jul 2025 23:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PGaVG7zy"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE262F271B;
	Wed, 16 Jul 2025 23:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752708352; cv=none; b=H2d1n+fSjB4UKmAKg36T/XEjLOHMqUxIbLPpDSNZdDN5AON0wQ7HkR2WTdPKcTOipaWX0w24sPoUQgCpG6qRIvx37tQl66/Ofk8YhBHX+yLmKULX54hhDXsaFcAw9HB1JlbV9RH+/YV7xIu2gKR6ejnDH9M3aXAsJ0cy+34SYow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752708352; c=relaxed/simple;
	bh=76+fbHSb07ElZJwZbLYzyjct4PpROjloUudmxGs59hc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JYr0T9MIOHq8x0WyGgfLVa0zGS/nC5XdYQoHR+JFaX2SV4iOepMMAOo8q8i4Qkxnx7Af+zXxCQH/Kdu4QnP/+CfrbSYInOf5z6T4y/Wdtg6MReS7Opczg9qmt7h+f8dIpA9Je7Te7lzEYbclFHfFjfMl6WrItb9moW3fbyErQtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PGaVG7zy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58E3DC4CEF5;
	Wed, 16 Jul 2025 23:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752708352;
	bh=76+fbHSb07ElZJwZbLYzyjct4PpROjloUudmxGs59hc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PGaVG7zyEi04+Ri/fW0q9G+KtZdTZ8T+h1M8909yKNwlG8rrGeUBwfQle8QxOONzi
	 LcfAujCvmTBANyCMFKkdaoXBYYS/bHZlj9UuZAo36mkfHkRSfICRM7iipQa4kfO7kV
	 E2dHVpWu6IDB1qDH0ArNMFxUr2fk3eGnBzu1oHFJS6Ru7LFm3ByO9nmi/+EhoOtBXp
	 VDy/aIwnXLGO4olYTDzP8mD8soTjcfUoYc8/yRLqXmn/mBZkncfqBvkdjTWCMxKXa7
	 siqlXnkUsvqwvTQDAptwmT1t+UIEbtPF3FCR0BUjUuACKMyhkqZrLWefh/HD8H99hc
	 jqgcpXZ0i/rdQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] kconfig: gconf: remove unneeded variable in text_insert_msg
Date: Thu, 17 Jul 2025 08:24:12 +0900
Message-ID: <20250716232542.873747-5-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250716232542.873747-1-masahiroy@kernel.org>
References: <20250716232542.873747-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'msg' and 'message' refer to the same pointer.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/scripts/kconfig/gconf.c b/scripts/kconfig/gconf.c
index e4f89270d19f..651140af7d13 100644
--- a/scripts/kconfig/gconf.c
+++ b/scripts/kconfig/gconf.c
@@ -90,11 +90,10 @@ static void text_insert_help(struct menu *menu)
 }
 
 
-static void text_insert_msg(const char *title, const char *message)
+static void text_insert_msg(const char *title, const char *msg)
 {
 	GtkTextBuffer *buffer;
 	GtkTextIter start, end;
-	const char *msg = message;
 
 	buffer = gtk_text_view_get_buffer(GTK_TEXT_VIEW(text_w));
 	gtk_text_buffer_get_bounds(buffer, &start, &end);
-- 
2.43.0


