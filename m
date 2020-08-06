Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D5C923DEAF
	for <lists+linux-kbuild@lfdr.de>; Thu,  6 Aug 2020 19:29:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729222AbgHFR2q (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 6 Aug 2020 13:28:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729725AbgHFRA4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Aug 2020 13:00:56 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9EEB6C061A15;
        Thu,  6 Aug 2020 05:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=EGNqm2OAGxLKcqDl+GdAdBwWIqcANnBJ4vDsUT0HyC0=; b=RZ97opg7YyhEx3dt2aRYJLyN3x
        sMcvQavppfwGjG6PNlaXjS36Sq3ScvJf6bnKt3qzer4f3S3Sx95AtBW4LFMR72fd0NlV/kp8vGTPB
        laZ7kd9VE78v9mtPcE8z5B5fik228y4ZayWvIqcpYVqEC/fCCYv77IHJtdUP0QlkO4g1xTO+fAuPZ
        JzJCoI1T95ENxYHpdzzy4dOm9Aw7Rbg1Y4bWhLhpqW3EOhlImxGfe7+TxanKtXtXgqwMaBFeXKTCD
        oXkkciAw+5ENq2rfPqispnr2q376UgbEvwdxMbxW3PBW50Jl4DqH8SHeHv13V5awAq7ItNidFq1K0
        txEb0Qig==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k3edT-0007ez-KY; Thu, 06 Aug 2020 12:04:39 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id C2E34301A66;
        Thu,  6 Aug 2020 14:04:38 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 6CCE12123A1E1; Thu,  6 Aug 2020 14:04:38 +0200 (CEST)
Date:   Thu, 6 Aug 2020 14:04:38 +0200
From:   peterz@infradead.org
To:     yamada.masahiro@socionext.com
Cc:     linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org
Subject: [PATCH -v2] scipts/tags.sh: Add custom sort order
Message-ID: <20200806120438.GG35926@hirez.programming.kicks-ass.net>
References: <20200805102550.GO2674@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805102550.GO2674@hirez.programming.kicks-ass.net>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org


One long standing annoyance I have with using vim-tags is that our tags
file is not properly sorted. That is, the sorting exhuberant Ctags does
is only on the tag itself.

The problem with that is that, for example, the tag 'mutex' appears a
mere 505 times, 492 of those are structure members. However it is _far_
more likely that someone wants the struct definition when looking for
the mutex tag than any of those members. However, due to the nature of
the sorting, the struct definition will not be first.

So add a script that does a custom sort of the tags file, taking the tag
kind into account.

The kind ordering is roughly: 'type', 'function', 'macro', 'enum', rest.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
Changes since v1:
 - removed the need for tags.unsorted by using a pipe

Due to this change 'make tags' is now actually faster than it was before
due to less sorting.

 scripts/sort-tags.awk | 79 +++++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/tags.sh       | 11 +++++--
 2 files changed, 87 insertions(+), 3 deletions(-)

diff --git a/scripts/sort-tags.awk b/scripts/sort-tags.awk
new file mode 100755
index 000000000000..1eb50406c9d3
--- /dev/null
+++ b/scripts/sort-tags.awk
@@ -0,0 +1,79 @@
+#!/usr/bin/awk -f
+
+# $ ctags --list-kinds
+# C
+#   c  classes
+#   s  structure names
+#   t  typedefs
+#   g  enumeration names
+#   u  union names
+#   n  namespaces
+
+#   f  function definitions
+#   p  function prototypes [off]
+#   d  macro definitions
+
+#   e  enumerators (values inside an enumeration)
+#   m  class, struct, and union members
+#   v  variable definitions
+
+#   l  local variables [off]
+#   x  external and forward variable declarations [off]
+
+BEGIN {
+	FS = "\t"
+
+	sort = "LC_ALL=C sort"
+
+	# our sort order for C kinds:
+	order["c"] = "A"
+	order["s"] = "B"
+	order["t"] = "C"
+	order["g"] = "D"
+	order["u"] = "E"
+	order["n"] = "F"
+	order["f"] = "G"
+	order["p"] = "H"
+	order["d"] = "I"
+	order["e"] = "J"
+	order["m"] = "K"
+	order["v"] = "L"
+	order["l"] = "M"
+	order["x"] = "N"
+}
+
+# pass through header
+/^!_TAG/ {
+	print $0
+	next
+}
+
+{
+	# find 'kinds'
+	for (i = 1; i <= NF; i++) {
+		if ($i ~ /;"$/) {
+			kind = $(i+1)
+			break;
+		}
+	}
+
+	# create sort key
+	if (order[kind])
+		key = $1 order[kind];
+	else
+		key = $1 "Z";
+
+	# get it sorted
+	print key "\t" $0 |& sort
+}
+
+END {
+	close(sort, "to")
+	while ((sort |& getline) > 0) {
+		# strip key
+		sub(/[^[:space:]]*[[:space:]]*/, "")
+		print $0
+	}
+	close(sort)
+}
+
diff --git a/scripts/tags.sh b/scripts/tags.sh
index 4e18ae5282a6..51087c3d8b1e 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -251,8 +251,10 @@ setup_regex()
 
 exuberant()
 {
+	(
+
 	setup_regex exuberant asm c
-	all_target_sources | xargs $1 -a                        \
+	all_target_sources | xargs $1				\
 	-I __initdata,__exitdata,__initconst,__ro_after_init	\
 	-I __initdata_memblock					\
 	-I __refdata,__attribute,__maybe_unused,__always_unused \
@@ -266,12 +268,15 @@ exuberant()
 	-I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
 	-I static,const						\
 	--extra=+fq --c-kinds=+px --fields=+iaS --langmap=c:+.h \
+	--sort=no -o -						\
 	"${regex[@]}"
 
 	setup_regex exuberant kconfig
-	all_kconfigs | xargs $1 -a                              \
-	--langdef=kconfig --language-force=kconfig "${regex[@]}"
+	all_kconfigs | xargs $1					\
+	--langdef=kconfig --language-force=kconfig --sort=no	\
+	-o - "${regex[@]}"
 
+	) | scripts/sort-tags.awk > tags
 }
 
 emacs()
