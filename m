Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84BE149344
	for <lists+linux-kbuild@lfdr.de>; Sat, 25 Jan 2020 05:13:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgAYENM (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 24 Jan 2020 23:13:12 -0500
Received: from conuserg-09.nifty.com ([210.131.2.76]:28180 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbgAYENL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 24 Jan 2020 23:13:11 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 00P4CcjS032210;
        Sat, 25 Jan 2020 13:12:39 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 00P4CcjS032210
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1579925559;
        bh=X/wkV6avTrwPTXdELDBmqNsqA0J2HLOgmvKqcuficjo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=rKFCAGLfzSsrZ3P0rBq48NqePjzKYag+KQj5GDtMKduOB5Q2z6flvW9Ys+kgev1Ff
         tAvdG/Z6MRxQviJzAvDsPI93zoxvtyZKTP+CCJNf/LRhBhlQJhWDaAo85g67+gW8VK
         4RUOisTzMfXwz3gtMCP6R9jJoz95yodl+Vz59kA6SSA6Rex3uFoLVnWl+fcPhpt14R
         xBgWfefZHSWGJT7j6NAoMt+VcDQ4CsjKnYP8TxUVqnnBVIGgJzgu5Ans3hvxdNu7QP
         Mp/Ymk4BHch4WTUpEPON2ZwbhRfA/JoFuJASOxB+vNAAjUQ3lf5zPhkB2SN0qZ59Yn
         pKZGQoTDcFmDA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ben Hutchings <ben@decadent.org.uk>,
        Riku Voipio <riku.voipio@linaro.org>,
        linux-kernel@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Subject: [PATCH v3 2/7] builddeb: match temporary directory name to the package name
Date:   Sat, 25 Jan 2020 13:12:30 +0900
Message-Id: <20200125041235.8856-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200125041235.8856-1-masahiroy@kernel.org>
References: <20200125041235.8856-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The temporary directory names, debian/hdrtmp (linux-headers package)
vs debian/headertmp (linux-libc-dev package), are confusing.

Matching the directory name to the package name is clearer, IMHO.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v3: None
Changes in v2: None

 scripts/package/builddeb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index d4bb28fbd3de..d72267835373 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -47,10 +47,10 @@ create_package() {
 }
 
 version=$KERNELRELEASE
-tmpdir="$objtree/debian/tmp"
-kernel_headers_dir="$objtree/debian/hdrtmp"
-libc_headers_dir="$objtree/debian/headertmp"
-dbg_dir="$objtree/debian/dbgtmp"
+tmpdir="$objtree/debian/linux-image"
+kernel_headers_dir="$objtree/debian/linux-headers"
+libc_headers_dir="$objtree/debian/linux-libc-dev"
+dbg_dir="$objtree/debian/linux-image-dbg"
 packagename=linux-image-$version
 kernel_headers_packagename=linux-headers-$version
 libc_headers_packagename=linux-libc-dev
-- 
2.17.1

