Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 383C4440D5A
	for <lists+linux-kbuild@lfdr.de>; Sun, 31 Oct 2021 07:33:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbhJaGf4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 31 Oct 2021 02:35:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbhJaGfz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 31 Oct 2021 02:35:55 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A479DC061570;
        Sat, 30 Oct 2021 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=5UQCkPFBQN2ny5fsoShcXhE1TmXwRaGEXGfIKwPR5nM=; b=MG81UmGaKWP24T5hF+ZepKdrPh
        A5ht6gORJ04D939dN/dyzD3IQL4zZiJLHVu8p7FKb/fhxRvegbRvKFtEyc3QTJ5CNPUvQYbTtkb/n
        OMoXWCWyYS79v+0D/NeGE5ssnixRf5cJFpbI4dHuG7FtLe5Bhamj+yRUVh6ciKxPtZ/8qiBf18pVz
        s2Qcq3oi2CYrEavdVGNQaQFu85bTevjId+w6mMWOL27shht1BesT5HgaYrw+ugvv2yR6WMQ1i/bi1
        ntVqNU5eRWtNunZIgUEfqzeeJ/lUJub6IyGGopmQxSorMtMtWn9lQbB22K0wW5n1vUCDzQCWfwybi
        yPrGgg/Q==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mh4PD-00DiU7-9P; Sun, 31 Oct 2021 06:33:23 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Subject: [PATCH] scripts/config: allow "O=config-dir" option
Date:   Sat, 30 Oct 2021 23:33:22 -0700
Message-Id: <20211031063322.20486-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Support "O=config-dir" as the location of the .config file
like (some) other kernel build (make) tools do.

Someone asked for this "feature" a few months ago but I don't
recall who it was.

Also check for the existence of the config-dir/config-file
and report if there is no such file instead of letting grep
report that there is no such file.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <ak@linux.intel.com>
---
 scripts/config |   44 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

--- linux-next-20211029.orig/scripts/config
+++ linux-next-20211029/scripts/config
@@ -37,6 +37,7 @@ commands:
 
 options:
 	--file config-file   .config file to change (default .config)
+	O=config-dir         Specify the directory location of the config-file
 	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
 
 $myname doesn't check the validity of the .config file. This is done at next
@@ -124,15 +125,48 @@ undef_var() {
 	txt_delete "^# $name is not set" "$FN"
 }
 
-if [ "$1" = "--file" ]; then
-	FN="$2"
-	if [ "$FN" = "" ] ; then
+DIR=
+FN=
+
+while [ "$DIR" = "" -o "$FN" = "" ]; do
+
+	if [ "$1" = "" ] ; then
 		usage
 	fi
-	shift 2
-else
+	if [ "$1" = "--file" ]; then
+		FN="$2"
+		if [ "$FN" = "" ] ; then
+			usage
+		fi
+		shift 2
+		continue
+	fi
+
+	optn=$1
+	optnlen=${#optn}
+	if [ $optnlen -gt 1 ] && [ ${optn:0:2} = "O=" ]; then
+		DIR=${optn:2}
+		shift
+		if [ "$DIR" = "" ]; then
+			usage
+		fi
+		continue
+	fi
+	break	# something other than --file or O=dir
+done
+
+if [ "$FN" = "" ]; then
 	FN=.config
 fi
+if [ "$DIR" != "" ]; then
+	DIR=$DIR"/"
+fi
+FN="$DIR""$FN"
+
+if [ ! -r $FN ]; then
+	echo "No such config file: $FN"
+	exit
+fi
 
 if [ "$1" = "" ] ; then
 	usage
