Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8116EA07BF
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 18:45:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfH1QpJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 12:45:09 -0400
Received: from mail-lj1-f169.google.com ([209.85.208.169]:32943 "EHLO
        mail-lj1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726515AbfH1QpJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 12:45:09 -0400
Received: by mail-lj1-f169.google.com with SMTP id z17so225277ljz.0;
        Wed, 28 Aug 2019 09:45:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TK1f1dl6MjT9oXeqIhsMWlEpHW6Ya5m7lCHOBn6DQcU=;
        b=WZnx8sHh16J5Y4zbZbjslkEl6sIdCz4pVSyFtQ8xUYOsASGB0g69MA+kfGzo3/PutC
         yoBLZKf7p5Sjefi8sS+4u7EbMF57hEsZjUp/hgczCkf+mT+pzHW+BBjtSfBJCPax3vbJ
         Sx3XaT7RGCc0R452V/X0WMlfKcKtYSbmLV+F61faTyVB+DrpJS+9qw5oV82RFMlQe+Le
         MYw3MxKI+pEul4C5bnkCO8MoxWH2D99IdMqI4ukGFzmA1NpwK+1x7OfQ4jiHZZ9vMIA6
         OmjKUQZgL7iyiqa/k5yu/jsR4S7iQ6vk091MLj29zKyU0zPTY/b0nlTg2bIwNah46peJ
         jY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TK1f1dl6MjT9oXeqIhsMWlEpHW6Ya5m7lCHOBn6DQcU=;
        b=DImlMeeI0SAsJakVYmRe4K0jopEcF/cXkeZZrBXQn57iTf5pxP8GpROh0H0fdNHZPx
         5S7/Jz+Ab7lRQTdTWp5hMWr2dGT6+rip0eJkHXhv1AK4fWNib3mcqICGjtGHHu/MKKHQ
         8kMvXKM6ilwLshjwSsfsHzZXgb+O0LTFABPyEcsa5IJZQG9l5BoYKVna7hYIwe8EUP2p
         nHJZG43VdsNKnykKLGi2AqMAVZO0BX8C4WlS36fGHGpWAOwNRqAj8mNX7uIddU3Tmzb3
         A2sBqYB7XjO0g5L0F0Eu9unC6gNDTXJimuqPRMGeFdsQnaj+3dEnPwmgSLQ25OR3GM/3
         eU7Q==
X-Gm-Message-State: APjAAAXUfGCP+QEVTXx+Y8K563C51ytA5KaL4mm1htkk+p3SdqFiLDUW
        HttBk+tyaNtU4HIFbufZSXodgUDlZuru70Dta5Q=
X-Google-Smtp-Source: APXvYqzdgrwBNgfkGNdYlGMKLKQLO9CJ7KXb64awVxzHUKZepseSqBKftXnP8qj1qSyAWhs53iE8udttMeFhu8cBmmY=
X-Received: by 2002:a2e:8510:: with SMTP id j16mr2619423lji.174.1567010707090;
 Wed, 28 Aug 2019 09:45:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190815225844.145726-1-nhuck@google.com> <20190827004155.11366-1-natechancellor@gmail.com>
 <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
In-Reply-To: <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Wed, 28 Aug 2019 18:44:56 +0200
Message-ID: <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Joe Perches <joe@perches.com>,
        Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2019 at 6:21 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Applied to linux-kbuild. Thanks.
>
> (If other clang folks give tags, I will add them later.)

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
