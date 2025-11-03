Return-Path: <linux-kbuild+bounces-9375-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C5182C2D119
	for <lists+linux-kbuild@lfdr.de>; Mon, 03 Nov 2025 17:20:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 6B2314E4D32
	for <lists+linux-kbuild@lfdr.de>; Mon,  3 Nov 2025 16:20:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9CE7318142;
	Mon,  3 Nov 2025 16:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VgxSYz1+"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E004318130
	for <linux-kbuild@vger.kernel.org>; Mon,  3 Nov 2025 16:20:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762186808; cv=none; b=NZ17d5lvJYkTIr7fPv8LwRLhJIIqJNmLm+a+CKz1EbcUIzssM3M2MuN2/aqn8KHVFZx7eeVrY9mabOg5+rZLPE8w8oiSOxWbvvztDOVBmb1Sm4Fe2wCgGsKSHkXdA/0RMnelSH0aS+GFe9jm4lDmHUlw6do9jnPpMjEidMN/vEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762186808; c=relaxed/simple;
	bh=pkHX++p8KzINn4g+tNG5oYVFuXXq/LyOGK2x2a5Q39w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=dGAbQLQIF64utnS7cOwzhXmngXSRO6SnbbeXoxWrjU/fjT1QoHldYnhxGqSCqBnCQSEmT+ApK3NIytduHDFJZo++T4Cn3FtEVhyBP4ohyogW6z08BNrsSv4sCR9lmllIuDpHXyrzb8zCW0qQN+081sSKRUduttM9LMj2E7kMeXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VgxSYz1+; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-429c95fdba8so1264530f8f.0
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2025 08:20:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1762186804; x=1762791604; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jKpzC7OwKr3KFY5COtWMHui39YTNk2I7jCnxEbVs+Mg=;
        b=VgxSYz1+TQ68Qc9k+4Zdm6LZd3LumOrbJybHGNYBI6SkLuy+sI6c0lh2snSdMN1dgf
         rN1iPIKCkPXrjyHwuBQPnNnYaUg5hsa1wf0Gai+OH4ZxKwXE9LS+TIaFqGmmxIyehvBt
         1o9wA5PPPt2HmH+U82DYmrv4CSOHAZl+ir5JhUZglRmRmWjTDGLWsJmZ2LWlQFxXrxC9
         6pkl5DYQKXwDkgxeB0dI7/RN58lyq1Iy9N8p5Cz+xvnXeJSiDQvfzRleiMosD6bLQOCU
         3jiHOMIiMxKqirQCdnIksZdQFNxD0zpxRk3CGugflFVZYZtZ5bkptE2fIuuByxLlFkNy
         urng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762186804; x=1762791604;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jKpzC7OwKr3KFY5COtWMHui39YTNk2I7jCnxEbVs+Mg=;
        b=EAFaTLpmr/h0os1dHEnDMB+6WTELBAgbKssKtz5sn+uxj90pYVUVAwtW9EiqBR+bfs
         zI6Pr8iELb15XZ/2H4mlHny2ikGwA2VhRAvWXKi/PzUKh84+eOT4MRn6Oh+IKdHF2/ya
         1IkN9BhM/gEkHLUOWkwPC9GQEf5NkS/cbiVnGUM2QQz5Qtrcdg+5A3V2C+KxdgO3Ad8i
         5vDhslkIvfHMr1nnuayfkhnqpGk4YR4PVfSaaWe9G9hQTe9gX+aEyNy/zLSc6zmP9QVv
         /mv1/TL4BuuOqDTMHfu82EvOkh7ZGuUCcmiUY6xWu1bTEPaDB9nQX8EwOC0wy5AWY4dJ
         a19g==
