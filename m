Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CD4C66BF6F
	for <lists+linux-kbuild@lfdr.de>; Wed, 17 Jul 2019 18:07:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726494AbfGQQH2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 17 Jul 2019 12:07:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:33635 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726081AbfGQQH1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 Jul 2019 12:07:27 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <seth.forshee@canonical.com>)
        id 1hnmRp-0001kQ-Ax
        for linux-kbuild@vger.kernel.org; Wed, 17 Jul 2019 16:06:29 +0000
Received: by mail-io1-f69.google.com with SMTP id f22so27555385ioh.22
        for <linux-kbuild@vger.kernel.org>; Wed, 17 Jul 2019 09:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ObxAaTqUw3sBO2ywY0jCPLtrtzU2IECjcL3XtvnRiSM=;
        b=WgokbOXcXAGEKcG3X6oshs84ChyRVxgPGl6K2bRDNuB6nZF9zAyIreMOGpDsgYlTTq
         h2seBFUHXgEquW689dQCW7RetIjFMJe9Bq2X+1l03acrp1O3Hrpm3NJ8J+veAh8C3MC8
         UN189YNgzeZMiDj2zzgoBFP1QyXvL8RX4SA6GasEhJZ0p+gOb5/7gVIsW1YNPsFxweFF
         HBAUfET8yuhYbX0IzCgCwbrTZx6PPAvRoz3aC3oGmZhfiRsCw+Fe93X4/qZxEdUUTD9O
         hTmiKKj43mG7rFtE3EmKjiU7MSbf0qsFFLHTub1dUBrV7a4vHKseaqghSNX5CvZi1EhP
         kHEA==
X-Gm-Message-State: APjAAAVZhagr6qjoZAskqU0RxiAQjhDeQLxB/cVZQUeuVYdy9nU/6qYw
        Tjo+k3ED6frNV9Xyvl//lFIwq2A/vEUJoxRqUMHhVb8VAy6z5surGraHn6VXipbAdYh3GPgFMfD
        8YX8rLlk3ANB8owic3eTDUiHzjiSxdQ59j6D4mjrk6A==
X-Received: by 2002:a02:528a:: with SMTP id d132mr40218810jab.68.1563379588303;
        Wed, 17 Jul 2019 09:06:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzBuJDwsdyIv42Ja0H/JR0OavxWZsQpl28VV7R8Rn30XEDFhWtft8Tow/C3eQQxbsOze1vNEA==
X-Received: by 2002:a02:528a:: with SMTP id d132mr40218777jab.68.1563379588038;
        Wed, 17 Jul 2019 09:06:28 -0700 (PDT)
Received: from localhost ([2605:a601:ac2:fb20:31dd:dc66:96d:f1eb])
        by smtp.gmail.com with ESMTPSA id p3sm24812022iom.7.2019.07.17.09.06.27
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 17 Jul 2019 09:06:27 -0700 (PDT)
From:   Seth Forshee <seth.forshee@canonical.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Josh Poimboeuf <jpoimboe@redhat.com>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] kbuild: add -fcf-protection=none when using retpoline flags
Date:   Wed, 17 Jul 2019 11:06:26 -0500
Message-Id: <20190717160626.26293-1-seth.forshee@canonical.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The gcc -fcf-protection=branch option is not compatible with
-mindirect-branch=thunk-extern. The latter is used when
CONFIG_RETPOLINE is selected, and this will fail to build with
a gcc which has -fcf-protection=branch enabled by default. Adding
-fcf-protection=none when building with retpoline enabled
prevents such build failures.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 Makefile | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Makefile b/Makefile
index 3e4868a6498b..73a94d1db2b6 100644
--- a/Makefile
+++ b/Makefile
@@ -878,6 +878,12 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
 # change __FILE__ to the relative path from the srctree
 KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 
+# ensure -fcf-protection is disabled when using retpoline as it is
+# incompatible with -mindirect-branch=thunk-extern
+ifdef CONFIG_RETPOLINE
+KBUILD_CFLAGS += $(call cc-option,-fcf-protection=none,)
+endif
+
 # use the deterministic mode of AR if available
 KBUILD_ARFLAGS := $(call ar-option,D)
 
-- 
2.20.1

