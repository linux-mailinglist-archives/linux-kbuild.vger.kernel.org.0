Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C0D2519A4D2
	for <lists+linux-kbuild@lfdr.de>; Wed,  1 Apr 2020 07:39:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731770AbgDAFjM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 1 Apr 2020 01:39:12 -0400
Received: from mail-pf1-f179.google.com ([209.85.210.179]:41810 "EHLO
        mail-pf1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731589AbgDAFjL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Apr 2020 01:39:11 -0400
Received: by mail-pf1-f179.google.com with SMTP id a24so4737928pfc.8;
        Tue, 31 Mar 2020 22:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sN9HZF7Qpw4weMjaH74NeOR3szZ0xXcm+yJQW/lmEvU=;
        b=MbRE0i2RITozewnAr9cGUxlzziJ1ELBQsjlDw0SgYByZz239VsAbdpMQKN60xN2T/W
         D3xQxbRFp+BwLWNdxePiIr9zpZ4iSx8vjEi1kz0Uj71Oy0snabNUJLEQCJuR0hML2+u9
         zu2pWDgulxZByG7LNGutgx5+/Rrtn4laGVK7ZTAn73t9Gb2uzBSSZzIJSs2GcR71FHxF
         pNPQn0zOJnDqKZiWpyNZVQ2KvEmVwP7CkJJNtuqumfzB+8Wnsa/sVu5NafJ2WebJo2WY
         XDBYuUoMFULSo4pIE/wILYbdW+Bis1wn1L4R+WCpF2xA4whKb/deCd7pBiUc4h7XliQ0
         E/Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sN9HZF7Qpw4weMjaH74NeOR3szZ0xXcm+yJQW/lmEvU=;
        b=bGX1pgmgWJqSCbxcOczBMtM3/HWF5fjlRYzUaqCsqI6cC21D8NEZBxQTW6ZvAIwBWD
         vftPicpwPpfzLj48S6nnU1AavCObrQ15Y9L0yhCyGCgKpajY10rHPrjGSTJrMV2fSv7o
         /xstlfhbI78DliG9VUBC/oxq2TaZP6Dp2oYo3vsK4R8XN/Ojz2v7rdT37p6dDWvYDU/9
         6ENZHIljNwLsFbeAxfFckInyd/E/qjqNzSyGfmPzHsvnp9/peIy7ZLqoZMmv2WLG6mBc
         3rS0XZocAM9x8ZM2BRaVWVE8LkGgHN+aDMcBRh95LsqSPQcUkolLkjfZIfbf5Ji9jBmZ
         hW5A==
X-Gm-Message-State: ANhLgQ15k9a5uy4LfF28Lh3ADLau0JaPjVxFQAYaqVlwmwYsFu2dYjkP
        V/WRRBUhs99o1d2muBwNbJ8=
X-Google-Smtp-Source: ADFU+vvmg/+3Vg5xk5u96YgBo6sYoDyPxxmxFEiR31brHnjEQsWETN3wVUyCj9KDyyvYhX5UsF2BaQ==
X-Received: by 2002:aa7:9f94:: with SMTP id z20mr20611571pfr.261.1585719548353;
        Tue, 31 Mar 2020 22:39:08 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id w69sm683077pfc.52.2020.03.31.22.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2020 22:39:07 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Nick Terrell <terrelln@fb.com>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>
Subject: [PATCH v4 8/8] .gitignore: add ZSTD-compressed files
Date:   Tue, 31 Mar 2020 22:39:13 -0700
Message-Id: <20200401053913.216783-9-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401053913.216783-1-nickrterrell@gmail.com>
References: <20200401053913.216783-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Adam Borowski <kilobyte@angband.pl>

For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
will come, thus let's be consistent with all other compressors.

Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Nick Terrell <terrelln@fb.com>
Signed-off-by: Adam Borowski <kilobyte@angband.pl>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 72ef86a5570d..edb0191c294f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -43,6 +43,7 @@
 *.tab.[ch]
 *.tar
 *.xz
+*.zst
 Module.symvers
 modules.builtin
 modules.order
-- 
2.26.0

