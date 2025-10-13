Return-Path: <linux-kbuild+bounces-9110-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 258CCBD504A
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 18:27:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0F52E548D77
	for <lists+linux-kbuild@lfdr.de>; Mon, 13 Oct 2025 16:01:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 160FE31D371;
	Mon, 13 Oct 2025 15:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="g/vvyxhD"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C1AC31C56D
	for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 15:39:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760369997; cv=none; b=a5THWD2gRfiYQqejZsikVrKcLf+Ax23Xq0uRTVZjAB3kfMKc/km4sFe1muaGMnXETfeU9n9hdsoN5Oe1Xd5AxDyLae3q5zvN6tQl6aGjMTZdN9gzA8lnylcXJsp/GCrP/TTJcuIsdngRKHLeJr1Ak8nZMmMkSy43DQ3IzPMra0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760369997; c=relaxed/simple;
	bh=lFWAd47m9WYWwYOwfmcdqTMftDRqoXt8LOsJmWA7WTg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=q8jkMXdBPdivaAN3YqBwdwOtO5vzwf/BSuo3SCIUpTzsEBZ/rvek3yZkOqwPokwcNfXbQW9TVc+s+ghF7JHDlN2LHyrXzrVO2AUMDsqqeq6D5I+tvOxqBeSNHbZ3n/sY4yln4aP5QUMhhc3OXXYQDznwyZrBOa4ptnYKEQ+Rzpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=g/vvyxhD; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b58d1fe8cd7so129341666b.2
        for <linux-kbuild@vger.kernel.org>; Mon, 13 Oct 2025 08:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760369994; x=1760974794; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eG/97FcPJjq5NmEgRW4PArfa7yqTL2l/aJZCar+bosQ=;
        b=g/vvyxhDWnZku3wjYliqv0l8G9npqfzcF2S6oS2yQXUlDgFHAm+aQIhFRdE81DobVe
         82bridSCQqMFxhTArZ7ov59YaC6gs7uaBF7ZpbaHY92fGzYK+6ErQD2/MCO3/KLyxEcw
         tI9OAIjFSBtiRIDaKfCsHj41lE3N9ZMUJimdl/RSH+pfoP2WYZMFw41AuXhMQwF4jLyU
         NV+78TGIv7ZtlLhksz+nHFdnPuhVYy3BOcFLRqXBFxRGJoGV8NCGVbEwR6qK2+SUn2rn
         8/XVBVSXR9wDdcKu7MDHseR6at+mn9UtJOeoCts29dXPTtcJM/9WHuOZFIUPMcKLKqHD
         oaVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369994; x=1760974794;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eG/97FcPJjq5NmEgRW4PArfa7yqTL2l/aJZCar+bosQ=;
        b=mlI8uQDy2MzApLpNbo97lcSt9upd2cbQoLwLvZTR5x8RCIauIT74xy7/ImTbzp2kP5
         wD0BtpSwYO/quE6uapHfZT4OroeKq8OHUkGFJnKPDBnmL1C3XYVMjMvzfqPR6RwY3WZO
         Lem/zXkHOJGkGutEZp5vX0ut2aodeOIn056+73POdKuUF5mHZxnRx7ShVuOnx2Z3/fzw
         DV0pbNqiFfomcbUS7PfAfvLo8HK+Xycp2jmxQYOkS5Uylh9ydCt7T/DO/k0seFuFSEJL
         gDiTjQ3f5MIXz6ZI6+lawNMNE1wPd4eLSNXOaGUvSfk0XIZSsdzoi5EgygiD2F/Ro+qD
         7Ffg==
X-Forwarded-Encrypted: i=1; AJvYcCV+uN35/XdtCfIdOaNXQNjgpHNYugSWVQbMPIITi8VULUVpsGOYWAroWnOkewzA3oWN8kNSmaZXVTObNwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFGPXMeUcXst0Z5+qpe4g6JG2FcVDJNMnycRm+0sCDRCWNrk5K
	TYYXv1VHr89srpH9f1Hyz5ZG1acAgVl0oEGG0Rj7uE3zesO4ST8y++rnQY3dV9u0orMwIfF9mQ+
	UB+EoSkuPXjLIXLOWLA==
