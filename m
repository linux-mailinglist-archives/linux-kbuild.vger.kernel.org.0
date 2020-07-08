Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35610219006
	for <lists+linux-kbuild@lfdr.de>; Wed,  8 Jul 2020 20:55:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726918AbgGHSzX (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 8 Jul 2020 14:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726941AbgGHSzX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jul 2020 14:55:23 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D5DCC061A0B;
        Wed,  8 Jul 2020 11:55:23 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id s26so6726213pfm.4;
        Wed, 08 Jul 2020 11:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=HLZSHSpL7anA3opEA2iCsRRTIgFRA+bbZF60HTrHBZMUFO0orOHpswLJuZGQ6RJYEk
         9hRkRYnnp3yjlZhI3ZiyGyYXzAeUBW1/ne89V18X7SEYevVIekigBWM9jNDLZaDa7eeA
         KLso1REH6Jahpkl25epuqd43KPvmt6Rpr/dL+sk+8lYUk4G73hi3O59W0QfLf6Yf1W+J
         +1ehDAIwOy7dNRrCdCodYbMqH39FsgHeWFvFkxa4qHz0a8XIOac4yUuOmqUsSsdWA4wQ
         9F513U5V6j7oKo0pKe/SVHjO8MHd4n+nlVXxYDAtG/SqzCoFVc3uxc+I0tz82Rs2N2s1
         IHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QCGzWBzwdRunC88ZR2ssAXgvTx6O91V0TzBT8uQq0=;
        b=UYdgPggSesBc6DkTF0ixmecK0YZJRs89c3tPBD+X2QVS4NPxtayjOPB/KsrOFPjcCc
         T629XJhOyUyIrdQcGXzcDT3rCfn0+pYV6HBaUfqG9jVkDIY8bZHAfFaU10xSDpFFCdMt
         xXpfcQOxNeXToY+ZtbmsJeZTVjw9/0RH/T/+T5POiG4jhvjG1ixZQgRw62bNTnw25prh
         tAiir2eyMCzh1MOwojmsP/qDfwqWoGeg2DJ9tKOv3zI+0/JTRW4yfEcfD6FW9iWR0k63
         wDEesPCfhyNaHu27eBcJMT/qBCutS5FQ/kJrWOO7PQo0Yv3I0xUhWOw7ir+bRTw50yYU
         wCHQ==
X-Gm-Message-State: AOAM533H92E8bTx/P9x1FPnjBnBPrISf0NxrM1dePAQvkQR/egjeiQ8C
        6DXhIWS28Cm435DxbHndez0=
X-Google-Smtp-Source: ABdhPJxSk57oqgiCu2hJUKRSyRh/1GroV7eOSeQipfNpj2GhtwYlW7QPWwcJ3OoBH7uKcuiBDhn8eQ==
X-Received: by 2002:a65:408b:: with SMTP id t11mr49871925pgp.407.1594234522539;
        Wed, 08 Jul 2020 11:55:22 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net. [98.33.101.203])
        by smtp.gmail.com with ESMTPSA id c132sm485606pfb.112.2020.07.08.11.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2020 11:55:22 -0700 (PDT)
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
        Alex Xu <alex_y_xu@yahoo.ca>, Nick Terrell <terrelln@fb.com>
Subject: [PATCH v7 5/7] x86: bump ZO_z_extra_bytes margin for zstd
Date:   Wed,  8 Jul 2020 11:50:22 -0700
Message-Id: <20200708185024.2767937-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200708185024.2767937-1-nickrterrell@gmail.com>
References: <20200708185024.2767937-1-nickrterrell@gmail.com>
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

