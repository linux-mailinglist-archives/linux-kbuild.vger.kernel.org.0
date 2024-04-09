Return-Path: <linux-kbuild+bounces-1495-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DA58989DD9B
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 17:03:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 955B228DC63
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Apr 2024 15:03:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B1C134415;
	Tue,  9 Apr 2024 15:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Nmjz20d3"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56697132805
	for <linux-kbuild@vger.kernel.org>; Tue,  9 Apr 2024 15:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712674908; cv=none; b=k7wClJFC6n4rZpQeebN4m1dPU515v/VKLAruEWzVX5resDm8roMTIAr2QXq4Zhj3FCvRqZQbBUff/5RCXTK/ADuRqeUtEKgGuj7FxSB3oOA3a4eKV7k5U2zf4/a8Qdi9o56vt2zDG7j41wdcfoqV1mYQ5vcI0R4XBSHb4B7BFWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712674908; c=relaxed/simple;
	bh=ne1nIh0Qwrvg61AZAr4OTz8Z0LGxASlvMGm2cM6SR1I=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gxBRr9S5T7JebQJRlUM4RKeDCwGa78WHQfVgoQ3E/0qV4ygicgHOXOFD41xNr0+Q30X5PNYMjg06ucVP/oftvRlRKiO/7Po9vxzyukfYNpmtdbn4BBSc3RqvFKN6c+gGvn20G/inaW/5U6CFp1r1FGkeMCxNqk9gTOveAhZefYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Nmjz20d3; arc=none smtp.client-ip=209.85.219.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ardb.bounces.google.com
Received: by mail-yb1-f201.google.com with SMTP id 3f1490d57ef6-ddaf2f115f2so7548389276.3
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Apr 2024 08:01:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1712674905; x=1713279705; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=24D5emD5FgWK1X1kR0N5gec4wW0lY0v4XxqAgq53xkE=;
        b=Nmjz20d33u9rLdxGdphKCSSWa8Z2ty3V/+CLOg5WSz0CFekw0qSm5qfxo81mFO1Pli
         0FkXH2yjBZDcKnoydobfGzHkbR/F32YcPRHkphoe8fud7kYjjlMzxB6O8+HZK3d3WuHO
         RJR7P9T3Y0Db1GzXMWt+LSStmKLkVNcIwWXklaIn2plbesmwY31tXGm/Av+Tb/ZOHvGe
         88X7fDsP35AroaSA4Lf5pX9xYwetQn2dFGmqtWRqF65pxpHR039dzHpWciflpnw3Za0Y
         BoLXMhPq0/c1VjtRnnMf9EjQkGC6Ss2/kZQf/66xLH00zAW1mAIZlVX+csPI6sOXvJcM
         xKrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712674905; x=1713279705;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=24D5emD5FgWK1X1kR0N5gec4wW0lY0v4XxqAgq53xkE=;
        b=eANgx0+0JGzxnuKQ3Q0CUgbnS4MY9AjhHpjeJXhby+tUDplswlkFHLn6t/eZGUnVUF
         YAEW7WabyrmBCT1t6L/kEHqoeY9GOqwwX2RpyT4J1IKJmn51Gx/ZNnlzOYWak/Arwx66
         XY1FG5aPGFWjiMU3Zid6OMhESrNFz3KNY0bZh989HMYDgh0TXY7LDisYUzCBd9AzyK23
         AVeiSl0ua7ylBBgHVLdhfm2PSHrIyNq1JdaWZRDqHIvH5xNZ7HdERwJIyhbmRAOSg8zY
         Ni+0wbUyMGV16ahkLIU+SfkJ4JGZyE5McpXLdrpr+o9wLYlR3QgxstONUS8R3lbr060X
         hjdg==
X-Forwarded-Encrypted: i=1; AJvYcCVQPhxve4TF13ciAsDADiwJsxPaHIqBlN7C9tYpZtXYrzBLdZG24HGKNx52qQm4/Etcig5ShStqoHeU6wfOZPAsp5iZGZBGvpxRe4jC
X-Gm-Message-State: AOJu0Yzz5Ew7/GHjEDpJnPRrNQilMjxXLE+ZmGKNPOCROUOQzMjxcMJI
	Egqv0kFFZZCA6CGy/oRCOBMXkvnAMnKRyjINcTTwiMsXjGvEYyiqIwz/gbRK9Q/9E9teyQ==
X-Google-Smtp-Source: AGHT+IFApcvERFVIpHAfgZJhNNMync2IwT47zPV5gAUWhJSxWCho+x3ksshS2TS7lQty3tR6R2B5I8hv
X-Received: from palermo.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:118a])
 (user=ardb job=sendgmr) by 2002:a05:6902:1082:b0:dd9:2d94:cd8a with SMTP id
 v2-20020a056902108200b00dd92d94cd8amr926332ybu.9.1712674905221; Tue, 09 Apr
 2024 08:01:45 -0700 (PDT)
Date: Tue,  9 Apr 2024 17:01:35 +0200
In-Reply-To: <20240409150132.4097042-5-ardb+git@google.com>
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240409150132.4097042-5-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=1618; i=ardb@kernel.org;
 h=from:subject; bh=ORZChgCpQukYWaId1hq+FAluQSgY7FsL4Hz5iVd1jE8=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIU00wp9pL9M1t7Sty6RbsvftP5R05JPTl/bSvhflPYdjj
 uy5XCjfUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZic56R4eKb17tar+vu7Z2R
 ts6cJfreoohXvLd4uqbeXs1usvGY6R+G/+nnFziwnjNYNonhd07J3e9rEjaJan0+WCn35czN9MM cYhwA
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
Message-ID: <20240409150132.4097042-7-ardb+git@google.com>
Subject: [PATCH v2 2/3] vmlinux: Avoid weak reference to notes section
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Martin KaFai Lau <martin.lau@linux.dev>, linux-arch@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, bpf@vger.kernel.org, 
	Andrii Nakryiko <andrii@kernel.org>
Content-Type: text/plain; charset="UTF-8"

From: Ard Biesheuvel <ardb@kernel.org>

Weak references are references that are permitted to remain unsatisfied
in the final link. This means they cannot be implemented using place
relative relocations, resulting in GOT entries when using position
independent code generation.

The notes section should always exist, so the weak annotations can be
omitted.

Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 kernel/ksysfs.c | 4 ++--
 lib/buildid.c   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index 495b69a71a5d..07fb5987b42b 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -228,8 +228,8 @@ KERNEL_ATTR_RW(rcu_normal);
 /*
  * Make /sys/kernel/notes give the raw contents of our kernel .notes section.
  */
-extern const void __start_notes __weak;
-extern const void __stop_notes __weak;
+extern const void __start_notes;
+extern const void __stop_notes;
 #define	notes_size (&__stop_notes - &__start_notes)
 
 static ssize_t notes_read(struct file *filp, struct kobject *kobj,
diff --git a/lib/buildid.c b/lib/buildid.c
index 898301b49eb6..7954dd92e36c 100644
--- a/lib/buildid.c
+++ b/lib/buildid.c
@@ -182,8 +182,8 @@ unsigned char vmlinux_build_id[BUILD_ID_SIZE_MAX] __ro_after_init;
  */
 void __init init_vmlinux_build_id(void)
 {
-	extern const void __start_notes __weak;
-	extern const void __stop_notes __weak;
+	extern const void __start_notes;
+	extern const void __stop_notes;
 	unsigned int size = &__stop_notes - &__start_notes;
 
 	build_id_parse_buf(&__start_notes, vmlinux_build_id, size);
-- 
2.44.0.478.gd926399ef9-goog


