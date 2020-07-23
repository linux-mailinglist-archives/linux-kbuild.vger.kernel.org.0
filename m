Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BC6D22B6C3
	for <lists+linux-kbuild@lfdr.de>; Thu, 23 Jul 2020 21:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726711AbgGWTas (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 23 Jul 2020 15:30:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726689AbgGWTar (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Jul 2020 15:30:47 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B5A6C0619DC;
        Thu, 23 Jul 2020 12:30:47 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id l6so3032492plt.7;
        Thu, 23 Jul 2020 12:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=cBY7Ts0Dn/yJ/+ZWE7VudkHnyuC7LqcXKcjymID4/kVhvNHMWHyBlg7WKRwPl4nCAC
         fKOPRWgTo4uMNrEZeJy5QtwqGN+fBVV7jid7LmRih4/8V2miaRuOuqirisKXJCNotIdo
         gwJH3149xT8gLHsmovNcEqSb+ojEmlb6UzMYo4b1MqZNTfP6kkRLAamanfCyy+mQWyp+
         S83L5ElaPB4HqZxIY728sV+xGs2wYwBu63N8WTEUYKO3zaDYuqd6JVrA7fuLQZ+rfCO8
         3lfTAWCQ2ZBKKay/yZ1CTV4zVhvpBlnPE1kboJUtT9icJ5/U7S9vBT+UdZVUlC5mthZD
         qxZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=sw7GFTRtOgVNquZNd+fAFR8fixL1GN2xttYJGrh3YU0LAqCZZz+cGIan5UNMst8fBV
         p9U7afQ8iAnP+EFePjpWfFVg6RQraaE3W2zCULFi1sd+j3axyDR4X6BNkWqkOHXf/HjJ
         nWHP1y/lxpjNe/WdygyixpralCXOqmycfPgUpbiQqe+nXXGpEpTQ1UVwj0Pyq6MBT8Pp
         bQjPwyMwUbGYt/xjV1FSy24t1V+VwEmusuvJnLlBglExpoQDA/ECTxGWzE8aeZgzHc/t
         PzZS2PQXCarXzfSQ+ofUSX9mxJjd1rNeYbXa85zSk4tH3cGlDEZWd/NJ/puTeftd0mMm
         mOdw==
X-Gm-Message-State: AOAM532JbvqmuAaVFofHO8yNC4PFlOmBhcGPU5BQKIIPI4thBSlB0DRc
        rAW5xLx1AbZK2jE4Wz9kE9fuJy9b70o=
X-Google-Smtp-Source: ABdhPJxQQ6heHaCHmOcJzC/I8BU7mAcdErDTCHiBwrJsRscBZC+VPjo0YIwwQ+jbZRag/cOOHlDkMw==
X-Received: by 2002:a17:902:7591:: with SMTP id j17mr5031015pll.286.1595532647100;
        Thu, 23 Jul 2020 12:30:47 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id y18sm3794332pff.10.2020.07.23.12.30.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2020 12:30:46 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>,
        Arvind Sankar <nivedita@alum.mit.edu>,
        Nick Terrell <terrelln@fb.com>
Subject: [PATCH v8 5/7] x86: bump ZO_z_extra_bytes margin for zstd
Date:   Thu, 23 Jul 2020 12:27:59 -0700
Message-Id: <20200723192801.351114-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723192801.351114-1-nickrterrell@gmail.com>
References: <20200723192801.351114-1-nickrterrell@gmail.com>
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

