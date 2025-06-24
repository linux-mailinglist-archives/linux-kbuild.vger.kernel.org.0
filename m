Return-Path: <linux-kbuild+bounces-7691-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F56AAE6B22
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 17:33:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FE771C2100E
	for <lists+linux-kbuild@lfdr.de>; Tue, 24 Jun 2025 15:25:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 368F726CE04;
	Tue, 24 Jun 2025 15:09:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PPf+BK7v"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F383F3DABE3;
	Tue, 24 Jun 2025 15:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750777770; cv=none; b=HL/nQCrJtnENtwKpiBQx2e6i/jzJWjHIlLCkJ6fpswUZq7cZNdFTpt6Nqyg0x4nrUexyOzvxLCKMEMgu0GyWGAxOnPjcC5FvMoL/wglasveJJiwzVzdi8omVZk96OGV+cI7foigol4yKptwLZFJMUB7S61czOo8PkC3e5oc3zWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750777770; c=relaxed/simple;
	bh=WpdSrMIWUAX+/wei+NDTtBpQwZ+wiFGmbtIoxxBGCvU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ObysPMvvs3D4PUbpMLHAR2s/9CJSlW4F8ZCpvCYbifI1fB/o5bKBp5krH/T4o2v7KwNYHh5TGNmtmokp0lNz1cmBdNYLlZpOyjmkkV4hjCJCinThqBm0iBTWLVfmzuDwCf5PrKlDhM4nMkmWU+jpq/zEAmLMeF4UwkFI3IrQOy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PPf+BK7v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34144C4CEF1;
	Tue, 24 Jun 2025 15:09:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750777769;
	bh=WpdSrMIWUAX+/wei+NDTtBpQwZ+wiFGmbtIoxxBGCvU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PPf+BK7v9IKHuIh0UjDmuDBFNpIqxbC6we3fjqpBg8QCh7b578M4CGE8LyX14c4qT
	 RRKVGHtX2AqqAyaFX1DXgCEBuViMBAOPdr3w4WXyvAPYC2t+z/47brIViA6RY1vIdL
	 2Kbz6lnPvQ5YEExGg1B4NBR/VotrhfZ3sDqDRKknRAsXI0cnFp48We1qyKY/5oq1ds
	 KxP25cEGqv0wuyYOa4QdBGcEXQnPHSQhP+FJHn/kT2MKb3xXMW6p1Mli7oRcFaPQ65
	 tGB9Ww7pbiC1i+H61zYxenBjhTm4RcoxrOHz6DxDhBAhJeiAuuROdMUcI/bqTx/jM7
	 K1qppQKTW9oEQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 64/66] kconfig: gconf: replace GtkVbox with GtkBox
Date: Wed, 25 Jun 2025 00:05:52 +0900
Message-ID: <20250624150645.1107002-65-masahiroy@kernel.org>
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

GtkVBox is deprecated with GTK 3.2. [1]

Use GtkBox instead.

[1]: https://gitlab.gnome.org/GNOME/gtk/-/blob/3.2.0/gtk/gtkvbox.c#L47

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/gconf.ui | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/gconf.ui b/scripts/kconfig/gconf.ui
index e5dad2b06502..378a3eadf9f8 100644
--- a/scripts/kconfig/gconf.ui
+++ b/scripts/kconfig/gconf.ui
@@ -19,7 +19,8 @@
   <property name="gravity">GDK_GRAVITY_NORTH_WEST</property>
 
   <child>
-    <object class="GtkVBox" id="vbox1">
+    <object class="GtkBox" id="vbox1">
+      <property name="orientation">vertical</property>
       <property name="visible">True</property>
       <property name="homogeneous">False</property>
       <property name="spacing">0</property>
-- 
2.43.0


