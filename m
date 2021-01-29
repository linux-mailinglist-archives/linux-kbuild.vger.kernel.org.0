Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75F1B308F9B
	for <lists+linux-kbuild@lfdr.de>; Fri, 29 Jan 2021 22:52:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232570AbhA2VtE (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 29 Jan 2021 16:49:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231940AbhA2VtC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Jan 2021 16:49:02 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E329DC061573
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 13:48:21 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id y10so1803907plk.7
        for <linux-kbuild@vger.kernel.org>; Fri, 29 Jan 2021 13:48:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nDCl0b2Dk+cS7GVWEWeoYxC8mwKbqEi6yIqTF9Oo/qE=;
        b=eGTW4MG8Pl3TK+TMkm4WglBjmPDuVT8H+GAviEyFrguRE6MRa/GZZU7J398/6ZxFe0
         xKPb6fAPxgSfXD/5KNroU2ifvPgvO1IC8xBnFPZzEvffhM+8Q1IErfcPS36GrEAidfn7
         mZUNfyj0ahxaGDAbfudWd+sU+mGeZMHZfwwVpRbB+qDyxpH5crTLeJwY1PlaMWn6JFMS
         NZ0bST5Evxu51geiAxpQM2AAPsjDwei/x21em74ddRcVbmAwrCX90CFifsFs6qZ1MfxK
         MGUg4o5cVCabYzEtUhZy2YrZ/jRtkSNA0vITi/lAdQbWRMyGdCsUvL40t9Y8gL8BLvub
         ckIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nDCl0b2Dk+cS7GVWEWeoYxC8mwKbqEi6yIqTF9Oo/qE=;
        b=Qp/kbM3Ipzhmx5DVyDckPgmT2Nxia6wwwkKNaOUpiQkz9jxRayqUoko9U9aWPpa0+y
         bSHVlvkGXSjPPkmlOyF0M/OVy9W8XdRAViha/EZpXf39RMxnyxEIdjAjIyslNDDeElzx
         nzKaagYPCmJ2r5movHMuY4vHdjQ7HPuR5qxkyCzM35j1m7szIyz8aPD0ikC1ByEGZbL5
         RkoNewDGP+8TE3B+4XrUy1mfbaYbn14E6pgQh1esAUWsguYlQ5yOdJF37n5Nmo5xP5Ut
         XE8zCQJ9Y/gDP+vfGz4NbvpNxjzfdfcMsRg0YyQV016uzbz4xx3rYPz5irE+ncL+J9EJ
         AJGA==
X-Gm-Message-State: AOAM531iXgzyiM9Qspa5NFYmkTT0lQHgGpqPJbBBXbdQ96zCYpo5PWdb
        1RQT71c2NT1X9Nj7Nue+M6SruRU9tsc3jh0wvUwrtA==
X-Google-Smtp-Source: ABdhPJyaUQFnwwGfCgFgWXfe9NvNBiQYNFxLJPMiY6STretlJGU4TmCaVSMStJjR790JfgkGm8fCqn5KCHfOCa2LqxE=
X-Received: by 2002:a17:90a:8b82:: with SMTP id z2mr6338917pjn.25.1611956901187;
 Fri, 29 Jan 2021 13:48:21 -0800 (PST)
MIME-Version: 1.0
References: <20210121082451.2240540-1-morbo@google.com> <20210122101156.3257143-1-morbo@google.com>
 <CAKwvOdm+3o8z2GivPjSJRa=c=UKdfkiY-79s6yn2BxJkFnoFTw@mail.gmail.com> <CA+icZUVbdbkboYNztXNtRDR+LH8yQbhZJ+Nw-h91TQRr=Z08Gw@mail.gmail.com>
In-Reply-To: <CA+icZUVbdbkboYNztXNtRDR+LH8yQbhZJ+Nw-h91TQRr=Z08Gw@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 29 Jan 2021 13:48:10 -0800
Message-ID: <CAKwvOdmyerPPJo=m+13jtWR_kPwrmOeb89jh=qgGzEaPhKDOLA@mail.gmail.com>
Subject: Re: [PATCH v7] pgo: add clang's Profile Guided Optimization infrastructure
To:     Sedat Dilek <sedat.dilek@gmail.com>
Cc:     Bill Wendling <morbo@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 28, 2021 at 11:43 PM Sedat Dilek <sedat.dilek@gmail.com> wrote:
>
> Some comments:
>
> [ hash mismatches ]
>
> Observed identical warnings when doing a rebuild with GAS or Clang-IAS.
>
> [ Importance of LLVM_IAS=1 working ]
>
> Clang-LTO and Clang-CFI depend both on LLVM_IAS=1 (see for example
> "kbuild: add support for Clang LTO").
> Sooner or later we will deal with this issue (hope it is not a local problem).

If you're switching back and forth between GAS and IAS, then I would
expect a hash error if you're trying to reuse profiling data from one
with the other.  The profiling data is not portable when switching
toolchains between when the profile was collected, and when it was
used.
-- 
Thanks,
~Nick Desaulniers
