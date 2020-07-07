Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52CD12164E0
	for <lists+linux-kbuild@lfdr.de>; Tue,  7 Jul 2020 05:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728178AbgGGDvN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 6 Jul 2020 23:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725941AbgGGDvL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 Jul 2020 23:51:11 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA3EC061755;
        Mon,  6 Jul 2020 20:51:11 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id e8so19378151pgc.5;
        Mon, 06 Jul 2020 20:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=nd3qIUY/At4MlLKusVkbwpdN1oiC+Y9cFHvVlipTtk8YMPXTa9OWsmko1uBnXTaXbW
         1UFuWLLWYJ6K9g9VnuAbEZCDl+A3lW9jdUFeN1o+cX6+coyuyqcoqSJTEeSIVriyaV2f
         2yGh+mxkqUMjl69ontdhWVvaoEtemJ/maG6tqRN+QpHBF6FSIw590RLvIcD9s9+qQCTw
         zJQQPL+zO2XZAvPXxrk7M4bEt4jD/1MOD8EmZ01LxBRwnzxx+sLmk6NNGuz/Nfs7WmAM
         Ln6m9/EqeufS5lFoWMjOZVx8RURQ0QqDpBWz6ne9atnC9Z4oETRGD4wUjEQLe7zwZtRl
         D7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=SCcV3O/Ym0/cl/j0fzKvTPBBJHB84Ys49pD1buRYZ2G3XRZaoqDx4PlmfBAupKY6EG
         +fTTHvbSyF+OgrJ6EG6ZfSfXNjuYbukOy9ZbmUkDRCqx6FrZ5/TyIG59a82nDzmSIRyQ
         2m04jB+bfyVYxb1geCzynJjGjdwq0ngZ8kH3FOkgnKBffYvDX0jqBYqRkW0NI8Ez6jzl
         C6nNhYFXtRAWoHY6s6wZEJ3DggX04dqMBL3iww6vhxIPvcMmkP3VtPHiUwZMOs8AQFeG
         ta/yJfCRZm6RtzeYNsWxjO0aILjkRPFrAcUn6/U8TQDdbZqx5saTPhTMMUNlX8SbeMZx
         8QjQ==
X-Gm-Message-State: AOAM533O4R4r8RW3nsGNvYETKcoTtilGyJmgxHPA13rfGc1Xb/0Af5no
        niVHL4b6cVQYPwUq8lH/pKk=
X-Google-Smtp-Source: ABdhPJwS1ZqsqB3ypXA5cPHuh6LCiuTuwIFiLhAq+zI5heo28/I2wWXmnRJZMc4YevKYHvwKiW44DA==
X-Received: by 2002:a63:6d42:: with SMTP id i63mr41869559pgc.77.1594093870910;
        Mon, 06 Jul 2020 20:51:10 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id d22sm20466320pfd.105.2020.07.06.20.51.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2020 20:51:10 -0700 (PDT)
From:   Nick Terrell <nickrterrell@gmail.com>
To:     Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>
Cc:     linux-kernel@vger.kernel.org, Chris Mason <clm@fb.com>,
        linux-kbuild@vger.kernel.org, x86@kernel.org,
        gregkh@linuxfoundation.org, Petr Malat <oss@malat.biz>,
        Kees Cook <keescook@chromium.org>,
        Kernel Team <Kernel-team@fb.com>,
        Nick Terrell <nickrterrell@gmail.com>,
        Adam Borowski <kilobyte@angband.pl>,
        Patrick Williams <patrickw3@fb.com>, rmikey@fb.com,
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Norbert Lange <nolange79@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v6 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Date:   Mon,  6 Jul 2020 20:46:02 -0700
Message-Id: <20200707034604.1539157-7-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707034604.1539157-1-nickrterrell@gmail.com>
References: <20200707034604.1539157-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Nick Terrell <terrelln@fb.com>

Bump the ZO_z_extra_bytes margin for zstd.

Zstd needs 3 bytes per 128 KB, and has a 22 byte fixed overhead.
Zstd needs to maintain 128 KB of space at all times, since that is
the maximum block size. See the comments regarding in-place
decompression added in lib/decompress_unzstd.c for details.

The existing code is written so that all the compression algorithms use
the same ZO_z_extra_bytes. It is taken to be the maximum of the growth
rate plus the maximum fixed overhead. The comments just above this diff
state that:

Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 arch/x86/boot/header.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 735ad7f21ab0..6dbd7e9f74c9 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -539,8 +539,14 @@ pref_address:		.quad LOAD_PHYSICAL_ADDR	# preferred load addr
 # the size-dependent part now grows so fast.
 #
 # extra_bytes = (uncompressed_size >> 8) + 65536
+#
+# ZSTD compressed data grows by at most 3 bytes per 128K, and only has a 22
+# byte fixed overhead but has a maximum block size of 128K, so it needs a
+# larger margin.
+#
+# extra_bytes = (uncompressed_size >> 8) + 131072
 
-#define ZO_z_extra_bytes	((ZO_z_output_len >> 8) + 65536)
+#define ZO_z_extra_bytes	((ZO_z_output_len >> 8) + 131072)
 #if ZO_z_output_len > ZO_z_input_len
 # define ZO_z_extract_offset	(ZO_z_output_len + ZO_z_extra_bytes - \
 				 ZO_z_input_len)
-- 
2.27.0

