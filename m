Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A198FC0689
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 15:42:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfI0NlQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 09:41:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54348 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727465AbfI0NlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 09:41:15 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so6675779wmp.4
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 06:41:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=hgnZlYVxe7nccl/AMGN96sUvuUJBPHkcwyTYZiuZshQ=;
        b=Fy5j/qmgSJyd5tLd2E0Y0I0s9aR2rJOX18jYABdElAIytSroY2DHEGWmW/j4lQl/7v
         BV8qyTbP3eT2rDYHKIYH4rUw+7ynj1SZW+f2+c/PtW+B2420sM6AvwYT80Q8f7NbUXSI
         oss4WK0y9hAGXrGtV5kjOpIDh675S8dOWTH5k/5MiPYMVlIuppQbCfdInRGDwaYTfvPb
         xUINeYpDP1TqXNgVLsAMW6pIX/k23rdz+Uf6/3bciD7dmL0P0jzF/Ce+KhzoU5vARPRO
         Ri/fiVoygkeAXTmR/32zEyHI8Dh07iF5haiSg0bMWx3I4uqyNZtkCsnEFihizD8NizDY
         jaoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=hgnZlYVxe7nccl/AMGN96sUvuUJBPHkcwyTYZiuZshQ=;
        b=WkB/VGbu7VtDCG21nSlK17cMviPmN1fr9DNM797dmqnIom8/Cea0xA11V8399G5auR
         m6nCiQcMlHZ9Oir8E6XW+RCeJNQHFEs7sivWKppAMWnqK0rw+VLUckqK+voggVlB1alv
         29dtzaH1EEAbbIAs+SQL6dKPObqOHk088wwD56n/DWOhrezvmlfJaSPZoHcCSpA2KhGJ
         +URleiB2A1wHeC0JmH6CziDO34q+2yDEyudlGdI4//pDJKcyyRK2HUV1KA8QZeYpyjc2
         9ojlek8P0eRM5KXIKym7lxaKLBhIMaiWNHM9sjnhCDwQop1RJDICzpsAfvboN/+GCJhJ
         dXXw==
X-Gm-Message-State: APjAAAUGeIG8YYiLZGkDOgffXUOGDJTo0XZsTP2OcMuJBl+f4+HlgeXH
        iGX7tP3oJooxmmktexFSt5tUlg==
X-Google-Smtp-Source: APXvYqzZfdxZiASgKEvFOVVutuQt3UJ3zjs7fZoAAlxXaz5VadUxbevICIzD6S4z7DdpOnCOlJczLQ==
X-Received: by 2002:a1c:a8cb:: with SMTP id r194mr4464907wme.156.1569591672626;
        Fri, 27 Sep 2019 06:41:12 -0700 (PDT)
Received: from google.com ([2a00:79e0:d:210:e8f7:125b:61e9:733d])
        by smtp.gmail.com with ESMTPSA id t18sm6535777wmi.44.2019.09.27.06.41.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Sep 2019 06:41:11 -0700 (PDT)
Date:   Fri, 27 Sep 2019 14:41:08 +0100
From:   Matthias Maennich <maennich@google.com>
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Jessica Yu <jeyu@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Fernandes <joel@joelfernandes.org>,
        Martijn Coenen <maco@android.com>,
        Will Deacon <will.deacon@arm.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/7] module: various bug-fixes and clean-ups for module
 namespace
Message-ID: <20190927134108.GC187147@google.com>
References: <20190927093603.9140-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20190927093603.9140-1-yamada.masahiro@socionext.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 27, 2019 at 06:35:56PM +0900, Masahiro Yamada wrote:
>
>I was hit by some problems caused by the module namespace feature
>that was merged recently. At least, the breakage of
>external module builds is a fatal one. I just took a look at the code
>closer, and I noticed some more issues and improvements.
>
>I hope these patches are mostly OK.
>The 4th patch might have room for argument since it is a trade-off
>of "cleaner implermentation" vs "code size".
>
Thanks Masahiro for taking the time to improve the implementation of the
symbol namespaces. These are all good points that you addressed!

For [04/07], I can work on this if you do not mind.

Cheers,
Matthias

>
>Masahiro Yamada (7):
>  modpost: fix broken sym->namespace for external module builds
>  module: swap the order of symbol.namespace
>  module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol
>    conflict
>  module: avoid code duplication in include/linux/export.h
>  kbuild: fix build error of 'make nsdeps' in clean tree
>  nsdeps: fix hashbang of scripts/nsdeps
>  nsdeps: make generated patches independent of locale
>
> Makefile               |   2 +-
> include/linux/export.h | 104 ++++++++++++++---------------------------
> kernel/module.c        |   2 +-
> scripts/mod/modpost.c  |  20 ++++----
> scripts/nsdeps         |   4 +-
> 5 files changed, 47 insertions(+), 85 deletions(-)
>
>-- 
>2.17.1
>
