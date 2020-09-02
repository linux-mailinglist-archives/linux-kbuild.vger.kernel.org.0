Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40EAD25B3A8
	for <lists+linux-kbuild@lfdr.de>; Wed,  2 Sep 2020 20:22:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbgIBSWb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 14:22:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726310AbgIBSWa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 14:22:30 -0400
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com [IPv6:2607:f8b0:4864:20::742])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7689C061244;
        Wed,  2 Sep 2020 11:22:29 -0700 (PDT)
Received: by mail-qk1-x742.google.com with SMTP id f2so638626qkh.3;
        Wed, 02 Sep 2020 11:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4I6dbzsqrks7JHzdcURJjhEd27VbJXYlEUu1KAPa0Uk=;
        b=uieLd14I9ZoTUTGGteDE/akzMnmQhahRl7HZPhi0ukmJKtLkNt7U7s0lwrMMomzv42
         3jcieflYGp0Vzgztcsr2JuRqtyL7YgNRGZb0LIoEZDVe0+DEVzI7AHsdJ+e3jUJ+PAbX
         zOizpHQ/lHHgfmg1PMbnlgEJ8dEodx+6xVbtYiN3ESjZNjU3wBM+LOX0luL4FFG47cZg
         IFpOj2Tmt2o0TATXanvRhxNcJFZRZCcJsobsdnKu9lcMMg/dkC3Cd/ETgNKDdy+DXLKy
         16khtgMvPrDfU7pbWAJlG4c6DE0/iP0vn9fxJPGU82kOyitGjJDHyhKoz0CWUJlrHucq
         AP0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4I6dbzsqrks7JHzdcURJjhEd27VbJXYlEUu1KAPa0Uk=;
        b=ENK3zMW7tiDAk0vXsNAAa5urvVoc7Ee5JPEfB7aOal57eGH4Dlc43t6afgVMr98mvI
         lKMp9SzAtrghvDH6ecLVYZ9d1Dugb7oxvr9GnvSuGKx4Z+2KzA9nR2lEoozYWuBuiH7/
         +22XZpn30Tlc0ZU9UxwM8IoqQjQ3dJPUoyg8PM8kWjI30eE/3IMjqhS2KSkU8douvCmq
         i8FTAH9T0ijwxAVWyFJgr3ZJEiDOWsPFjZSH6DGZMYo7uAYmwvgoJPvXgnbfmSDXQOIE
         /Ew8MVKRa318slAV29288WPzeBCg1FC00SWd6qejNpCabL9aeIL7G1khTOmXTLeynO9x
         +gXQ==
X-Gm-Message-State: AOAM5334IBoUEzIKnoTSdEBhsBH/wPYiMh2Z4Y3yUFqqeA4TJddF7Tf/
        ansFqj2BskIYex8TSXDt/Lrw8BgBhcpVyd3g4yLPoCHo9cs=
X-Google-Smtp-Source: ABdhPJzzBwsBj4Syb0SZybcGLQUB2RhMsqw80JJglvVXk0fEf5RQvzuvtI9mfsTT4nT+dvPFVj59jPXW/tsqbRUhFj8=
X-Received: by 2002:a37:a495:: with SMTP id n143mr8149528qke.394.1599070949233;
 Wed, 02 Sep 2020 11:22:29 -0700 (PDT)
MIME-Version: 1.0
References: <be80ceda-596b-03aa-394f-166cc6388aa0@infradead.org> <CAK7LNAQekh08D6=+CqRWiB7F4KCLOgSK9oof8ArVUvMc7B1YXQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQekh08D6=+CqRWiB7F4KCLOgSK9oof8ArVUvMc7B1YXQ@mail.gmail.com>
From:   Nathan Royce <nroycea+kernel@gmail.com>
Date:   Wed, 2 Sep 2020 13:22:18 -0500
Message-ID: <CALaQ_hq01BCA7=sVJjm6LQrjjBFy1V79uUXcRXeLBB5g3k9M1Q@mail.gmail.com>
Subject: Re: [PATCH] kconfig: streamline_config.pl: check defined(ENV
 variable) before using it
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Thanks, but I'd just as soon not be acknowledged/credited. All I did
was submit a report.

On Wed, Sep 2, 2020 at 11:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Applied to linux-kbuild/fixes with Nathan's tag
>
> Reported-by: Nathan Royce <nroycea+kernel@gmail.com>
>
>
>
> Nathan,
> I think adding your tag is OK to credit your contribution.
> Please let me know if you do not have it in
> the commit log.
>
>
>
> --
> Best Regards
> Masahiro Yamada
