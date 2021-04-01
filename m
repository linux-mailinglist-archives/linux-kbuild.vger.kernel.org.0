Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E5C53521A8
	for <lists+linux-kbuild@lfdr.de>; Thu,  1 Apr 2021 23:33:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234416AbhDAVdY (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 1 Apr 2021 17:33:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234366AbhDAVdX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 1 Apr 2021 17:33:23 -0400
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59F8C061788
        for <linux-kbuild@vger.kernel.org>; Thu,  1 Apr 2021 14:33:23 -0700 (PDT)
Received: by mail-pf1-x434.google.com with SMTP id s11so2374144pfm.1
        for <linux-kbuild@vger.kernel.org>; Thu, 01 Apr 2021 14:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xUvZJIJIDadxvdRdsIrLgm58xD07+hDQPhDK3/jq060=;
        b=Pb4XR5RnN4XMKGzkIgWEXnoYtI5TagectmXHpjbwn537UdwNgJo3v5MGsBRwkrWgsa
         y6gpKhupWAGktcfQ3o0VVgV3oftfdMP5Jn00nDFdExvtLoeGAUATsr/LZ2lDBiRVMOIJ
         rZgzXZH2bn1Hpubvk0B+mn4zoWR4+N9POAQF0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xUvZJIJIDadxvdRdsIrLgm58xD07+hDQPhDK3/jq060=;
        b=ir7YqIH4Tn3kHgs34gFcL3SQEPou8z/i2daWGw1+Gqy126Bju+6L6sZ/l7vvUmbT1F
         xC2/tVZDWElHd12N57FLUHzCFPXl2z2xzMEU0pZB9QVIBZnBOCdrrFeMxIrubU2mCu7G
         eD2LMcqmsuNPZ9C9omlouRjyE1PVp6HSoPamVTjMMhK782f68LwCs5cVYh1jPqq1ND16
         nk6uP8furSvuqW1gx0fimaoYkQUge3TZkS+ZmVYo2E1GIJQTMlnVyuKuYLhjXu4oHzM+
         qUa52vZLHX1Gpl4tRIaUC0c6bWalGb37/c8kJs+TJK28VmxdiHKZBfRvaJDHP7El70zi
         Zfzg==
X-Gm-Message-State: AOAM533MukepJVd5CVWBfnjNyAOI3R2jgsCfm23FCG6N8cce29Ba7OYC
        exQ7mFE+L/UmLpl5N91BkO80bA==
X-Google-Smtp-Source: ABdhPJy21UeKFxWqSqyojz0XvpAZ0LpV10btvcxWlDDKgQTUJd6oIa61ah9cbhTv2mGLWZsgMfI1ig==
X-Received: by 2002:a65:47ca:: with SMTP id f10mr9380550pgs.206.1617312803473;
        Thu, 01 Apr 2021 14:33:23 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id q19sm6363000pff.91.2021.04.01.14.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 14:33:22 -0700 (PDT)
Date:   Thu, 1 Apr 2021 14:33:21 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sean Christopherson <seanjc@google.com>
Cc:     Sami Tolvanen <samitolvanen@google.com>,
        Fangrui Song <maskray@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Subject: Re: [PATCH] kbuild: Merge module sections if and only if
 CONFIG_LTO_CLANG is enabled
Message-ID: <202104011433.48B4149E@keescook>
References: <20210322234438.502582-1-seanjc@google.com>
 <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
 <YFoZBY1SqilWAmx4@google.com>
 <CABCJKucYHQ893LS1iCHXivPS05RMDN2BpDFou306jOEbWnt1Dg@mail.gmail.com>
 <YFvBEIkuFY2ajNlG@google.com>
 <202103311228.D42822B@keescook>
 <YGTWdju9UiDGRCCJ@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YGTWdju9UiDGRCCJ@google.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 31, 2021 at 08:07:18PM +0000, Sean Christopherson wrote:
> On Wed, Mar 31, 2021, Kees Cook wrote:
> > On Wed, Mar 24, 2021 at 10:45:36PM +0000, Sean Christopherson wrote:
> > > On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > > > On Tue, Mar 23, 2021 at 9:36 AM Sean Christopherson <seanjc@google.com> wrote:
> > > > >
> > > > > On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > > > > > On Mon, Mar 22, 2021 at 4:44 PM Sean Christopherson <seanjc@google.com> wrote:
> > > > > > >
> > > > > > > Merge module sections only when using Clang LTO.  With gcc-10, merging
> > > > > > > sections does not appear to update the symbol tables for the module,
> > > > > > > e.g. 'readelf -s' shows the value that a symbol would have had, if
> > > > > > > sections were not merged.
> > > > > >
> > > > > > I'm fine with limiting this to LTO only, but it would be helpful to
> > > > > > understand which sections are actually getting merged here.
> > > > >
> > > > > It doesn't appear to matter which sections get merged, the tables only show the
> > > > > correct data if there is no merging whatsoever, e.g. allowing merging for any
> > > > > one of the four types (.bss, .data, .rodata and .text) results in breakage.
> > > > > AFAICT, merging any sections causes the layout to change and throw off the
> > > > > symbol tables.
> > > > 
> > > > Thanks for the clarification. I can reproduce this issue with gcc +
> > > > bfd if any of the sections are merged, but gcc + lld produces valid
> > > > symbol tables.
> > > 
> > > FWIW, clang + bfd also produces mangled tables, so it does appear to be bfd
> > > specific.
> > 
> > Are you able to open a bug against bfd for this?
> 
> Yes?  I'll ping you when I run into trouble ;-)

Hm, I can't tell if any of these are duplicates:

https://sourceware.org/bugzilla/buglist.cgi?bug_status=UNCONFIRMED&bug_status=NEW&bug_status=ASSIGNED&bug_status=SUSPENDED&bug_status=WAITING&bug_status=REOPENED&component=ld&list_id=59962&product=binutils&query_format=advanced&short_desc=symbol&short_desc_type=allwordssubstr

-- 
Kees Cook