X-Google-Smtp-Source: AGHT+IHM78g7/9ceK5BgemHYhfAGssyyk28SSEXehcoYdtwkhhg6hYVEul09QjzOoJajkOTlNWCkbmyfjJw/coM=
X-Received: from edbm27.prod.google.com ([2002:a50:999b:0:b0:634:9afe:3dc1])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:aa7:cd43:0:b0:636:7b44:f793 with SMTP id 4fb4d7f45d1cf-639d5c76f3amr14705335a12.36.1760369993704;
 Mon, 13 Oct 2025 08:39:53 -0700 (PDT)
Date: Mon, 13 Oct 2025 15:39:15 +0000
In-Reply-To: <20251013153918.2206045-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251013153918.2206045-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.740.g6adb054d12-goog
Message-ID: <20251013153918.2206045-8-sidnayyar@google.com>
Subject: [PATCH v2 07/10] linker: remove *_gpl sections from vmlinux and modules
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

These sections are not used anymore and can be removed from vmlinux and
modules.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/asm-generic/vmlinux.lds.h | 18 ++----------------
 scripts/module.lds.S              |  2 --
 2 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 310e2de56211..6490b93d23b1 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -490,34 +490,20 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 									\
 	PRINTK_INDEX							\
 									\
-	/* Kernel symbol table: Normal symbols */			\
+	/* Kernel symbol table */					\
 	__ksymtab         : AT(ADDR(__ksymtab) - LOAD_OFFSET) {		\
 		__start___ksymtab = .;					\
 		KEEP(*(SORT(___ksymtab+*)))				\
 		__stop___ksymtab = .;					\
 	}								\
 									\
-	/* Kernel symbol table: GPL-only symbols */			\
-	__ksymtab_gpl     : AT(ADDR(__ksymtab_gpl) - LOAD_OFFSET) {	\
-		__start___ksymtab_gpl = .;				\
-		KEEP(*(SORT(___ksymtab_gpl+*)))				\
-		__stop___ksymtab_gpl = .;				\
-	}								\
-									\
-	/* Kernel symbol table: Normal symbols */			\
+	/* Kernel symbol CRC table */					\
 	__kcrctab         : AT(ADDR(__kcrctab) - LOAD_OFFSET) {		\
 		__start___kcrctab = .;					\
 		KEEP(*(SORT(___kcrctab+*)))				\
 		__stop___kcrctab = .;					\
 	}								\
 									\
-	/* Kernel symbol table: GPL-only symbols */			\
-	__kcrctab_gpl     : AT(ADDR(__kcrctab_gpl) - LOAD_OFFSET) {	\
-		__start___kcrctab_gpl = .;				\
-		KEEP(*(SORT(___kcrctab_gpl+*)))				\
-		__stop___kcrctab_gpl = .;				\
-	}								\
-									\
 	/* Kernel symbol flags table */					\
 	__kflagstab       : AT(ADDR(__kflagstab) - LOAD_OFFSET) {	\
 		__start___kflagstab = .;				\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index 9a8a3b6d1569..1841a43d8771 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -20,9 +20,7 @@ SECTIONS {
 	}
 
 	__ksymtab		0 : ALIGN(8) { *(SORT(___ksymtab+*)) }
-	__ksymtab_gpl		0 : ALIGN(8) { *(SORT(___ksymtab_gpl+*)) }
 	__kcrctab		0 : ALIGN(4) { *(SORT(___kcrctab+*)) }
-	__kcrctab_gpl		0 : ALIGN(4) { *(SORT(___kcrctab_gpl+*)) }
 	__kflagstab		0 : ALIGN(1) { *(SORT(___kflagstab+*)) }
 
 	.ctors			0 : ALIGN(8) { *(SORT(.ctors.*)) *(.ctors) }
-- 
2.51.0.740.g6adb054d12-goog


