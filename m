Return-Path: <linux-kbuild+bounces-42-lists+linux-kbuild=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8E37EF7CE
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Nov 2023 20:24:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 113EEB209BF
	for <lists+linux-kbuild@lfdr.de>; Fri, 17 Nov 2023 19:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53B3243AA7;
	Fri, 17 Nov 2023 19:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0tJvmUS6"
X-Original-To: linux-kbuild@vger.kernel.org
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB37D68
	for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2023 11:24:05 -0800 (PST)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-da39d244087so3106819276.3
        for <linux-kbuild@vger.kernel.org>; Fri, 17 Nov 2023 11:24:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1700249045; x=1700853845; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HSTC7ZIhM+0E3YkZ4H2RZYaJJgTVqQ3IlDSCu47AzCU=;
        b=0tJvmUS6KoveufwYLvQAS+iA4ISlcTr1YrncPyQ/xzzxv8jWhbJVDld8gVUb1qLldT
         /AlLY92d9oHRg9Lbf0LiF/VBVqSOrX2Qjgk4ggqLn49lEaS+pJgUD/HpI2Om1+IJxIv5
         rl/DQxVyM/bbcgOmfpT169VlTMBG9HfU2bZ29wzk1KC7b8Tuil02N5oGfBe+f7F9lUTI
         F70Gl7dyftvJtYbbL+IjlAXWHc6/y0UoNERrs5cglYNN8E8RIUD6smGryyNUYOj/p4kW
         IKZfOlq3zTpkFNLp17fg3pLEilP9on0Iy5qN4LCPm156Olj5xesp8e7x5VoaFrw/doPU
         Q7/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700249045; x=1700853845;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HSTC7ZIhM+0E3YkZ4H2RZYaJJgTVqQ3IlDSCu47AzCU=;
        b=t9Gm8Bq6QnaxPHekpDiTglRPBrAhXBoKWmqbZ8AsDrp2d6YL1yffc7S37/WyZ8zUwH
         WCStfhxlFamNdoVtv/bxPHY8NBNbzcgotv4wKSzMy8UwshUJ4zoicpR1AnON+PyAFjDc
         4zwYoLRlH2hzPjMpdu4zYazMfiB7R8+jPX1ujOqrubvzYUVo7I+/01DkAn3+ZsQxnJNY
         TSU73d/TXCrw3iVfYcPJlcNmjXQxGg/mFzKTcAmPujjQJ4L1vml/nsJOkr5YhMhK6qwJ
         Q6CW7XEFeTuBGFcTD6/iqogQ6qiRwuU46p5IgsxzQLVCpTJ3OCyMw6xyqGR6AtTH71jM
         kGUQ==
X-Gm-Message-State: AOJu0YwvfOIGbjTmThlopG5lAvdJGP/hzGPGdjooAdkyvFD+pdxvuq7b
	nuRi5k+86wKWX1HfeOywO+ocy3//M8G32CY61k0=
X-Google-Smtp-Source: AGHT+IF5ejdZ1RJrFSKBwDFrAUrVQQyZZ2P+eh4NOyuZHdmvdsPLA+z6m9r5fxOFPVoeQ9q7OoWN5o2siXIJJlF6AfQ=
X-Received: from ndesaulniers2.svl.corp.google.com ([2620:15c:2d3:205:a112:7ca7:75f7:b362])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6902:104:b0:daf:bf50:ff66 with
 SMTP id o4-20020a056902010400b00dafbf50ff66mr8516ybh.13.1700249045028; Fri,
 17 Nov 2023 11:24:05 -0800 (PST)
Date: Fri, 17 Nov 2023 11:24:02 -0800
Precedence: bulk
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIANK9V2UC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQ0Nz3dzEzLwSIE4tKta1sEhNTDZJNjAySTRUAuooKEpNy6wAmxYdW1s LAKDfkHFdAAAA
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=eMOZeIQ4DYNKvsNmDNzVbQZqpdex34Aww3b8Ah957X4=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700249043; l=3212;
 i=ndesaulniers@google.com; s=20230823; h=from:subject:message-id;
 bh=TJDc5k+AKhiQs6dI7oAGZ36HBYs5k33/muh2oeVUkG8=; b=KiNZlZN38egnPaIXbHlMC4o7eK/WY9b8im52Pymwi+jqpS1ynwZWkTtOOEDrikp8NnAv46gXk
 LkeOJFFtiA2DSuiqyRPsNZRUYnPZu6e9QRpncsHp1BnIx/pd3mC7cVH
