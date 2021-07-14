Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C98B3C91F5
	for <lists+linux-kbuild@lfdr.de>; Wed, 14 Jul 2021 22:19:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237148AbhGNUWs (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 14 Jul 2021 16:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230004AbhGNUWs (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Jul 2021 16:22:48 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A91DC06175F;
        Wed, 14 Jul 2021 13:19:55 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id j5so2861149ilk.3;
        Wed, 14 Jul 2021 13:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7L4kksj/vfOAUbxuHKgQDlq1eiLc/XNqtZfav2j7JVs=;
        b=jR7ZAc1fIM4vo4zdVr/y4sbLOKemEpSL/oQO7vRGlxCE03qUBOdBJR2miQkPtkUSov
         CtMwnWBR37jxHJAYZgODBG0PTFl8wCuIiH6K/l9ufF9iGtqkC1623m0YNeYpU9gsUzYA
         SABvdDKjEJAniWbDygpQa6O/glAdqHUV8y4kwjmQI6zeUDo8oJC6QElBbuiEvj/gZ9n/
         GmbTaXaxCF1xPA5bcZeBcwNDXcUZIcJ7gXvsNw/Fr2AHldhjMwQLLqAkqnsoKhH1B+DN
         mHmsDheSZC+/vg50tL1RJiMjmhbueLF481b/UF1fGdIvPUcUgipfXRqsFv9B/SQ2avwS
         R8yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7L4kksj/vfOAUbxuHKgQDlq1eiLc/XNqtZfav2j7JVs=;
        b=P7e/+LIo/cfTuSyQFjce3tQZp6/cFtcicriiFgxqdAQTt1o58oCX0BMORJUA7u/E7t
         2GQIFFYEc7BzSX/OPWmKniST6piXqCvDZs+wfXYvjK/IIdHD+Zjd7y2HwqAOzjwHzbpp
         aW+lUnZ2YIb7yutcuHACM+dI3+mTyPFLmz1FiPoAysb46UkQc7hGnU9yp40N8th0wYDL
         YbA0d7JcjayaE8o0Kg9vWcql8rFPdA1n8ThVd5PnC8yO96MeeCvBdcZOOeT0SFijuwHZ
         Nm7HfhjZbTCj9A+yIe4HxWfIVrmEJ+pb4xEGGMk2OD5Z+QIxgkDsImXt5MjpKbVbxNF2
         icYA==
X-Gm-Message-State: AOAM532LnvH0gIjIi7Y0OPYQ8lrFmvKw5LyK+wMInNiFyJojW52lzILk
        1UX+hJ+WqyQSNs5DkuFglA95DlP78PAF644XMUu5oHRMAevmHA==
X-Google-Smtp-Source: ABdhPJzah4445d7rlsM/MOuKDZT+/KyPCUkqd8cC0SG0y0ixvYaQx9ZMzPCSjcA5UWfZ871Hmvxv4+guF4BBMJEixAY=
X-Received: by 2002:a92:b74d:: with SMTP id c13mr7737985ilm.176.1626293994890;
 Wed, 14 Jul 2021 13:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 14 Jul 2021 22:19:43 +0200
Message-ID: <CANiq72mronNX4MfKGvzQTe0R3Fd=2M32bX8acdaij9sGopmerg@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 14, 2021 at 8:20 PM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> For C++ demangling, we have c++filt.
>
> A quick search turned up: https://github.com/luser/rustfilt
>
> but if the v0 mangling scheme is upcoming, I doubt a repo that hasn't
> been updated supports an upcoming scheme.  Is there a more official
> equivalent?

Demangling v0 is already supported by the latest releases of binutils
(2.36) / gdb (10.2), e.g.:

    echo _RNvXNtCshGpAVYOtgW1_7example9my_moduleINtB2_13MyGenericTypeNtB2_6MyTypeENtB2_7MyTrait9my_method
| c++filt -i
    <example::my_module::MyGenericType<example::my_module::MyType> as
example::my_module::MyTrait>::my_method

See the current status at https://github.com/rust-lang/rust/issues/60705.

(which reminds me I have to update the "Hacking" section in the Quick
Start guide, because now the releases I backported the support into
are not needed anymore)

Cheers,
Miguel
