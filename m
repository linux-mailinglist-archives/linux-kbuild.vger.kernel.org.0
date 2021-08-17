Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D3033EE360
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Aug 2021 03:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233555AbhHQBdL (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Aug 2021 21:33:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237174AbhHQBcZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Aug 2021 21:32:25 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B1C6C061764
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 18:31:52 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id q21so8680193ljj.6
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 18:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QWD6IuudwvXHVLZghwIzB+7q/RK1CR9TCJ3QiGpBNMU=;
        b=CthTApjFsNdNUwolGv/t0aOmUlGyk5zpS52tTxKbEj3xNDrs4pRENTCs9r8EdmptPe
         P8vq+xfPlfQ8KXE9gP+Kl8SB03dM4x+DWeI+FivIkJcxKhqzVKlk/UwEZjFUNWZF1pzM
         q5ugXXNNUTJw3qFd/cEnzRG2t8IhQC00kI350=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QWD6IuudwvXHVLZghwIzB+7q/RK1CR9TCJ3QiGpBNMU=;
        b=QsqAKuGD8neeutuJm+/C961/La0uZnN4ojnawyuFkkUJwEJ4yDdRFZRkXOg/5gUM1K
         V2lS0UK/a/dty52jEesWhxbhHrnoxxEWASWyqiw95V4WQZT5B9Kkl2YfkszRmekNKnjU
         L3ZJhWSZhU2X32TOmZrCeu5wL3hrcer9H1W/8H5WURs9vv6Zx/MCxJ/NQgb0PALLjJFd
         kdKmU83LxR0mi0Bla2lB3lcRfKUlOE2PzBcqDZLyyK+ysujw42UxmmV8A7hlpiVjJ6bJ
         EbsKb+qmn9QyHy1Zu2YG2yWZgMSXeLIw0oA0pcr12tlGagvZSF0BCk5GHe3K/9wtTozP
         n3sg==
X-Gm-Message-State: AOAM533XJXExRrbvqgFiceaUunCq+Ac3HZ5MHJ+qCAvvC6Z8wEXenmfs
        e5983L09NEB420AxvisEO8JKGvBzFuyppoDZ
X-Google-Smtp-Source: ABdhPJwuiItWNfHCoN29lZW+kvunRdN3WmTnW0/iLZ+KxZDVXnzz2wO+lCjz6z682qy/O+9qf4NUhw==
X-Received: by 2002:a2e:b5dc:: with SMTP id g28mr887249ljn.96.1629163910734;
        Mon, 16 Aug 2021 18:31:50 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com. [209.85.167.53])
        by smtp.gmail.com with ESMTPSA id m15sm49415lfr.16.2021.08.16.18.31.49
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Aug 2021 18:31:50 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id c24so38120745lfi.11
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2021 18:31:49 -0700 (PDT)
X-Received: by 2002:a19:500e:: with SMTP id e14mr468759lfb.487.1629163909695;
 Mon, 16 Aug 2021 18:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210813224131.25803-1-rdunlap@infradead.org> <CAHk-=wj4chmL3TUdXHhAV+eU-YVNj-ZtZBjNJEFBzTnPMP3_bA@mail.gmail.com>
 <CAHk-=wgnvC=Tyejg_ts1O7yZYRxAgS+mxStCWM+PcyFPnaw1sw@mail.gmail.com>
 <CAHk-=whP8o-K2=WWQm=cqx5YTpZcb+KCVvomZ+NeV19CsBMp3w@mail.gmail.com> <4eafc072-1837-737f-973a-a4e0c815cebd@infradead.org>
In-Reply-To: <4eafc072-1837-737f-973a-a4e0c815cebd@infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Mon, 16 Aug 2021 15:31:33 -1000
X-Gmail-Original-Message-ID: <CAHk-=wiA2wnA-3_iVjN9kUf-Gve2jD8UzDkvhDGLg=R=O1vN9g@mail.gmail.com>
Message-ID: <CAHk-=wiA2wnA-3_iVjN9kUf-Gve2jD8UzDkvhDGLg=R=O1vN9g@mail.gmail.com>
Subject: Re: [PATCH] Makefile: use -Wno-main in the full kernel tree
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Daniel Bristot de Oliveira <bristot@kernel.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Aug 16, 2021 at 3:01 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> That sounds likely. We can just ignore this if you had rather go that way.

I'm happy doing it, I don't think the Wmain warnings buy anything for
the kernel. My main worry is just that some compiler version might not
support it at all or similar, and it would cause problems that way.

Which is really the only reason why I'd like to narrow it down as much
as (trivially) possible.

It doesn't sound worth trying to pinpoint exact gcc version, but
making it gcc-only would at least narrow it down a _bit_.

                  Linus
