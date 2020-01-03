Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5D20812FBF3
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 19:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728362AbgACR77 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 12:59:59 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64711 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728110AbgACR7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:39 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJ2022724;
        Sat, 4 Jan 2020 02:59:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJ2022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074369;
        bh=zoAmWBfqVWksao6CrQDMXgz0tVFyw9MhTptiTkdSm+Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=wcAhjkbI3zZJMz8+G6QH/1O3pTb1EfIxNiVR/4arYaJ4K6iKS1I6uymllQj2Dfh5w
         9PahHjR6X4DFFMuep4BpFHvc/nLvUqS2yDYKLfGO/qQ9lhLyNQLcpl2Df24wPw+w1q
         BY92IjDSRHY4tdUnfWHvBL295m822KdBG9nsC+MXMoMJuuEcQDx+FPum+cPlNzv/Do
         VIdI6LEKaNDlKCaQzu3JcP8S5Ah1gnIXn/5h9OUjok6mRFctgPO/Qj2kuxgQVmdnJQ
         t9/ntZH1E03wVqrXeZeSRP46KcoYxyAVVR9bn7LWuNGWWsbJlkjlyBhixORJWSRk33
         wvI//duEbgMOA==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 01/12] gen_initramfs_list.sh: remove unused variable 'default_list'
Date:   Sat,  4 Jan 2020 02:59:04 +0900
Message-Id: <20200103175915.26663-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

This is assigned, but not referenced.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/gen_initramfs_list.sh | 1 -
 1 file changed, 1 deletion(-)

diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
index 2bbac73e6477..909a7b865aa7 100755
--- a/usr/gen_initramfs_list.sh
+++ b/usr/gen_initramfs_list.sh
@@ -280,7 +280,6 @@ while [ $# -gt 0 ]; do
 			shift
 			;;
 		"-d")	# display default initramfs list
-			default_list="$arg"
 			${dep_list}default_initramfs
 			;;
 		"-h")
-- 
2.17.1

