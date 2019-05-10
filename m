Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E9019908
	for <lists+linux-kbuild@lfdr.de>; Fri, 10 May 2019 09:32:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727061AbfEJHcx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 10 May 2019 03:32:53 -0400
Received: from mga02.intel.com ([134.134.136.20]:33007 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726983AbfEJHcx (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 03:32:53 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 10 May 2019 00:32:52 -0700
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO lkp-server01) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 10 May 2019 00:32:51 -0700
Received: from kbuild by lkp-server01 with local (Exim 4.89)
        (envelope-from <lkp@intel.com>)
        id 1hP01T-000H7X-9S; Fri, 10 May 2019 15:32:51 +0800
Date:   Fri, 10 May 2019 15:32:07 +0800
From:   kbuild test robot <lkp@intel.com>
To:     Brendan Higgins <brendanhiggins@google.com>
Cc:     kbuild-all@01.org, linux-kbuild@vger.kernel.org,
        Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [RFC PATCH kbuild] kbuild: kunit_stream_get_level() can be static
Message-ID: <20190510073207.GA2325@lkp-kbuild06>
References: <201905101508.nymn1QP2%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201905101508.nymn1QP2%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


Fixes: 7ab313d288d1 ("kbuild: enable building KUnit")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 kunit-stream.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kunit/kunit-stream.c b/kunit/kunit-stream.c
index 93c14ee..3d92646 100644
--- a/kunit/kunit-stream.c
+++ b/kunit/kunit-stream.c
@@ -11,7 +11,7 @@
 #include <kunit/kunit-stream.h>
 #include <kunit/string-stream.h>
 
-const char *kunit_stream_get_level(struct kunit_stream *this)
+static const char *kunit_stream_get_level(struct kunit_stream *this)
 {
 	unsigned long flags;
 	const char *level;
