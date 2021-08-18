Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2C713EFCC8
	for <lists+linux-kbuild@lfdr.de>; Wed, 18 Aug 2021 08:31:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238763AbhHRGbd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 02:31:33 -0400
Received: from smtprelay0162.hostedemail.com ([216.40.44.162]:35956 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S238781AbhHRGbd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 02:31:33 -0400
Received: from omf03.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay06.hostedemail.com (Postfix) with ESMTP id 46E201822186F;
        Wed, 18 Aug 2021 06:30:58 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id D94EF13D97;
        Wed, 18 Aug 2021 06:30:53 +0000 (UTC)
Message-ID: <c408a8ef7173671d6d220c4eaedc8fec8693bef5.camel@perches.com>
Subject: Re: [PATCH 2/5] slab: Add __alloc_size attributes for better bounds
 checking
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.org>
Cc:     linux-kernel@vger.kernel.org, Daniel Micay <danielmicay@gmail.com>,
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
Date:   Tue, 17 Aug 2021 23:30:52 -0700
In-Reply-To: <202108172312.7032A3E@keescook>
References: <20210818050841.2226600-1-keescook@chromium.org>
         <20210818050841.2226600-3-keescook@chromium.org>
         <f3e56f56c36b32dc76e174886008a2a1ecf3fefa.camel@perches.com>
         <202108172312.7032A3E@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.40.0-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: D94EF13D97
X-Spam-Status: No, score=0.10
X-Stat-Signature: hjcrhopffer1mfxg8wkoncrukr5czgen
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18CHCANKQ9SjuGNd1lv9bArDZG2IJwopqI=
X-HE-Tag: 1629268253-493183
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, 2021-08-17 at 23:16 -0700, Kees Cook wrote:
> On Tue, Aug 17, 2021 at 10:31:32PM -0700, Joe Perches wrote:
> > On Tue, 2021-08-17 at 22:08 -0700, Kees Cook wrote:
> > > As already done in GrapheneOS, add the __alloc_size attribute for
> > > regular kmalloc interfaces, to provide additional hinting for better
> > > bounds checking, assisting CONFIG_FORTIFY_SOURCE and other compiler
> > > optimizations.
[]
> > Lastly __alloc_size should probably be added to checkpatch
> 
> Oh, yes! Thanks for the reminder.
> 
> > Maybe:
> > ---
> >  scripts/checkpatch.pl | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> > index 161ce7fe5d1e5..1a166b5cf3447 100755
> > --- a/scripts/checkpatch.pl
> > +++ b/scripts/checkpatch.pl
> > @@ -489,7 +489,8 @@ our $Attribute	= qr{
> >  			____cacheline_aligned|
> >  			____cacheline_aligned_in_smp|
> >  			____cacheline_internodealigned_in_smp|
> > -			__weak
> > +			__weak|
> > +			__alloc_size\s*\(\s*\d+\s*(?:,\s*d+\s*){0,5}\)
> 
> Why the "{0,5}" bit here? I was expecting just "?". (i.e. it can have
> either 1 or 2 arguments.)

You are right.  I misread the doc.  I also missed a \ before the last d.

So that last added line should maybe be: (totally untested btw)

+			__alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\)

