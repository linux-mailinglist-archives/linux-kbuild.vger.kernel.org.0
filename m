Return-Path: <linux-kbuild+bounces-7598-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BF316AE281E
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 10:52:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FCB33A700A
	for <lists+linux-kbuild@lfdr.de>; Sat, 21 Jun 2025 08:51:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB0781E2858;
	Sat, 21 Jun 2025 08:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b="JZdzsuWd"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from cvsmtppost32.nm.naver.com (cvsmtppost32.nm.naver.com [114.111.35.242])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C866B1DE4CD
	for <linux-kbuild@vger.kernel.org>; Sat, 21 Jun 2025 08:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=114.111.35.242
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750495915; cv=none; b=BdJ8+JL3qs792eQaw0VU5fmOh0fMjrxbpfWc0ZibmTnjb9QTRtqWdcZKoSDxkRFojN2dBSda0sPQWf+9Cg6mzwKQJH6daZCXn8X8b7DqAnGnF6AfW6DGyrmp+cBVjN9sBXgd1Gp7Y8Pfrtdl354FvoUSh2n0xpcxjmD2xeUkZkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750495915; c=relaxed/simple;
	bh=rKtFqi4VVgxh1mefZj2DobHy7+yO6s5RafJYIJAk6MQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kgrsv7Liw40N0sUsV+5fFjKJxgo184WE3t+D31oXFtG9efhU68pf/oo5D9ghv54FoN+bnUvB59OQpADZen2A8eycNJmElLVLL93nI95oV7b5j2OJTZPxb8FwXBfcMey6IN8K3Ef6kHCafTxjygMi7B8MFZYpnFZTfoLXYOVuR60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com; spf=pass smtp.mailfrom=naver.com; dkim=pass (2048-bit key) header.d=naver.com header.i=@naver.com header.b=JZdzsuWd; arc=none smtp.client-ip=114.111.35.242
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=naver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=naver.com
Received: from cvsendbo006.nm ([10.112.20.43])
  by cvsmtppost32.nm.naver.com with ESMTP id hgGVS1ynToColmnTrzt1cQ
  for <linux-kbuild@vger.kernel.org>;
  Sat, 21 Jun 2025 08:41:44 -0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=naver.com; s=s20171208;
	t=1750495304; bh=rKtFqi4VVgxh1mefZj2DobHy7+yO6s5RafJYIJAk6MQ=;
	h=From:To:Subject:Date:Message-ID:From:Subject:Feedback-ID:
	 X-Works-Security;
	b=JZdzsuWd6+2ijbjDgh0FkHf9nE9O49YX21Bz5TeTkxwmmS9em2vKYAIRV8Z8H5eM9
	 o+pKujuhjYy2qHWsa58HCEGrOPsjmJGJ6KPEgqDHrKAa8YhMDVA5urVMakQGkbyUeI
	 R2PUv+h5w5KROFUqhndMfN1rgXgiHosJQ7NlmUHL/A+nhBEgDJWoGgSpp3hLxb0NMg
	 QkZnPjCXVbJcE/BYX8MuNpzlx7+S1NjUhtZ/mUUfnfvgyoFPGEmLFoDJTj3IIuC/ko
	 VPOKE85KyTNSCggZzLKVateqAx2LTxB+Osq5/DZhqpfIB+koDdSTMGg9GfFwWBFSl1
	 afs2C+PheMyCA==
X-Session-ID: 50YONv5+QGuiAFKKIujcIw
X-Works-Send-Opt: k/YdjAJYjHmlKxu/FoJYKxgXKBwkx0eFjAJYKg==
X-Works-Smtp-Source: XZnrFAg9FqJZ+HmqKAvZ+6E=
Received: from asya.. ([121.138.252.96])
  by cvnsmtp003.nm.naver.com with ESMTP id 50YONv5+QGuiAFKKIujcIw
  for <multiple recipients>
  (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
  Sat, 21 Jun 2025 08:41:43 -0000
From: Cherniaev Andrei <dungeonlords789@naver.com>
To: linux-kbuild@vger.kernel.org
Cc: masahiroy@kernel.org,
	yann.morin.1998@free.fr,
	linux-kernel@vger.kernel.org,
	Cherniaev Andrei <dungeonlords789@naver.com>
Subject: [PATCH 1/1] kconfig: fix 'space' to (de)select options
Date: Sat, 21 Jun 2025 17:41:24 +0900
Message-ID: <20250621084124.7134-1-dungeonlords789@naver.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix that by treating 'space' as we treat y/m/n, ie. as an action key, not as shortcut to jump to prompt. This is copy of commit https://gitlab.com/buildroot.org/buildroot/-/raw/master/support/kconfig/patches/16-fix-space-to-de-select-options.patch

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Cherniaev Andrei <dungeonlords789@naver.com>
---
 scripts/kconfig/lxdialog/menubox.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/lxdialog/menubox.c b/scripts/kconfig/lxdialog/menubox.c
index 6e6244df0c56..d4c19b7beebb 100644
--- a/scripts/kconfig/lxdialog/menubox.c
+++ b/scripts/kconfig/lxdialog/menubox.c
@@ -264,7 +264,7 @@ int dialog_menu(const char *title, const char *prompt,
 		if (key < 256 && isalpha(key))
 			key = tolower(key);
 
-		if (strchr("ynmh", key))
+		if (strchr("ynmh ", key))
 			i = max_choice;
 		else {
 			for (i = choice + 1; i < max_choice; i++) {
-- 
2.48.1


