Return-Path: <linux-kbuild+bounces-437-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3388381F54F
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Dec 2023 08:10:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 443201F22608
	for <lists+linux-kbuild@lfdr.de>; Thu, 28 Dec 2023 07:10:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DD8063C5;
	Thu, 28 Dec 2023 07:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="INrGEv+i"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC80A611F
	for <linux-kbuild@vger.kernel.org>; Thu, 28 Dec 2023 07:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-28bcc273833so4868083a91.1
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Dec 2023 23:09:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703747388; x=1704352188; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EoqhO26zK6349/cY+3ITh8QstYG5iPWC2+7Y4ulVjaM=;
        b=INrGEv+i3X4P5sBtW7GZWQPkcyoc4ZKPbJm8+LhgPsuiZLCCrzl4uo1IPJlfNd07T6
         q/cQk6gQkoc6nt/ckh+Ghh+0XNKrlcLEAYprBmusEK3rJ96KdGY+b1Skc4LayZPvd1sZ
         uyXabYoDfucPwstRTxmg5gIR7sEazwhBFXLq8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703747388; x=1704352188;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EoqhO26zK6349/cY+3ITh8QstYG5iPWC2+7Y4ulVjaM=;
        b=GigLbTmfiEDbqondUUthIo49ur6PtfhARYYglQBZqe3O+abtA1j3+KuRlqWu1SBskA
         MCbQXAtkC+2WuQ5UHavaw5A6cX+3V7wVaBy29v+LrU/oUBX796wjWUuSjR3DW5RQaSLY
         VC8o6+KdPOGNCIVaJrK+D38X4xBg1fjLIaG3Hv+B7dt2oFO9ACq9bg8P8/CNsXBtyar9
         E+QQO/ZljH3nppymayTyGk2Tt7GKtkPSW6+5PZw901aPwwYIbirICusMu4MlN0lfl/MA
         Ddq2SI2e3oBBK6Vu4HmCxYNeqBLTAVVZSgwh/0AdOWtTkVENjB/07PqGZEHiDwnsyim5
         wRgg==
X-Gm-Message-State: AOJu0YwH/D2cxWqo1nyfIAhXedFyZWB9gqUTyjVxs3cMWjp+ZNiczGwt
	TIc+4jZRdJF8pzcTACR29hBqqwVnUu94
X-Google-Smtp-Source: AGHT+IG4gqdQCkzcto7NogJr0sMKUtYQiYZXZC2H6KwjAQtGI8F9G+BMcgCbVlQJoq/5JFUJFkg9Jw==
X-Received: by 2002:a17:90b:b83:b0:28b:e124:1afb with SMTP id bd3-20020a17090b0b8300b0028be1241afbmr5169012pjb.37.1703747388048;
        Wed, 27 Dec 2023 23:09:48 -0800 (PST)
Received: from basement.c.googlers.com.com (112.157.221.35.bc.googleusercontent.com. [35.221.157.112])
        by smtp.gmail.com with ESMTPSA id 28-20020a17090a019c00b0028b2262e0cdsm19068454pjc.56.2023.12.27.23.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 23:09:47 -0800 (PST)
From: Tomasz Figa <tfiga@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Tomasz Figa <tfiga@chromium.org>
Subject: [PATCH] kconfig: Add a build target for checking current config for issues
Date: Thu, 28 Dec 2023 16:09:41 +0900
Message-ID: <20231228070941.3611649-1-tfiga@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The new target is called 'checkconfig' and currently is basically an
alias for `listnewconfig` with KCONFIG_WARN_UNKNOWN_SYMBOLS set to true.
It can be used to validate if the current config is directly compatible
with the current kernel version or needs some manual adjustment.

Signed-off-by: Tomasz Figa <tfiga@chromium.org>
---
 scripts/kconfig/Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 4eee155121a8..501cb9b76414 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -81,6 +81,9 @@ PHONY += savedefconfig defconfig
 savedefconfig: $(obj)/conf
 	$(Q)$< $(silent) --$@=defconfig $(Kconfig)
 
+checkconfig: $(obj)/conf
+	$(Q)KCONFIG_WARN_UNKNOWN_SYMBOLS=true $< --listnewconfig $(Kconfig)
+
 defconfig: $(obj)/conf
 ifneq ($(wildcard $(srctree)/arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG)),)
 	@$(kecho) "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
@@ -144,6 +147,7 @@ help:
 	@echo  '                    default value without prompting'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
+	@echo  '  checkconfig	  - Check current config for unrecognized and new symbols'
 	@echo  ''
 	@echo  'Configuration topic targets:'
 	@$(foreach f, $(all-config-fragments), \
-- 
2.43.0.472.g3155946c3a-goog


