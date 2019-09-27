Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2216DC09A8
	for <lists+linux-kbuild@lfdr.de>; Fri, 27 Sep 2019 18:35:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbfI0Qfh (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 27 Sep 2019 12:35:37 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46655 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727289AbfI0Qfh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 12:35:37 -0400
Received: by mail-vs1-f65.google.com with SMTP id z14so2247422vsz.13
        for <linux-kbuild@vger.kernel.org>; Fri, 27 Sep 2019 09:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SPdMiX1DB6yH7UTwD6nnQ3yXveUHAyrjtppQIJgHs6s=;
        b=ntYukBtQp1VqGY2ZpspKHPAz3jRzk+QXud3ldxVFWpCMYFzHm01OCAotrjTeU8clMT
         ptI5f0iYumQMfQYOCT1iYqlWUuxo1hFtBZwn9LFAZL9buHPqj0POrcrgmggEmpChf4J4
         XRe0crhEppGgxl05bHqXw60ErcBEQhvNBY8OSX0+4mieTPtZ00qTDHhGDTr+gfbquI7b
         ADjBQ9xiUSrxKT6A2FN9KFc5MvznTwX7ggKZGFiNp7EbspbLLG0CT6i3aU1LRDDNH6VY
         /gHE/5cln4Vua2xJu0SRLG1ziTH5SlJ7p6cCVV2QEIgkarPhlz2Hqaw0m92ilGqKQJ/V
         tnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SPdMiX1DB6yH7UTwD6nnQ3yXveUHAyrjtppQIJgHs6s=;
        b=GS2V92/c52ozew+wJzv/kaAtgzGThMvQfjQqhJRgewU9/zXVgofNg40+3iKeHohPYX
         0SIEBR+c+p0rQj6h1gy8unxErARyeH9448oiUvB0F0T5Ho4y8+tIMB3TBTG/Zcu6eowq
         u1aZRMbVQk6nSzDLQVooeJOBOVlBnYo4lqdciEUmHE04cm/1iBHU/ZnmNzjyJMT9G82h
         oZXNwaK6lw9f6ERKWVk/UFlq7IxPSpJP15qhLvK7gOt9GmDpUD4OvWz6fPYEcNjVD9m1
         Xw3/ovMhyH9w0F1D1gK0XQaPCIOmqmETRnTl6kobsJP77tGer5yUim/XrR8i/hEiWkMr
         Yx5w==
X-Gm-Message-State: APjAAAX0XP3MW8zXQHbHvSe7orwjNTo+AfVXBxcrYms0p+Aj+Km+T0b4
        GwsAhAm4flX6X/P1sfjWdL1+WI37bNDyrPnUCms=
X-Google-Smtp-Source: APXvYqwh3FxY0UiMBoR85xADpIWCiCfioKMmP6dNcfscYXWGLsv1XyEwQbS474uOhaUgq8xVeGgtVibo9P5lMZ0CPAE=
X-Received: by 2002:a67:1387:: with SMTP id 129mr2834444vst.108.1569602136285;
 Fri, 27 Sep 2019 09:35:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAKYFi-4i-rspPYsYPznjcU+_v02sKEewxFLQuHyx6i11v85UWQ@mail.gmail.com>
 <CAK7LNAQ8xu=6PD_Pz8wPrshsTtHprwjQEj7qFoFsq80rc5bDZg@mail.gmail.com>
In-Reply-To: <CAK7LNAQ8xu=6PD_Pz8wPrshsTtHprwjQEj7qFoFsq80rc5bDZg@mail.gmail.com>
From:   constant override <constantoverride@gmail.com>
Date:   Fri, 27 Sep 2019 18:34:52 +0200
Message-ID: <CAKYFi-7FbdHqobEYBCpYprABOEhPN0wrgEsujFv6V3D71Vz4cQ@mail.gmail.com>
Subject: Re: scripts/kconfig/nconf.c stuck in infinite loop in search
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Sep 27, 2019 at 5:54 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Fri, Sep 27, 2019 at 2:41 AM constant override
> <constantoverride@gmail.com> wrote:
> >
> > please have a look at the patch/solution here:
the only reason I even mentioned it here(ML) is because someone in the
comments asked me to.
> > https://bugzilla.kernel.org/show_bug.cgi?id=203437#c0
> >
> > thanks!
>
> Could you send it in a patch form to this ML?
"using your real name (sorry, no pseudonyms or anonymous contributions.)"

no can do, sorry :)
>
>
> Please add the subject in the form:
>
> kconfig: <one-line description in imperative mood>
>
>
> Also, one important thing is
> to add your Signed-off-by:
>
> For the patch submission rule, you can refer to:
>
> https://github.com/torvalds/linux/blob/master/Documentation/process/submitting-patches.rst
>
>
>
> --
> Best Regards
> Masahiro Yamada
