Return-Path: <linux-kbuild+bounces-8663-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 044EDB3B972
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 12:55:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EE493683528
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Aug 2025 10:55:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 444DA311C24;
	Fri, 29 Aug 2025 10:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h94eX1K5"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8FC53148C9
	for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 10:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756464881; cv=none; b=XA/+g1nLWfDgNVHvB4KnhhYRPKQh4/Mve/kuD6vSgnHAi/uIbUrOmC0xVbuSvAAPVsPomC9NPxUn1BjfPRzOM7XW332vqtqwks3shs3dsBMc2B5L/3PjJuoSk3GNmpIjCGJd56virjK19B4kGV4JjWtUVuo0wa6g9Vwunmmg7ZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756464881; c=relaxed/simple;
	bh=so0KS5+HKtS7bLgo8wlIBPBrMrd/uZF6z+PZRF+H0bI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FrjfBbelFg7ptoI5O4TL5JaCxA2I4RgeLhycDas/Cr2CWeeklmlc8vbfIdmwM2rQvYL1Xi8LrFk4F8ejWT4ODn5nK/YoGcDHrfpaxGtFHuKhs0pI3oqm8F34nyztFKW1geePDLmnYAUJ/2+IpTu4hutc2iOVSgevYB+Uag3oyfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h94eX1K5; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sidnayyar.bounces.google.com
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-45a1b0cb0aaso13879735e9.3
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Aug 2025 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756464877; x=1757069677; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2RLysX4FvFaZxrrpQCtMS5piDnkGHi5CdyrEUjW23Q=;
        b=h94eX1K5Wxx/ICOyOMU2fJj16skwRe0a9i0pccb0ZMRC/3GLURFA0Aal8HOHLNX2k7
         H6YJ478Y3YEpC86P9BvjP4C6l+EPWlc5q6gPOVKdGeB8SNZ9MQUVkuMCTwOjEX0RLPop
         3ilypXLnkPuLWkvGkTnssu99nIiFCY1db86yiqoDE3YdcZGdHV4QzBgbsGU/itBis6sg
         I4+JwUwXjCS7dOhQRpZOAxwX1u1HSLWCi7QI7msNV6oIckQlVZGjToKUCAOIVNMQkXGf
         mKNje/UtkF5PvsO3sn2a6PF66VjnLsC9nF8mrlXeC3BzG028wQ03HtSjlwHJaDYWruKP
         TxHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756464877; x=1757069677;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2RLysX4FvFaZxrrpQCtMS5piDnkGHi5CdyrEUjW23Q=;
        b=DVcmpvKpqfuy1MGGnUJztYt/2O6vTAoqdW3WQg5urz6MN+ugOLk+20hQeQpM0RGanF
         m11hVP3bpZ0sx0naWaPe2xbp5ny0mPUG2ORKOmen9w/7glvBb1KrYToa30npBfOr94Wj
         tBhORNfkJlLdBNTfg4FMwIm83/b6cZXWrfMd5KDGgs7Sy/xttQRa5Tk7KB85hJzkAnpR
         i2MXOkjmaiNt0Eatul8gYQyFa2x4KFAK8NhsZe6emddcoP4l7dSUhZJwaEUuoHWbRlN3
         FeKZZgyctgYk0nLyvO4O+9Qyr/bqPs2iVpHn9xskso+fpjVEC1j9jectPhetrbfdN09J
         4mrA==
X-Forwarded-Encrypted: i=1; AJvYcCW3rP/vuFnlmGUkfYj5pLS2L2jZgE9sQzkTtOlzNqJMheIW+P4t0K3yJRNu8sZkr7Vcyohy78hj6n20NZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxsz39/oi7KoFFAsm/r3/r+i4bNh4hl1xJ7HbJtB4N01aWgDPUb
	/J6Cob8JhURg9BT7tRsLSZf7UgpMlxVBBODI3WTpxrCck8svCnkDpO+aBJ7PhEhgLOCGiRtlyIo
	E5gK5U80G6v5GZvsOaQ==
X-Google-Smtp-Source: AGHT+IGn0Rpy1dY1XrZvELEcqgT8iGR3jz5ujSyOBLj7FBCWbv3AUGiqUNArS0IwRoFyThmIfPNLn57QEPEFlW0=
X-Received: from wrbm25.prod.google.com ([2002:adf:a3d9:0:b0:3b7:76ea:26cd])
 (user=sidnayyar job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5887:0:b0:3b7:88f5:eaae with SMTP id ffacd0b85a97d-3c5dc542ac7mr20449959f8f.39.1756464877398;
 Fri, 29 Aug 2025 03:54:37 -0700 (PDT)
Date: Fri, 29 Aug 2025 10:54:16 +0000
In-Reply-To: <20250829105418.3053274-1-sidnayyar@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250829105418.3053274-1-sidnayyar@google.com>
X-Mailer: git-send-email 2.51.0.338.gd7d06c2dae-goog
Message-ID: <20250829105418.3053274-9-sidnayyar@google.com>
Subject: [PATCH 08/10] remove references to *_gpl sections in documentation
From: Siddharth Nayyar <sidnayyar@google.com>
To: Nathan Chancellor <nathan@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>
Cc: Nicolas Schier <nicolas.schier@linux.dev>, Petr Pavlu <petr.pavlu@suse.com>, 
	Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Siddharth Nayyar <sidnayyar@google.com>
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Siddharth Nayyar <sidnayyar@google.com>
---
 Documentation/kbuild/modules.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
index d0703605bfa4..f2022fa2342f 100644
--- a/Documentation/kbuild/modules.rst
+++ b/Documentation/kbuild/modules.rst
@@ -426,11 +426,11 @@ Symbols From the Kernel (vmlinux + modules)
 Version Information Formats
 ---------------------------
 
-	Exported symbols have information stored in __ksymtab or __ksymtab_gpl
-	sections. Symbol names and namespaces are stored in __ksymtab_strings,
+	Exported symbols have information stored in the __ksymtab section.
+	Symbol names and namespaces are stored in __ksymtab_strings section,
 	using a format similar to the string table used for ELF. If
 	CONFIG_MODVERSIONS is enabled, the CRCs corresponding to exported
-	symbols will be added to the __kcrctab or __kcrctab_gpl.
+	symbols will be added to the __kcrctab section.
 
 	If CONFIG_BASIC_MODVERSIONS is enabled (default with
 	CONFIG_MODVERSIONS), imported symbols will have their symbol name and
-- 
2.51.0.338.gd7d06c2dae-goog


