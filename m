Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFDA25DC40
	for <lists+linux-kbuild@lfdr.de>; Fri,  4 Sep 2020 16:53:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730454AbgIDOx1 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 4 Sep 2020 10:53:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730258AbgIDOxZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 4 Sep 2020 10:53:25 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAD6C061244;
        Fri,  4 Sep 2020 07:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=C93Bva8rREpRWfgd7uzk8ZfeKaPFHiRbyRDvw46iFOY=; b=fbndYahXL3+H/DTtCdOhDFUJhi
        KVxjkuQrILC5BBiHjjAYVAAS8AMgMvEEBMZq/ENhS2eoD4JSr111zHQPRJRunYUrd6OchzZ/VXJP6
        aPejgJmTN/JqI6V4R5Sdp7z1MIgB6+lJlVhXVszqO+WhNMhr7viYzohbRHP0vV3H5IFgETtLo0rL1
        Wz9I8M6ZV3olAgafOMud40YICuq32e87J+Nb3lzq9aCYjRt/xBMWQKlL5Qh2XSDmCFjLDMmNb/kq7
        M8BDJaoYnhXsOSEJvf/7eIWg+SGuMBtS1S7bkVuWWev8qLB7v1redbLB4B8o4bGd+YyZPMVR8iemj
        Wr8FxhQg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=noisy.programming.kicks-ass.net)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kED5e-0001OI-VL; Fri, 04 Sep 2020 14:53:23 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client did not present a certificate)
        by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 924D9301179;
        Fri,  4 Sep 2020 16:53:22 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 58B0029E3DDBE; Fri,  4 Sep 2020 16:53:22 +0200 (CEST)
Date:   Fri, 4 Sep 2020 16:53:22 +0200
From:   peterz@infradead.org
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH -v2] scipts/tags.sh: Add custom sort order
Message-ID: <20200904145322.GA35926@hirez.programming.kicks-ass.net>
References: <20200805102550.GO2674@hirez.programming.kicks-ass.net>
 <20200806120438.GG35926@hirez.programming.kicks-ass.net>
 <CAK7LNAQE2jPUQJUa1yi7+=w--Jj-wwnGVR2hyPQZxR7Yp9odBA@mail.gmail.com>
 <20200902162649.GL1362448@hirez.programming.kicks-ass.net>
 <CAK7LNAS+0QtvgX1b77Y51cuMQ-eK4cKb8rebTQ=Ug3F2rkjP2g@mail.gmail.com>
 <20200903072604.GT1362448@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200903072604.GT1362448@hirez.programming.kicks-ass.net>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Sep 03, 2020 at 09:26:04AM +0200, peterz@infradead.org wrote:
> On Thu, Sep 03, 2020 at 11:07:28AM +0900, Masahiro Yamada wrote:

> > Will re-implementing your sorting logic
> > in bash look cleaner?
> 
> Possibly, I can try, we'll see.

It is somewhat cleaner, but it is _abysmally_ slow. Bash sucks :-(

It is still broken in all the same ways as before, I figured I'd get it
'working' first.

---
diff --git a/scripts/tags.sh b/scripts/tags.sh
index 32d3f53af10b..ec2688b3441a 100755
--- a/scripts/tags.sh
+++ b/scripts/tags.sh
@@ -239,10 +239,65 @@ setup_regex()
 	done
 }
 
+sort_tags()
+{
+	export LC_ALL=C
+
+	# start concurrent sort
+	coproc sort
+	# HACK, clone sort output into 3 to ensure we can still read it
+	# after sort terminates
+	exec 3<&${COPROC[0]}
+
+	while read tag file rest;
+	do
+		local tmp=${rest#*;\"}
+
+		case "${tmp:1:1}" in # Precedence for 'C' kinds
+
+		c) order="A";; # classes
+		s) order="B";; # structure names
+		t) order="C";; # typedefs
+		g) order="D";; # enumeration names
+		u) order="E";; # union names
+		n) order="F";; # namespaces
+
+		f) order="G";; # function definitions
+		p) order="H";; # function prototypes
+		d) order="I";; # macro definitions
+
+		e) order="J";; # enumerators (values inside an enumeration)
+		m) order="K";; # class, struct and union members
+		v) order="L";; # variable definitions
+
+		l) order="M";; # local variables [off]
+		x) order="N";; # external and forward variable declarations
+
+		*) order="Z";;
+
+		esac
+
+		# write to sort with a new sort-key prepended
+		echo "${tag}${order}	${tag}	${file}	${rest}" >&${COPROC[1]}
+	done
+
+	# close sort input
+	exec {COPROC[1]}>&-
+
+	# consume sort output
+	while read -u 3 key line;
+	do
+		# strip the sort-key
+		echo "${line}"
+	done
+}
+
 exuberant()
 {
+	(
+
 	setup_regex exuberant asm c
-	all_target_sources | xargs $1 -a                        \
+	all_target_sources | xargs $1                           \
 	-I __initdata,__exitdata,__initconst,__ro_after_init	\
 	-I __initdata_memblock					\
 	-I __refdata,__attribute,__maybe_unused,__always_unused \
@@ -256,12 +311,16 @@ exuberant()
 	-I DEFINE_TRACE,EXPORT_TRACEPOINT_SYMBOL,EXPORT_TRACEPOINT_SYMBOL_GPL \
 	-I static,const						\
 	--extra=+fq --c-kinds=+px --fields=+iaS --langmap=c:+.h \
+	--sort=no -o -						\
 	"${regex[@]}"
 
 	setup_regex exuberant kconfig
-	all_kconfigs | xargs $1 -a                              \
+	all_kconfigs | xargs $1                                 \
+	--sort=no -o -						\
 	--langdef=kconfig --language-force=kconfig "${regex[@]}"
 
+	) | sort_tags > tags
+
 }
 
 emacs()
