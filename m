Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3F5128F755
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Aug 2019 00:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387547AbfHOW7s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 15 Aug 2019 18:59:48 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40964 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732541AbfHOW7s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Aug 2019 18:59:48 -0400
Received: by mail-lj1-f193.google.com with SMTP id m24so3615530ljg.8;
        Thu, 15 Aug 2019 15:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/TruZIxtpLXDniXG8O8y0k/AZstmN0fZMWSKysTNg+I=;
        b=YinilCEz2FvlapVPOpHYLoIDWKMnIR2S2bDHIEIHXa6xOPKV01N4Yg2bZBsENH8/S1
         dZ00MSy84lL8SyKrRzIjalUKli5/qREprdVq5DCnkfPfNnsIPLwiIWZHSgGfGTjVzMqc
         2NbFMS+OVmpGmeDJrdLSnMY3D2EFZEN1orNY5aOCclR5vVbHVJIm/aAbVd653W7fit2C
         i5HWPfe5NeL1Lc6b51b+9LjI1AFZWvYx648HZVDGd6sf62niTgHgcQ6VrortSqxKOuqY
         Fv6aclHGXgkjbj55eqRBh7NCUM4AxLtmZekugiFM5sZJYoZOViZ32XYAUSMVChEtvhyl
         Qzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/TruZIxtpLXDniXG8O8y0k/AZstmN0fZMWSKysTNg+I=;
        b=T4r8nLUtnfOj1r6Kr5X+HVuWwq9MQAQkOT6fAbvraNmRBmYRvtxt9qPcPp0LEYD6Ok
         XbfuIeoMR+25OITveaiOMgGe6+L+JcCJyNt8B9O32I+bZFLiLliUkxMe6Cusb7AxpQhg
         JhRAKJ3N83fXph3nNX3xRX5WGbOiYanuxq42lqemqP0rq9JObImQOHRIUed+FVEQDPbW
         VoPG2OvKMlMCy7ObtC+CFTJLy+KmuON1E/GnIo33bUwpTHckFSL50KZwYXgD6Oa6quy+
         il5/ZM/y9QSAOn7DP6cFwCe4Mzuq9YG9cWxdu6aHPWjrRgf9RvMLvDypX7uLG/Ya18cy
         04EQ==
X-Gm-Message-State: APjAAAU/FNEEM9/SwyXMrSO9YJNQpbvMsUanCarVXQu1dHFNCjXY46Di
        iDKB8Gj+i+p4BCbrPWapsGAAPkQE0hYeSk/18tY=
X-Google-Smtp-Source: APXvYqzlhxK6FXeVO7+suXBanf7qrmXBNE9OCCL5y/uLTvQi8unGqTMYkR6+ubvMZcNrcQ85W3MJNDskk/XOGQevYAo=
X-Received: by 2002:a2e:9252:: with SMTP id v18mr2746420ljg.93.1565909986126;
 Thu, 15 Aug 2019 15:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190815182029.197604-1-nhuck@google.com> <20190815204529.GA69414@archlinux-threadripper>
In-Reply-To: <20190815204529.GA69414@archlinux-threadripper>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 16 Aug 2019 00:59:34 +0200
Message-ID: <CANiq72nM4d-rc_qUMUEisXyEU9A0mbW=O_w5X0zoqWNPLacuNw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Require W=1 for -Wimplicit-fallthrough with clang
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Nathan Huckleberry <nhuck@google.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Joe Perches <joe@perches.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 15, 2019 at 10:45 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> I am still not a huge fan of the CONFIG_CC_IS_CLANG ifdefs but I don't
> really see a much cleaner way to get around this. Some that come to
> mind:

Yeah...

> * Revert commit bfd77145f35c ("Makefile: Convert -Wimplicit-fallthrough=3
> to just -Wimplicit-fallthrough for clang") for the time being and just
> rely on adding -Wimplicit-fallthrough to KCFLAGS for testing.

I would avoid applying commits that will have to be reverted just for
Clang, particularly since it is not fully supported yet.

Cheers,
Miguel
