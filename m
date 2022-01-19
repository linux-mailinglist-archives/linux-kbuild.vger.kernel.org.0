Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5F4493717
	for <lists+linux-kbuild@lfdr.de>; Wed, 19 Jan 2022 10:20:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352994AbiASJUZ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 19 Jan 2022 04:20:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352987AbiASJUZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 19 Jan 2022 04:20:25 -0500
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 513D9C06161C
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jan 2022 01:20:25 -0800 (PST)
Received: by mail-ed1-x535.google.com with SMTP id cx27so8317155edb.1
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jan 2022 01:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CrKLop8goJNAb7F3nsn024T54b0Rb1lNYvD3dS3QIUg=;
        b=IysqV66EW2ES4sCLHdqMGUXBEuQJc4fTU3SXkhhXKLiMJAWtXrH5G+5FT/Jm4oauK1
         OndgKqCg0VKgwrpn9LiBUfoANaWFs71Hu8FjcSLktWZFpxHzkgN4PdgqA7jeuFABJwhw
         AI3KoA629xhfoZN9ioXEHjbTTG8OtmtEmxIb8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CrKLop8goJNAb7F3nsn024T54b0Rb1lNYvD3dS3QIUg=;
        b=0PR6Kx8/HPHSJQ5FTrVucXUUMh7lsxNqaadfMzLHzxzMaVODJ8B5+cLxLiMui64NP9
         WjBcBEQHN52UloL6L0Hii0rKBRsypAlzWtC2h510YtNDm7AZ9xsBEnqyAmQeCZu1OCKr
         ERY1eXj/W6+wMbrIID3v+8VE/4SNWIBAmGsU0WnyUw5k70FFm7KzwxFWYt5jdQwVwdC9
         YGinPmkfdrZGOzvWC5S+FSUPrMzcque4NwQjZ2no0SzuH84LOW60pGrWuxahMFIdZdpT
         zYitDHagNQHRMAuayfLDvsnKP2OxZDF5veiSgawyDSKMuvlM2QMGSTxC7lYW/ep1DTI5
         0Uyg==
X-Gm-Message-State: AOAM5321JMJFa3gtPjekj0O9ETOsh0JoOV0JdFA9j7ITJ4OtDp0iRWrO
        UXSBoLwK0asr2yPI2ltXi0HmER896/j2M7QWfWc=
X-Google-Smtp-Source: ABdhPJwgrLnqpEvntxPkGGxB6cVXfOqCEpAxIxATXjR4KN7UIbSgfzyDJlEU7RTu12FA/6euuy1abg==
X-Received: by 2002:a17:906:6691:: with SMTP id z17mr23497414ejo.763.1642584023684;
        Wed, 19 Jan 2022 01:20:23 -0800 (PST)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com. [209.85.128.47])
        by smtp.gmail.com with ESMTPSA id h13sm918649edl.96.2022.01.19.01.20.23
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jan 2022 01:20:23 -0800 (PST)
Received: by mail-wm1-f47.google.com with SMTP id c66so3952794wma.5
        for <linux-kbuild@vger.kernel.org>; Wed, 19 Jan 2022 01:20:23 -0800 (PST)
X-Received: by 2002:a5d:5582:: with SMTP id i2mr3756654wrv.442.1642584022918;
 Wed, 19 Jan 2022 01:20:22 -0800 (PST)
MIME-Version: 1.0
References: <CAK7LNAShL3dfQ0Ter2avCvGPjrd0YTJau-S4+8rJyWXmu0tG0Q@mail.gmail.com>
In-Reply-To: <CAK7LNAShL3dfQ0Ter2avCvGPjrd0YTJau-S4+8rJyWXmu0tG0Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 19 Jan 2022 11:20:06 +0200
X-Gmail-Original-Message-ID: <CAHk-=wiizVi7p_VbaXgKxSne9fAEqNR8F_ivx95_2mkGOxxPqg@mail.gmail.com>
Message-ID: <CAHk-=wiizVi7p_VbaXgKxSne9fAEqNR8F_ivx95_2mkGOxxPqg@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for v5.17-rc1
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jan 18, 2022 at 9:43 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> You will see a trivial conflict in scripts/link-vmlinux.sh
> (commit 72b3942a173c in the mainline
> vs 7d153696e5db from this PR)
> The fix is available in linux-next.

The resolution in linux-next seems to be wrong.

It missed a new case of

        if [ -n "${CONFIG_SLS}" ]; then

in scripts/link-vmlinux.sh, which no longer works after commit
7d153696e5db ("kbuild: do not include include/config/auto.conf from
shell scripts").

That needed to be converted to

        if is_enabled CONFIG_SLS; then

too.

I think that was the only case. Knock wood.

             Linus
