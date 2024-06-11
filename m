Return-Path: <linux-kbuild+bounces-2069-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A6B9042E2
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 19:57:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AC6A1C21DD7
	for <lists+linux-kbuild@lfdr.de>; Tue, 11 Jun 2024 17:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB52479949;
	Tue, 11 Jun 2024 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eCZ9YV+6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A345378C79;
	Tue, 11 Jun 2024 17:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718128566; cv=none; b=FL/JBtpVR/EosJigh0DOwLmkPRdQZPb7dHPiIZ/E9uv8vTz5/MnNkCEfOxr8LTaehgz7mz09sgYXwDbBWoYxgjM/jN3XJU7tUtKZJ2ar823GdRykaZitFzhd3lOQl/Q1Vj/uImgTx+1kUOxS1sYKwSrjM9I1fDt9mS5xABmuBiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718128566; c=relaxed/simple;
	bh=qcBiO8SNAAfZtzQky9fVy54pHt8w/K87uRJ98NXalMw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxkAI8eyybnvYGYeudjTEMRmxPtoNNIKXq2En3jx7/n9Fq3ec/FkNVcVOLWKW3RlnRLfLGBH+ufP4/MQZRooA7zwhVDYRVDjgJ/kYtJfAHjNupabq6zvlaEcrSYz7Y7XhJDdAsjDVBaHgGQc9/nBJiY0+ANZPCPcCQ6qDsMA5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eCZ9YV+6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBBAC4AF49;
	Tue, 11 Jun 2024 17:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718128566;
	bh=qcBiO8SNAAfZtzQky9fVy54pHt8w/K87uRJ98NXalMw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eCZ9YV+6vzdNEbWMyFBCo5Nm3G/q9xWLYSSS2LhhR55+FkesjxOmlmKiFPa/cC5AT
	 mC8PJn2mdJXba5LRSwoMhJJRPIFPk2Jj7hLCe/gl4Tg1XZ16dcPeo5RFKnAbMXPv9n
	 nJXSApDGUvK+peCbOALN1/YvhRFaUgm2wLFzODuilKjW0T4AYOLl6tIvuONXGYFzVW
	 aZeAWyv95tJ3Gl/Q56sT8nbtTfCPS0scdv50mrulYXzIXYmhr/AVeyC3rrvkmPoBIN
	 PIoyPJ0zJkWBVVLr2AeJ9sa4Rnl8vgAzET+Ez4hVmB1DlkxeHJf9x2VAOz/P7Gvglt
	 caZxLIfNNUvzg==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 05/16] kconfig: import list_move() and list_move_tail()
Date: Wed, 12 Jun 2024 02:55:14 +0900
Message-ID: <20240611175536.3518179-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240611175536.3518179-1-masahiroy@kernel.org>
References: <20240611175536.3518179-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Import list_move() and list_move_tail() from include/linux/list.h.

These will be used in the next commit.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/list.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/scripts/kconfig/list.h b/scripts/kconfig/list.h
index 882859ddf9f4..7008243f48a8 100644
--- a/scripts/kconfig/list.h
+++ b/scripts/kconfig/list.h
@@ -127,6 +127,29 @@ static inline void list_del(struct list_head *entry)
 	entry->prev = LIST_POISON2;
 }
 
+/**
+ * list_move - delete from one list and add as another's head
+ * @list: the entry to move
+ * @head: the head that will precede our entry
+ */
+static inline void list_move(struct list_head *list, struct list_head *head)
+{
+	__list_del_entry(list);
+	list_add(list, head);
+}
+
+/**
+ * list_move_tail - delete from one list and add as another's tail
+ * @list: the entry to move
+ * @head: the head that will follow our entry
+ */
+static inline void list_move_tail(struct list_head *list,
+				  struct list_head *head)
+{
+	__list_del_entry(list);
+	list_add_tail(list, head);
+}
+
 /**
  * list_is_head - tests whether @list is the list @head
  * @list: the entry to test
-- 
2.43.0


