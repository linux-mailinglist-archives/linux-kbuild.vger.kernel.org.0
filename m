Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B93712C6CDA
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Nov 2020 22:18:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgK0VQh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Nov 2020 16:16:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730248AbgK0VQO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Nov 2020 16:16:14 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A762C0613D1
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 13:16:05 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id j10so7323109lja.5
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 13:16:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Bcq5nvyQqo6mh3u7DswmsrnqFs0sPScZXFNxYa3vNA4=;
        b=c6828afhOnkbjpth7Yk1WdawsTrP15Loc77tsWPGeki6JdT3pIdKiz1Rm7UQtJREb1
         FKJcxLizt0aPl/2jHtrHwf6U2yEVf9RbnFXpCojlP0i1Cjf1J+/uRsfzfOpmXvTbfqQJ
         T8Qh2BDNl3PSX+NtQ2pRuNIPHu3qPdPnszA7E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Bcq5nvyQqo6mh3u7DswmsrnqFs0sPScZXFNxYa3vNA4=;
        b=Jaa+VHzJ7kR2MSFBzAPLc5A7TNvz6VcXqBNnTwTwKrBT3fBj+fLPOwYWCxUpo6TRme
         hbjxY9E2OGk6ikKjOyI+jeto0AehkoX5tsaVZfGdMURDmaeIGwQ5fDwbpsnAPbICBCqQ
         bB/Vcm/Fw7jLiS3o86dEpZErbh2fRWKEjaNKi8yFrN4Ta3xiZ6O/DdxH82H+5kDyHlc4
         4QX6MOd4chNgvLbOKp/ZebUqzHRy8kLJNbi+DxExgr9Lcyq0j8564gPwO9n5d5y74fpJ
         CWP18wywS0RY+oekeIZJ6oTYcxnUV+3TJlQyDI48WbwUXJbY4fXdc2m70poHLoELt2WT
         t87w==
X-Gm-Message-State: AOAM530QvMbxn5OBI06lP21Hnn5q5AwaT8JLVQ9Sht/4TL1nnFJfIrsT
        Seav37DHEuTDUyPQ70rSKKLvjGtw4lM7DQ==
X-Google-Smtp-Source: ABdhPJzZmtOdpUSbZyYZxAqSopP0rL3D6Wvxo6iXjnce6C56NFDu92FuXYcKZQmDIKPxBEvxupJHUg==
X-Received: by 2002:a2e:a0c2:: with SMTP id f2mr4342807ljm.431.1606511763543;
        Fri, 27 Nov 2020 13:16:03 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id i8sm824901lfl.269.2020.11.27.13.16.02
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2020 13:16:02 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id u18so8776160lfd.9
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Nov 2020 13:16:02 -0800 (PST)
X-Received: by 2002:ac2:4199:: with SMTP id z25mr4440339lfh.148.1606511762473;
 Fri, 27 Nov 2020 13:16:02 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNASn4Si3=YhAPtc06wEqajpU0uBh46-4T10f=cHy=LY2iA@mail.gmail.com>
 <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
In-Reply-To: <CAHk-=wihYvkKOcXWPjY7wN13DXbh3k2YX_6JxK_1cQ=krbi9kg@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 27 Nov 2020 13:15:46 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
Message-ID: <CAHk-=wi86Eu8Whu66CVu+GVTxbuJG+QNvDuk-hXnWu+5q90Zeg@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v5.10-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Nov 27, 2020 at 1:08 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
>        make --trace allmodconfig
>
> shows a series of
>
>     scripts/Makefile.host:112: target 'scripts/kconfig/....o' does not exist
>
> lines, which is silly and wrong

Oh, this is a red herring. It's "make" output being misleading, and it
just comes from the FORCE keyword.

And no, those don't actually change the end result for me.

        Linus
