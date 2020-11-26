Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B14952C5862
	for <lists+linux-kbuild@lfdr.de>; Thu, 26 Nov 2020 16:41:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391228AbgKZPim (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 26 Nov 2020 10:38:42 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:42938 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733044AbgKZPim (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Nov 2020 10:38:42 -0500
Received: by mail-pl1-f194.google.com with SMTP id s2so1296792plr.9;
        Thu, 26 Nov 2020 07:38:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rzGZIAEm926uhIyxuRw0b4qhN9U79TKpOJgS1rllun8=;
        b=U5Sxvj9+gTeGrPKJnIUQV5FNO8Pc0nMZo62ZIau60f9ibAh0gfkY7yN6VN8l94HwRr
         +pRoM6VlEBc92HNSQT0Tt0IULYGaiVwf45zZHdwm2WqKxXFrVwY3lgVh5xQIeGWJ0uvF
         piYqrtVe/rrMNDQsdWQYIYD+hCYehN3NuNFWw+MpDJDFaRMderRI58i7+6/K4LQY7bHr
         7fziZkeVLGmxp4pfISlRMxi6ybC/LzWfQZfj07+YpkwePUATN6TnJFow9psC1fvTBtle
         8T0XrdgWDVaeS+nuye0oo9ddAuMabUo6Bq52pGcuAqoiGFrwjCkXcAe6xDhDjPDbtxU1
         YUEg==
X-Gm-Message-State: AOAM533Quwmc69VzdAmvt0hHYdiRDZZy2yreP7QTttCH47tT7pDJx/hb
        0zaS4TTtPIZkcKuTz2/8+JA=
X-Google-Smtp-Source: ABdhPJyq6tAlIeIXdtjepXInKufD9Wb3jpaAZXuUc1WqO59gK4pvUzWFf6UUaCo42m9yldLHqPg0CA==
X-Received: by 2002:a17:902:bd84:b029:da:17d0:e754 with SMTP id q4-20020a170902bd84b02900da17d0e754mr3201046pls.68.1606405121352;
        Thu, 26 Nov 2020 07:38:41 -0800 (PST)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id 22sm7575053pjb.40.2020.11.26.07.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2020 07:38:39 -0800 (PST)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id EC16140317; Thu, 26 Nov 2020 15:38:38 +0000 (UTC)
Date:   Thu, 26 Nov 2020 15:38:38 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Boris Kolpackov <boris@codesynthesis.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Felix Fietkau <nbd@openwrt.org>,
        Patrick Franz <patfra71@gmail.com>,
        Ingo Molnar <mingo@kernel.org>,
        Arnaldo Carvalho de Melo <acme@redhat.com>,
        Junio C Hamano <gitster@pobox.com>,
        linux-kernel@vger.kernel.org
Subject: Re: kconfig as a git subtree on Linux
Message-ID: <20201126153838.GL4332@42.do-not-panic.com>
References: <20201125172544.GJ4332@42.do-not-panic.com>
 <boris.20201126122203@codesynthesis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <boris.20201126122203@codesynthesis.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 26, 2020 at 12:38:41PM +0200, Boris Kolpackov wrote:
> Luis Chamberlain <mcgrof@kernel.org> writes:
> 
> > I'd like to propose we discuss the possibility of taking kconfig and
> > making it a git subtree under the Linux kernel. This would allow
> > other projects outside of the Linux kernel to be able to update their
> > own copy / fork of kconfig in a jiffie *very* easily.
> 
> I am maintaining one such copy/fork[1] and for me the effort to pull
> in the new version of upstream (which I currently do by just copying
> scripts/kconfig/*) is nothing compared to the effort of maintaining
> a set of patches[2] on top of that which are necessary to make kconfig
> buildable on other platforms and usable with other build systems.
> 
> So unless there is also an agreement that such portability patches
> are now welcome, this is not going to be a major improvement for me.

Unless you have tried git subtrees, I doubt you really mean this. How
is a 'make refresh' command as comparable as manually pulling in
changes from a project to your project?

> And right now such patches are clearly not welcome[3] (but no hard
> feelings; I wouldn't touch Windows with a ten-foot pole if I could
> help it).

Portability of kconfig to other platorm is a topic of its own. If that
sort of conversation can exist, I think it would have to be *secondary*
to deciding whether or not kconfig lives on its own to allow other
Linux projects to benefit from it.

  Luis
