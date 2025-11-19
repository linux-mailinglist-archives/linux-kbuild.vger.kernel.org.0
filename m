Return-Path: <linux-kbuild+bounces-9685-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BB090C7099B
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 19:15:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by tor.lore.kernel.org (Postfix) with ESMTPS id 12B692286E
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Nov 2025 18:14:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E8F3306B00;
	Wed, 19 Nov 2025 18:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HU9Idn5S"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C8A3126CB
	for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 18:14:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763576074; cv=none; b=OHhRnJhRBTAw8A7Jg4pgm9mN6tRXag/zLMjKuSU0vWcPduv3q/K8r0bmRNP+FQe9R4cuYvTLP5jEt1kwjcwL7L+clGdPYcOQNk1Pa7qqeax3v65MNlp1JvjN+6gbNyhfCvXbBdgg1BEGaqTSnKByjrDFKEDCkLeUQWdi5SASVmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763576074; c=relaxed/simple;
	bh=N9znOiAe5PJwsEoCpATqeH68yT6+oiXSUDjwEep8rqE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ulu2BwuitATbKHNMfYExaKFhCF6mBdwoFzOgG8QSISVbReTfU+yf3EhdS2f0WOK0HK8mLkTKlvjVwSwWLOElHgJJOXyd3RfCXk0FdO6eLLV6gAvIaeLP7Nv3j8/7aSPVgbb5ssDuYC+uJAjRrUMIc9PpnOF5bzYjaLSMnrbCxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HU9Idn5S; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-948f8fa9451so137080639f.3
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Nov 2025 10:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1763576057; x=1764180857; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4cU75xuJ/5xIhcW50wA4hHS4Fk7gDNqRb9uRUlMbq3I=;
        b=HU9Idn5Sc0tWMN4qxsg6yLFHv93vAMQ/I8sgSVGYpPdM6jF0yzLOzARkhO0n9KIHKB
         374OVxf5P7PZObVGHap9Db1pmONd6uOjn1SvmwzBQLIMX+cpAsktg/snLcKySHLupyDt
         mvtCnGqdjYGGfw2zV9QwTX2Gtg7Zw/TY/uTZM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763576057; x=1764180857;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4cU75xuJ/5xIhcW50wA4hHS4Fk7gDNqRb9uRUlMbq3I=;
        b=JoUNGHCeJ+1+fX3M2NlubUVOQsGo7arNCVzkIJrLZ88ppEnglich9Cqz8aaOGUZCMi
         Wymh7l3wA2ZVf4pfHsVmlBXf4lJ11QU7lbL2W5M+GnCeWy4muM5RYyyeJ8XWBC0ZFopr
         SLI062toIe/yUg9KXfFKmEot+gP1nEIvO2cBFD/dsIfMqG4JSvM2Z/SPkxsi2+wUEiIq
         hA7gxQ++wC/BuiuoOoREp7NGLKl7S23xD8rdQQ+oX4fneHX7eACTJ1KPZDONEhUg3YBd
         beQb2zK+8NO9/sttJ6JdFTsFiFupRizmJkZLkR86DZG1rCk2TAq9dZNDYVS7EgVMPUDF
         qLjQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVnWdoKJMegx2sk5ofHOBb1gwydbOBGlC5p91I5tYmxUulBu2ZDT53maXYx43AXdCjDA8Af0xBaeIhh2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnFFtf8wf1SXBK9xFqCL5EOR93qwgDzRp+lWty+CxzBMq7vcam
	biDeS+RkC54ImXQiKUmfuoJXSIxJq7QhkCL3w3OdCqJS5k95BfUSDQpspNmMuXB4lQ==
