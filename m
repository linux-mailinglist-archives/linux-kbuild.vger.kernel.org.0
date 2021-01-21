Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 285032FF032
	for <lists+linux-kbuild@lfdr.de>; Thu, 21 Jan 2021 17:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387844AbhAUQ04 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 21 Jan 2021 11:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387852AbhAUQ0p (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jan 2021 11:26:45 -0500
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CEBC06174A;
        Thu, 21 Jan 2021 08:26:02 -0800 (PST)
Received: by mail-io1-xd30.google.com with SMTP id q129so5177645iod.0;
        Thu, 21 Jan 2021 08:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=aaKhKct3ImPnrveXxBya8SOIzEUzRg0gfWNOxlVt5NM=;
        b=PwgJ1uAXRIIQ4yGRndNE5e3r+59O+ZUAlqEtwbWWLr80GCiWjnnsQYYbh7JeBiy6AT
         IGUybexdKWddsOFXzcARoiqUjWeMes4vyQmXMmHi+a+AtIi30PGLuDD63XoPX+sSMuPH
         HQG/iXtB8q1esk1tu1qjmFHFSZUbW0YIswwKyvtuG8TOMUfuJmVu82bFgzcYDVHZkdt7
         f4oqEigfe08Y5Rn8yNndSeAfHvTS1NZkSVi3id0wjRc78FNy721GJyF+5N3ZVG5x6iTv
         WnW+OSaU3dzGCon4huh4SqxokcDA0CH6OiZHr19NWpNr2fQLYxjtNQG7NKMoc9LmIFpw
         HIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=aaKhKct3ImPnrveXxBya8SOIzEUzRg0gfWNOxlVt5NM=;
        b=sXeVD22a30bXvIhSG66P3rcau6URlISZD3eZjchow4UQAnCTtTqlslU8vyiofCS3iK
         s2E02iFNKzT64VZVxTZ+PCToP+NYA19hUqSnet0PVrqzWr0ORF23xfJc1xwB/CIgqXWl
         Cgwx6vWFHdznvVogkShhGqkJxvyMBgKFnYPPvnVCCWdX+eeY+K6M9mjoUS1apVsXZs8n
         mNsgOr9hQYugp+eLMUA+SbCvHvE+sliGmGQoVT58vjfQo2ny4j2kfP3jTUYo9hE3VT6h
         uOj8AuuElTY81TnubDxyuWwWw/Go6Buf3yD20BTvmmfOc5unGZIULMhPUQrDklPiDuVc
         bdQg==
X-Gm-Message-State: AOAM532Bjj7YboHQQvbjBgwMPZp9qsBbK3wg9WW+KdB31rlnYwlSxgQw
        RPFhPW9rqvw8iRjs0n6M5npBYxSMLodrnT3kQOc=
X-Google-Smtp-Source: ABdhPJwzEKcRBy1sUJPZf40mDTB/CaBGVVSaAJuPdl+lRXEIaTluerNXxkybsCn1h3mZ87VAsjlq/gpAX87NtAAAANU=
X-Received: by 2002:a92:cd8c:: with SMTP id r12mr417902ilb.221.1611246362296;
 Thu, 21 Jan 2021 08:26:02 -0800 (PST)
MIME-Version: 1.0
References: <20210121160115.4676-1-lukas.bulwahn@gmail.com> <20210121161640.GA1101379@ubuntu-m3-large-x86>
In-Reply-To: <20210121161640.GA1101379@ubuntu-m3-large-x86>
From:   Lukas Bulwahn <lukas.bulwahn@gmail.com>
Date:   Thu, 21 Jan 2021 17:25:51 +0100
Message-ID: <CAKXUXMyrE6OPmn8ETKqRJ9DOaeRO_n3=uUP3vhjAnqmUGmqdYA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: adjust to clang-version.sh removal
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Joe Perches <joe@perches.com>,
        Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Pia Eichinger <pia.eichinger@st.oth-regensburg.de>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 21, 2021 at 5:16 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> On Thu, Jan 21, 2021 at 05:01:15PM +0100, Lukas Bulwahn wrote:
> > Commit 6c8ad4427f6e ("kbuild: check the minimum compiler version in
> > Kconfig") removed ./scripts/clang-version.sh and moved its content to
> > ./scripts/cc-version.sh.
> >
> > Since then, ./scripts/get_maintainer.pl --self-test=patterns complains:
> >
> >   warning: no file matches    F:    scripts/clang-version.sh
> >
> > The CLANG/LLVM BUILD SUPPORT section in MAINTAINERS intends to track
> > changes in ./scripts/clang-version.sh; as the file is removed, track
> > changes in ./scripts/cc-version.sh instead now.
> >
> > Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
> > ---
> > applies cleanly on next-20210121
> >
> > Masahiro-san, please pick this quick fix-up patch.
>
> Masahiro cannot pick this up because the patch to add clang-version.sh
> to MAINTAINERS is in mmotm.
>
> I think the better solution is for Andrew to drop the current version of
>
> maintainers-add-a-couple-more-files-to-the-clang-llvm-section.patch
>
> and pick up the second one I sent, which allows us to deal with this:
>
> https://lore.kernel.org/lkml/20210114171629.592007-1-natechancellor@gmail.com/
>
> I am not sure it is right for us to maintain cc-version.sh but I am open
> to it if Masahiro agrees.
>

Okay, I did not see in linux-next that both changes are coming into
linux-next through to different trees.

Nathan, I guess if you send a follow-up patch to Andrew that is the
best way to handle it, or we wait until both trees land in mainline,
and then just provide a quick fix like this afterwards.

So, Masahiro-san, no need to pick this patch here.

Lukas
