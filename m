Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8839D3F0FD7
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 03:11:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234322AbhHSBLl (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 21:11:41 -0400
Received: from smtprelay0120.hostedemail.com ([216.40.44.120]:41386 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S232954AbhHSBLk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 21:11:40 -0400
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay07.hostedemail.com (Postfix) with ESMTP id 204F81847717B;
        Thu, 19 Aug 2021 01:11:04 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 2393B13D96;
        Thu, 19 Aug 2021 01:10:59 +0000 (UTC)
Message-ID: <3a0c55a3fabc57ce9771c93499ef19327f3b8621.camel@perches.com>
Subject: Re: [PATCH 2/5] slab: Add __alloc_size attributes for better bounds
 checking
From:   Joe Perches <joe@perches.com>
To:     Matthew Wilcox <willy@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>
Cc:     Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org,
        Daniel Micay <danielmicay@gmail.com>,
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
Date:   Wed, 18 Aug 2021 18:10:57 -0700
In-Reply-To: <YR2lexDd9N0sWxIW@casper.infradead.org>
References: <20210818050841.2226600-1-keescook@chromium.org>
         <20210818050841.2226600-3-keescook@chromium.org>
         <f3e56f56c36b32dc76e174886008a2a1ecf3fefa.camel@perches.com>
         <YR2lexDd9N0sWxIW@casper.infradead.org>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Stat-Signature: 8qe6xyoy57bos6zsdrn7c1ahwobp3eqw
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 2393B13D96
X-Spam-Status: No, score=0.08
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18uoPU/elFRF3Nb3Gx5R4/gAdoN63UF+n4=
X-HE-Tag: 1629335459-615253
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, 2021-08-19 at 01:27 +0100, Matthew Wilcox wrote:
> On Tue, Aug 17, 2021 at 10:31:32PM -0700, Joe Perches wrote:
> > Lastly __alloc_size should probably be added to checkpatch
> > 
> > Maybe:
> > ---
> >  scripts/checkpatch.pl | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> > @@ -489,7 +489,8 @@ our $Attribute	= qr{
> >  			____cacheline_aligned|
> >  			____cacheline_aligned_in_smp|
> >  			____cacheline_internodealigned_in_smp|
> > -			__weak
> > +			__weak|
> > +			__alloc_size\s*\(\s*\d+\s*(?:,\s*d+\s*){0,5}\)
> 
> Should probably be added to kernel-doc as well.  Any other awful regexes
> that need to be changed to understand it?  And can we commonise the
> regexes that do exist into a perl helper library?

probably, but there would need to be some library work done and
changes made to both utilities so they could use the same $helpers.

And there are several nominally incomplete regexes already in
kernel-doc and I'm not at all familiar with kernel-doc.

e.g.: kernel-doc has:

my $attribute = qr{__attribute__\s*\(\([a-z0-9,_\*\s\(\)]*\)\)}i;

but __attribute__ can have quotes like:

__attribute__((section("foo")))

and spaces around and and I believe between (( and )) like:

__attribute__ ((packed))

so those wouldn't match.

The use of parentheses internal to attributes like __align__(8) may
not work particularly well either given greedy matching.


