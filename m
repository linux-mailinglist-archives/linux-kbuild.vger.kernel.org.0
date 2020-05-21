Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4D49B1DDA11
	for <lists+linux-kbuild@lfdr.de>; Fri, 22 May 2020 00:18:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729922AbgEUWSk (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 May 2020 18:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbgEUWSj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 May 2020 18:18:39 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C685BC061A0E
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:18:39 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t7so3556080plr.0
        for <linux-kbuild@vger.kernel.org>; Thu, 21 May 2020 15:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=rf4tJm2txvY5na/8+j5CB7aTOYv72GPVmDh1yfq7cjU=;
        b=nawu1sY9brEek06PsqlCx+dbEytS8R+cmmspJLrpOj7ZS9sHjIk6H1Lgz/bOXZVdlY
         hVWs8bylJ6//TXJYlfSVYjhJ5c2vTijIs2jhfEJYhE4VPJQcHaVZ7nilo2rtsqNzvhfK
         JAgr+3J4j1Ziz7r8bPjyU7gqc4nmxNZSPYeK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=rf4tJm2txvY5na/8+j5CB7aTOYv72GPVmDh1yfq7cjU=;
        b=g3IxSDlkDvkSAaqVkd/uNb8tMG0caU2c1pkscq+1Ui6AbJRDK6OzAxjf2sVom8CuuZ
         nNTP/dgMo8+JPXeLEB9vkKIIX48Bx3uAEvKquM0gApNXblEX43XUNJDWED9noEg67bYc
         l4gXkRnSBODBqTnr5sWyKMJpIcTh2leAy9ekynOSs1vHbo6Z0GcM9/bB3/d5TFYv8tX/
         wqsL+36yKO5jKTfUsB3XlbQ0FymQ9OdsCqzjPLsv6BFo/CLEbKfM2MNEBHlotv3XDLB8
         ah4YggCcnRL0Qi0fhG1Yb0MIrj/boc8gHYdKRbhGiYRTG/hD+a6b1A7W5ZVilwgHuCS4
         T0Zg==
X-Gm-Message-State: AOAM531HBMsOFqYP44wriBAscDImlvYXcIuTrTSo66kfE1z4+UD/GR82
        obzt/UR3AiqhWUjQEsD8nYwYtQ==
X-Google-Smtp-Source: ABdhPJyXuTchiohxG/7qxMaOU9EGc8YbdDOkrtNLspmWALVB8rZMgnEet6n6kLKmBpBwp5T//sQtpg==
X-Received: by 2002:a17:90a:3d49:: with SMTP id o9mr754082pjf.26.1590099519333;
        Thu, 21 May 2020 15:18:39 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id a6sm5284031pfa.111.2020.05.21.15.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2020 15:18:38 -0700 (PDT)
Date:   Thu, 21 May 2020 15:18:37 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Sami Tolvanen <samitolvanen@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kbuild: reuse vmlinux.o in vmlinux_link
Message-ID: <202005211515.481BD90@keescook>
References: <20200521202716.193316-1-samitolvanen@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521202716.193316-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, May 21, 2020 at 01:27:16PM -0700, Sami Tolvanen wrote:
> Instead of linking all compilation units again each time vmlinux_link is
> called, reuse vmlinux.o from modpost_link.
> 
> With x86_64 allyesconfig, vmlinux_link is called three times and reusing
> vmlinux.o reduces the build time ~38 seconds on my system (59% reduction
> in the time spent in vmlinux_link).

BTW, I'll see this most in that it knocks about 6% off my "I changed
1 .c file and now I'm rebuilding" workflow time (which is obviously
dominated by linking), from 25 seconds to 23.5 seconds. And since most
of those seconds are spent staring at the build, it feels like a lot
more. ;)

-- 
Kees Cook