X-Gm-Gg: ASbGncsjWoYcfEqJOAm2pq+Alhu5zxkrs5rIBHeOUppJloky2QQ4nW6YMqOSM+QdRYi
	WybEswppg1Vvx6lSU/Z/e5lNCLJLQCEPdswt6jq/Rbge/qNxTEuhl3GuUhUAbvC4L2KIXnjYSa/
	gNZfBgvR6MfGEIFkIkqs61zCpbbJ+Kz0H3Hd6sqMeauNI3lpXwT8+3IuS38nnyQpebUL+lE8FpJ
	8DZugWm9S9FKi7uPat4gnLbejFnWzPezYiywl3vQSPx1nqvkSOj9e0SvCvZ09WCdiixmksrPTBR
	4r49ggDmzDKS96V/EeiiOcMHHgKyQ1myNTMXo3vAmfch9BfF6cYsi4RsCJtJKPjsQnPseHjCv4/
	w+8W31CEaJ0WVYMQYwtLsoe6pEtFMhHq1CdDoC4Z4FOPpcjzMs84kO6cYOjzaRfMY2yUofkDSFv
	/Nwxu3
X-Google-Smtp-Source: AGHT+IEIAcWoFGwcNgccxAP828+yd7/kMEFFY+sH8+j/iQjjBsmYniUh67wbp4Ar9H6A3QqKNZyn4Q==
X-Received: by 2002:a05:6602:1607:b0:948:e11f:5b4c with SMTP id ca18e2360f4ac-9492b6ed063mr334288439f.19.1763576057415;
        Wed, 19 Nov 2025 10:14:17 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-949385ae254sm4838639f.1.2025.11.19.10.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Nov 2025 10:14:16 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	"Reviewed-by : Nicolas Schier" <nsc@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nicolas Schier <nicolas.schier@linux.dev>,
	Rong Xu <xur@google.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Will Deacon <will@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 6/8] kbuild: Allow adding modules into the FIT ramdisk
Date: Wed, 19 Nov 2025 11:13:27 -0700
Message-ID: <20251119181333.991099-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251119181333.991099-1-sjg@chromium.org>
References: <20251119181333.991099-1-sjg@chromium.org>
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
built automatically when using FIT_MODULES is not empty.

Signed-off-by: Simon Glass <sjg@chromium.org>
Suggested-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Suggested-by: Reviewed-by: Nicolas Schier <nsc@kernel.org>
Acked-by: Nathan Chancellor <nathan@kernel.org>
---

Changes in v6:
- Mention that FIT_MODULES just needs to be non-empty
- Make use of modules.order instead of using 'find'

Changes in v5:
- Build modules automatically if needed (fix from Nicolas Schier)

Changes in v4:
- Rename the Makefile variable from 'EXTRA' to 'MAKE_FIT_FLAGS'
- Use an empty FIT_MODULES to disable the feature, instead of '0'
- Make use of the 'modules' dependency to ensure modules are built
- Pass the list of modules to the script

 Makefile             | 1 +
 arch/arm64/Makefile  | 1 +
 scripts/Makefile.lib | 6 +++++-
 3 files changed, 7 insertions(+), 1 deletion(-)

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
index 1d581ba5df66..28e0cc0865b1 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -398,11 +398,15 @@ MAKE_FIT := $(srctree)/scripts/make_fit.py
 # Use this to override the compression algorithm
 FIT_COMPRESSION ?= gzip
 
+# Set this to non-empty to include an initrd with all the kernel modules
+FIT_MODULES ?=
+
 quiet_cmd_fit = FIT     $@
       cmd_fit = $(MAKE_FIT) -o $@ --arch $(UIMAGE_ARCH) --os linux \
-		--name '$(UIMAGE_NAME)' \
+		--name '$(UIMAGE_NAME)' $(MAKE_FIT_FLAGS) \
 		$(if $(findstring 1,$(KBUILD_VERBOSE)),-v) \
 		$(if $(FIT_DECOMPOSE_DTBS),--decompose-dtbs) \
+		$(if $(FIT_MODULES),--modules @$(objtree)/modules.order) \
 		--compress $(FIT_COMPRESSION) -k $< @$(word 2,$^)
 
 # XZ
-- 
2.43.0


