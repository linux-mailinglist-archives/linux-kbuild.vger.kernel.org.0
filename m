Return-Path: <linux-kbuild+bounces-1459-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D66D898192
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Apr 2024 08:40:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E7DB3B223DD
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Apr 2024 06:40:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C11BD2C870;
	Thu,  4 Apr 2024 06:40:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ekENsFYa"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6CB62574F
	for <linux-kbuild@vger.kernel.org>; Thu,  4 Apr 2024 06:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712212850; cv=none; b=PCvoQ2X4EAaUUsmvMGI5hHgmVptpEdhJf+YYQOv8DjB2VzsaQsNw9c+ZRwW0rqw6Jf1eprHv8tx74tmsuVWZHBOrfACfu+/D41XbEcIsuEty2B6gDP0zmAswUv26CKv5f5fjrSCCA/8cidbVPIvcudjMBph7gODcQqL3sZFLmWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712212850; c=relaxed/simple;
	bh=gmXCHfuVK28dXGiJqtNn1m5z5c76NG9chT9qaM0dj08=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IHY8+eEgyw4rMbl2t5y65D1Y2DfTvO66dX/dLNT3sgZ88SBeQ0hE3jf0IsB6wTla+ofwljhuX2kGXfzGDC7xLD8Ys1hvvIM5DvTjIU/oz6yfFzkO8sGnDeSyspkzpklrWABck1Tfak2a2rsINj3h+0cFSNK/dR88UjoZubO0Uws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ekENsFYa; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712212847;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dbacsQIxKvMn+2xANmrsBxOQChGVTv7MjeHKfWsj0Ik=;
	b=ekENsFYa9LeHV279f/P1dACg61tBbSureNPPc1zS2i0Qj79LksLh6Ih8Fj7pLNeUEjMjia
	XenTgr2yYmlmkvBZXB+8XaR7m+o2zx/siDUDh8wQ4mCEpJFoLVFE/v/888J2QgCA+mNNlp
	RRKq6e0t7OYO9NwoL0BnTRwgq5Smr6A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-137-YjNQWv0KMHq0Ims4Gf57jg-1; Thu,
 04 Apr 2024 02:40:44 -0400
X-MC-Unique: YjNQWv0KMHq0Ims4Gf57jg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 240E23C02745;
	Thu,  4 Apr 2024 06:40:44 +0000 (UTC)
Received: from kaapi.redhat.com (unknown [10.74.17.202])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 786E417B3A;
	Thu,  4 Apr 2024 06:40:42 +0000 (UTC)
From: Prasad Pandit <ppandit@redhat.com>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	Prasad Pandit <pjp@fedoraproject.org>
Subject: [PATCH] kconfig: add config and source entry details
Date: Thu,  4 Apr 2024 12:10:37 +0530
Message-ID: <20240404064037.3440433-1-ppandit@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5

From: Prasad Pandit <pjp@fedoraproject.org>

Add details to the 'config' and 'source' entry description.
It'd come handy during path reviews for Kconfig source files.

Signed-off-by: Prasad Pandit <pjp@fedoraproject.org>
---
 Documentation/kbuild/kconfig-language.rst | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

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


