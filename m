Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1839C29EA7A
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 12:29:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726458AbgJ2L3V (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 29 Oct 2020 07:29:21 -0400
Received: from alln-iport-1.cisco.com ([173.37.142.88]:45950 "EHLO
        alln-iport-1.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725805AbgJ2L3V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Oct 2020 07:29:21 -0400
X-Greylist: delayed 366 seconds by postgrey-1.27 at vger.kernel.org; Thu, 29 Oct 2020 07:29:21 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=842; q=dns/txt; s=iport;
  t=1603970961; x=1605180561;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=G5yO747s4jdu0R3kHbhed+Io6wTx5do6R24/UBQXme4=;
  b=NtAWmLwwCeUaUxmpYZN5j6a5v0iZTPnqtgIcLuEYBi8NsT+kV/7BGl8w
   3fqrjOkUozu13uVE/Rj49bZwDQ3vYxVxAj8Xon3cLt/aBZGbeYp9/q42N
   MkeoUuF7V5oEkypUdXB/0E2adjDvnYfaX7Rr8LCRF1aCTpK9a1G/Q8o0O
   g=;
X-IronPort-AV: E=Sophos;i="5.77,429,1596499200"; 
   d="scan'208";a="575259983"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 29 Oct 2020 11:21:13 +0000
Received: from sjc-ads-9103.cisco.com (sjc-ads-9103.cisco.com [10.30.208.113])
        by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id 09TBLCS0020875
        (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Thu, 29 Oct 2020 11:21:13 GMT
Received: by sjc-ads-9103.cisco.com (Postfix, from userid 487941)
        id 8C738CC1251; Thu, 29 Oct 2020 04:21:12 -0700 (PDT)
From:   Denys Zagorui <dzagorui@cisco.com>
To:     masahiroy@kernel.org, michal.lkml@markovi.net,
        linux-kbuild@vger.kernel.org
Cc:     dzagorui@cisco.com, linux-kernel@vger.kernel.org
Subject: [PATCH] kbuild: use -fmacro-prefix-map for .S sources compilation
Date:   Thu, 29 Oct 2020 04:21:12 -0700
Message-Id: <20201029112112.21285-1-dzagorui@cisco.com>
X-Mailer: git-send-email 2.19.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Outbound-SMTP-Client: 10.30.208.113, sjc-ads-9103.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Follow-up to a73619a845d5 ("kbuild: use -fmacro-prefix-map to make
__FILE__ a relative path") commit. Assembler sources also use __FILE__
macro so this flag should be also apllied to that sources.

Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index ee2284a5cad2..26c4294f6e25 100644
--- a/Makefile
+++ b/Makefile
@@ -947,6 +947,7 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
 
 # change __FILE__ to the relative path from the srctree
 KBUILD_CFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
+KBUILD_AFLAGS	+= $(call cc-option,-fmacro-prefix-map=$(srctree)/=)
 
 # ensure -fcf-protection is disabled when using retpoline as it is
 # incompatible with -mindirect-branch=thunk-extern
-- 
2.19.0.dirty

