Return-Path: <linux-kbuild+bounces-1475-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6FF89AF3A
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Apr 2024 09:29:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC2071F23DFC
	for <lists+linux-kbuild@lfdr.de>; Sun,  7 Apr 2024 07:29:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A918328F7;
	Sun,  7 Apr 2024 07:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cEAx/fDx"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC624125B2
	for <linux-kbuild@vger.kernel.org>; Sun,  7 Apr 2024 07:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712474984; cv=none; b=qmAfLbhAwr6rvDNs7uHAJzK7rzx0YaIgo+0mQNLjD2U1o0U5nhBDfMRSrucHFxVkZhULUnfYpb7c458CccH0FOLrLSktdYP66tfr9W5zuMjHI/yFPBLTqhXpqWmQtLjmQz1CH2RMak2TyvLaGHPCMat/ugc71ikz/jAMDkxwHoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712474984; c=relaxed/simple;
	bh=c4gx5gcQ+/KZ11SSWnacKCMVPfuYBoPwmmjD279Nb7U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Cj1ksJPRMHuE8cET+mS5z0FIL4turK5xMIEyMEaI4VGE/56V6Cf+stuhMJ7BM+X4qauIXqmu9yHSRX8BNytCGQiIOFnQZ8UmTivnSh0X2eoE20K+m2on1y6pH/p54pDgFa98nnku149Q7fzRxeLfG9J/X3Z3sRDm0sxUQBDNOv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cEAx/fDx; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712474981;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=X27ygB47YVHTECz49cgF8BF51X7CZq1qToYAliyB6IM=;
	b=cEAx/fDxAI/72Y0xWef886g8N5QiY/l5PL/ejejy4eKByez0QHsk2WUCYAdNRO5BsP4bXF
	bJY4d0DCY2H/28r4QfF+XbQOT89Nb+BswTrl+BqyEDj2YJhCbXH5c0mclptUASMTXt6i7t
	gqAteGUeozp7vd0kFwW7t+C7ZGzbce8=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-hzviGMaoNSC3G6qqNt4ajA-1; Sun,
 07 Apr 2024 03:29:40 -0400
X-MC-Unique: hzviGMaoNSC3G6qqNt4ajA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B3C9C1C060FC;
	Sun,  7 Apr 2024 07:29:39 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.74.16.61])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 39F4210E4F;
	Sun,  7 Apr 2024 07:29:37 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH v1] kconfig: add config and source entry details
Date: Sun,  7 Apr 2024 12:59:33 +0530
Message-ID: <20240407072933.3562124-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

From: Prasad Pandit <pjp@fedoraproject.org>

Add details to the 'config' and 'source' entry description,
to make it unambiguous. It'd come handy as reference for
Kconfig language or patch reviews for Kconfig source files.

Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 Documentation/kbuild/kconfig-language.rst | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

v1:
 - Fix typo path -> patch
 - https://lore.kernel.org/linux-kbuild/20240404064037.3440433-1-ppandit@redhat.com/T/#u

diff --git a/Documentation/kbuild/kconfig-language.rst b/Documentation/kbuild/kconfig-language.rst
index 0135905c0aa3..0783850d5a00 100644
--- a/Documentation/kbuild/kconfig-language.rst
+++ b/Documentation/kbuild/kconfig-language.rst
@@ -39,11 +39,14 @@ them. A single configuration option is defined like this::
 	  kernel.  ...
 
 Every line starts with a key word and can be followed by multiple
-arguments.  "config" starts a new config entry. The following lines
-define attributes for this config option. Attributes can be the type of
-the config option, input prompt, dependencies, help text and default
-values. A config option can be defined multiple times with the same
-name, but every definition can have only a single input prompt and the
+arguments.  "config" starts a new config entry. The following lines,
+indented by a leading tab (\t) character, define attributes for this
+config option. Attributes can be the type of the config option,
+input prompt, dependencies, default values and help text. Help text
+is further indented by two more spaces.
+
+A config option can be defined multiple times with the same name,
+but every definition can have only a single input prompt and the
 type must not conflict.
 
 Menu attributes
@@ -451,6 +454,11 @@ source::
 	"source" <prompt>
 
 This reads the specified configuration file. This file is always parsed.
+The specified file path is from the top source directory ($SRCTREE).
+It allows one to source a file from any subdirectory under the source
+tree. Such path is always unique under the source directory.
+A configuration file must terminate with a new line (\n) character
+at the end.
 
 mainmenu::
 
-- 
2.44.0


