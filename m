Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9BA13BAF35
	for <lists+linux-kbuild@lfdr.de>; Sun,  4 Jul 2021 23:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230002AbhGDVa6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 4 Jul 2021 17:30:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbhGDVa5 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 4 Jul 2021 17:30:57 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B68F4C061574
        for <linux-kbuild@vger.kernel.org>; Sun,  4 Jul 2021 14:28:21 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id p16so1317140lfc.5
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Jul 2021 14:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EbAGqDDbQnmjvsoTclpanP0h7gMK/AYm7CJnJS7LBY0=;
        b=EHudwuo4e7cs9iy4bKTttxh5r9bMEt+Or14SkbnP8XxX+YLimbIhboHjNY1YI7rJb1
         BQgZulzERbrQhHRG6dgvXGd+bH8g8ubQtBJwB6kCRYzc86HwozOTZo/k6oJHPk7lUEHT
         e8WtFHMImLSrmrRRFjuGao0CPcAtgaoBdpI9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EbAGqDDbQnmjvsoTclpanP0h7gMK/AYm7CJnJS7LBY0=;
        b=DPxFpi4riHo2RdsvzGmuGgTiU+H6e/lVRSaOCaPZQzSWEtI6/JDqaJIFOyOtCjJYL/
         Ip0MrMs09siJBbhky/1iBBs0yZKxeIhm8eyF91J8cVRGnT14iPFCxvzc1JH9vod1h0+4
         x0+v91PSV84iE9wEQnBfFRoGAceACcJdON5uSZpXYWbHKYt7WKtwxrzjyk0+zq+VqNNE
         Me//VxsTQY+nl9RFVGRT/hsC+BYSXbp5SYSxJPnycyxbufumxLxPZq+1SMhwVbQjNoMo
         ZCdwo+56WlZyPo1Zc9hx+nNnjlm/BAUgmUgeRYFfKkEEkFY965ZpVHpnBKlFC3XyxSej
         WgfA==
X-Gm-Message-State: AOAM530YwAiQVF3fWS9vJ1iUuVTKWDPXu+i2SY1rcDsyNR4Fn7hGWoRb
        5hhfy3uwDtoZrWTzPo+hMNMxCV78T9Tps8ip
X-Google-Smtp-Source: ABdhPJztWoJPe8Hvy81q2foTCyfXSM+t3Zg3HO6ND8HR8rAy1j3McXzVTj8Qmnr7sKOS8Cd51cf3vg==
X-Received: by 2002:ac2:5dec:: with SMTP id z12mr7918863lfq.256.1625434099894;
        Sun, 04 Jul 2021 14:28:19 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com. [209.85.167.54])
        by smtp.gmail.com with ESMTPSA id v13sm892924lfg.88.2021.07.04.14.28.19
        for <linux-kbuild@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Jul 2021 14:28:19 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id bq39so16165530lfb.12
        for <linux-kbuild@vger.kernel.org>; Sun, 04 Jul 2021 14:28:19 -0700 (PDT)
X-Received: by 2002:ac2:4903:: with SMTP id n3mr7787093lfi.487.1625434098906;
 Sun, 04 Jul 2021 14:28:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-2-ojeda@kernel.org>
 <CAHk-=wisMFiBHT7dLFOtHqX=fEve3JafZjSvbd5cy=MpW4u7zQ@mail.gmail.com> <CANiq72n0SeubFWsFXkTT1V-BCQB+MzVRqC4L+PT8QtA0=C2r8Q@mail.gmail.com>
In-Reply-To: <CANiq72n0SeubFWsFXkTT1V-BCQB+MzVRqC4L+PT8QtA0=C2r8Q@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 4 Jul 2021 14:28:03 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjFa-d_Gha9KyrXb9UxTKNJY3L3D1D-f6jPSz0_AWSuLg@mail.gmail.com>
Message-ID: <CAHk-=wjFa-d_Gha9KyrXb9UxTKNJY3L3D1D-f6jPSz0_AWSuLg@mail.gmail.com>
Subject: Re: [PATCH 01/17] kallsyms: support big kernel symbols (2-byte lengths)
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Sun, Jul 4, 2021 at 2:15 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> No particular reason. It makes sense to use LE -- I will change it.

Matthew's suggestion is denser, which is nice.

At that point, it would be neither BE nor LE. But the "LE-like" version would be

   len = data[0];
   if (len & 128)
        len += data[1] << 7;

which ends up having a tiny bit more range (it goes to 11^H32895).

Of course, if the range is expected to be just 0-300, I guess that
matters not one whit.

                Linus
