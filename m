Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6CBE8199EE6
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 21:26:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgCaT0l (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 15:26:41 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:42722 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727509AbgCaT0l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 15:26:41 -0400
Received: by mail-ot1-f66.google.com with SMTP id z5so23056363oth.9;
        Tue, 31 Mar 2020 12:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=p2qtUegF86XJQD0U9mJ6PbruzGtXxYRXcPJJraWyFNo=;
        b=ELhoeap4k3w9h7bN3wcxhblGlHt/Y266s4gRXs/8+KgpSlLbX53w29ryNSlWfNUzzQ
         24uFWR202K7G8mT2ecteqfqcIpE5MUB232V4d2zGoMuPdMcvMWJCGvLAvYlLtivgvk24
         9f7Va3tctc42c6KdTNAua8en3Zu5c9haPM2AIig3nIlVr8KoIHpqEWxrDbL/mH7Wk5go
         bTNDD4AzNg1XiGfXf0zTNMnmIKZJakNmMkpNdOXAYmsE+MyF5+hDdaulyYmaktYRJpD6
         rOYajfFz26v+Q5z+IaPvvG3nosGY3Jb5lF8ECN+Fs7lP7jeC0tqU+BzWyljNdbv4IOOj
         cspQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=p2qtUegF86XJQD0U9mJ6PbruzGtXxYRXcPJJraWyFNo=;
        b=F2+D6bGTAAZk9XhYz3Y9ZDhVNpFm5RknWqYhG90j/g7ldNyljFLt++I2ffirUamg/m
         UvfJdqTAUOpOT0NGvMzLadD5WdFDWwNFl/8WN24SMQLnPryD9Nb20y6ElX0J9s+c0VWt
         YWmoxefhQ0kMR/UVTr80R+SbHXK4vAtAySwHBZao4sxoN4v+TppuavLTFxhoDPiWv/Pn
         1BewEJnixZyy9XyOIqQspiO1BkkOyg1YtnX61DKEIx8z9zXPdO10g9OzYVdiBheTyFIx
         DaafEHI9zb3WuaJI2Tti3Z8uOuyVOz5keOsrcvf8nXFg8KvoRw096QN+jOOac2jKZ7gt
         iJfA==
X-Gm-Message-State: ANhLgQ0k9lh2LPMGITR8FcqDmR0oPBDUCob9wnti22eWfoE/IT+tFy2Z
        XsuX0b9Kufu9YbZCmkAZ7+w=
X-Google-Smtp-Source: ADFU+vsdiPcZYYBWdzojItr8T5o1ryKfN0bU1KvGxWA3rNxYN6SUUNiqR3EJ1ted02/26RlWPqXaEw==
X-Received: by 2002:a9d:a6b:: with SMTP id 98mr13525220otg.21.1585682800831;
        Tue, 31 Mar 2020 12:26:40 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
        by smtp.gmail.com with ESMTPSA id 90sm5487928otc.29.2020.03.31.12.26.38
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 Mar 2020 12:26:39 -0700 (PDT)
Date:   Tue, 31 Mar 2020 12:26:37 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
Message-ID: <20200331192637.GA54270@ubuntu-m2-xlarge-x86>
References: <20200326194155.29107-1-natechancellor@gmail.com>
 <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com>
 <20200331101122.GA6292@ubuntu-m2-xlarge-x86>
 <CAKwvOdkkpnkLwtNctSnebXTwumfprEQtLiuM5_4e-UBFTYBUxg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdkkpnkLwtNctSnebXTwumfprEQtLiuM5_4e-UBFTYBUxg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 09:02:19AM -0700, 'Nick Desaulniers' via Clang Built Linux wrote:
> On Tue, Mar 31, 2020 at 3:11 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > Just a follow up, those two patches have been picked up and should be in
> > this coming release:
> >
> > https://git.kernel.org/balbi/usb/c/58582220d2d34228e5a1e1585e41b735713988bb
> > https://git.kernel.org/rostedt/linux-trace/c/bf2cbe044da275021b2de5917240411a19e5c50d
> >
> > As of next-20200331, with the former applied (because it is not there
> > yet) along with this patch, I see no warnings on arm, arm64, x86_64
> > all{mod,yes}config.
> 
> kbuild test robot is testing more arch's than that with Clang so it
> may report if it finds more instances of that warning in those.
> 
> -- 
> Thanks,
> ~Nick Desaulniers
> 

I'll keep an eye out. Hopefully not too many more are lurking but we
have definitely caught some bad behavior with this warning already so
getting it turned on so that all CI systems can benefit from it is
important.

Cheers,
Nathan
