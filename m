Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AFB8731B87F
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 12:58:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229928AbhBOL6Z (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 06:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbhBOL6Y (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 06:58:24 -0500
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF0C6C0613D6;
        Mon, 15 Feb 2021 03:57:43 -0800 (PST)
Received: by mail-yb1-xb35.google.com with SMTP id n195so6877239ybg.9;
        Mon, 15 Feb 2021 03:57:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tPsSRC32Tt/1UUo7+8DjmKZQ4k3SqdIUalMtUn5imSE=;
        b=dQLZtwISF06Vdfv2ROIu9JYugUa9OgLm5DHHTCu+LbXbScod8eRWwf1j3W9Ppg9p1Y
         i8OjfopMQmMMBBz/CeUs/fjv9saPAK20ftXdr3JF78pQIxjeXRcatkqAozZXiKwDzhoy
         5+sFNf6xIBSmRswJo+fQeIDNWVWDrLoPYI1RT/tmlUGreU3cU/ExHaZ+STUcoQRTxqq3
         ZHLMcUwDBuZnzf5H2FWKSrB8RtrQhkFn7vswiGwOBBocwc7JVimGLWaLwvlE4THMbbBC
         zd9Np/4C9p6ZRKCG6w8HG23ln6oYFhZRcg2i2dQ3RM45j+lLOnQcqICGVPd+sBlch+IP
         7cAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tPsSRC32Tt/1UUo7+8DjmKZQ4k3SqdIUalMtUn5imSE=;
        b=HbBxK9SkQw16DJf5M3QV9eCtPtqyJA+5z1pbur0kV8gjnykdjcgi3uxbtVwLbXJbM8
         V39KcnQQKx/kW70xyPQOHj/4vVovbhG5t/p2BshvcUZRFFGKrStaoZpym73rVmLvESL9
         8A59qtZxA8Lb8MAWEUu6R7mCGiut6VIKemMhHBo6Fzmt0AIoYfbaZmo/j0O0Yrt2lLbu
         No8RW0DnZmHsFGDNNwQf0uEn3KeD7cu8tYFGdEO+f/4TntzEel7y3z+NZkvXBamNVs0d
         lQMvDafR/37q7yW1YtDn7TncDoCCVeNxbtuz/WJlqEL54ruuHQtWtU94IYsUnZqbmLDy
         GjtQ==
X-Gm-Message-State: AOAM533uuzB+1XGBbjWi1+UbO/QiRC2mTWsMXWFOMfuyS2Hm4V+Ruxwx
        A0qYHzavaR94Buy7Kezd14Ez/Yu2GTHow8vJhOE=
X-Google-Smtp-Source: ABdhPJwCptyHemlLOfWjl5JiCUZzIhKPnxuPAdsK6amAI8LMdza622Je2Ww1riRJnXJDQ/Tix94A+e+Jfp+MBwheTBQ=
X-Received: by 2002:a25:e08b:: with SMTP id x133mr13092641ybg.138.1613390263076;
 Mon, 15 Feb 2021 03:57:43 -0800 (PST)
MIME-Version: 1.0
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86> <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
 <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
 <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com>
 <CAK7LNAR06H3Ue5SG3=6u1veyjg+kXXb2isEBsHVQEtMMJ3d2Tw@mail.gmail.com>
 <CALuz2=fHXZ=NrVdRNzyromD88wp9pAzYC9nffPt6y5YM=sJniw@mail.gmail.com> <CAK7LNARoL19wQo84AZAizZBzXJKkg3KciryQU+Sm5Uc4BDd9DA@mail.gmail.com>
In-Reply-To: <CAK7LNARoL19wQo84AZAizZBzXJKkg3KciryQU+Sm5Uc4BDd9DA@mail.gmail.com>
From:   Stephen Zhang <stephenzhangzsd@gmail.com>
Date:   Mon, 15 Feb 2021 19:57:32 +0800
Message-ID: <CALuz2=c62qb-gG7r892sw=QRxr7MZMxGv09eSdFd4=2ZHmhE7g@mail.gmail.com>
Subject: Re: [PATCH v1] clang_tools:gen_compile_commands: Change the default
 source directory
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        LKML <linux-kernel@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Masahiro Yamada <masahiroy@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8815=
=E6=97=A5=E5=91=A8=E4=B8=80 =E4=B8=8A=E5=8D=881:10=E5=86=99=E9=81=93=EF=BC=
=9A
>
> So, what is the problem?
>
>
>
>
> --
> Best Regards
> Masahiro Yamada

Okay=EF=BC=8Cit seems that I misunderstood what you said before.

--
Best Regards
Stephen Zhang
