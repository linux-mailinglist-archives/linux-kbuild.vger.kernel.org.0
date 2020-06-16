Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 81F331FBD7F
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2020 20:03:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731444AbgFPSDW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jun 2020 14:03:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731438AbgFPSDV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 14:03:21 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63FABC06174E
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2020 11:03:21 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id a127so9853500pfa.12
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2020 11:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=qg6/6CMY8n7dnVVzd/Y5tNDAB5f5iIduvPF8I6aFaCo=;
        b=Y8yS3TZ8PrhQXOs6mBuw4v2QGvvGfxHsE1fQ7xfnQHUyeW3t+dbyTbFSDDa+98l4UG
         9S7farLd0mOaXNW8mKYeschG/WM6J5RJd5VrsolvvCS7ZvOxgmeoJW346Ax+Yeq+UaEZ
         PSBERBsdM86nsYlrf4DzJ0E0+racCrQPjy/zY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=qg6/6CMY8n7dnVVzd/Y5tNDAB5f5iIduvPF8I6aFaCo=;
        b=in1jMYiPpARA7XzBGOea7vIiPhzWQS3ejewvvEBPpAyGpeMbsE3KYnLtVCBUOauofw
         XnaAx6e1nxNr8dX/oSK6eGkntZIDMpHOC5Je3zIgNumZoBVSrOKfMsf290XK/gA0m+ib
         dfzQOqlud5HqrWf1pu6B19BZcWQDso8pl/ob9F0fHEtDTavnighsXRVQW05lSvzz5g28
         lyJPCRAAmdFn1o5Vi0eUuy7vjra6mfIJ84lfsA7hghPTmmQJ8Yi8dFQOO1UgxWmg7/1w
         Si5lP10blGub/pOETFkxeOlJFIS5zx7znMRJdSEWqzbUiHddBfjkKVZTnlnP6bu2RF4f
         Hlow==
X-Gm-Message-State: AOAM533oExDrTOZ1+VuRJ4Kf/3F0QhcmY7m2RwdXxUuJMIzpuLDAZb9a
        AM0Far6obV1fWtdJTvxlchBLqVhy+yq6Cg==
X-Google-Smtp-Source: ABdhPJyXxWprGddlTKQxjwvOzOfzWbsCy/u2EM6/g368rwSGZfo6UsGRgcOsulhmI4axiemhv/6BFQ==
X-Received: by 2002:a63:b74f:: with SMTP id w15mr3104550pgt.314.1592330600769;
        Tue, 16 Jun 2020 11:03:20 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id i10sm15257177pgq.36.2020.06.16.11.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 11:03:19 -0700 (PDT)
Date:   Tue, 16 Jun 2020 11:03:18 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Matt Helsley <mhelsley@vmware.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] recordmcount: support >64k sections
Message-ID: <202006161101.34B26E6@keescook>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200424193046.160744-1-samitolvanen@google.com>
 <20200424222214.GC9040@rlwimi.vmware.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200424222214.GC9040@rlwimi.vmware.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 24, 2020 at 03:22:14PM -0700, Matt Helsley wrote:
> On Fri, Apr 24, 2020 at 12:30:46PM -0700, Sami Tolvanen wrote:
> > When compiling a kernel with Clang and LTO, we need to run
> > recordmcount on vmlinux.o with a large number of sections, which
> > currently fails as the program doesn't understand extended
> > section indexes. This change adds support for processing binaries
> > with >64k sections.
> > 
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
> 
> Feel free to add
> 
> Reviewed-by: Matt Helsley <mhelsley@vmware.com>

Hi!

Can this patch please be applied and sent before -rc2? FGKASLR, LTO, and
link time improvements[1] all depend on this fix, and I'd really like
them all to be able to sanely rebase for the development window.

Thanks!

-Kees

[1] https://lore.kernel.org/lkml/CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com/

> 
> > ---
> > Changes in v2:
> >  - Switched to unsigned int for (old|new)_shnum in append_func.
> >  - Added set_shnum and find_symtab helper functions and moved
> >    the new logic there.
> > 
> > ---
> >  scripts/recordmcount.h | 98 +++++++++++++++++++++++++++++++++++++++---
> >  1 file changed, 92 insertions(+), 6 deletions(-)
> 
> <snip>

-- 
Kees Cook
