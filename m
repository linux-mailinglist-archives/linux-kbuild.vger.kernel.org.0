Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F38D390CA4
	for <lists+linux-kbuild@lfdr.de>; Wed, 26 May 2021 01:02:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232040AbhEYXD6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 25 May 2021 19:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232065AbhEYXD5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 May 2021 19:03:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D1A3DC061756
        for <linux-kbuild@vger.kernel.org>; Tue, 25 May 2021 16:02:26 -0700 (PDT)
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1621983743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7kafmThOz3eNzZ1ujEOerebfXF333jroyu7OdlmXeos=;
        b=Hi1O27cylViv3Bz23a7Py7dP85gBgqHB9RhtQNgsTMFszDqvsrP+D2HJ1Xy4HN5D7HgvpB
        O/4b1R6ud9LkDXrCxD2XuBkbWh7QXfOJA9s6cwGmABXZl2w+lhygU3bokbuBeR9+pt9ZB2
        /UeKpXzFcCGfUG2jOl6H98USFb6qm+/UU1ByN+FhCLvRpQDnzvGpS2NbllWwIja5q69Ijm
        M1RDBrCY99EM09eJqmKKY9rnRPzocORqiIZ5oX4tsnYU1l0mTiVkKbS+spRYtyOeb0hzz2
        WD5tW90Qf6cztiD4e9M/YcyEE7Y9QPvnwZsjqz3O6Q3s/9QKCt+WpwnmlFjlYg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1621983743;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7kafmThOz3eNzZ1ujEOerebfXF333jroyu7OdlmXeos=;
        b=01SOOT2peEnBmAk75iLCSnUPMYjDqpXmGQB5B+cGYguX3hv3HzZrci2pkMfiwDf53vOdyI
        aAKVSQg+IOSbkmAw==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH v2 2/5] builddeb: set CC on cross build to prefixed gcc
Date:   Wed, 26 May 2021 01:01:36 +0200
Message-Id: <20210525230139.6165-3-bage@linutronix.de>
In-Reply-To: <20210525230139.6165-1-bage@linutronix.de>
References: <20210525230139.6165-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

Building the generated package with CC unset will fail for cross
compilation. Detect that and set CC to a sane default prefixed by
dpkg-architecture's DEB_HOST_GNU_TYPE variable.

Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/mkdebian | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index b317d26e2bbf..449e284a449c 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -223,6 +223,14 @@ fi
 cat <<EOF > debian/rules
 #!$(command -v $MAKE) -f
 
+include /usr/share/dpkg/architecture.mk
+
+ifneq (\$(DEB_BUILD_GNU_TYPE),\$(DEB_HOST_GNU_TYPE))
+ifeq (\$(origin CC),default)
+CC := \$(DEB_HOST_GNU_TYPE)-gcc
+endif
+endif
+
 srctree ?= .
 
 build-indep:
-- 
2.30.2

