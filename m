Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 71C1F193188
	for <lists+linux-kbuild@lfdr.de>; Wed, 25 Mar 2020 20:59:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbgCYT7V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 25 Mar 2020 15:59:21 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:38976 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbgCYT7T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 25 Mar 2020 15:59:19 -0400
Received: by mail-pj1-f66.google.com with SMTP id z3so943353pjr.4;
        Wed, 25 Mar 2020 12:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HT7X1bnF9RB/ljiH7L9vefoV2nWMReVG/vC3cuU3dbw=;
        b=XN9kHvFyWF+8Hy2oH/prNDAbAZON6o62WQjdqKVBeDElRkgnMscqiDIB7xzhOq561m
         yBnftf9dZU4ICX+ukf14Vl/L/CuCRJw1haVgcKJjrKk4/XoQLoFDYmZpgttyyoMhCJwv
         2CBnx1+ko+sxnCzKSOHVytwiG5AJ2v/w/sj/7ikTZAoxUS6WVOPdQzHpMueEC/2LUKgr
         /mVUKYQgH9o0Ry5/L6Bdz2U2iZL+zm7Otv/Clnc8km9MzLbeAtPTo+rc6r7FWgEDMWu9
         C1ugUsA9miFBGGEy9kK5t0pKXEcxexSrQ+N53RDLhqOoY2ePxhLYNMK0vZ2jXxEcepIx
         fhfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HT7X1bnF9RB/ljiH7L9vefoV2nWMReVG/vC3cuU3dbw=;
        b=Ava9A/LOeZZjqa++uZZSZtnUW8LtGBWuh4g5Fr4Biw83IzzhWDiYE9mM4m0B3D4M6S
         7MazfR0ibYaPew+tCX43aiCkLTxFXbMW69K3vnwhLsra/fIrvalTmX/Bxv+E34Gv5WS5
         fNwmuzArALkBg8j85VtOB5QAYuHYgF3aEeF37CZOIsoeFQMsG+QDa8D6e2KN0CE9i4cV
         p+DhgXXqkMwLpkHGcPO1zez2oBaO2L7aIRFe3q1to6WMCCOOs17wQ7DMVFBLXVGGkkhc
         4RlaeVWuVeRRaaNRKm5PlVZdZMJoES+9VLB0K0OIsTWWXNdInPG7e+MMbSg+Z2H9GzNu
         knRA==
X-Gm-Message-State: ANhLgQ0B4cv+7tiMY1logkACZYgLwttJDK9XAukQ8PeXMzQQEOEHtuVz
        //OiCk4Iv07aBNPEjjI98S0=
X-Google-Smtp-Source: ADFU+vtIN9MKM2bUmaS+Zx7L51UUNq0Ew63ggvXaRO0qaJZL9thFxBeb+qASuXtev0ZgDYzt5kBwtQ==
X-Received: by 2002:a17:90a:b78e:: with SMTP id m14mr5435101pjr.135.1585166358024;
        Wed, 25 Mar 2020 12:59:18 -0700 (PDT)
Received: from nickserv.localdomain (c-67-188-225-242.hsd1.ca.comcast.net. [67.188.225.242])
        by smtp.gmail.com with ESMTPSA id d7sm19341374pfr.17.2020.03.25.12.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2020 12:59:17 -0700 (PDT)
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
Subject: [PATCH v3 8/8] .gitignore: add ZSTD-compressed files
Date:   Wed, 25 Mar 2020 12:58:49 -0700
Message-Id: <20200325195849.407900-9-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200325195849.407900-1-nickrterrell@gmail.com>
References: <20200325195849.407900-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Adam Borowski <kilobyte@angband.pl>

For now, that's arch/x86/boot/compressed/vmlinux.bin.zst but probably more
will come, thus let's be consistent with all other compressors.

Signed-off-by: Adam Borowski <kilobyte@angband.pl>
Signed-off-by: Nick Terrell <terrelln@fb.com>
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
2.25.1

