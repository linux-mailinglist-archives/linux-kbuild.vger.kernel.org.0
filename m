Return-Path: <linux-kbuild+bounces-9019-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 89316BBFBD8
	for <lists+linux-kbuild@lfdr.de>; Tue, 07 Oct 2025 01:03:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0739C3C476A
	for <lists+linux-kbuild@lfdr.de>; Mon,  6 Oct 2025 23:03:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C720A21FF2E;
	Mon,  6 Oct 2025 23:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FpyspUHA"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC91021A458
	for <linux-kbuild@vger.kernel.org>; Mon,  6 Oct 2025 23:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759791775; cv=none; b=rFjyucM4H8gjdHzZuzq1ef0gdo43d2uqrW7m9s9GQmUeUUKCk0Fw2eFd0PdNFnY7akHMzTZEsZ1nw2pQpmxql5G1qnQNiRRA/tdo/sLjwiwrNqdGmb+hRMnL0YRrnJ1VpMiK5YhZFtGvJEQZ+D8hJjXHjEFN94xPRsPLnyQdH2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759791775; c=relaxed/simple;
	bh=J5q0jWsK5BjH042bjuBuYYFQ87rhLFCo1nf6x44DvAY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RFuXsb65gs6FtnXmlFldDjvXMprQMGwGEcnzNn6/yeOezIiKyOv7LrKd/+xuIECiya3+bOLNBFmy4+V5/zRFmqkaEbpJPUldvwJfVpOf0EUBR6ILvLKvEPP6Jsvw4o/6N404kRV2vIEEd+o/h9W758gG6QnCvWgHIgA7DE/9sHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FpyspUHA; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-42f61004750so17072755ab.2
        for <linux-kbuild@vger.kernel.org>; Mon, 06 Oct 2025 16:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791773; x=1760396573; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYASDCPfiPbCUV1KYUTYbx4wHolb9ntBgheoD945Sac=;
        b=FpyspUHAbqwZXazaT9iNZdMk6sRLYYyRHaevXs3MQRqkRMU5Kl25+Jf8X5vCfjAoDp
         NQ1FfYXbTtrFhD0i9DnyGBHuLYGMcM7/4ChLQqs4WXCkVFTYRkh7uzzgsHwAlupaNe/q
         5ITTL3VRhb4jQufIfwgLYt6YbIxVqlyFEhARU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791773; x=1760396573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYASDCPfiPbCUV1KYUTYbx4wHolb9ntBgheoD945Sac=;
        b=IAAdZpsuC6P0CfnbA35NaKpCrXAYveh+mDbvMKoBGjWd3gMo0/rvIpfuO7f/9S1cGx
         Tj0DPIquHQPjOnDbNkZzFlojHsUvA2HhxF8QfU79Br+a/koaPOihJfc9Cp8r5ZQb9RVw
         cGUxTg1/xJmCQnForLM0aLdM/tnbt1OMEER8HRGsdDz4rG+GiuHLgO6dlzsTDYv2X5WB
         vGOY+LBlozC5k4l2INq1scpJZJkF24L1ldrI6A5ZuhGE9iAIlCXDaKPfac2JltttsAmq
         wIPtHJ3vCy3VJTGzcLk0QQU1FYrDmBD4xFgqhMexnMQdAVAB4ZNV0UpIA0itf/US2Dwa
         hZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXnHI6xH/9iml3j+nRDAPgeX/wUymkwj1TMiTU+DeAtuKebcgOvzMzKJ2iu4zmS0JIqPjeLYycRDKD5VCw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVf4GiqFBdnmHsNT1OnAbOmViiNGRKHNuXB+9R/yJHB/knf0G3
	oXMIqY7iSQoOZT4I5CLFKtsSu44/AzYdXOamoaIRdet7AP10RBrrgfqtQm1TURoIdg==
X-Gm-Gg: ASbGncu358C6Upry7cNaDe3cY/shfmuqjVgDEL5AIYpEdaCutzsRqC+XvDSkR71RLV7
	2rOhgKpvuHMrR/1HigbVJtXspbzP/d3RjvIsbhIDVP1WsxEk+U0PdPswpBKAlrIgRpOLr8xmEeX
	+J9ANDvDJqAzgzZ2vAqDwV7CbOz2v9lIlrQDzPK6gExvzONPnphEkT9ymVkYgAibAGhn7ou/6g1
	4n1YIy0vY2z/V5V5YwQ6ekMxe2Tbpv296O6hK0jMG6XqV44SiT25GkvAUXkHTTiI8Gz4KF+j3fk
	rSh8JLuOhBApp2eZL7x//iLEDWSggHHfETFEcldXz70cRa03/O9FpGf2HkCIfUgzhPKoCgCaqzg
	L91FqclQGcRMaDza4l4ldRT4UonaJ8kcJblBNBO6W95Y=
X-Google-Smtp-Source: AGHT+IFWMMJp+NFmsOx6pq2dwd7Hy4kI7ynB4UcS1GCGMob/F9UqCyjwJZxXEHBZiF/C7t22Bn7ozg==
X-Received: by 2002:a05:6e02:174e:b0:428:c370:d972 with SMTP id e9e14a558f8ab-42e7acedb7dmr164223205ab.7.1759791772886;
        Mon, 06 Oct 2025 16:02:52 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:51 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 5/7] kbuild: Allow adding modules into the FIT ramdisk
Date: Mon,  6 Oct 2025 17:01:56 -0600
Message-ID: <20251006230205.521341-6-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support 'make image.fit FIT_MODULES=1' to put all the modules into a
ramdisk image within the FIT.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v4:
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

 arch/arm64/boot/Makefile |  4 ++++
 scripts/Makefile.lib     | 10 ++++++++--
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/Makefile b/arch/arm64/boot/Makefile
index b5a08333bc57..d10c85f96aea 100644
--- a/arch/arm64/boot/Makefile
+++ b/arch/arm64/boot/Makefile
@@ -43,6 +43,10 @@ $(obj)/Image.zst: $(obj)/Image FORCE
 $(obj)/Image.xz: $(obj)/Image FORCE
 	$(call if_changed,xzkern)
 
+ifeq ($(FIT_MODULES),1)
+.PHONY: modules
+$(obj)/image.fit: modules
+endif
 $(obj)/image.fit: $(obj)/Image $(obj)/dts/dtbs-list FORCE
 	$(call if_changed,fit)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 1d581ba5df66..c6a3aa653035 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -398,11 +398,17 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
 
+# Set this to 1 to include an initrd with all the kernel modules
+FIT_MODULES ?=
+
 quiet_cmd_fit = FIT     $@
-      cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+      cmd_fit = $(if $(FIT_MODULES), \
+		find $(objtree) -name '*.ko' > $(objtree)/.modules-list 2>/dev/null &&) \
+		$(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
+		$(if $(FIT_MODULES),--modules @$(objtree)/.modules-list) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
 # XZ
-- 
2.43.0


