Return-Path: <linux-kbuild+bounces-4284-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F199AD3D1
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:18:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0DD01F2303D
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D73F1D14E1;
	Wed, 23 Oct 2024 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kfMUw8Pb"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 739D81D0F77;
	Wed, 23 Oct 2024 18:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707508; cv=none; b=MNOmpIlMyCOpT/VDNd3fNUnITPxtFBNgrOVEAqH/8TAIskhjp8MSullET62Kf7Q+GPtXSAvbK9g9iTSc2M50HqsPohTWFZyd1pLZrb8iVAdQp4yfiI+VGtjTDZ8v7vykmd73t+k+2N7ejng7RmRvmqgKoBDpWdiTF6jLGoOpRsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707508; c=relaxed/simple;
	bh=r6wjnhku+DknLdFNwLezf9sp74rPJJIDaA8wS+ADw2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2rFC9bfArYnq5KUABmaGHnwuKYgiYoVDuR/z+4cdZOLcJERLJ3eiwn+pkiJXTwegzuiuTUIRNeqkY5ygByi58dxIYBcXp4aDO1y/dfVhVatz6TEfbJHCQTEC51AujQ22N11ucrKFYHt96fSBRmvIHwdErXrswiVH6ibudECrf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kfMUw8Pb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60870C4CEC6;
	Wed, 23 Oct 2024 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707508;
	bh=r6wjnhku+DknLdFNwLezf9sp74rPJJIDaA8wS+ADw2s=;
	h=From:To:Cc:Subject:Date:From;
	b=kfMUw8Pb1n7yYh/U8gVi0w8+Is8EXmAli72QwO0gHP9L1tUj5vQ4D2lsYZCI1X9YQ
	 ZN/RN9/NfouFqk1CrH8RXQ0oggd43PPr8XetlcJbz4+Qb+UaoBDZ7a42sW7zYPvU7H
	 dA5ISJjqmgKVZAMevdsa91h2nTHAq285K5gqFdXb9pxP+vgW7KmbWaNTH0BL2PuKSi
	 KBhHsyHWjD1v608xPqKO5zkeiijjId8nOsKaEIwjeieVVCk44iA99SYI+J/0OOY7Mi
	 +ecLs87I7Btd0jMR3+4BlIB5NvVfxCzF7PEAmTyirLWLXqUE0enAtUgt7kjf/9zk9a
	 UNmzhWkPA/E+w==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 01/13] kconfig: qconf: remove mouse{Press,Move}Event() functions
Date: Thu, 24 Oct 2024 03:17:51 +0900
Message-ID: <20241023181823.138524-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions simply passes the event to the parent.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 14 --------------
 scripts/kconfig/qconf.h  |  2 --
 2 files changed, 16 deletions(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 90f139480eda..18cc5c184f56 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -781,13 +781,6 @@ void ConfigList::keyPressEvent(QKeyEvent* ev)
 	ev->accept();
 }
 
-void ConfigList::mousePressEvent(QMouseEvent* e)
-{
-	//QPoint p(contentsToViewport(e->pos()));
-	//printf("contentsMousePressEvent: %d,%d\n", p.x(), p.y());
-	Parent::mousePressEvent(e);
-}
-
 void ConfigList::mouseReleaseEvent(QMouseEvent* e)
 {
 	QPoint p = e->pos();
@@ -834,13 +827,6 @@ skip:
 	Parent::mouseReleaseEvent(e);
 }
 
-void ConfigList::mouseMoveEvent(QMouseEvent* e)
-{
-	//QPoint p(contentsToViewport(e->pos()));
-	//printf("contentsMouseMoveEvent: %d,%d\n", p.x(), p.y());
-	Parent::mouseMoveEvent(e);
-}
-
 void ConfigList::mouseDoubleClickEvent(QMouseEvent* e)
 {
 	QPoint p = e->pos();
diff --git a/scripts/kconfig/qconf.h b/scripts/kconfig/qconf.h
index aab25ece95c6..0b62fb26821a 100644
--- a/scripts/kconfig/qconf.h
+++ b/scripts/kconfig/qconf.h
@@ -55,9 +55,7 @@ class ConfigList : public QTreeWidget {
 
 protected:
 	void keyPressEvent(QKeyEvent *e);
-	void mousePressEvent(QMouseEvent *e);
 	void mouseReleaseEvent(QMouseEvent *e);
-	void mouseMoveEvent(QMouseEvent *e);
 	void mouseDoubleClickEvent(QMouseEvent *e);
 	void focusInEvent(QFocusEvent *e);
 	void contextMenuEvent(QContextMenuEvent *e);
-- 
2.43.0


