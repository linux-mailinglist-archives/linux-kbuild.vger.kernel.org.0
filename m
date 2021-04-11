Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7705335B304
	for <lists+linux-kbuild@lfdr.de>; Sun, 11 Apr 2021 12:14:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbhDKKO6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 11 Apr 2021 06:14:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235229AbhDKKO5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Apr 2021 06:14:57 -0400
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA3CEC06138D
        for <linux-kbuild@vger.kernel.org>; Sun, 11 Apr 2021 03:14:41 -0700 (PDT)
From:   bage@linutronix.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1618136078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5s6pA65p/yfFUofwR6oMI3HJ1MVNvuCzB7HAJwIb11I=;
        b=Xezv23OQvaLsHN9nTDPz4fy7fNZYt1HiA2JBghTVB+xvu0mLI2J0lRQsfm8ReJBjGrwTeC
        aQMki2gFVTwjGt6ApcXXLOBmPWAuF/1q5uXaSw0YFbtvjBe8VWysHW7Y09bGS7DczhvyMe
        w8KwZZw6jbCTkzERvhGmg7bhgyTzpTbPVWbDs2nn5ZkaBcUGLskHNPvkYiW8DDHbhhPMNZ
        EWDMoRxuqL0n1rnMRZcDEAuzch/BdHKUp6GTkBubOWL2PBnJqtJOo+fIKDnseqe7EawAT5
        kwmwDFToE2+iuwuBGGgQxCKyP9F6r6uRe1lZExBz03ivLbMboJAfj6bXeVVg3A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1618136078;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=5s6pA65p/yfFUofwR6oMI3HJ1MVNvuCzB7HAJwIb11I=;
        b=kByPnUjZoBw5ZhR6Iix4e0DmGEwn0wfUjsxW25YzgyncU8P0FVRSQcgDA+D9srMxd2V0SO
        ezbvQAeKAxSGG9Ag==
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Cc:     Bastian Germann <bage@linutronix.de>, linux-kbuild@vger.kernel.org,
        tglx@linutronix.de
Subject: [PATCH 4/6] builddeb: use standard format for copyright file
Date:   Sun, 11 Apr 2021 12:14:20 +0200
Message-Id: <20210411101422.7092-5-bage@linutronix.de>
In-Reply-To: <20210411101422.7092-1-bage@linutronix.de>
References: <20210411101422.7092-1-bage@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

From: Bastian Germann <bage@linutronix.de>

Convert the minimal copyright file to the DEP-5 standard format that is
commonly used in Debian.

Link: https://trends.debian.net/#copyright-format-machine-readable-dep-5-vs-old-format
Signed-off-by: Bastian Germann <bage@linutronix.de>
---
 scripts/package/mkdebian | 27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index 717223ef6b03..bb5c19735345 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -152,22 +152,23 @@ EOF
 
 # Generate copyright file
 cat <<EOF > debian/copyright
-This is a packacked upstream version of the Linux kernel.
-
-The sources may be found at most Linux archive sites, including:
-https://www.kernel.org/pub/linux/kernel
-
-Copyright: 1991 - 2018 Linus Torvalds and others.
-
-The git repository for mainline kernel development is at:
-git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
-
+Format: https://www.debian.org/doc/packaging-manuals/copyright-format/1.0/
+Upstream-Name: Linux
+Source: https://www.kernel.org/pub/linux/kernel
+Comment: This is a packaged upstream version of the Linux kernel.
+
+Files: *
+Copyright: 1991 - 2021 Linus Torvalds and others.
+License: GPL-2
+ The git repository for mainline kernel development is at:
+ git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
+ .
     This program is free software; you can redistribute it and/or modify
     it under the terms of the GNU General Public License as published by
     the Free Software Foundation; version 2 dated June, 1991.
-
-On Debian GNU/Linux systems, the complete text of the GNU General Public
-License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
+ .
+ On Debian GNU/Linux systems, the complete text of the GNU General Public
+ License version 2 can be found in \`/usr/share/common-licenses/GPL-2'.
 EOF
 
 # Generate a control file
-- 
2.30.2

