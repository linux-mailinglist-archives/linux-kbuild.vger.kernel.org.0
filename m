Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6939319D4B
	for <lists+linux-kbuild@lfdr.de>; Fri, 12 Feb 2021 12:22:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229960AbhBLLWF (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 12 Feb 2021 06:22:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230393AbhBLLUp (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Feb 2021 06:20:45 -0500
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C87AC061788;
        Fri, 12 Feb 2021 03:20:30 -0800 (PST)
Received: by mail-yb1-xb30.google.com with SMTP id i71so8683643ybg.7;
        Fri, 12 Feb 2021 03:20:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=q1AsROKdOqecHVFM8xTf93PZvGwRiKKo+rKu3/qWAYU=;
        b=Y4JItaRYX1iOcq6I6r/1PFSjqcUSYr9/kEVFYU+F+RR2Dg7lbrbq1eYaOel0nh6TYV
         InK2A1Jv/Ftg7txiLUacnpMjNp8oKD7dv+EmWaBdbuQTKoFSrMP4XVEw3WRtBCoHaqOz
         M1WjNVDH+vP+AnT3NgJXMxeiXrJloqvBDCpKrpqDII5DqRDFVG0uneTxrHp+VfnAEsT5
         l/e3dUMbpEG+0ASiIg03GWEIXYFnLvVG881d/yaC0y5jgmzskt0tV/W2s6jkuiJ96szb
         FPg+56psqAeanrGQqrt0dWdvdj28E5DPy+moIEQLoo8lJalP3B/I37YRwyGpgp1ZAxNZ
         nMxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=q1AsROKdOqecHVFM8xTf93PZvGwRiKKo+rKu3/qWAYU=;
        b=CNYrvAUIXZwfiTnsqb5p5pv1tWwPTKwpe33c6tpOLpgoBkmne+8RSt8iKlZeCe/+Yo
         0KMwHElUQZJCCxvmSs78cPSHjFxpgPki/OL6gkdV3J7HnpV9yO9m3HyRsRQJHPOKLa2R
         SxGBlYDnALnMESFgZEnhfwmtN4J31DTr/Bq/gELGg9UudW4KbfAR5awzzpDYH34YTqWf
         VRAnwlyYMJyyuDulBQWvc9UkqgJzuKtFbRjxIOsK7iXxvryU5NL4rg8m1IdlO5bOmPMy
         cJbLZK8CzA5nXdekaaSWAEXAUKRrWIgPInyrnMhBYj8c8/c7aBx9D5nyC9OLUVTo2HaW
         BY4g==
X-Gm-Message-State: AOAM530NspXzzbmn8yqnXC1+MFrApa8SOQvpd4nB/rQv7zoNP4FVW5LW
        ssqRElm3Yxfny/1ungnctS9s+UZIcNzMUDNP4mr8W8SGeto=
X-Google-Smtp-Source: ABdhPJwHPtXZFQND6/aMQkNdlns62owet2KZa+OlygbcrEaee1JMglLKT/X3GizKSXyoEty429BdXMXOHxNZunKWCx8=
X-Received: by 2002:a25:7312:: with SMTP id o18mr3250196ybc.352.1613128829698;
 Fri, 12 Feb 2021 03:20:29 -0800 (PST)
MIME-Version: 1.0
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86> <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
 <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
In-Reply-To: <CAK7LNAT+CG9zqPpYLoy9_1eA4caZWzxyQACcOrhbg9zfArEwPQ@mail.gmail.com>
From:   Stephen Zhang <stephenzhangzsd@gmail.com>
Date:   Fri, 12 Feb 2021 19:20:18 +0800
Message-ID: <CALuz2=ck_=M6Dd8oFgWxnRGdipWOsdL2KODZQSmodh2N7Z8T-w@mail.gmail.com>
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

Masahiro Yamada <masahiroy@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8811=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=8810:16=E5=86=99=E9=81=93=EF=BC=
=9A
> Please stop.
>
>
> Commit 6ca4c6d25949117dc5b4845612e290b6d89e70a8
> removed the tools/ support.
>
>
> There exist two build systems in the Linux source tree.
> Kbuild covers the entire tree except tools/.
> The tools/ directory adopts a different build system.
>
> It is a pity that the tools/ directory
> went in a wrong direction, and people
> try to fix problems in a wrong layer.
>
>
> You are not the first person to send to
> tweak obj/source trees of this script.
>
> You can not do this correctly
> without terribly messing up the code.
>
> Please do not try to support tools/.
>
>
>
> --
> Best Regards
> Masahiro Yamada

Thanks for the suggestion.But what we try to support is scripts/
instead of tools/. 'tools/' here is to help explaining the problem.
Or am I just misunderstanding your words?

--
Best Regards
Stephen Zhang
