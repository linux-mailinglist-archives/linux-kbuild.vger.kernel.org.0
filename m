Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C7183507CC
	for <lists+linux-kbuild@lfdr.de>; Wed, 31 Mar 2021 22:08:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236426AbhCaUHm (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 31 Mar 2021 16:07:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236434AbhCaUHX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 31 Mar 2021 16:07:23 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 610F6C061574
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 13:07:23 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id f3so124407pgv.0
        for <linux-kbuild@vger.kernel.org>; Wed, 31 Mar 2021 13:07:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=j8v7zlQCarZgdFLgATsFe+vW/NFhoDJt/9MWBvCMW3o=;
        b=PHWdya59ypGDcuhE+/Lj0qikX5VKKJXVdJWzs0hZfbTtT1pTrku9dxeF2BRmS1lpxh
         YfrvMh564HSSwf9crONrxjhy6Kvwgho+tI9MxKnecxhLK6q7jWUX5JfW1/uFuYuAUXn9
         FB7rFnOcSaxSCaHGTwmJj5M5KHbjStoBJjZ7T5lemUwbT9co1C3P2SGvnxkM5xlmc8kZ
         gYMSH/b7yz7JIPwQxloWvXZhufWderMls7/bo/K2TvhsD4rDuM32hgRZxmGsCzCwe4UH
         8KETRP77LjLRCoEX0fuOSTEXA9Z3C9YUd3Z87sCWhxtpwzTmj37e/L2uP8XfHkW+s6El
         7nBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j8v7zlQCarZgdFLgATsFe+vW/NFhoDJt/9MWBvCMW3o=;
        b=LgNr7CxNISqvtzrSFyEbk3NAoSPPrcQgWCS5BlmjUG9UWeR+vxVuAdpBIkB5KBNp0m
         k6ZYPKXW0NB60rTLbzbVg1nqHYyxXtbSIgZPks8zw/1Ye/S4yIME1XhLux8P505ROBCG
         yFNJh8hbygj5nav4UsSn7cT7RRlLYkh6Ff+WMqg4AxkpB7qrMlEKpetDxRGWMUHe+nQ/
         2lrLoknw4jiGs36TbTWsuJBnuH8//CB7/NSW7imQsCHdqd+4z4zPByWBb9C0sUCHLq/V
         EM1AZcjQ9sScAic+gRZLCDNHs4e6A5P80hwDwKf31WfAElhXlyJoxhjh1BaiL3SFBsDj
         rHVw==
X-Gm-Message-State: AOAM532x2jXEl2QxhWpVthpDhGNAH65O//SjKXAWyqTB3KcsQONNx3Ks
        MuW8q5pepGgrqT+monru+7RYyQ==
X-Google-Smtp-Source: ABdhPJxMs6vJpij60DibOiWc5Zg+qRDcCo87p5sWjlsdO7CJNWPOggYWCf1uv/7lZH7V2p6KWWaS0w==
X-Received: by 2002:a63:4763:: with SMTP id w35mr4698071pgk.226.1617221242566;
        Wed, 31 Mar 2021 13:07:22 -0700 (PDT)
Received: from google.com (240.111.247.35.bc.googleusercontent.com. [35.247.111.240])
        by smtp.gmail.com with ESMTPSA id fa21sm3093569pjb.41.2021.03.31.13.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 13:07:21 -0700 (PDT)
Date:   Wed, 31 Mar 2021 20:07:18 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Kees Cook <keescook@chromium.org>
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
Message-ID: <YGTWdju9UiDGRCCJ@google.com>
References: <20210322234438.502582-1-seanjc@google.com>
 <CABCJKudMQ9CP1zhvywTf-_=PY5zmeviURR+=PqsMn_bqa_MV-g@mail.gmail.com>
 <YFoZBY1SqilWAmx4@google.com>
 <CABCJKucYHQ893LS1iCHXivPS05RMDN2BpDFou306jOEbWnt1Dg@mail.gmail.com>
 <YFvBEIkuFY2ajNlG@google.com>
 <202103311228.D42822B@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202103311228.D42822B@keescook>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Mar 31, 2021, Kees Cook wrote:
> On Wed, Mar 24, 2021 at 10:45:36PM +0000, Sean Christopherson wrote:
> > On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > > On Tue, Mar 23, 2021 at 9:36 AM Sean Christopherson <seanjc@google.com> wrote:
> > > >
> > > > On Tue, Mar 23, 2021, Sami Tolvanen wrote:
> > > > > On Mon, Mar 22, 2021 at 4:44 PM Sean Christopherson <seanjc@google.com> wrote:
> > > > > >
> > > > > > Merge module sections only when using Clang LTO.  With gcc-10, merging
> > > > > > sections does not appear to update the symbol tables for the module,
> > > > > > e.g. 'readelf -s' shows the value that a symbol would have had, if
> > > > > > sections were not merged.
> > > > >
> > > > > I'm fine with limiting this to LTO only, but it would be helpful to
> > > > > understand which sections are actually getting merged here.
> > > >
> > > > It doesn't appear to matter which sections get merged, the tables only show the
> > > > correct data if there is no merging whatsoever, e.g. allowing merging for any
> > > > one of the four types (.bss, .data, .rodata and .text) results in breakage.
> > > > AFAICT, merging any sections causes the layout to change and throw off the
> > > > symbol tables.
> > > 
> > > Thanks for the clarification. I can reproduce this issue with gcc +
> > > bfd if any of the sections are merged, but gcc + lld produces valid
> > > symbol tables.
> > 
> > FWIW, clang + bfd also produces mangled tables, so it does appear to be bfd
> > specific.
> 
> Are you able to open a bug against bfd for this?

Yes?  I'll ping you when I run into trouble ;-)
