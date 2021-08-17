Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E3A93EE0D5
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 02:21:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232929AbhHQAV7 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 20:21:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234864AbhHQAV7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 20:21:59 -0400
Received: from mail-qk1-x74a.google.com (mail-qk1-x74a.google.com [IPv6:2607:f8b0:4864:20::74a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0826EC061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:27 -0700 (PDT)
Received: by mail-qk1-x74a.google.com with SMTP id y185-20020a3764c20000b02903d2c78226ceso8424218qkb.6
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 17:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=GoHRqY6WMaY6q/Xzrr4/n035GxGMZNNS93sY1WbcrOg=;
        b=TRXaJLDpWOVuB4lUnlR+yoS05hBwCJTWDCzu/pBp8cTnnT6F7Cj+KPqeJzpyjiuk9r
         D0TRbzxeB9Zm7bNFH9MsLf12RvSLW+1UOYiut9GL2AKqK2fXU7eS/y/1UG1PQ5o6FsBq
         nnDHDHobEWdCpHsYkT8jH8fhkzfbLxq3aL44Xvr9jF2ld0ZNagA7V0vv+QZ3qIfPjwrT
         qt7rhl74MpeqnLmGLafLTXAix2cNJWfEkg0DYO40xeQsuYCvcoj+Bk7IgkVdocaIUUej
         mMAI+Lt6hiJoGKph+Upxe2H1liP+TIPFQO6VnTiVprHWHg0ozuE/6Ztn3NQ5P6hvgtYS
         US2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=GoHRqY6WMaY6q/Xzrr4/n035GxGMZNNS93sY1WbcrOg=;
        b=pNCD6g5Od2U14ztTRQ/o/K8AJh/cNez59iFWTBrYhbqbs8bO/djnRC7JDwDBnNHujX
         uDVSTcPjW5R2XwqLhpORxHdDHt6J+4lWqtvBbH6Z7uO6SwEb+5yZAoRi9QU4EkyND5LC
         mHlFbgrNmI/l6g5jjrgmJM3lWAvmOvJdVEdkVRmwHHgESJybEnp+uclCEt8vSkugk5JE
         ZvuzRz0c77taTF8rznACXgpaxtXhJu48Y//I61CYYqA7NQLqlqImi8CGyJSjE3eCDwyF
         yCNG9ACMHCAYQilzDQlUriLOu+j0w0Hf/lsQPnW/usgXxM8HgWOOCR2Eg/Wnvsk15MVv
         JGJQ==
X-Gm-Message-State: AOAM530U8rCHiRWVSvOMQk+gqOD7xR7+v24FXLTTJ+rLkGXhPHhxEooP
        5L765++BIv5frAxT2D1kpAGzyHQ0r0BIyM6sm+4=
X-Google-Smtp-Source: ABdhPJzQ7I5BJ/a8ZE26weFpk5AiUI/hLKNy4VKXu2vcVT32Uc9/c1Tf1DTt8IkYNyTPOt5ZrpKMfHQkkk9cIfkMEUQ=
X-Received: from ndesaulniers1.mtv.corp.google.com ([2620:15c:211:202:478:6e44:5cf7:fcde])
 (user=ndesaulniers job=sendgmr) by 2002:a05:6214:410e:: with SMTP id
 kc14mr705288qvb.33.1629159686159; Mon, 16 Aug 2021 17:21:26 -0700 (PDT)
Date:   Mon, 16 Aug 2021 17:21:06 -0700
In-Reply-To: <20210817002109.2736222-1-ndesaulniers@google.com>
Message-Id: <20210817002109.2736222-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20210817002109.2736222-1-ndesaulniers@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH 4/7] arc: replace cc-option-yn uses with cc-option
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com,
        Nick Desaulniers <ndesaulniers@google.com>,
        Vineet Gupta <vgupta@kernel.org>,
        linux-snps-arc@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

cc-option-yn can be replaced with cc-option. ie.
Checking for support:
ifeq ($(call cc-option-yn,$(FLAG)),y)
becomes:
ifneq ($(call cc-option,$(FLAG)),)

Checking for lack of support:
ifeq ($(call cc-option-yn,$(FLAG)),n)
becomes:
ifeq ($(call cc-option,$(FLAG)),)

This allows us to pursue removing cc-option-yn.

Cc: Vineet Gupta <vgupta@kernel.org>
Cc: linux-snps-arc@lists.infradead.org
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 arch/arc/Makefile | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arc/Makefile b/arch/arc/Makefile
index c0d87ac2e221..8782a03f24a8 100644
--- a/arch/arc/Makefile
+++ b/arch/arc/Makefile
@@ -18,8 +18,7 @@ ifeq ($(CONFIG_ARC_TUNE_MCPU),"")
 cflags-y				+= $(tune-mcpu-def-y)
 else
 tune-mcpu				:= $(shell echo $(CONFIG_ARC_TUNE_MCPU))
-tune-mcpu-ok 				:= $(call cc-option-yn, $(tune-mcpu))
-ifeq ($(tune-mcpu-ok),y)
+ifneq ($(call cc-option,$(tune-mcpu)),)
 cflags-y				+= $(tune-mcpu)
 else
 # The flag provided by 'CONFIG_ARC_TUNE_MCPU' option isn't known by this compiler
-- 
2.33.0.rc1.237.g0d66db33f3-goog

