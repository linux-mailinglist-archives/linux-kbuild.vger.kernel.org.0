Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 79BBF12FBE7
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 18:59:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728272AbgACR7k (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 12:59:40 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64713 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728220AbgACR7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:39 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJ6022724;
        Sat, 4 Jan 2020 02:59:31 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJ6022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074371;
        bh=bJfY9P/JRKRZL7zus1oisBlsP9ihX0EmmC9HMpfIWSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=PTu8eM5NHXVqrx5W1k/BibTYQ0P4tMRWzZvHSbFNWXpZ6kxxVnWK1xBvz7QzgdNkj
         jDEC15QKl6bSHyX9S/qbDMKQ9ixMvaRO4yDrrLjWpATl2X3otG12gWzxnaVm13Lk5k
         8wAb0w1g7417BhkzYSbCy5Asxp81gug3naTYzYd4ssC/fIDJVQArVqxGWOXdL9hqyW
         +AT3N66EgAhgBLOgA1Hh61TVWhaULFXPwYsLg5mmktpEhjCN8WlMOKNzv8+Pv2SE17
         RHn5RY/50mGN38cVNVDeaL6gjyH4lYrrmlyhMhHgGdWYJrzIJ29mBY3GWdICteylKk
         sncjN4GY//lUw==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/12] initramfs: make compression options not depend on INITRAMFS_SOURCE
Date:   Sat,  4 Jan 2020 02:59:08 +0900
Message-Id: <20200103175915.26663-6-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Even if INITRAMFS_SOURCE is empty, usr/gen_initramfs.sh generates a
tiny default initramfs, which is embedded in vmlinux.

So, defining INITRAMFS_COMPRESSION* options should be valid irrespective
of INITRAMFS_SOURCE.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/Kconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/usr/Kconfig b/usr/Kconfig
index 72f50a21c051..43934c128010 100644
--- a/usr/Kconfig
+++ b/usr/Kconfig
@@ -102,7 +102,6 @@ config RD_LZ4
 
 choice
 	prompt "Built-in initramfs compression mode"
-	depends on INITRAMFS_SOURCE!=""
 	optional
 	help
 	  This option allows you to decide by which algorithm the builtin
@@ -211,7 +210,6 @@ config INITRAMFS_COMPRESSION_LZ4
 endchoice
 
 config INITRAMFS_COMPRESSION
-	depends on INITRAMFS_SOURCE!=""
 	string
 	default ""      if INITRAMFS_COMPRESSION_NONE
 	default ".gz"   if INITRAMFS_COMPRESSION_GZIP
-- 
2.17.1

