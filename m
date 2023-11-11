Return-Path: <linux-kbuild+bounces-15-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 577707E86E7
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Nov 2023 01:29:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55D3B1C208CD
	for <lists+linux-kbuild@lfdr.de>; Sat, 11 Nov 2023 00:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74238EDB;
	Sat, 11 Nov 2023 00:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ByWIc5KZ"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C61EA1
	for <linux-kbuild@vger.kernel.org>; Sat, 11 Nov 2023 00:29:36 +0000 (UTC)
Received: from mail-qv1-xf2a.google.com (mail-qv1-xf2a.google.com [IPv6:2607:f8b0:4864:20::f2a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8F873C3D
	for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 16:29:35 -0800 (PST)
Received: by mail-qv1-xf2a.google.com with SMTP id 6a1803df08f44-66d0760cd20so22174856d6.0
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2023 16:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1699662575; x=1700267375; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMe27PCpSGrpKy6akin6UXrBQxmCtSQz/w0mkm8+aO0=;
        b=ByWIc5KZlNlmBIPWwJcgT983Yq9tWUr/KFSiBxanH4vHTBB4WGPQMvsSgrgFr4s1WK
         CPkuT5sAeDsk6xRLNjHENt5wN1pxV7Zudq1O93U3MbiVyiKE/E7CRZzjAqXYAPcmGZ2D
         wQnHuSe4VbJhXZfJvPRAsKl8iSIQcbO9nKVhc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699662575; x=1700267375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMe27PCpSGrpKy6akin6UXrBQxmCtSQz/w0mkm8+aO0=;
        b=oplwRCei3fdgqadiFmJ7y19QLoEgyY6TFAvL3a7nQ3EEbRCotQiUyGQTqq5n38Xb30
         5ha5BDwuDIJGi8Tl1pN6iB7WYp3aBopsaTWujw38NnRHhq0lUoUz/VYl9i4solUifLKb
         Q6+Tuh+/X3m7CJEk/8uIFuOtjA3K5PIQ3l5HxrzZrMhO4g8dWpDf+2SRLLnvvcl/vLrv
         qevQDocV+aMA+/whqMm0ut8A24bMNfbdQaivTJaRa3AjOSW6HaSe5rTw7CidRPXrvJh3
         H7O3wRH/XCvQ8Pw+M5vumFVL8JrkBGQ7f6Zv0FUayFFdChg/KxqC3ivkGSs6IFnHX6Tu
         Pwjw==
X-Gm-Message-State: AOJu0Yya4dS3uV5N8RU8peFqzCFgzTp1IBzGLeSz+DeGe/wGGqoOjXwX
	H/EPXAFvD5RfjgIN6uLsr5AZdQ==
X-Google-Smtp-Source: AGHT+IE0a/VdrtgvwTmIbRQLeoUJHTOtRwQJiuZK5PAG5tzmD5AD8V4FRMa71Q4svxolT1LcdUmEbg==
X-Received: by 2002:ad4:4e6d:0:b0:670:ba7c:938d with SMTP id ec13-20020ad44e6d000000b00670ba7c938dmr1203791qvb.25.1699662575054;
        Fri, 10 Nov 2023 16:29:35 -0800 (PST)
Received: from kea.bld.corp.google.com ([2620:15c:183:200:5104:5a27:f95d:21d1])
        by smtp.gmail.com with ESMTPSA id l16-20020a056214029000b00677adcfd261sm55898qvv.89.2023.11.10.16.29.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Nov 2023 16:29:34 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: lkml <linux-kernel@vger.kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	U-Boot Mailing List <u-boot@lists.denx.de>,
	Simon Glass <sjg@chromium.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH v5 2/3] arm: boot: Move the single quotes for image name
Date: Fri, 10 Nov 2023 17:28:01 -0700
Message-ID: <20231111002851.1293891-3-sjg@chromium.org>
X-Mailer: git-send-email 2.42.0.869.gea05f2083d-goog
In-Reply-To: <20231111002851.1293891-1-sjg@chromium.org>
References: <20231111002851.1293891-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add quotes where UIMAGE_NAME is used, rather than where it is defined.
This allows the UIMAGE_NAME variable to be set by the user.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v4)

Changes in v4:
- Add a patch to move the single quotes for image name

 scripts/Makefile.lib | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 68d0134bdbf9..1a965fe68e01 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -487,14 +487,14 @@ UIMAGE_OPTS-y ?=
 UIMAGE_TYPE ?= kernel
 UIMAGE_LOADADDR ?= arch_must_set_this
 UIMAGE_ENTRYADDR ?= $(UIMAGE_LOADADDR)
-UIMAGE_NAME ?= 'Linux-$(KERNELRELEASE)'
+UIMAGE_NAME ?= Linux-$(KERNELRELEASE)
 
 quiet_cmd_uimage = UIMAGE  $@
       cmd_uimage = $(BASH) $(MKIMAGE) -A $(UIMAGE_ARCH) -O linux \
 			-C $(UIMAGE_COMPRESSION) $(UIMAGE_OPTS-y) \
 			-T $(UIMAGE_TYPE) \
 			-a $(UIMAGE_LOADADDR) -e $(UIMAGE_ENTRYADDR) \
-			-n $(UIMAGE_NAME) -d $< $@
+			-n '$(UIMAGE_NAME)' -d $< $@
 
 # XZ
 # ---------------------------------------------------------------------------
-- 
2.42.0.869.gea05f2083d-goog


