Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B0792A29FD
	for <lists+linux-kbuild@lfdr.de>; Mon,  2 Nov 2020 12:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728494AbgKBLx4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 2 Nov 2020 06:53:56 -0500
Received: from rcdn-iport-9.cisco.com ([173.37.86.80]:6047 "EHLO
        rcdn-iport-9.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728297AbgKBLx4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Nov 2020 06:53:56 -0500
X-Greylist: delayed 434 seconds by postgrey-1.27 at vger.kernel.org; Mon, 02 Nov 2020 06:53:54 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=934; q=dns/txt; s=iport;
  t=1604318035; x=1605527635;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OyOQHTIUgHMUuC830JRkqMxl1dIU1flTQWpGztg7O5I=;
  b=jHvZTyk9CiBWIoiIxuZ3tNbmHTdD3WBtppwVtHs6iuABnfS0XUmmeRrD
   gjdx2kRNit/Fo3AUBhLGHW+MgfMr3XbNZFZWuIHdH/Zmiwd93KwIBXHdW
   TK1yzT4TKISVbnVw7znU8/lHhPIfVIWXcAJ+f707POEXLzTwbt9pJ8l3K
   4=;
X-IronPort-AV: E=Sophos;i="5.77,444,1596499200"; 
   d="scan'208";a="746195443"
Received: from rcdn-core-12.cisco.com ([173.37.93.148])
  by rcdn-iport-9.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 02 Nov 2020 11:46:29 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
        by rcdn-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 0A2BkO5a022811
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Mon, 2 Nov 2020 11:46:27 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
        id C5FBACC1253; Mon,  2 Nov 2020 03:46:23 -0800 (PST)
From:   Denys Zagorui <dzagorui@cisco.com>
To:     masahiroy@kernel.org
Cc:     michal.lkml@markovi.net, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org, dzagorui@cisco.com
Subject: [PATCH v2] kbuild: use -fmacro-prefix-map for .S sources compilation
Date:   Mon,  2 Nov 2020 03:46:23 -0800
Message-Id: <20201102114623.93323-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.19.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: rcdn-core-12.cisco.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Follow-up to a73619a845d5 ("kbuild: use -fmacro-prefix-map to make
__FILE__ a relative path") commit. Assembler sources also use __FILE__
macro so this flag should be also apllied to that sources.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ee2284a5cad2..81e480fc6805 100644
--- a/Makefile
+++ b/Makefile
@@ -946,7 +946,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
 
 # change __FILE__ to the relative path from the srctree
-KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_CPPFLAGS += $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 
 # ensure -fcf-protection is disabled when using retpoline as it is
 # incompatible with -mindirect-branch=thunk-extern
-- 
2.19.0.dirty

