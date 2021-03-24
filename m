Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4CC2B3484D5
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Mar 2021 23:46:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238884AbhCXWpv (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Mar 2021 18:45:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238875AbhCXWpl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Mar 2021 18:45:41 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49BA7C06174A
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Mar 2021 15:45:41 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id l1so15784208pgb.5
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Mar 2021 15:45:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=dtMAFNGRvXR9tr74ckEk4qdzC3+4Qmuoanh+5ep0zEg=;
        b=mf4RKQX2PTsWVXlghsyxe8tAq+NHBJ/XcntZttvk+RoykwKGf03PqYjgRaYZpuERLo
         VIohXueiLN9zcCGZPSrTApIF+OW7zXOcdCT1MpoXkImRUaU2+hCZY4DZrM89t2PQogRh
         vEGm4/gFGaIYg5t074wfc/a4z2rGcz7XeutUeBzVeETCWc9QcGEZJ+Kbm9ftykJCauqm
         n2tFBn61Oc7G8gnCx6SJhEthi4uVMiawT98MZtZjqlP276qdHJnFGUGOazmKpnlls/1e
         t+43rr6zgsOlt/SLhgbj9PpNTd5nCIbc+fPx+Pgl/x5I96C/fYxw8nFHk2jZfFHG5Y6E
         z/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=dtMAFNGRvXR9tr74ckEk4qdzC3+4Qmuoanh+5ep0zEg=;
        b=rPgcXC1yTSVn49nL6EpVmVDdk8zwNGvR4Pju4sMvYqeUbXzSgSptsw5/FP04uohI8z
         R+UueBJgNvKGQ/RoOhCUq5qISCKXZuHXZyhtDv9v54byjsrlsRYrZPm+wmsHRHySUjc/
         Ya66vwdvDYK6XezpXSTw9qObW6vwoFDoYXKTK0ob5AMCIW6o07u2Ae5DkXIpeVG2WzWb
         fS/Y6uSQYB0Ul9OiIyDU/0F8bQ9YbNk9TVD7FmOvB9fp2RhF1ULff12Rr2IVT2mU/Ua0
         mcJPiDW+o6uWIcYBpp54KFwguYvyXtNqL8Wvxwb13OpPb7GV5G25DCaPLept1BHWweMQ
         ZWwA==
X-Gm-Message-State: AOAM532pAJN2iFdP9Q3pQDUEG7DGc9tRkWZz3VeY31wcIt1zf9auqoqJ
        soLibWeDsNIX5hn1BIVPt6nzcQ==
X-Google-Smtp-Source: ABdhPJx9tirFcs8M8z1akH8PiPcyfxRquA5Pe9ivMYrUey8HlclyG6nFMCckS2EuSyMG3lRCt2NS0w==
X-Received: by 2002:a63:d704:: with SMTP id d4mr4751624pgg.221.1616625940704;
        Wed, 24 Mar 2021 15:45:40 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id l22sm3785879pfd.145.2021.03.24.15.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 15:45:40 -0700 (PDT)
Date:   Wed, 24 Mar 2021 22:45:36 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH] kbuild: Merge module sections if and only if
 CONFIG_LTO_CLANG is enabled
Message-ID: <YFvBEIkuFY2ajNlG@google.com>
References: <20210322234438.502582-1-seanjc@google.com>
 <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
 <YFoZBY1SqilWAmx4@google.com>
 <CABCJKucYHQ893LS1iCHXivPS05RMDN2BpDFou306jOEbWnt1Dg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CABCJKucYHQ893LS1iCHXivPS05RMDN2BpDFou306jOEbWnt1Dg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> On Tue, Mar 23, 2021 at 9:36 AM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > > On Mon, Mar 22, 2021 at 4:44 PM Sean Christopherson <seanjc@google.com> wrote:
> > > >
> > > > Merge module sections only when using Clang LTO.  With gcc-10, merging
> > > > sections does not appear to update the symbol tables for the module,
> > > > e.g. 'readelf -s' shows the value that a symbol would have had, if
> > > > sections were not merged.
> > >
> > > I'm fine with limiting this to LTO only, but it would be helpful to
> > > understand which sections are actually getting merged here.
> >
> > It doesn't appear to matter which sections get merged, the tables only show the
> > correct data if there is no merging whatsoever, e.g. allowing merging for any
> > one of the four types (.bss, .data, .rodata and .text) results in breakage.
> > AFAICT, merging any sections causes the layout to change and throw off the
> > symbol tables.
> 
> Thanks for the clarification. I can reproduce this issue with gcc +
> bfd if any of the sections are merged, but gcc + lld produces valid
> symbol tables.

FWIW, clang + bfd also produces mangled tables, so it does appear to be bfd
specific.

> Perhaps someone more familiar with bfd can comment on whether this is
> a bug or a feature, and if there's a flag we can pass to bfd that
> would fix the issue. In the meanwhile, this patch looks like a
> reasonable workaround to me.
> 
> Reviewed-by: Sami Tolvanen <samitolvanen@google.com>
> Tested-by: Sami Tolvanen <samitolvanen@google.com>
> 
> Sami
