Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B76A3EFA2C
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 07:38:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237618AbhHRFir (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 01:38:47 -0400
Received: from smtprelay0254.hostedemail.com ([216.40.44.254]:51240 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S237588AbhHRFiq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 01:38:46 -0400
X-Greylist: delayed 391 seconds by postgrey-1.27 at vger.kernel.org; Wed, 18 Aug 2021 01:38:46 EDT
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com [10.5.19.251])
        by smtpgrave01.hostedemail.com (Postfix) with ESMTP id 195C1183EE7A4
        for <linux-kbuild@vger.kernel.org>; Wed, 18 Aug 2021 05:31:43 +0000 (UTC)
Received: from omf17.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 0B102183F79A5;
        Wed, 18 Aug 2021 05:31:38 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 9403D27DD38;
        Wed, 18 Aug 2021 05:31:33 +0000 (UTC)
Message-ID: <f3e56f56c36b32dc76e174886008a2a1ecf3fefa.camel@perches.com>
Subject: Re: [PATCH 2/5] slab: Add __alloc_size attributes for better bounds
 checking
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org
Cc:     Daniel Micay <danielmicay@gmail.com>,
        Christoph Lameter <cl@linux.com>,
        Pekka Enberg <penberg@kernel.org>,
        David Rientjes <rientjes@google.com>,
        Joonsoo Kim <iamjoonsoo.kim@lge.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Vlastimil Babka <vbabka@suse.cz>, linux-mm@kvack.org,
        Miguel Ojeda <ojeda@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-hardening@vger.kernel.org
Date:   Tue, 17 Aug 2021 22:31:32 -0700
In-Reply-To: <20210818050841.2226600-3-keescook@chromium.org>
References: <20210818050841.2226600-1-keescook@chromium.org>
         <20210818050841.2226600-3-keescook@chromium.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: kazeuswp33idfqrb7eqs6yyhwczrkq3u
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 9403D27DD38
X-Spam-Status: No, score=0.10
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/uEF5/fBpMfVSWUWGASCCc76xkvowtGVk=
X-HE-Tag: 1629264693-636294
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2021-08-17 at 22:08 -0700, Kees Cook wrote:
> As already done in GrapheneOS, add the __alloc_size attribute for
> regular kmalloc interfaces, to provide additional hinting for better
> bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
> optimizations.
[]
> diff --git a/include/linux/slab.h b/include/linux/slab.h
[]
> @@ -181,7 +181,7 @@ int kmem_cache_shrink(struct kmem_cache *);
>  /*
>   * Common kmalloc functions provided by all allocators
>   */
> -void * __must_check krealloc(const void *, size_t, gfp_t);
> +void * __must_check krealloc(const void *, size_t, gfp_t) __alloc_size(2);

I suggest the __alloc_size attribute be placed at the beginning of the
function declaration to be more similar to the common __printf attribute
location uses.

__alloc_size(2)
void * __must_check krealloc(const void *, size_t, gfp_t);

I really prefer the __must_check to be with the other attribute and that
function declarations have argument names too like:

__alloc_size(2) __must_check
void *krealloc(const void *ptr, size_t size, gfp_t gfp);

but there are a _lot_ of placement of __must_check after the return type

Lastly __alloc_size should probably be added to checkpatch

Maybe:
---
 scripts/checkpatch.pl | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 161ce7fe5d1e5..1a166b5cf3447 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -489,7 +489,8 @@ our $Attribute	= qr{
 			____cacheline_aligned|
 			____cacheline_aligned_in_smp|
 			____cacheline_internodealigned_in_smp|
-			__weak
+			__weak|
+			__alloc_size\s*\(\s*\d+\s*(?:,\s*d+\s*){0,5}\)
 		  }x;
 our $Modifier;
 our $Inline	= qr{inline|__always_inline|noinline|__inline|__inline__};


