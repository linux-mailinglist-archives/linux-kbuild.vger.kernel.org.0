Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A333F3BAF25
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 23:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229788AbhGDVSQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 17:18:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229681AbhGDVSQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 17:18:16 -0400
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FD64C061574;
        Sun,  4 Jul 2021 14:15:40 -0700 (PDT)
Received: by mail-io1-xd2b.google.com with SMTP id v3so18656639ioq.9;
        Sun, 04 Jul 2021 14:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9t9vS4i+ijcUBW+4/5JZWRpxFmkSHrgr4SQtZITNXcA=;
        b=HM0+VHd/ZGQgOBioS3qgQCVHYFJFFlVko2L4gezZ4RnnwZOCJ0iBY7pRRFZmH1xntf
         zIK0OZbvD3WS9vHX/+YBvszsT0ShGbkSpI/uvYmLbcS7g8wSomPDjbg3a4oTnmJt/SSz
         4JjSgikbxdhfhyVkl8fHXB2TaWbBkQwH1LlHjYllhljgMpPOQZZW7kZv7pMZifEVQdi4
         QqnEl/iIppcu9xDd4hwnwGFRZPIt4EK91cgNA0631h5E4LYzeFP0X8UzR4VUqYP5NjMN
         xEyTH4yHKRU0NZpUvucRZBbwA/fCrbNLV+1o9vxIkKVD6hKlWJtFNR5MckW2p/gtUhLw
         1wLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9t9vS4i+ijcUBW+4/5JZWRpxFmkSHrgr4SQtZITNXcA=;
        b=MUmNq2fn/Y9QVueqy+VQESuJa4z2p1Fm9aOpBt9bjEMqhHjsJfYa9A5XlYYzXaJXFG
         FA2gpXp0/mCwiOvmhrTwKVM6qC8f+zh+ufLpjfRk4EPHximuDZUQeMCs8Jnn5kNrtjJ6
         I00KDSWoX4iWDF5AiEL+faYsJo8m8UVzOXwvUDOFd4m0jNGnUZZrwd49ufAw0AnpvK5W
         mFI4FJ0RPvPp7lkn1WGICxU9+pZw/Nb3KuX+44c5lkwP58pCrjJu5NcyG3GlXl8PE7k+
         gqkygo7o9OfzLIQcuf3b4Wqp0cscb6thR+MfOHYLZ400N9zBedsnlVL/Too9BRFA7UF6
         vZmA==
X-Gm-Message-State: AOAM532oeulJ5kHvOicCYcDdS/qoXQ9slZ3kqiKff7T8fI7wnx6FdwNY
        QgmWR8z/uGHj6dImlr84EINMZnc+1/JSQSNsl5E=
X-Google-Smtp-Source: ABdhPJxJj0rHx13H7kGRmQqC2aKSNxyAIvj5P8+yAE+daIQCHgTitt5U/sL4/bQeGSQMLiJ0gm7Tbgvaoj75oTQBqsw=
X-Received: by 2002:a5e:d512:: with SMTP id e18mr9046073iom.149.1625433339702;
 Sun, 04 Jul 2021 14:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
 <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
In-Reply-To: <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sun, 4 Jul 2021 23:15:28 +0200
Message-ID: <CANiq72n0SeubFWsFXkTT1V-BCQB+MzVRqC4L+PT8QtA0=C2r8Q@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Jul 4, 2021 at 10:52 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Also, why is this in big-endian order?

No particular reason. It makes sense to use LE -- I will change it.

Cheers,
Miguel
