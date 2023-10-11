Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 28F0C7C4BD2
	for <lists+linux-kbuild@lfdr.de>; Wed, 11 Oct 2023 09:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345752AbjJKH3x (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 11 Oct 2023 03:29:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345781AbjJKH3m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2023 03:29:42 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3801BC1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2023 00:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697009352; x=1728545352;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ATpEoKpO3YSPpXOfbJaXNvB0KxrAU0eMnfX4v5Ua/sI=;
  b=KfchJ/QbAqQRXefbFEd41CWC7P7r/c6tMh9XfuZmBem8/Pwo4L3pCuxB
   E2NbFoCa9BkVOWlgaE0BZS6GURlzOPJ+lNnbbLwa5puG4jYnj8nOCszzm
   dFmPWUdfAyaZZxfVrLyTFJzzsvy+AMZR+PoVCaN11X/yyBRt986a8IWlg
   w13YpSPc6Z7pEbn3h1o+u4UKM9fK7qcnW5zlYhpSOqCON3YFMXiuI8H52
   zNj++pFr0nYmpdKzxpIF4W3QDJ3v1pb4Ul6sLkDnyh0FzpjwHxxuNnKYF
   IJtruPmc8sVQ7KGLs/NrWioeoJ1ZTRometK3zXKQVo02RamrpriEbJ1vv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="3191978"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="3191978"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:29:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10859"; a="747352174"
X-IronPort-AV: E=Sophos;i="6.03,214,1694761200"; 
   d="scan'208";a="747352174"
Received: from wprelogx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.56.229])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2023 00:29:08 -0700
From:   Jani Nikula <jani.nikula@intel.com>
To:     intel-gfx@lists.freedesktop.org
Cc:     linux-kbuild@vger.kernel.org, jani.nikula@intel.com,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 0/2] drm/i915: align with W=1 warnings
Date:   Wed, 11 Oct 2023 10:29:02 +0300
Message-Id: <cover.1697009258.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

v2 of https://patchwork.freedesktop.org/series/124718/

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>

Jani Nikula (2):
  drm/i915: drop -Wall and related disables from cflags as redundant
  drm/i915: enable W=1 warnings by default

 drivers/gpu/drm/i915/Makefile | 44 +++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 17 deletions(-)

-- 
2.39.2

