Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EBD2AA08CB
	for <lists+linux-kbuild@lfdr.de>; Wed, 28 Aug 2019 19:39:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726894AbfH1Rjc (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Aug 2019 13:39:32 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46986 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbfH1Rjb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Aug 2019 13:39:31 -0400
Received: by mail-pg1-f194.google.com with SMTP id m3so86965pgv.13
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Aug 2019 10:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GuCbGVwHRmEGqfMBjZZ+2u4NovL8Rt/IpkZfKDrFBI8=;
        b=IGR9CiXHZQSh/xjQMoY6pRAdfAFxdTZNImDxml/hjjOXvJ+gRYKyeoRx8mYWbRhZvz
         GrByy0qWFHCi/YCnq0nk0i2F0Uyh3zew2GKE8iw1N3pmmuOwEaPeSFiy1MRX8CzcMuRZ
         mkQ13VgaMibRHsM8YDcSX84q45vyxMq3XHi0YOSc/Vn9seZ/HrhxmFEBsJMH50ohZon3
         3GRUl2ipzTQISk5T0eHK9Exwck0dA+Y54K8x2HMFLy+sXXha95k9CGPrjVar0ijiCvgl
         0MxX1s9Z/4QIb0NNa+jEur5DCeeV9hDAw3GHwjG97CDGBh3JGZBHUx3Qf5sn1ZCR17+h
         +pvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GuCbGVwHRmEGqfMBjZZ+2u4NovL8Rt/IpkZfKDrFBI8=;
        b=unXi78CSUtt5KxC25WZJLLx8nAK4tElqcfM8tA0AECIuAUbKKPjwn21GL5Zx70qLme
         kEaK9phGkpGuYVI+FBzosUwQng/vT57CHq8cFKpOSTslNgwry1l/9FO+6DZAogOwWWhK
         k+fPEhVOgbEppn6gxhPp6mPFinaM/VcMYKsYs4kdOy6s27zsrUEBVKBwAfBreHZzDY/x
         wlxG1olFR2Dpf3zSQV+6ar3fMdlLuoCki3YJa1NX0rrY52fgt+E9ouRoPZRGCyOAdVlM
         Pr3mZ/veX1OJl1lYZ2eZQnbJ+L5v7d16wdjxhoOct9V4fwFxBhAz5VgXUkevdONrISHG
         Axjw==
X-Gm-Message-State: APjAAAVGuS+aVZd/UMhZchzlpFJvULVJj92IOJ+4XpSbtaDUsWfIqgp8
        ONl/qkkCRXNqA4GbyFSJQKENDo3EfEQ4MVIttTf2QQ==
X-Google-Smtp-Source: APXvYqzdtkFSXhZjMKVoVzXBpdLNDINY5K3kMdUxm75M/4l37E4Q0dysGQ/lGI2Jnh2fcoAoGM+YptMYIOb8HnteoXE=
X-Received: by 2002:a17:90a:c20f:: with SMTP id e15mr5304440pjt.123.1567013970427;
 Wed, 28 Aug 2019 10:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190815225844.145726-1-nhuck@google.com> <20190827004155.11366-1-natechancellor@gmail.com>
 <CAK7LNATHj5KrnFa0fvHjuC-=5mV8VBT14vrpPMfuNKWw7wabag@mail.gmail.com> <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com>
In-Reply-To: <CANiq72ndWZWD-KBT1s-mUxQNa1jaD7oDaCB2+NPiT1chf14Z_g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Wed, 28 Aug 2019 10:39:19 -0700
Message-ID: <CAKwvOdkuDPfOusJRneeTzg7tZ4VKxaRCNg2SgmjVas58cDwe8w@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Do not enable -Wimplicit-fallthrough for clang
 for now
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Masahiro Yamada <yamada.masahiro@socionext.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Nathan Huckleberry <nhuck@google.com>,
        Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Aug 28, 2019 at 9:45 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Aug 28, 2019 at 6:21 PM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Applied to linux-kbuild. Thanks.
> >
> > (If other clang folks give tags, I will add them later.)
>
> Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

I verified that GCC didn't get support for -Wimplicit-fallthrough
until GCC ~7.1 release, so the cc-option guard is still required.
Acked-by: Nick Desaulniers <ndesaulniers@google.com>
Thanks for the patch Nathan.
-- 
Thanks,
~Nick Desaulniers
