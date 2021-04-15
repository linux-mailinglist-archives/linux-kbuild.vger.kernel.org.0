Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EADBD36099B
	for <lists+linux-kbuild@lfdr.de>; Thu, 15 Apr 2021 14:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232795AbhDOMkf (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Apr 2021 08:40:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbhDOMke (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Apr 2021 08:40:34 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DEAFC061574;
        Thu, 15 Apr 2021 05:40:10 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id v3so23612003ybi.1;
        Thu, 15 Apr 2021 05:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HNWPrpdPoD+pXH9p1hvOGpr8+bIHmvjS+4XG2ldZ0Sc=;
        b=PHuF3KrGqNBmqAhI7J+l69fge3/RxdwOfMm73BbiapXnaS25fJER94tzGL0volq6nJ
         uVBdFT87qfAFF6Mk9bToFO5RRpRY90hP8G2jKu6QeUr2Kt50f58LPPu85yVORSpWVKYQ
         hd5D4KclIVt0np3ZmNZEmb7ZR6eE10A3wTDxilcHC6fMWxbsbaw7jKcI3tcqLt7m/ckn
         QCJhcjmQCzFCbiJw4xc7e+DIitZozXwIlcRRUisdbJZcbZMG2ORchleytjjRVcsDlsJG
         RID3l6K3+u7ePY/dvZTSnJKqVAerSfoEiYE3lytwF4HiVmXSsLtV4suJai+7Q/Hp3CEL
         ia6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HNWPrpdPoD+pXH9p1hvOGpr8+bIHmvjS+4XG2ldZ0Sc=;
        b=FP4tmY1b/bHhUbmHF7dd4X43sr9hNfsRYQO1uy8Yq1AprYKopqsC987jJriFyLqfNG
         MMkKQVYnihXyHWoGq+B85YXA6uFqSS6s7OaaS2msKFe2PUQuOs6trzHHj4K+tl2NvYlR
         etI4sED1MUGhOaE5o28W4vFggPAjErh0y/rVjy0LBcKjPtZEo7TMzY61NnZ7yXb1eT/0
         qJaj79/l8yi8NTGBZTjKuYXB5IaEKROy3BnF/nTq6yJ/UWVNHwPhDkNJ/tDoYSpNHqpb
         W8umJxPNsHNpndXk7nKQoVdLn+q+wgNFpp1YwCyYnW8fH+Yzl5XsRIi0PL3ckPXVGdl9
         Cm/w==
X-Gm-Message-State: AOAM533uA6CJ/ssg3J/DvhRgh9cFZhpCGyh7DUk44GsGIlczf7cJZuvZ
        29H+uf2gHd2dGWYERI+mwpCnyyL373RI9FzNrXugrek1iyc=
X-Google-Smtp-Source: ABdhPJxxvwHaN8MXNkZ2cWP+VxR/Oi6OrV25u/8c4Sk71cAVeHSDikukkFzc+2IPtDy3JiqOzh/Ywn1UnHBoDwcKALw=
X-Received: by 2002:a25:cfc2:: with SMTP id f185mr4317197ybg.26.1618490409882;
 Thu, 15 Apr 2021 05:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
 <CANiq72mSMtfdRFPGJKuoqCBFdsa_xHvx9ATjcB7QSunQdDHBuw@mail.gmail.com> <202104141820.7DDE15A30@keescook>
In-Reply-To: <202104141820.7DDE15A30@keescook>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 15 Apr 2021 14:39:58 +0200
Message-ID: <CANiq72=miTm-WYN4Q4JRfm7ocaoNePW_f1khcUOE1EkO8UyQzw@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Kees Cook <keescook@chromium.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Apr 15, 2021 at 3:38 AM Kees Cook <keescook@chromium.org> wrote:
>
> Before anything else: yay! I'm really glad to see this RFC officially
> hit LKML. :)

Thanks! :)

> When originally learning Rust I was disappointed to see that (by default)
> Rust similarly ignores the overflow problem, but I'm glad to see the
> very intentional choices in the Rust-in-Linux design to deal with it
> directly. I think the default behavior should be saturate-with-WARN
> (this will match the ultimate goals of the UBSAN overflow support[1][2]
> in the C portions of the kernel). Rust code wanting wrapping/checking
> can expressly use those. The list of exploitable overflows is loooong,
> and this will remain a weakness in Rust unless we get it right from
> the start. What's not clear to me is if it's better to say "math with
> undeclared overflow expectation" will saturate" or to say "all math must
> declare its overflow expectation".

+1 Agreed, we need to get this right (and ideally make both the C and
Rust sides agree...).

Cheers,
Miguel
