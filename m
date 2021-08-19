Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A58D3F1040
	for <lists+linux-kbuild@lfdr.de>; Thu, 19 Aug 2021 04:17:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235605AbhHSCSV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 18 Aug 2021 22:18:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhHSCSV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Aug 2021 22:18:21 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB4FCC061764;
        Wed, 18 Aug 2021 19:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
        Sender:Reply-To:Content-ID:Content-Description;
        bh=6qFa63LSLe36g4wM0Z8z+Amgw0mnG5ofseKFv1HZmaM=; b=jkSVueB+uX0AcffMksm+YIvw3n
        SSLMObXwjcA4anhkE1Onilfxzd/yrStGGSPvaiC/48QLpoQpG97cRAWdv6EsdYDV3gi53abGV6c+M
        JUZRJ6sR3kKmGE0vAa+ELmF80mwEEDSKRY1OAjU4jB/UUPgv+lO+2YaZr0inx8tdX/z66LA2gxfgz
        Pz8g3y4GD2b+ASrT6P9ZcRgupZo6iBZQjzX/ylsSvr37QmVsG+yFmIx8MtSoKeJvZGT+HHUD374LP
        seEvSKvu3AKdsuTWkl0TcDFonl+lThil2DF69HAMJGStztY+VTQrzySLspfZz+3A05G8PgJK/loFS
        Uy0MkOnQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mGXbZ-004VHM-Ln; Thu, 19 Aug 2021 02:16:54 +0000
Date:   Thu, 19 Aug 2021 03:16:29 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Joe Perches <joe@perches.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        linux-doc <linux-doc@vger.kernel.org>,
        Kees Cook <keescook@chromium.org>,
        linux-kernel@vger.kernel.org, Daniel Micay <danielmicay@gmail.com>,
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
Subject: Re: [PATCH 2/5] slab: Add __alloc_size attributes for better bounds
 checking
Message-ID: <YR2+/WBa9eVGn0bp@casper.infradead.org>
References: <20210818050841.2226600-1-keescook@chromium.org>
 <20210818050841.2226600-3-keescook@chromium.org>
 <f3e56f56c36b32dc76e174886008a2a1ecf3fefa.camel@perches.com>
 <YR2lexDd9N0sWxIW@casper.infradead.org>
 <3a0c55a3fabc57ce9771c93499ef19327f3b8621.camel@perches.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3a0c55a3fabc57ce9771c93499ef19327f3b8621.camel@perches.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 18, 2021 at 06:10:57PM -0700, Joe Perches wrote:
> On Thu, 2021-08-19 at 01:27 +0100, Matthew Wilcox wrote:
> > On Tue, Aug 17, 2021 at 10:31:32PM -0700, Joe Perches wrote:
> > > Lastly __alloc_size should probably be added to checkpatch
> > > 
> > > Maybe:
> > > ---
> > >  scripts/checkpatch.pl | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> []
> > > @@ -489,7 +489,8 @@ our $Attribute	= qr{
> > >  			____cacheline_aligned|
> > >  			____cacheline_aligned_in_smp|
> > >  			____cacheline_internodealigned_in_smp|
> > > -			__weak
> > > +			__weak|
> > > +			__alloc_size\s*\(\s*\d+\s*(?:,\s*d+\s*){0,5}\)
> > 
> > Should probably be added to kernel-doc as well.  Any other awful regexes
> > that need to be changed to understand it?  And can we commonise the
> > regexes that do exist into a perl helper library?
> 
> probably, but there would need to be some library work done and
> changes made to both utilities so they could use the same $helpers.
> 
> And there are several nominally incomplete regexes already in
> kernel-doc and I'm not at all familiar with kernel-doc.

Yes, kernel-doc is an awful example of perl gone wild.

