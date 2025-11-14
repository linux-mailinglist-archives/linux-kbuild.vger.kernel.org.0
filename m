Return-Path: <linux-kbuild+bounces-9634-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 58BAEC5DAE8
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 15:50:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 18A0D35C339
	for <lists+linux-kbuild@lfdr.de>; Fri, 14 Nov 2025 14:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7F3A32C33A;
	Fri, 14 Nov 2025 14:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFk+7/dr"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A232B998
	for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 14:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763130496; cv=none; b=Rt3dJAmxnt7r6oQcy1yJ+z2pf4WWuMEE8ELwyy9Rki4DvWvRVBNUxCqOdT9B8vnIGxZOqllai58BNoLrZ5XBiRFToyQ43WwmorOMGxEgZFU02blKU9mSV8s4zSNhzCcvYKOT3i2tvrnOqYkAu/TfWQiNG8gm80Ez7dybIPpF4tc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763130496; c=relaxed/simple;
	bh=Khn8xl78nWKbQ9qiwRfPIiqdd7MMix5aw37wtwcBeyI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BCB0gCqFVtxDc/VrWgLSxnfXYkqGRpXgTnmYI9d2pb7mjZM95Ap2lpK2loMVKonMUKpbAr0bkT34BOoiQWRCQQI5M7N+m+hJ54u0vWXiUO+XOhDL18qLhUVk9l6/ZAiazs2LMPUJ1yozeig/+v+IZd8xRoLQOie/+H80w+7mFO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFk+7/dr; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-433101f2032so9390385ab.1
        for <linux-kbuild@vger.kernel.org>; Fri, 14 Nov 2025 06:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763130494; x=1763735294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zlW9sVY3dHmO2QQaQTwq9Tqd8agWgn9nVM7+PnbVmYo=;
        b=RFk+7/drKj+JB0Ads7dZwQTeuDy1Ftbs8h3h2NOUILT16EiIhIUCU/hgV6V2keVPvC
         ZYvDJ3BqUduZgHxpy60Qem4QVY/iP899m2Tg6yYYKtjCky+YPWxmPTxuD1B4OWdk4o52
         A5qcK75FpYC4pHTuegbJOpyfNLM8Ac9W5fWJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763130494; x=1763735294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zlW9sVY3dHmO2QQaQTwq9Tqd8agWgn9nVM7+PnbVmYo=;
        b=OSUPUJ3HueoanotdWs65e2g7lMP36gh6Jm3N8e6p2SzYqf1a2bwOffOxmH6P3SWxDe
         Zd4pNgPItnClbkkhErEz7i9k9kgm8U2djQVy7t5Fpz9iimFYACtC3KgZtSrx+lrV9B93
         Zsqr3H/JB+URegOr+e6whrh9mIVm6m3Jv4kazhbjHaIbvbnPhYHubuOui551yuOL06HL
         UUok7XQIji8rIwCvmG24YIMfZZ/860K8k/QzDOuSQbTu1NUTmt+t8DldO8sujiLgtOkG
         05fkeq8YTo7FGdTsMw9NJHzl/CowOG1xvbl4tlYoFFjncgqdSndu0Tmq9jRHQWTVXqUz
         i0WA==
X-Forwarded-Encrypted: i=1; AJvYcCUzcYTMb4Po/BEOqEXxUrj0FJ8dD8FS9NFuZHoTqOFljSKN1KYH7Qv7p/tTfusM7ErPaPQxVPE84i3gcZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+pnvwdLAoV0keG8aeCk8BTu6tdsQiwMIoN0+PPoEc1EBtsOd1
	BoE8xz9pADoC6tWN/OJFcqERnxq9AFYfyli0qI+esSwKC1TG9o+SaVUfh9kiTaYP5g==
X-Gm-Gg: ASbGncu97G0sfFVLfeMLaym7GMiW3GPgBIZNwTJZQhPMfBrGfIAUmV0F5zdcPdC9jeL
	1i+7wYdO53Y3WF0BuR9ipcKQ/cWKfL7KVILQYRQchl+9tMFpUsj/RpktLvDpvrQNU7KMacqSVkH
	/8yfxKVJUBAAgQuxmQcUaMmiWXgtaahg432VV/fFZm6NdGeALrZ/3ywJKAOuNLq8MUU1p5a2CK2
	7Ci5PwiiCAzR8P/fNDkeJifytalnIGAADjbWfvVV7as6Mckw/RT+S4NfyHIvnVcbn6+BSNwl8oU
	NyK606e4xHdPE3S1dSTlktFJsaJ47GiBGpsn3JVUuw05MsX67VOW0VeaBrUVaUdSvwykX0CzGiD
	z9AtZOmgfyVgdddpZxAQl6pSj1GKP6fUxYBhUmtHmyomZXBXrQmVwsbMnvmgV6enlDfvQCJCl3W
	46fMUnKdEcB9xOl0U=
X-Google-Smtp-Source: AGHT+IHtlD8phUcrsxxNZnSEeRERBORiCvKi70lR0tOOd7wFG1c+yfIKHGrMPWetfRl4tu7NCPgRrw==
X-Received: by 2002:a05:6e02:1523:b0:433:713d:a288 with SMTP id e9e14a558f8ab-4348c94ad9emr53176765ab.32.1763130494081;
        Fri, 14 Nov 2025 06:28:14 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-434839cdb10sm27500205ab.32.2025.11.14.06.28.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Nov 2025 06:28:12 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Nicolas Schier <nicolas@fjasle.eu>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Simon Glass <sjg@chromium.org>,
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Parth Pancholi <parth.pancholi@toradex.com>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/8] kbuild: Allow adding modules into the FIT ramdisk
Date: Fri, 14 Nov 2025 07:27:32 -0700
Message-ID: <20251114142741.1919072-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251114142741.1919072-1-sjg@chromium.org>
References: <20251114142741.1919072-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Support 'make image.fit FIT_MODULES=1' to put all the modules into a
ramdisk image within the FIT.

Add image.fit as a target which requires modules, so that modules will
built automatically when using FIT_MODULES=1

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v5:
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

 Makefile             |  1 +
 arch/arm64/Makefile  |  1 +
 scripts/Makefile.lib | 10 ++++++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 8cd46222fc48..4eccaef95826 100644
--- a/Makefile
+++ b/Makefile
@@ -773,6 +773,7 @@ endif
 # Just "make" or "make all" shall build modules as well
 
 modules-targets := all
+modules-targets += $(if $(FIT_MODULES),image.fit)
 modules-targets += modules
 modules-targets += nsdeps
 modules-targets += compile_commands.json
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 73a10f65ce8b..7036f251ab40 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -174,6 +174,7 @@ endif
 all:	$(notdir $(KBUILD_IMAGE))
 
 image.fit: dtbs
+image.fit: $(if $(FIT_MODULES),modules)
 
 vmlinuz.efi image.fit: Image
 $(BOOT_TARGETS): vmlinux
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


