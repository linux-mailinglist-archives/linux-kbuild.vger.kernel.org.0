Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30E34199AA7
	for <lists+linux-kbuild@lfdr.de>; Tue, 31 Mar 2020 18:02:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730562AbgCaQCd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 31 Mar 2020 12:02:33 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:37842 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730560AbgCaQCd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 12:02:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id i34so406080pgl.4
        for <linux-kbuild@vger.kernel.org>; Tue, 31 Mar 2020 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eZXXG443uKpSgfNEJ0dEluZmkv04301vNY8sTrH9njo=;
        b=o3zehxjmag5NakEZfFg2RqsjIVFQbAr+Hr142Z/jaWpzD9M9pV55Ec6CyR8+WtYyNj
         zJEShpo6DAxWY0maP0Xrkt76nMtW6ucnH/4pQ1CpiUpIiu+ywNAjKuA8Elnq7L4qwQUu
         MbcTePJ2DxRo1GtsWqIi74HsVCfTb+K/DhueZVyIKCP3bppxBYeImYRF4dpqOcPwdMgG
         NsLBacY7UPqGdcdMa7uDMrZ6PlW67aqPb+yf98FlKfC2EeVKg/d4JtAqY264r0NI0R8U
         uMJAowrGvTxrqmYc614/RlhbEOQhYy+eylmncvKQPrYPEOtt0flq5i0P4nAMPttkTbw+
         2klA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eZXXG443uKpSgfNEJ0dEluZmkv04301vNY8sTrH9njo=;
        b=oZB4Zcc+qUXNArubJRl59zXCnqb7xpJF2e58FHqTPdU3z92uwEYcXmebndBM8DEYUz
         A5ZpW52F1gjs1UCLsgjBnDpqC78wYWAw+HA6ZI/MnExCpVDFIFGOCxT99NPcpGt1EG8s
         1x+pbYw839gyOtrFJNhXdcX3d0Rz99J99CvVBzMFM+vPzUBBMaVdhTWH68i50ALL6e99
         fnmZPNltiXt9kKCKcOGkeuQJpKBDr/BFhpBmE8lTHvDbF/F6tfqFU/UPKUVzsLGWAmht
         xtM868BsELrSxt6+/RG49fPQX4kgR4poocFME6KVCo6t0TUPXAoV/exuutOpmq605Ele
         XJzg==
X-Gm-Message-State: AGi0PuZSddWoqwgS9X4SCWPV2nJGs+sL254wUuEYLkrZx3IpwFIJInXb
        ts0WvrIiZZW+2itYHB/ffn05DEbbDD85HlX7zHYcgA==
X-Google-Smtp-Source: APiQypKTUIgSCVTCzjJmedQpID1qg/aVFr9Kah3/bPpP/Wb+lalxGGDeco9c06qITTHZkr7RMLAO4TtzxWyduyG/tMQ=
X-Received: by 2002:aa7:919a:: with SMTP id x26mr15382467pfa.39.1585670551606;
 Tue, 31 Mar 2020 09:02:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200326194155.29107-1-natechancellor@gmail.com>
 <CAK7LNAQ8uHtuhd7DiGGOLbkEX524rPjfUuWAHjU-_92Ow3_1Pg@mail.gmail.com> <20200331101122.GA6292@ubuntu-m2-xlarge-x86>
In-Reply-To: <20200331101122.GA6292@ubuntu-m2-xlarge-x86>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Tue, 31 Mar 2020 09:02:19 -0700
Message-ID: <CAKwvOdkkpnkLwtNctSnebXTwumfprEQtLiuM5_4e-UBFTYBUxg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Enable -Wtautological-compare
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Mar 31, 2020 at 3:11 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
> Just a follow up, those two patches have been picked up and should be in
> this coming release:
>
> https://git.kernel.org/balbi/usb/c/58582220d2d34228e5a1e1585e41b735713988bb
> https://git.kernel.org/rostedt/linux-trace/c/bf2cbe044da275021b2de5917240411a19e5c50d
>
> As of next-20200331, with the former applied (because it is not there
> yet) along with this patch, I see no warnings on arm, arm64, x86_64
> all{mod,yes}config.

kbuild test robot is testing more arch's than that with Clang so it
may report if it finds more instances of that warning in those.

-- 
Thanks,
~Nick Desaulniers
