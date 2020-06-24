Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6CA3207D4C
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 22:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406554AbgFXUd1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 16:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406539AbgFXUdY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 16:33:24 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14BFCC0613ED
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:24 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id f130so3481945yba.9
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 13:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=063/REsTpnFRr+cDI+sseVhgFckW5SG29uiho3UNZTY=;
        b=QHLFKZjziQv1B4lTQJOFrFkeBBeD3vqMRAW+KU8uSJ0z8P5diTku752ppGYK+p1sHj
         Tuqj5FmieFc5zewP3DRNS5iM40Pga5Yd012RZ1UJSub9OeGcQ/BjM9Xhswo2S+wawZKA
         RoZrP4AKzJhPxHnp2kwUEq2iAcWJC9Jvd0o41DT/D0J5C0PT78vt0tH2KpFNFHvjKqOE
         izzBiEOpzdtuThxfwOEyO+K5m3BsSaqVWi7OpscZsOWnWe/8qa7rh4O22Mfte1SMk6Qe
         rW+Cnirb92ArG8+1lDPtjHVyv4CvsFhD6/kzdDW605IdVtQymCiQD3WRRYOvRlD/Mv+p
         36IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=063/REsTpnFRr+cDI+sseVhgFckW5SG29uiho3UNZTY=;
        b=XshDs7sW50Ovq9axh5u1IraZLndrFVhSSBwACZNumzswpkuJ2P+0WZOVcj1BRCtj1S
         WHhcB+Ra0tUwCD7SlgsMvxzdwzGie8RtUg07mMUpki++Mup60UPZTKzWFhdjUxIzD260
         hT02r0cpWvpJ9DGipW4pgG3FtuZvcy4fTSo22t3YlcYfY5Gvh9IgdEhlWtEkty7AX9Qr
         8VuYVMXojeJUiQU3YBS1rrh8CFn2i8T6INYjhAmBhzZ0tVaSpMzJp69vQZoIsWbgZHxS
         W7mAWz2Ui9KRef9PSfkjxLqtYUrR/oILqJY39SdB+uot+4I6+siYf2opu0E7Dls+D4yL
         HbFQ==
X-Gm-Message-State: AOAM532yZl+EXOz3jVMBqY9RKVFLjoXxoSpwP8I0qF+t1qx6fOmYQLPh
        +ebV8ie1DiUrTkQfYmowKHhiFnf8QIPEgMbhC98=
X-Google-Smtp-Source: ABdhPJxSD93X1bZbMxIVxbatDlNzo+plulwlXrP7mUhDGUyc2zpYsUnUjocqKRL/aFZ9kJnCfhHJEfDbrbY1YJULi70=
X-Received: by 2002:a25:e8b:: with SMTP id 133mr46457083ybo.13.1593030803250;
 Wed, 24 Jun 2020 13:33:23 -0700 (PDT)
Date:   Wed, 24 Jun 2020 13:31:52 -0700
In-Reply-To: <20200624203200.78870-1-samitolvanen@google.com>
Message-Id: <20200624203200.78870-15-samitolvanen@google.com>
Mime-Version: 1.0
References: <20200624203200.78870-1-samitolvanen@google.com>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH 14/22] efi/libstub: disable LTO
From:   Sami Tolvanen <samitolvanen@google.com>
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux@googlegroups.com,
        kernel-hardening@lists.openwall.com, linux-arch@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
        x86@kernel.org, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

With CONFIG_LTO_CLANG, we produce LLVM bitcode instead of ELF object
files. Since LTO is not really needed here and the Makefile assumes we
produce an object file, disable LTO for libstub.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 drivers/firmware/efi/libstub/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/firmware/efi/libstub/Makefile b/drivers/firmware/efi/libstub/Makefile
index 75daaf20374e..95e12002cc7c 100644
--- a/drivers/firmware/efi/libstub/Makefile
+++ b/drivers/firmware/efi/libstub/Makefile
@@ -35,6 +35,8 @@ KBUILD_CFLAGS			:= $(cflags-y) -Os -DDISABLE_BRANCH_PROFILING \
 
 # remove SCS flags from all objects in this directory
 KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_SCS), $(KBUILD_CFLAGS))
+# disable LTO
+KBUILD_CFLAGS := $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 
 GCOV_PROFILE			:= n
 # Sanitizer runtimes are unavailable and cannot be linked here.
-- 
2.27.0.212.ge8ba1cc988-goog

