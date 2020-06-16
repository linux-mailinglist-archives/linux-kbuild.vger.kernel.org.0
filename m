Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A07171FBE62
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Jun 2020 20:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729103AbgFPSpd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Jun 2020 14:45:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbgFPSpc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Jun 2020 14:45:32 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD996C061573
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2020 11:45:32 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id k2so1823774pjs.2
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Jun 2020 11:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rmSJWxikFj7bgJmn45fuzUuJ6sw5AQKrQ6Dr0LRN23I=;
        b=iFOhQHCyrfEGFsNShSQPRE4PrJOQZ9VKREjYMLD0SUTYliGigEdRa2Su6obq9J0e81
         9Sv3wCjVjKCp87FQYgqjHVrfRpL80hbPjzpa72gB9O9qDJJLibkQhWUDL3SkUPgjPGRG
         UlCf1+mkgb3kiS6ZTLK+u99dp3J8eNbBXMRLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rmSJWxikFj7bgJmn45fuzUuJ6sw5AQKrQ6Dr0LRN23I=;
        b=qR0wH81MJALoNMa8tFzWvX5TnPyQHjSsRR4Xs0b0vnrSxOE52WxC9N1dBUeLwWkvN4
         xUqrXvmad3gNArwh+2htv7mBNxNxVs1UHSwLi2CjJDr4gbOmJEymYjPuhhckWwtspjHZ
         4jqbA5bTx20YCc2qidh/aynrA7bwEYKgo8/B1WT/FI4lcXgAxvJcfLBeifP3i6l/suOy
         e7WwFAYYdbFPtA4fC6Hr4ckvhhA+gpeMZRMQaKsBkMqYCjujfKg2PZj50ZJDuNn6GdiC
         cJI5/7HbFw0JhFOaMNC7wc4jPEO6CLZhhJ1gA7Q+EN+8lDnwP7Q52j0JpiTGipfNOzL1
         rR6w==
X-Gm-Message-State: AOAM530kKp8H8I4aFVjh50j4UBk3AgXbPH38ccLRFAZG9pwqNkl/Bz4C
        IGB4wIVnzziyWPSFDaob1JxXlA==
X-Google-Smtp-Source: ABdhPJxxorBJAn5taPg0A/Ckrho79IKy9QNPv3Ut0WHcvI8/d9o5Ql5ZBx9jimE1wldAwM1mInFgIg==
X-Received: by 2002:a17:90b:30d8:: with SMTP id hi24mr4146731pjb.78.1592333132397;
        Tue, 16 Jun 2020 11:45:32 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id m7sm18276404pfb.1.2020.06.16.11.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2020 11:45:31 -0700 (PDT)
Date:   Tue, 16 Jun 2020 11:45:30 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Matt Helsley <mhelsley@vmware.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Kristen Carlson Accardi <kristen@linux.intel.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] recordmcount: support >64k sections
Message-ID: <202006161145.25387D9@keescook>
References: <20200422232417.72162-1-samitolvanen@google.com>
 <20200424193046.160744-1-samitolvanen@google.com>
 <20200424222214.GC9040@rlwimi.vmware.com>
 <202006161101.34B26E6@keescook>
 <20200616143844.5599804d@oasis.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200616143844.5599804d@oasis.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 16, 2020 at 02:38:44PM -0400, Steven Rostedt wrote:
> On Tue, 16 Jun 2020 11:03:18 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > > Reviewed-by: Matt Helsley <mhelsley@vmware.com>  
> > 
> > Hi!
> > 
> > Can this patch please be applied and sent before -rc2? FGKASLR, LTO, and
> > link time improvements[1] all depend on this fix, and I'd really like
> > them all to be able to sanely rebase for the development window.
> > 
> > Thanks!
> > 
> > -Kees
> > 
> > [1] https://lore.kernel.org/lkml/CAK7LNARbZhoaA=Nnuw0=gBrkuKbr_4Ng_Ei57uafujZf7Xazgw@mail.gmail.com/
> 
> The patch seems to have fallen behind in my patch stack (unfortunately,
> it's most recent first!)
> 
> Anyway, I'm putting together now a set of patches for -rc2. I'll
> include this one in it as well.

Awesome! Thanks very much. :)

-- 
Kees Cook
