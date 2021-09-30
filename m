Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C3FCF41E506
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Oct 2021 01:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350178AbhI3Xel (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 30 Sep 2021 19:34:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350091AbhI3Xeh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Sep 2021 19:34:37 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB2C3C06176A
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 16:32:54 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id j15so5111093plh.7
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Sep 2021 16:32:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4kRmuKUrahG9seIEHQB8p6vrb39NQ+GV6pMPjXiJNGs=;
        b=HGL/KZ0jqmCjgbTC6ZXynflpAz4V9xD4Mrxgfi7Kn0MHTJWTnskxqDkMvms2lZGIBX
         whpqyazTpy2WtYvPuYsK9Rl1plz9CEAHbe6bojro555WymT5Ktlnf71IzZvSWMtvXF8y
         RVJC3FRFGCejSZhDyqDruGQDzPijplhH2aIjJP9b30rhYFo3YI9uX4VrtJ1W5OsoD4A1
         Vx8c7TahhZJPzOTU/Frqsve3jdPPj4a0Yv08b57EKla0aymni0laUlX1x6dqRTKzozLD
         CzP31LoWH9QzHqbvJkkI1pVHyAVR9qCaodFSUAyka1kYpV162lBAL0LrXsz9unCiycis
         oXqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4kRmuKUrahG9seIEHQB8p6vrb39NQ+GV6pMPjXiJNGs=;
        b=lct+y9QkaCKxSW+y3QeqAGVhQHdwMyerVXl9zIfF3SOQfFA4+x244WzGlT+JvMH0Tl
         5xW2qZ9H5phIqexKHdCYXbg2Hr6dsYxvyGRadhIY/5kU1dm4bXB3k++aw98Qn0ReTmoY
         B3xZDEX+PI6VMOEIcPBeEknk42Koknp/Uo/6qcsJPSS/5BAH3c9OAL7YB46Xu8IWS7KF
         ygh1UZPXuVDRAiVk3AvzuHCsPZK6f4PBx1oVZyzVM0RPlk/63q6E/fV4GqxsGa7h4pYU
         ew83xnd7axnvCZaUbCbMWQQo7MgGCkPxCX4pZN32Vz6UlR7P4zdxRlZO4m1UsWYte4Ug
         bm5A==
X-Gm-Message-State: AOAM530Xr7ZtofhFB0hAc+S8mKkvBAJu3hDVqE9/fE2aX39Om+SMOl5v
        YiszJCxnoZOAt7L3z/TENR7//g==
X-Google-Smtp-Source: ABdhPJysrpFMMVhFfdW8pGBLGHU+1+GLI5ELLB1RDK4HzOKTh0AU6VhWr2DYdGsWszQCpgnuITTLGQ==
X-Received: by 2002:a17:90a:4091:: with SMTP id l17mr9552554pjg.138.1633044773874;
        Thu, 30 Sep 2021 16:32:53 -0700 (PDT)
Received: from google.com ([2620:15c:211:202:c01d:f023:c9b5:66e8])
        by smtp.gmail.com with ESMTPSA id b12sm4063267pfp.5.2021.09.30.16.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 16:32:52 -0700 (PDT)
Date:   Thu, 30 Sep 2021 16:32:44 -0700
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        llvm@lists.linux.dev
Subject: Re: [PATCH] modpost: add allow list for llvm IPSCCP
Message-ID: <YVZJHNchx9LZz//v@google.com>
References: <20210929225850.3889950-1-ndesaulniers@google.com>
 <CAHk-=wh0BNEDz+uOdJWG8iW=n0PeOEjZpHyuSN2g0pKSCj+6iQ@mail.gmail.com>
 <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdn-Z1q99zZW4GQ2aNnVMQ_JYuczrResTG7tvcfv0WLJ-w@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Sep 29, 2021 at 05:18:49PM -0700, Nick Desaulniers wrote:
> On Wed, Sep 29, 2021 at 4:28 PM Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > Or, like in at least the early_get_smp_config() case, just make it be
> > marked __init, so that if it doesn't get inlined it gets the right
> > section?
> 
> In the case of early_get_smp_config(), that's what Boris suggested:
> https://lore.kernel.org/lkml/20210225114533.GA380@zn.tnic/

Sorry, I misremembered the above thread. That's what *Arnd* had suggested.
