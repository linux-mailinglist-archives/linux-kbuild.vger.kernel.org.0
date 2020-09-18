Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C7742708BB
	for <lists+linux-kbuild@lfdr.de>; Sat, 19 Sep 2020 00:04:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgIRWEu (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 18 Sep 2020 18:04:50 -0400
Received: from mga17.intel.com ([192.55.52.151]:33601 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726154AbgIRWEt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 18 Sep 2020 18:04:49 -0400
IronPort-SDR: Cw93KdnN/Tvpjnw/SfTYd6VGDVx03PeVyNmQxXRgkvtol/X/IZIyXk+hOKS1Wax+BM0JSYW9/u
 ItJIAQr5SPew==
X-IronPort-AV: E=McAfee;i="6000,8403,9748"; a="140049743"
X-IronPort-AV: E=Sophos;i="5.77,276,1596524400"; 
   d="scan'208";a="140049743"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 15:04:46 -0700
IronPort-SDR: dIQt1OOvPZKDRVk8qfEIyWcxU4C4lqHRvumPlTRVJ1tk29L3c+cNTgx/Khb4ZCUtzt9RA6ChhK
 TYlZ/CGUr29w==
X-IronPort-AV: E=Sophos;i="5.77,276,1596524400"; 
   d="scan'208";a="452936209"
Received: from ramansri-mobl.amr.corp.intel.com (HELO pbossart-mobl3.intel.com) ([10.213.162.107])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2020 15:04:45 -0700
From:   Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-kbuild@vger.kernel.org,
        Kai Vehmanen <kai.vehmanen@linux.intel.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH] MAINTAINERS: fix KERNEL_BUILD entry
Date:   Fri, 18 Sep 2020 17:04:15 -0500
Message-Id: <20200918220431.251873-1-pierre-louis.bossart@linux.intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

the get_maintainer.pl script throws the following errors:

Unmatched () '(open list:KERNEL BUILD + files below scripts/ (unless
mai...)' '' at /usr/lib/git-core/git-send-email line 546.

error: unable to extract a valid address from:
linux-kbuild@vger.kernel.org (open list:KERNEL BUILD + files below
scripts/ (unless mai...)

Removing parentheses and adding dash separators makes this go away.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0d0862b19ce5..45934cac3a18 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9471,7 +9471,7 @@ L:	autofs@vger.kernel.org
 S:	Maintained
 F:	fs/autofs/
 
-KERNEL BUILD + files below scripts/ (unless maintained elsewhere)
+KERNEL BUILD + files below scripts/ -- unless maintained elsewhere
 M:	Masahiro Yamada <masahiroy@kernel.org>
 M:	Michal Marek <michal.lkml@markovi.net>
 L:	linux-kbuild@vger.kernel.org
-- 
2.25.1

