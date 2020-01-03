Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 474A412FBF5
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Jan 2020 19:00:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728370AbgACSAA (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Jan 2020 13:00:00 -0500
Received: from conuserg-07.nifty.com ([210.131.2.74]:64708 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728218AbgACR7j (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Jan 2020 12:59:39 -0500
Received: from grover.flets-west.jp (softbank126093102113.bbtec.net [126.93.102.113]) (authenticated)
        by conuserg-07.nifty.com with ESMTP id 003HxSJ3022724;
        Sat, 4 Jan 2020 02:59:29 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-07.nifty.com 003HxSJ3022724
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1578074370;
        bh=GRGGfCfoQ/0hyOTt3wty73oXtffQ+8+tIJPvI8S8JZw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bcezmG3abfJr6Y/Wu2vaPSno2Wovm0MI5BKGf+iR8g4VTlkk6jsbO8wpcacrF99Q4
         KtJOVRN7nJkV8l1VGfXN5UfRrMUOl7hY6mB7tuXX3YpDrakJoaLvwit/0Ych6HOx8L
         o1oMuw2iiWDq6BmQ3jkCf+Wf0Oo/7mplCbYlUxMKP+VLW8KRYfv7bRxCxrN+pXUT8N
         T7lB2Ju3Ccr8vJluVLAImg9g3m1Co6NJl+1g30+ltsZs+kFanAHjUp9IpIyxou8CXY
         Ei+3hbhPLUGXegCcfwSddUyAgTz/ndr9OjIMRrG5EDOmQNbt9Eh0XgRRwVGZ0wjLmr
         RpqGxxePtuh4A==
X-Nifty-SrcIP: [126.93.102.113]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 02/12] gen_initramfs_list.sh: fix the tool name in the comment
Date:   Sat,  4 Jan 2020 02:59:05 +0900
Message-Id: <20200103175915.26663-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200103175915.26663-1-masahiroy@kernel.org>
References: <20200103175915.26663-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

There is no tool named "gen_initramfs". The correct name is
"gen_init_cpio".

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 usr/gen_initramfs_list.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/usr/gen_initramfs_list.sh b/usr/gen_initramfs_list.sh
index 909a7b865aa7..1fd93414fb37 100755
--- a/usr/gen_initramfs_list.sh
+++ b/usr/gen_initramfs_list.sh
@@ -189,7 +189,7 @@ dir_filelist() {
 
 # if only one file is specified and it is .cpio file then use it direct as fs
 # if a directory is specified then add all files in given direcotry to fs
-# if a regular file is specified assume it is in gen_initramfs format
+# if a regular file is specified assume it is in gen_init_cpio format
 input_file() {
 	source="$1"
 	if [ -f "$1" ]; then
-- 
2.17.1

