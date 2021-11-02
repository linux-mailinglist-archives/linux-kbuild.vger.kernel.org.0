Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F24B4438A6
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Nov 2021 23:40:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230293AbhKBWnW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Nov 2021 18:43:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229844AbhKBWnV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Nov 2021 18:43:21 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42E37C061714;
        Tue,  2 Nov 2021 15:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=cOU6fJ6CIwTv1kvDcNkH1XvDvhXueDW5em6fcmrW0X4=; b=ea1z5WE4/rsiqR0KskFWKrquok
        S7Y+UQxZ0agrpfn7vL7DNXtuu8vkMktBTW8b8loo4D9gkLw3y+ghXBf/kRCSX1h7OnXt6VGxZRb7P
        fzldcorGwZTEDdR/pT5/4a6agAzgSy9+wrtZpi2nK4VmQKB1leHxK861/EYaBQooum8cZMZK93tUD
        zS+Bc8zETovVHht9Imcy4P/wNzWdiUjI/fzU2lrMRwGYb644uQdWULK5gMU8vvapc3P48rnYg7vvU
        igirSnUIvTncEH/EgMxsjRGRz0Vp8OqnHfmymtsXJk9HDmKBB493L4okdJrDw3SD7BI6X4iuTqBKm
        pIEIzEJw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mi2SQ-003Bvx-5t; Tue, 02 Nov 2021 22:40:42 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
        Nicolas Schier <nicolas@fjasle.eu>
Subject: [PATCH v2] scripts/config: allow "O=config-dir" option
Date:   Tue,  2 Nov 2021 15:40:41 -0700
Message-Id: <20211102224041.5105-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Support "O=config-dir" as the location of the .config file
like (some) other kernel build (make) tools do.

Also check for the existence of the config-dir/config-file
and report if there is no such file instead of letting grep
report that there is no such file.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>
Cc: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <ak@linux.intel.com>
Reviewed-by: Nicolas Schier <nicolas@fjasle.eu>
---
v2:
- use 'shellcheck' and other recommendations from Nicolas
- move one comment from the commit description to under the "---" line

Someone asked for this "feature" a few months ago but I don't
recall who it was.

 scripts/config |   44 +++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 5 deletions(-)

--- linux-next-20211102.orig/scripts/config
+++ linux-next-20211102/scripts/config
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
+while [ "$DIR" = "" ] || [ "$FN" = "" ]; do
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
+	if [ "$optnlen" -gt 1 ] && [ "${optn:0:2}" = "O=" ]; then
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
+FN="${DIR}${FN}"
+
+if [ ! -r "$FN" ]; then
+	echo "No such config file: $FN"
+	exit
+fi
 
 if [ "$1" = "" ] ; then
 	usage
