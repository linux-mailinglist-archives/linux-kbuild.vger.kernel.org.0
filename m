Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651B115B8B9
	for <lists+linux-kbuild@lfdr.de>; Thu, 13 Feb 2020 05:41:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729383AbgBMElB (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 23:41:01 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:53598 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729358AbgBMElA (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 23:41:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:MIME-Version:Date:Message-ID:Subject:From:To:Sender:Reply-To:Cc:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=V4kNebw5qwSAs1Iv3VjcAGcXSIRN/Sh+t0JG0ujJMLA=; b=Q+wbEs+4SjiYlqx6+leCFn40Rb
        MFIheZuIKzBVVOtdCQU5SULXwDC1rDORCfMp0rjyuChrx8ChPH8vtSnVk8rqNMX1eq0wulpE9SKRA
        9WAhh3YSvV3u1ZD5we4JrdoPWE5fWnioChew1lXXVAhDw8jDEsXMdMMTiqw7Rrd6Nh7Brk0ZWZHXt
        kNz1Um7Nzai5WYjwCiIyw6V+jLuCqn7jHUfQO3W7SzOKLMldKoyiWvBcuCWBoZPFbOtjCgmT38eKQ
        GA4SOAiiwcJh0MfcVZkYdZnjtJPeO1wslVj5SYClhP2CkHqG9Ps4IfhY205UtOLWHTgQ+qnbIlgl8
        PQYhTn4A==;
Received: from [2601:1c0:6280:3f0::19c2]
        by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1j26JA-0003vk-Hq; Thu, 13 Feb 2020 04:41:00 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] kbuild: add comment for V=2 mode
Message-ID: <a06194f0-3713-cc04-1673-c05b35c03242@infradead.org>
Date:   Wed, 12 Feb 2020 20:40:57 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Complete the comments for valid values of KBUILD_VERBOSE,
specifically for KBUILD_VERBOSE=2.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
 Makefile |    1 +
 1 file changed, 1 insertion(+)

--- linux-next-20200206.orig/Makefile
+++ linux-next-20200206/Makefile
@@ -68,6 +68,7 @@ unexport GREP_OPTIONS
 #
 # If KBUILD_VERBOSE equals 0 then the above command will be hidden.
 # If KBUILD_VERBOSE equals 1 then the above command is displayed.
+# If KBUILD_VERBOSE equals 2 then give the reason why each target is rebuilt.
 #
 # To put more focus on warnings, be less verbose as default
 # Use 'make V=1' to see the full commands