X-Forwarded-Encrypted: i=1; AJvYcCVApzY2+QrvO9iLPEqwGiYhIqtjpYgRHnrQKXaidD94hfv5JS9UEfG22iRCFkosBgKxD+HPe5kfC/odHsI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3jbey5pzeMw1B2qYnVNjUQpMR2LosZAhTMGhQZ0QBiTIwBp+O
	5pP+CZJZvY2mzvmuNPEfeVBpJKVQgoO3/PYuK9Vw0RQKFwpf/eslH8mhTSs1P82zcKpAZToQHHm
	sB45JfNCwCH0TQy7CJw==
X-Google-Smtp-Source: AGHT+IGYgTuLSihsPJ88Spd9dISIsCQuf62e7EG7IJZ70IGjE1Hy68HXjMiE6YNWqCxl9BmEEpOCUF8ubsRZqv0=
X-Received: from wrmr5.prod.google.com ([2002:adf:e685:0:b0:3f9:9fbe:f838])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2281:b0:429:d2d2:5032 with SMTP id ffacd0b85a97d-429d2d2519emr3619316f8f.3.1762186804331;
 Mon, 03 Nov 2025 08:20:04 -0800 (PST)
Date: Mon,  3 Nov 2025 16:19:48 +0000
In-Reply-To: <20251103161954.1351784-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251103161954.1351784-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.1.930.gacf6e81ea2-goog
Message-ID: <20251103161954.1351784-3-sidnayyar@google.com>
Subject: [PATCH v3 2/8] linker: add kflagstab section to vmlinux and modules
From: Siddharth Nayyar <sidnayyar@google.com>
To: petr.pavlu@suse.com, corbet@lwn.net
Cc: arnd@arndb.de, linux-arch@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	mcgrof@kernel.org, nathan@kernel.org, nicolas.schier@linux.dev, 
	samitolvanen@google.com, sidnayyar@google.com, maennich@google.com, 
	gprocida@google.com
Content-Type: text/plain; charset="UTF-8"

This section will contain read-only kernel symbol flag values in the
form of a 8-bit bitset.

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
Reviewed-by: Petr Pavlu <petr.pavlu@suse.com>
---
 include/asm-generic/vmlinux.lds.h | 7 +++++++
 scripts/module.lds.S              | 1 +
 2 files changed, 8 insertions(+)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index ae2d2359b79e..310e2de56211 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -518,6 +518,13 @@ defined(CONFIG_AUTOFDO_CLANG) || defined(CONFIG_PROPELLER_CLANG)
 		__stop___kcrctab_gpl = .;				\
 	}								\
 									\
+	/* Kernel symbol flags table */					\
+	__kflagstab       : AT(ADDR(__kflagstab) - LOAD_OFFSET) {	\
+		__start___kflagstab = .;				\
+		KEEP(*(SORT(___kflagstab+*)))				\
+		__stop___kflagstab = .;					\
+	}								\
+									\
 	/* Kernel symbol table: strings */				\
         __ksymtab_strings : AT(ADDR(__ksymtab_strings) - LOAD_OFFSET) {	\
 		*(__ksymtab_strings)					\
diff --git a/scripts/module.lds.S b/scripts/module.lds.S
index ee79c41059f3..9a8a3b6d1569 100644
--- a/scripts/module.lds.S
+++ b/scripts/module.lds.S
@@ -23,6 +23,7 @@ SECTIONS {
 	__ksymtab_gpl		0 : ALIGN(8) { *(SORT(___ksymtab_gpl+*)) }
 	__kcrctab		0 : ALIGN(4) { *(SORT(___kcrctab+*)) }
 	__kcrctab_gpl		0 : ALIGN(4) { *(SORT(___kcrctab_gpl+*)) }
+	__kflagstab		0 : ALIGN(1) { *(SORT(___kflagstab+*)) }
 
 	.ctors			0 : ALIGN(8) { *(SORT(.ctors.*)) *(.ctors) }
 	.init_array		0 : ALIGN(8) { *(SORT(.init_array.*)) *(.init_array) }
-- 
2.51.1.930.gacf6e81ea2-goog


