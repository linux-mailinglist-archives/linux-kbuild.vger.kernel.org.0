Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2914822FCBA
	for <lists+linux-kbuild@lfdr.de>; Tue, 28 Jul 2020 01:11:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727971AbgG0XLL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 27 Jul 2020 19:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgG0XLK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 27 Jul 2020 19:11:10 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA76C061794;
        Mon, 27 Jul 2020 16:11:10 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id b9so8945947plx.6;
        Mon, 27 Jul 2020 16:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=DDE38O7MDTjFzPi+jNi7AcxIrN8m2Xy+vyE+39QeVAl3lDQbhVXmUapG/raDcEELaN
         X5Wu115FKObrOFDRTvNcEdCU8/6vJFTvZl0pgd+jGWzZoMy9xFcJzAUMnd3vIz3WpEXw
         aOFa0eHF3w4UrsOpBwc2lYwSbltUviuoeiJHqExKp+83j52m7RjKYlFNjKXwBOxC50Bc
         AOE1coF2SimeCKVTeRB8sV7T5H/qjHgps0T+YDHjnvZrG/XJ3waSAtpCLtubT7CQmCsu
         awUDbMh9wxGiZ7SY+uKx1gzSZGP1qVMl96aJDjdKDF+olzK35JY6E/P4G4UtW5DFxcd3
         vsQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=C0J52l08N23Im971I58TEAHOMJyDmWq2WqE3V2zkuFAF0oW8E8mwyTyhEV1bJlmT5b
         /iooZUZ8yz0XPxoLRFHj60jv17ElcI3RwEjdgS0+wzRp4xXWXKKEp2I+ff0th31I0PFR
         MVlHJL2n/uJPHMYY2edPdo0ihqn+oJ2vDAoxHiJ2Ow4L8Cb/7K10q1fWBFNabbp0uYxP
         Zo6aSPrZyKv4t26+nqqiBXE5cdrLy5aDG0EPtU4FbZG/D6c4c9SbRnxR0uTaiz5saeJM
         3Rjzo0kSXhlIns3t9uc2MPZdINgsqIlwujEYQ3hDSLSvwV+YA6LzQrWcuhNltMPCcSAq
         fbvg==
X-Gm-Message-State: AOAM530gBdwdcb28Dvt+ILqY2ScwyauE1wPP5Fm5eKMclvoIhek/YX0S
        uNM3Wp/vXxiQfbrVMOgFnEU=
X-Google-Smtp-Source: ABdhPJyCLS8T4Yh9UWh6S1BChgY/ZBA+Gb48qsktFYpKS+BkFS9ZDx7H1HTkPUN7vZ/SxpfTNr3ARg==
X-Received: by 2002:a17:902:b905:: with SMTP id bf5mr19790937plb.250.1595891469863;
        Mon, 27 Jul 2020 16:11:09 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id y68sm3515931pfy.185.2020.07.27.16.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2020 16:11:09 -0700 (PDT)
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
Subject: [PATCH v9 5/7] x86: bump ZO_z_extra_bytes margin for zstd
Date:   Mon, 27 Jul 2020 16:06:04 -0700
Message-Id: <20200727230606.906598-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727230606.906598-1-nickrterrell@gmail.com>
References: <20200727230606.906598-1-nickrterrell@gmail.com>
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

