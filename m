Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29A3230C5AA
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 17:29:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236450AbhBBQ3N (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 11:29:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236284AbhBBQ04 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 11:26:56 -0500
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 792A9C06178B;
        Tue,  2 Feb 2021 08:26:15 -0800 (PST)
Received: by mail-il1-x12f.google.com with SMTP id z18so19339511ile.9;
        Tue, 02 Feb 2021 08:26:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uUPSf5IONoMjH7eJPdjOKIHOgkvLOpGL4eqwWCbjGqQ=;
        b=VnsLZMaMRaxj7WfTbrUjXcfUBtOJvRdty0dDO+U2Eh9+5DIogmRJs8nsGV+0p1ppBm
         z53Se1utHs8QgVHjuWDH6rTIxGRNUl4Mwgt1m+FGzRCurII7IoX6z7a3Y+10kvzwPBTG
         6czCsyV3zX4mKbUm1CvSJKZGeVwiJz9fqC80p7FSf5H4cX972oCrZqMOYWwynmDyR6Ks
         mgl3jSagE26iDArQM9FzC4fuys07ib4rGC7RG13HIeD8lxBioUz7JWft/P5hGRY7fyeW
         NjF4CTpfGSmzygDz+72Cwva1CxHj68LV54H02Hb8MKc1kJ6j7NIIkibSG0U0vVgj8vnT
         Bf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uUPSf5IONoMjH7eJPdjOKIHOgkvLOpGL4eqwWCbjGqQ=;
        b=C7oAh5lAqj4BjyEefMbWelr/dm0B1nj0rPOVfZ4WHRe3Zx3q3KdL/mbtp//GLURP7m
         X1jRzU2xmrX5oWAfwUkZxZnFGHi+GMRlAUs2UQRa0wEYQ3CTuh2rQWQte1h0IOcbDpQn
         NIwFE1AnKmZMlsRpl/vXhmApW9nsXs1gW3su47LGO3PUQ2Z+OnCe+BVjStHnnbCv9/F3
         ogt1/VoPQk0dYce22Ztc5KeUJI02V4cMdtJMtFP+lbvhQNltd2Jt0X8JPH2oqJbdw878
         qUfJU0mnZfa4FIkmfEU/fdKc+PaT6WXCtAXHIz4P9rq3z3kCceaf4jaC/qE/lfhIYQFx
         gj+A==
X-Gm-Message-State: AOAM5313JU+AyQf9ng+rmgE5uCWHJfuhIihFcsIQg7kEaJ/V6DCAMAMJ
        ZwnYbD9lwVhYHmJAc0jCSjtGXsAKx+kuFhRaqFJcpdXqMz8=
X-Google-Smtp-Source: ABdhPJzce812e00lFV/98GezeHMsK91BtHrPg83M1U807OvDlwrIfgM7Kzat6SmzGT6F4/pLAaLB1/wCSDCDotAxpuw=
X-Received: by 2002:a05:6e02:1343:: with SMTP id k3mr530712ilr.102.1612283174756;
 Tue, 02 Feb 2021 08:26:14 -0800 (PST)
MIME-Version: 1.0
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu>
In-Reply-To: <20210202053307.GB28542@1wt.eu>
From:   Amy Parker <enbyamy@gmail.com>
Date:   Tue, 2 Feb 2021 08:26:02 -0800
Message-ID: <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
Subject: Re: Alternative compilers to GCC/Clang
To:     linux-kernel@vger.kernel.org
Cc:     linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 1, 2021 at 9:33 PM Willy Tarreau <w@1wt.eu> wrote:
>
> Hi Amy,
>
> On Mon, Feb 01, 2021 at 03:31:49PM -0800, Amy Parker wrote:
> > Hello! My name's Amy. I'm really impressed by the work done to make
> > Clang (and the LLVM toolchain overall) able to compile the kernel.
> > Figured I might as well donate my monkey hours to helping make it run
> > on other compilers as well. I haven't been able to find any that use
> > the same arguments structure as GCC and Clang (read: you can pass it
> > in as CC=compilername in your $MAKEOPTS). Any compilers along that
> > route anyone here has worked with that I could work with?
>
> If you're interested, you should have a look at TCC (tiny CC) :
>
>      https://repo.or.cz/tinycc.git

Thank you for linking this! Wasn't able to find this git repository
for it - only binaries for nonfree operating systems (yuck).

>
> It compiles extremely fast, implements some subsets of gcc (a few
> attributes for example), but is far from being able to compile a kernel

Well, we'll see what I can do with that. :)

> (at least last time I checked). Its speed makes it very convenient for
> development. I made some efforts to make haproxy support it (and provided
> some fixes to tcc) as it compiles the whole project in 0.5 second instead
> of ~10 seconds with a modern gcc. It could probably compile a kernel in
> 15-20 seconds if properly supported, and this could be particularly handy
> for development and testing.

Oh wow, yeah, that would be great. Thank you for pointing this out!
Compiling the kernel in 15-20 seconds instead of the current *couple
minutes* would definitely be great.

>
> Regards,
> Willy

Best regards,
Amy Parker
(she/her/hers)
