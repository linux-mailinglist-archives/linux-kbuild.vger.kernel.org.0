Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6052E66DA69
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 11:00:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236227AbjAQKAJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 05:00:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235873AbjAQKAH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 05:00:07 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D2C02BEE8;
        Tue, 17 Jan 2023 02:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673949606; x=1705485606;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IPALOuTqyB441x5eKxRDE98AgBh7qKozuzZcP1LFatc=;
  b=Vocnfx5GS1pp+4WJ2p7ILhsHb9QQPZO7oRUcjKbMOGYckiqWNyoDXU8I
   H1B4kD9iLt+zGtDQ60qcZNBBtxkouOZt6AYq6SX9oBhEVzMI8fQbfsocS
   y21UtSYsgvYbtwNhAjUFkJnxgWh37u9H9fkisWVZG7McM9iKadkRwZxAr
   B9Hs0UwJAyJs+aBzIB7JwuWX71RsIGBeBEJDv14fVN9lria8calqGM7R6
   1fZRDJtG5BBKao7lpTne4qANAOonueHabFqaEgm8Uw0dgLhfNMCsRgFdw
   dkrd8clEmY0QzJp0Y+aVYcM19mt6RxPp/tqR+fRxRjJBLuaHPRY374pPW
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="325933204"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="325933204"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="904595547"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="904595547"
Received: from dmcmanus.ger.corp.intel.com (HELO localhost) ([10.252.27.166])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:04 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     jani.nikula@intel.com
Subject: [PATCH 1/6] MAINTAINERS: fix kbuild repo branch
Date:   Tue, 17 Jan 2023 11:59:41 +0200
Message-Id: <20230117095946.2042832-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230117095946.2042832-1-jani.nikula@intel.com>
References: <20230117095946.2042832-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The MAINTAINERS repository entry specifies "kconfig" as the branch, but
the repository itself has "kbuild".

Cc: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a36df9ed283d..98da2af0a653 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11171,7 +11171,7 @@ M:	Masahiro Yamada <masahiroy@kernel.org>
 L:	linux-kbuild@vger.kernel.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-kbuild/list/
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kconfig
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
 F:	Documentation/kbuild/kconfig*
 F:	scripts/Kconfig.include
 F:	scripts/kconfig/
-- 
2.34.1

