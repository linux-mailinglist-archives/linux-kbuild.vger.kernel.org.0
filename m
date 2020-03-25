Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D3350193184
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 20:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727600AbgCYT7K (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 15:59:10 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:46321 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYT7K (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:59:10 -0400
Received: by mail-pl1-f194.google.com with SMTP id s23so1210147plq.13;
        Wed, 25 Mar 2020 12:59:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WRe0CDur4+QyYBsqVasmKkHEv01IAC5YsJAw+ZG6o6Q=;
        b=Lb+plGHidr/zatDeYeYaLIbpXpVMviYlLwxRsoejw2Ls6GWObgI8rK2/7EmA6NZVZR
         z8r0q+btXD3WnG8Eif129D5qiO6wvxKEi3jDVvghtkuKV8WzT0s8WKhgXXDEi7mtmDLr
         LG7J6nW///svzdYdW2l1ngs/NYuPJNv31L62YUDY0c/XSLW3+HFcR1eVMnnnxoHftBEj
         cmcHnupftkWXOGRjEzk/9FWhj2B1MWubizdecYK6kasx+79msosfHD2GHD3alY9z5eTA
         T9jcFVT0uQUF+/WQomiK2fQhN+4eCrncDw2PbGj/uhXTJjlqb8k7fuzo0njXIOrw9MGd
         mgaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WRe0CDur4+QyYBsqVasmKkHEv01IAC5YsJAw+ZG6o6Q=;
        b=gPMtrSA0e9GTJmZya1TPtIMLL59CHdgqL/glJNffS1Sm3X40tKFw0u7VgQzueidJL2
         xhCGsEIsFzp2/IwfWDsv04tKhsMt+OYb/Rcyt0lGrwLgjHkcSNq0xRorV3FI3O0MaoP6
         hARRvN8UrNFP6n8YpaQWroklIXMJygp8AwUpFqCR1DcZL575d/jUPSYSenaMN4de0BEP
         HjpY1XZsp/BEP4kGZndcWexNJn5Zen9V9D9+WCZXxzGliF1reSA6YRdzw9ydN7YJ0ThU
         uIu6NSp2CNhFPauiN35cPkWE++HhNWVsMBbUj5soBz1l81AfHM2+0yAyS4OtRDr2YsJG
         PJvQ==
X-Gm-Message-State: ANhLgQ25294EoCDCVSBltPWiDXrMeG5pq/MSMvv+BHfPFMX1pI9jc9FE
        zTWjBviqxKR+yGIkQ2ads8A=
X-Google-Smtp-Source: ADFU+vu7NxZjKnBSSPljYCoyjYcnEyVqw3mFJt7W8U8Ec+IqI2L+KP27Y2S9x7DnxKalt6YFk4eEJQ==
X-Received: by 2002:a17:902:9b8b:: with SMTP id y11mr4891627plp.189.1585166348810;
        Wed, 25 Mar 2020 12:59:08 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id d7sm19341374pfr.17.2020.03.25.12.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 12:59:08 -0700 (PDT)
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
        mingo@kernel.org, Patrick Williams <patrick@stwcx.xyz>
Subject: [PATCH v3 6/8] x86: bump ZO_z_extra_bytes margin for zstd
Date:   Wed, 25 Mar 2020 12:58:47 -0700
Message-Id: <20200325195849.407900-7-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325195849.407900-1-nickrterrell@gmail.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
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

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 arch/x86/boot/header.S | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/x86/boot/header.S b/arch/x86/boot/header.S
index 97d9b6d6c1af..b820875c5c95 100644
--- a/arch/x86/boot/header.S
+++ b/arch/x86/boot/header.S
@@ -536,8 +536,14 @@ pref_address:		.quad LOAD_PHYSICAL_ADDR	# preferred load addr
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
2.25.1

