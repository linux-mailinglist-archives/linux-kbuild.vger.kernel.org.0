Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B15917F4D2
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2020 11:15:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgCJKPN (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Mar 2020 06:15:13 -0400
Received: from conuserg-09.nifty.com ([210.131.2.76]:28070 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbgCJKPN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 06:15:13 -0400
Received: from localhost.localdomain (p14092-ipngnfx01kyoto.kyoto.ocn.ne.jp [153.142.97.92]) (authenticated)
        by conuserg-09.nifty.com with ESMTP id 02AACqfV019796;
        Tue, 10 Mar 2020 19:12:53 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-09.nifty.com 02AACqfV019796
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1583835174;
        bh=c1hiVSalTfFe0k0/wchrmFhfrgNpWjBz7yfa9mrIes0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=czPo1Alz4v2bYy/O+q1ieUqOMyecpHvIpktuzimVqNuSLSW59yllVakJKLtmz+z40
         yOKERYzt+YCkxIqs7mQdJHtYA7sxpB54U/94Lu6Mo2udosIOymxVX3ifGZajrk5YHV
         y9DAzF3XmhsdprFlMsBZOZYKD/g4QyDUv93/1/G6o85FzesJ+32gw7hHJOJCzQJtvo
         no/VAdi3c8JpC4+3UMLk+cs/orlJ6vaUxybrzWKG+621Sk5gmrtC6aHW5VyhWgqyDe
         w8A5BZAf1opTQjUIxh3iIkI0Q8Zjfg7SN0VjCrsyIwDxed7S/2nGS8EIBzXedUTpet
         y7zsLNw7eD/rA==
X-Nifty-SrcIP: [153.142.97.92]
From:   Masahiro Yamada <masahiroy@kernel.org>
To:     linux-kbuild@vger.kernel.org
Cc:     Ard Biesheuvel <ardb@kernel.org>, George Spelvin <lkml@sdf.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        David Howells <dhowells@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Patrick Bellasi <patrick.bellasi@arm.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] int128: fix __uint128_t compiler test in Kconfig
Date:   Tue, 10 Mar 2020 19:12:50 +0900
Message-Id: <20200310101250.22374-2-masahiroy@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200310101250.22374-1-masahiroy@kernel.org>
References: <20200310101250.22374-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

The support for __uint128_t is dependent on the target bit size.

GCC that defaults to the 32-bit can still build the 64-bit kernel
with -m64 flag passed.

However, $(cc-option,-D__SIZEOF_INT128__=0) is evaluated against the
default machine bit, which may not match to the kernel it is building.

Theoretically, this could be evaluated separately for 64BIT/32BIT.

  config CC_HAS_INT128
          bool
          default !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) if 64BIT
          default !$(cc-option,$(m32-flag) -D__SIZEOF_INT128__=0)

I simplified it more because the 32-bit compiler is unlikely to support
__uint128_t.

Fixes: c12d3362a74b ("int128: move __uint128_t compiler test to Kconfig")
Reported-by: George Spelvin <lkml@sdf.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 init/Kconfig | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/init/Kconfig b/init/Kconfig
index 20a6ac33761c..4f717bfdbfe2 100644
--- a/init/Kconfig
+++ b/init/Kconfig
@@ -767,8 +767,7 @@ config ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	bool
 
 config CC_HAS_INT128
-	def_bool y
-	depends on !$(cc-option,-D__SIZEOF_INT128__=0)
+	def_bool !$(cc-option,$(m64-flag) -D__SIZEOF_INT128__=0) && 64BIT
 
 #
 # For architectures that know their GCC __int128 support is sound
-- 
2.17.1

