Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92DA93D97F7
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Jul 2021 23:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhG1V7T (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Jul 2021 17:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbhG1V7S (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Jul 2021 17:59:18 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CD63C0613D5
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Jul 2021 14:59:16 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id j1so7244404pjv.3
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Jul 2021 14:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ry2so8wkWIDOCG/sQogiwuE+9Zyl4IrepEHbauTvq4U=;
        b=IGRqrDLsPrMGIokLAHHitBXrTGx8ldPYhQZ0vhlO7BwqLTxHuG39KqoD+0xySdQDeZ
         wOes72WlsRRJac/rz2gEpxXYvtLZ6bSaZfmQarX0qm7P2LxswesUfd9AKF5i4JhugBhi
         nx2jk3HjG5WlS1z72s2XLwsxgebFqKKL6xJwA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ry2so8wkWIDOCG/sQogiwuE+9Zyl4IrepEHbauTvq4U=;
        b=uY5kcBQRhw2qt7eaUre854IMVNxDqGbLEFwwVNQLefWXQd/cmNkfEKrHwYtDOWH7p/
         7Jk4lwEUT7mNrdQXIDQCyNn4myjaOXcNss0yyryxXLU35jaSnJvD7WxBKV+mWKKcTpq0
         FrhrgcMcRcTptTlaXD0Zq1/UwEArt6iEAbVeNH+q2dzrzWFbAKVGqzkFMImZ5Rmddpl1
         OnT7h0O0qi+9jRhNFm03I5C8snWGwI9G3vRD9IttIgzW2qn1adpbAyJZ8PftdThijFP8
         6Wm1Db+xAD4YeiOChf6Nq3ExnkzW1phJRf5M36w74g+9YCDB3wUgUU6c/aRuo9/YFzUs
         0G/g==
X-Gm-Message-State: AOAM530rA2PimIWaK1HS9Bjo4eHO4OLJnQu1E97d1RwfC+xDAe5SgYqY
        X140SqrqaiT5nt3Fl+ztAu3cGQ==
X-Google-Smtp-Source: ABdhPJzgz5HqNdUbzYWG/8osCsOtCEP6ipgHXlpT0b4bkWx62GdyxJFdtfEBDYACX8aQ6iHvHf/hRw==
X-Received: by 2002:a65:498a:: with SMTP id r10mr928037pgs.7.1627509555798;
        Wed, 28 Jul 2021 14:59:15 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 30sm1011862pgq.31.2021.07.28.14.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jul 2021 14:59:15 -0700 (PDT)
Date:   Wed, 28 Jul 2021 14:59:14 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc:     linux-hardening@vger.kernel.org,
        Keith Packard <keithpac@amazon.com>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        netdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-staging@lists.linux.dev, linux-block@vger.kernel.org,
        linux-kbuild@vger.kernel.org, clang-built-linux@googlegroups.com
Subject: Re: [PATCH 04/64] stddef: Introduce struct_group() helper macro
Message-ID: <202107281456.1A3A5C18@keescook>
References: <20210727205855.411487-1-keescook@chromium.org>
 <20210727205855.411487-5-keescook@chromium.org>
 <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41183a98-bdb9-4ad6-7eab-5a7292a6df84@rasmusvillemoes.dk>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 28, 2021 at 12:54:18PM +0200, Rasmus Villemoes wrote:
> On 27/07/2021 22.57, Kees Cook wrote:
> 
> > In order to have a regular programmatic way to describe a struct
> > region that can be used for references and sizing, can be examined for
> > bounds checking, avoids forcing the use of intermediate identifiers,
> > and avoids polluting the global namespace, introduce the struct_group()
> > macro. This macro wraps the member declarations to create an anonymous
> > union of an anonymous struct (no intermediate name) and a named struct
> > (for references and sizing):
> > 
> > 	struct foo {
> > 		int one;
> > 		struct_group(thing,
> > 			int two,
> > 			int three,
> > 		);
> > 		int four;
> > 	};
> 
> That example won't compile, the commas after two and three should be
> semicolons.

Oops, yes, thanks. This is why I shouldn't write code that doesn't first
go through a compiler. ;)

> And your implementation relies on MEMBERS not containing any comma
> tokens, but as
> 
>   int a, b, c, d;
> 
> is a valid way to declare multiple members, consider making MEMBERS
> variadic
> 
> #define struct_group(NAME, MEMBERS...)
> 
> to have it slurp up every subsequent argument and make that work.

Ah! Perfect, thank you. I totally forgot I could do it that way.

> 
> > 
> > Co-developed-by: Keith Packard <keithpac@amazon.com>
> > Signed-off-by: Keith Packard <keithpac@amazon.com>
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  include/linux/stddef.h | 34 ++++++++++++++++++++++++++++++++++
> 
> Bikeshedding a bit, but do we need to add 34 lines that need to be
> preprocessed to virtually each and every translation unit [as opposed to
> adding a struct_group.h header]? Oh well, you need it for struct
> skbuff.h, so it would be pulled in by a lot regardless :(

My instinct is to make these kinds of helpers "always available" (like
sizeof_field(), etc), but I have no strong opinion on where it should
live. If the consensus is to move it, I certainly can! :)

-Kees

-- 
Kees Cook
