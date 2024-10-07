Return-Path: <linux-kbuild+bounces-3938-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A490D993284
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2024 18:07:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BA5B1F237BB
	for <lists+linux-kbuild@lfdr.de>; Mon,  7 Oct 2024 16:07:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70BB91DA0FC;
	Mon,  7 Oct 2024 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbULXJIi"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com [209.85.214.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FF51D61B9;
	Mon,  7 Oct 2024 16:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728317241; cv=none; b=d9vIgTdUOWpAwNqh0068KhudfDxqlNn5OujFou3psU9ffxjPS/uG3XP0JPXwOlA400beb+1ZlIKiXGPF92ha/9i+YPjOivaGHGDA/RTMOcY71fMt4v+RIb6jFAIpetLI2OFiCWbJrRxvmCnZswLa/PVjDx7iAAkZCYFC5eJm2PU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728317241; c=relaxed/simple;
	bh=oFZDxZzZySVS3T5lGWIAzPggMpxcrF6nUmlUJMgreDM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tFssy141RGYfjsVzA2kmOx5MEoAG60wwLf3NRPZC4bOddTye87RCsVcW7BgVBc86pxy7DqJw6D/RDjolErSNZ+GczCsO3uY8xIupcEhBXOm1PAe2V4Ws+jqmeog+Rd3yR6X80FDsf8MjGgM5FO2PoMvoOCRX79xjs4SwcXOJ0xc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbULXJIi; arc=none smtp.client-ip=209.85.214.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f193.google.com with SMTP id d9443c01a7336-20b49ee353cso43284885ad.2;
        Mon, 07 Oct 2024 09:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728317239; x=1728922039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amdae/BqYBmxq5uKSqkgtaxGR1sUx6TEtJQKjIcgahQ=;
        b=lbULXJIiO3Z5KYGXL6d6n2cTPlNVJpoCs7FeRaO7r86FG7JZgcKy/nyV4uALQe8wIm
         2t7ojw4J21HWcCMOV+aFCZZZwqeP7hfaS8HOfOtA6L8zd0EYulaNVskX7dnty9fimNSL
         1gMDDRaZ8RqOiTZVFIDsspznB2UxM2nH1f+tYdFgSJ0jbtI3SgCMFMfw26NdJrCdngc1
         26xf4J6rH2XKRVjEUq9pMb9rrzLyj8RTuWflfYmnhKjMbrcA7CaPTxyhzsY+ZcGiJSwf
         WeHgu+Nsgij9FieXYvEzBGA3mGPXIY/a08z4sidAH8IsgEp79Pn+uEU/HMZjFu/jSW1n
         S16w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728317239; x=1728922039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=amdae/BqYBmxq5uKSqkgtaxGR1sUx6TEtJQKjIcgahQ=;
        b=DQn37VM3FXOXtmJisKG67yU55kBlECySmXTSxYgUdZpxryiKQAYn0PBk41vVj2aq/X
         hMqJAOhQzJaUdiMh6vllOTOvCh3AmobtnWXAIF6LNdSEzjlV5DRx+JBYlP6pfTqBPLPc
         xF8nxGeUoVdZHP3G2Slic2fA/x/H+Xgdugh6U8ufABuPg3hReVg1TqF+HQyoubQMzCKb
         +2HOVvLCcJ9EHaphv1t33CZglLuV73pV7AsuY7AtPIOx5zv0e4MMQHOWXISWf1OlVigu
         5c6cy29PGTPp7psTStD3PSjlQYOMagkc4WDjH6f04/Jy0LOP06hqyxe/+TYz9PD2pg3e
         s8gg==
X-Forwarded-Encrypted: i=1; AJvYcCVylyZEND0ypdKXpUPchhGOhejd+VkU+3Ch8T9vt/5E90kwp2+1rFJXc/0oq+yMq5Hp0iYcoV4y2YZPkjo=@vger.kernel.org, AJvYcCXu6wClnbpIvnE/QQ8ZnCk0UO1aO5XFynL3joWHqgjsPHInm2LNNBdXYOGTXySzERzbfzzcS7LoyLC/CKO+@vger.kernel.org
X-Gm-Message-State: AOJu0YxXHfMFmdxVg0rcUMFtieuoIO58BDqtT0GGTEdceaVXV9aXWRNC
	BAJQ9jvzfIfF/EPQ/1R1msglyQ1l7IjgqM2pBNKUzqgfcRLJE9td
X-Google-Smtp-Source: AGHT+IHG45kLy6GWGFdtJYm8LUxc3XAGRYzgrfjClcgECPwHJj9suXhXoOcR5f9lMPgGD4o0d55PoA==
X-Received: by 2002:a17:902:f549:b0:20b:ad45:538f with SMTP id d9443c01a7336-20bfdf82fb3mr194702075ad.14.1728317239290;
        Mon, 07 Oct 2024 09:07:19 -0700 (PDT)
Received: from localhost.localdomain.localdomain (n220246094186.netvigator.com. [220.246.94.186])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c13987b7esm41381575ad.259.2024.10.07.09.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 09:07:18 -0700 (PDT)
From: Zach Wade <zachwade.k@gmail.com>
To: masahiroy@kernel.org
Cc: nathan@kernel.org,
	nicolas@fjasle.eu,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Zach Wade <zachwade.k@gmail.com>
Subject: [PATCH] kbuild: Add vmlinux_install to facilitate debugging
Date: Tue,  8 Oct 2024 00:07:10 +0800
Message-ID: <20241007160710.3937-1-zachwade.k@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When testing multiple versions of the kernel with the same source code,it 
is often necessary to recompile the kernel, which is time-consuming for 
small hosts. I need to cp vmlinux to the corresponding module directory.
I think adding this will make debugging the kernel a little more 
convenient.

Signed-off-by: Zach Wade <zachwade.k@gmail.com>
---
 Makefile | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Makefile b/Makefile
index c5493c0c0ca1..1caab011599f 100644
--- a/Makefile
+++ b/Makefile
@@ -1579,6 +1579,7 @@ help:
 	@echo  '* vmlinux	  - Build the bare kernel'
 	@echo  '* modules	  - Build all modules'
 	@echo  '  modules_install - Install all modules to INSTALL_MOD_PATH (default: /)'
+	@echo  '  vmlinux_install - Install vmlinux to INSTALL_MOD_PATH (default: /)'
 	@echo  '  vdso_install    - Install unstripped vdso to INSTALL_MOD_PATH (default: /)'
 	@echo  '  dir/            - Build all files in dir and below'
 	@echo  '  dir/file.[ois]  - Build specified target only'
@@ -1887,6 +1888,19 @@ modpost: $(if $(single-build),, $(if $(KBUILD_BUILTIN), vmlinux.o)) \
 	 $(if $(KBUILD_MODULES), modules_check)
 	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
 
+# ---------------------------------------------------------------------------
+# vmlinux install
+
+PHONY += vmlinux_install
+
+vmlinux_install:
+	@if [ -f vmlinux ]; then \
+		echo "INSTALL ${MODLIB}/vmlinux"; \
+		cp -f vmlinux ${MODLIB}/ ; \
+	else \
+		echo "vmlinux file does not exist."; \
+	fi
+
 # Single targets
 # ---------------------------------------------------------------------------
 # To build individual files in subdirectories, you can do like this:
-- 
2.46.0