X-Mailer: b4 0.12.3
Message-ID: <20231117-maintainers-v1-1-85f2a7422ed9@google.com>
Subject: [PATCH] MAINTAINERS: refresh LLVM support
From: ndesaulniers@google.com
To: Kees Cook <keescook@chromium.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Tom Rix <trix@redhat.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Nicolas Schier <nicolas@fjasle.eu>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="utf-8"

As discussed at the ClangBuiltLinux '23 meetup (co-located with Linux Plumbers
Conf '23), I'll be taking a step back from kernel work to focus on my growing
family and helping Google figure out its libc story. So I think it's time to
formally hand over the reigns to my co-maintainer Nathan.

As such, remove myself from reviewer for:
- CLANG CONTROL FLOW INTEGRITY SUPPORT
- COMPILER ATTRIBUTES
- KERNEL BUILD

For CLANG/LLVM BUILD SUPPORT I'm bumping myself down from maintainer to
reviewer, adding Bill and Justin, and removing Tom (Tom and I confirmed this
via private email; thanks for the work done Tom, ++beers_owed).

It has been my pleasure to work with everyone to improve the toolchain
portability of the Linux kernel, and to help bring LLVM to the table as a
competitor. The work here is not done.  I have a few last LLVM patches in the
works to improve stack usage of clang which has been our longest standing open
issue (getting "rm" inline asm constraints to DTRT is part of that). But
looking back I'm incredibly proud of where we are to today relative to where we
were when we started the ClangBuiltLinux journey, and am confident that the
team and processes we have put in place will continue to be successful. I
continue to believe that a rising tide will lift all boats.

I identify first and foremost as a Linux kernel developer, and an LLVM dev
second. May it be a cold day in hell when that changes.

Wake me when you need me.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 MAINTAINERS | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 482d428472e7..1e6692697167 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -5076,7 +5076,6 @@ CLANG CONTROL FLOW INTEGRITY SUPPORT
 M:	Sami Tolvanen <samitolvanen@google.com>
 M:	Kees Cook <keescook@chromium.org>
 R:	Nathan Chancellor <nathan@kernel.org>
-R:	Nick Desaulniers <ndesaulniers@google.com>
 L:	llvm@lists.linux.dev
 S:	Supported
 B:	https://github.com/ClangBuiltLinux/linux/issues
@@ -5091,8 +5090,9 @@ F:	.clang-format
 
 CLANG/LLVM BUILD SUPPORT
 M:	Nathan Chancellor <nathan@kernel.org>
-M:	Nick Desaulniers <ndesaulniers@google.com>
-R:	Tom Rix <trix@redhat.com>
+R:	Nick Desaulniers <ndesaulniers@google.com>
+R:	Bill Wendling <morbo@google.com>
+R:	Justin Stitt <justinstitt@google.com>
 L:	llvm@lists.linux.dev
 S:	Supported
 W:	https://clangbuiltlinux.github.io/
@@ -5242,7 +5242,6 @@ F:	drivers/platform/x86/compal-laptop.c
 
 COMPILER ATTRIBUTES
 M:	Miguel Ojeda <ojeda@kernel.org>
-R:	Nick Desaulniers <ndesaulniers@google.com>
 S:	Maintained
 F:	include/linux/compiler_attributes.h
 
@@ -11516,7 +11515,6 @@ F:	fs/autofs/
 KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
 M:	Masahiro Yamada <masahiroy@kernel.org>
 R:	Nathan Chancellor <nathan@kernel.org>
-R:	Nick Desaulniers <ndesaulniers@google.com>
 R:	Nicolas Schier <nicolas@fjasle.eu>
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained

---
base-commit: 6bc40e44f1ddef16a787f3501b97f1fff909177c
change-id: 20231117-maintainers-88eac4c024a1

Best regards,
-- 
Nick Desaulniers <ndesaulniers@google.com>


