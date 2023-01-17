Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3459766DA66
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Jan 2023 11:00:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236164AbjAQKAD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 17 Jan 2023 05:00:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbjAQKAC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Jan 2023 05:00:02 -0500
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2592BEE8;
        Tue, 17 Jan 2023 02:00:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673949602; x=1705485602;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=aH8DrIpT8HGh4e0HNKSU8GArfzd8LmA9RxrYxJTuICk=;
  b=KK6v6IMUmd0BsQSUDqLDgcIcfqZmFFhcsKMmhfKbZwItFf+wYX9igJdB
   nSTVrVFOW6XA11gFTpJRcPUJMNb7mTlXz7hHYCuy5wvKWKqArU/uYe2EN
   x5RD+B0OKwK5NHE2VVboJ21n0ye6w+t4nNhSFDXCkk10YjxIcYAEzUrJy
   iTXN6TnchMEPtRkKoPQ8YJVAQIPtO8/3Or90Dy/sJqL6FTA1/uKHl/Ion
   +NWICaThu0vpWmX0hRe5EsR36qt7n1YkmyZmYUOJ+NdrSSEHqQwi2uUtj
   TJkDmVLTZxqcw49kU9cldNoGACV5sooWBWQnu4w5zuHY/aOhujgHEzlyJ
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="410894654"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="410894654"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 02:00:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10592"; a="661233309"
X-IronPort-AV: E=Sophos;i="5.97,222,1669104000"; 
   d="scan'208";a="661233309"
Received: from dmcmanus.ger.corp.intel.com (HELO localhost) ([10.252.27.166])
  by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2023 01:59:59 -0800
From:   Jani Nikula <jani.nikula@intel.com>
To:     linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     jani.nikula@intel.com
Subject: [PATCH 0/6] docs: kbuild makefile documentation cleanups
Date:   Tue, 17 Jan 2023 11:59:40 +0200
Message-Id: <20230117095946.2042832-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

I usually shy away from making rst updates, but the makefiles.rst file
always bugs me when I look at it, so here goes. Even I usually look at
the rst file in the editor instead of html in the browser, but the
editor knows about rst...

This is based on the kbuild branch of linux-kbuild.git, and there's a
MAINTAINERS update too to fix the branch name. ;)

BR,
Jani.


Jani Nikula (6):
  MAINTAINERS: fix kbuild repo branch
  docs/kbuild/makefiles: fix header underline
  docs/kbuild/makefiles: throw out the local table of contents
  docs/kbuild/makefiles: drop section numbering, use references
  docs/kbuild/makefiles: clean up indentation and whitespace
  docs/kbuild/makefiles: unify quoting

 Documentation/kbuild/makefiles.rst | 2148 ++++++++++++++--------------
 MAINTAINERS                        |    2 +-
 2 files changed, 1060 insertions(+), 1090 deletions(-)

-- 
2.34.1

