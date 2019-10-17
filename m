Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 025D4DA9E5
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 12:25:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404953AbfJQKZf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 06:25:35 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34406 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404947AbfJQKZf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 06:25:35 -0400
Received: by mail-pg1-f194.google.com with SMTP id k20so1108401pgi.1;
        Thu, 17 Oct 2019 03:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ui7yMtz2wfm6ArdIY4PSgSLK8DHmSvQDSKngr1D16w=;
        b=tmYSc7Pr+Ii7CCifbpxcUrtLSZGm/eeycdTacjQOc+wMN83w8QZ4fKSe2IRQd6Db5D
         oyRUb7rQjBXAVLqkCBoWQvGAVx/7EB4d66KCOpes6qPPIDCEKSlJ8ilOQdTmtMbSTITS
         6T7GBiqopMS3rLoIGcpSQqJ0qm5pUESTVBnzVNtVKSRK3aJfTdpL2HauIqRrE/duCwH+
         Rzujz3g+Qog4OCM6+IjnwINWL+e/Lk7w2aA2xGuTfn2PsdyGVRwLmZXVcMRDC7PNxFbp
         f/Z+4JMc65/seAFAUz+cNMAf2TRTV0KiNkjsycPAQhKCnbDGqjqlfPRybLnIynD9mobQ
         OYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3ui7yMtz2wfm6ArdIY4PSgSLK8DHmSvQDSKngr1D16w=;
        b=m0/aSGlsIWiQlzQG99hIdbhKWAD4diYS3/881tdXoEno68kAY4HaO9yqEYyjPXWsAE
         xevFuGVlvNIHClT3+p8DRCKFgDbkkyZq6u29LWyF+UDC1ZiHf4w51WQBE7zvdo7pImEp
         nOqhPTKRTTFzlLHUX21R6qkB/5f91/e7PE/qMm5PvOhUOctgTVEC0PALsEvuNW60G0Wj
         bU+ZZs1A6t+GzD5jp8JHPda4vWDfU8I5I4kfHjWg/4ZRNMiHpz+PCybxBMOtFgKz2MdI
         ENUJ5gwrqwC9Rj8RraeTs2MVU6Ws1h5gAQn4UA4bZiiEOAETGgAN2zJINYtXr+pj9p7v
         ERTw==
X-Gm-Message-State: APjAAAUW/GlUNEmylbjOBmZWr4IteL2usVCARSNrOiz8t8ALq3YnmMJr
        1nQVvOYevwtjj2pcwdCYWsk=
X-Google-Smtp-Source: APXvYqz16KoqtIUP2gwT0knNEgKxe6+qhSyzddrS4II1XPAqvQBAuSURDX/Cpj2Lg69dzGeJ9/Pl2w==
X-Received: by 2002:a17:90a:d793:: with SMTP id z19mr3314470pju.140.1571307934826;
        Thu, 17 Oct 2019 03:25:34 -0700 (PDT)
Received: from Gentoo.localdomain ([103.231.90.172])
        by smtp.gmail.com with ESMTPSA id o185sm4113858pfg.136.2019.10.17.03.25.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 03:25:33 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, torvalds@linux-foundation.org,
        Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: [PATCH] scripts : mksysmap : NM variable missed the value,so fixed
Date:   Thu, 17 Oct 2019 15:55:06 +0530
Message-Id: <20191017102506.22192-1-unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This patch will provide the missing value for NM variable.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
TO all,
Adjusted the subject line, missed in previous one,sorry

 scripts/mksysmap | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mksysmap b/scripts/mksysmap
index a35acc0d0b82..4b2f45c45f14 100755
--- a/scripts/mksysmap
+++ b/scripts/mksysmap
@@ -40,5 +40,5 @@
 # 'W' or 'w'. __crc_ are 'A' and placed in the middle
 # so we just ignore them to let readprofile continue to work.
 # (At least sparc64 has __crc_ in the middle).
-
+NM=$(which nm)
 $NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' > $2
--
2.21.0

