Return-Path: <linux-kbuild+bounces-4286-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEC19AD3D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 20:19:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B53BFB22860
	for <lists+linux-kbuild@lfdr.de>; Wed, 23 Oct 2024 18:18:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC9601D173A;
	Wed, 23 Oct 2024 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KDT3Ok5B"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53E71D433C;
	Wed, 23 Oct 2024 18:18:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729707510; cv=none; b=XFSrXDkMSXnQdd00ONUuYIrNbDs5gzvS7UJqru1uNJfYViGgOxplfKc/NXqi1/wlh6kjfNLg1mKVpQA/iTD450km0LY7132AzP9st1lfxnhlSUjI9TqXt445I5ZoR8HOtTWMk7IKeuD/B3NWm3FoEB1bNBNPmDxqqKx1scXsS4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729707510; c=relaxed/simple;
	bh=s2VPAdI8Tith/AXHG8JzGiQ2Aol3WjhoEw6k7kH8kOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IYsfOigAifBuk1LMiMd2sVXTtALVBmCQLDBwmP5spIoMgiEjIPYd2MLdWXCUcJFYtsqaUDuSZlpyDhcK01wmvCfdbZ8aXwXB1qUp5qVtxuoQkL9DawazgeV/z7RdU8uZVx+clHLHmhDAYa8V7pgFVU5j63MfhfB1jwPGsyaPRck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KDT3Ok5B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0759C4CEE5;
	Wed, 23 Oct 2024 18:18:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729707510;
	bh=s2VPAdI8Tith/AXHG8JzGiQ2Aol3WjhoEw6k7kH8kOk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KDT3Ok5BuHYalzGe3qit45hLmgFwN/2R6N0BC2cYBnKKw6lnwOXW7jVz2DXNAPw7W
	 VP9e22UJwvRoQSr6G5DV/WLnQmg026Xr1zZFa65b9sUnqZuo+Sub6pRyJR6WxiZ8yC
	 lJgs5acgL7CA0cFpDRmJTEMmDBS7uPrWJIH6D+VXnzpSY9Yv4mQseqFZScaQfFt8pP
	 bLq9TzknMbNi57nMgAPyPnPBplgUFd6HqQ9K6AAlbRrdz1iKqfuo5NjwxykKUpWgI5
	 HwjpkBG6TXMlLaTjfO612j/rTtv/TcD3X+g4nbKbkL+N6rbyMyyrpshFjyMX+6URNE
	 k0u5jxGUqprpQ==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/13] kconfig: qconf: remove unnecessary setRootIsDecorated() call
Date: Thu, 24 Oct 2024 03:17:53 +0900
Message-ID: <20241023181823.138524-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241023181823.138524-1-masahiroy@kernel.org>
References: <20241023181823.138524-1-masahiroy@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The default value of the rootIsDecorated property is true.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/qconf.cc | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/qconf.cc b/scripts/kconfig/qconf.cc
index 58c57c908149..120090fa4ac9 100644
--- a/scripts/kconfig/qconf.cc
+++ b/scripts/kconfig/qconf.cc
@@ -307,7 +307,6 @@ ConfigList::ConfigList(QWidget *parent, const char *name)
 {
 	setObjectName(name);
 	setSortingEnabled(false);
-	setRootIsDecorated(true);
 
 	setVerticalScrollMode(ScrollPerPixel);
 	setHorizontalScrollMode(ScrollPerPixel);
-- 
2.43.0


