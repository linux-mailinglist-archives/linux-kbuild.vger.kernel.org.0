Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67D0020FC81
	for <lists+linux-kbuild@lfdr.de>; Tue, 30 Jun 2020 21:13:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726842AbgF3TNJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 30 Jun 2020 15:13:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbgF3TNH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 30 Jun 2020 15:13:07 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D3BC061755;
        Tue, 30 Jun 2020 12:13:06 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id g2so12060037lfb.0;
        Tue, 30 Jun 2020 12:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Qh5qpq0DRF5ItkAziSeZrTjhiLljM/TKCiqFCudwnKM=;
        b=XOd0G8vhwKM7selbWtFimmDM/t7yIBdIbFHaIpaOZDjzlFp/okhd6dlzL/sbJGEbQX
         pcAsfzq7TpGSA68FtpbIm5sxxeIin/i9ENVGMlnKvFiYwh69RUnFvt4qWuVG/My88Vy7
         gtCLu7aUzXUEKTUcBSbxBJ4mg2fYWpRRXukG7mvtoL7NRog9XjT9XBS5dcJZ3Xs0Mr6W
         4EGLzQ9CJ9PI0CAcePP6J7OMOfXMBWh5f1e2cBDXK/U959+zti4VXqIRRwfXGVb0wHcc
         3+DJWEsAwwuJq8UOnEqbXMk0AHa+4XDV9TlIjeZLofvXlMsCfzOzaX57ZD+CbGjjorYn
         xsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Qh5qpq0DRF5ItkAziSeZrTjhiLljM/TKCiqFCudwnKM=;
        b=ecFhUsPzaf5JI0U8iBZmtd+l5F6sXjV5U/Zd0FZGnvdLuxJWecMkv39RE1kzINFjDC
         imqXE9Ku2ixDAMDG+gk1Hkc3BeSgb4Dxv1aQds9vAM8rK0kTFkEmosqHwtnxbrz1wCN1
         FNaQ+ap16s6nv0Qno76npNcabIPMwoHRnKlxU5IjsFZXpKY6W1tkRnBenH8pxtWLf7PO
         Di9Ln+EXTsgGFGkLR9JRZdBA+r0ZgdRdala4qFgDTV90jFHX7boJDOhtfQvL527Vgl+j
         h58yDTJYmfWBwjDTK1oj05HWM6NGaNUw3M4nfRC4tVhnRt2kGdK1E9fkLp83EOd/4wME
         X3Ag==
X-Gm-Message-State: AOAM533au4Y+SJf9QwpYQlrG4KTuBHTaC76UV28r6q27VzG/TtGMz2EE
        DGiIr7ogzaKjni21QyY1nkBQ8uYFDfIE7LbQxcoTaQ==
X-Google-Smtp-Source: ABdhPJwQe6pLq/YzqmjnIc7IaWJPawPhkGrywWgSTur5Pcmb3rRRjEPqThtHf7kj9EHlaRsXb/uVLoOMP4jScwen3IY=
X-Received: by 2002:ac2:46f0:: with SMTP id q16mr12862291lfo.51.1593544385174;
 Tue, 30 Jun 2020 12:13:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200629085911.1676554-1-masahiroy@kernel.org>
 <CAKwvOd=qe5KE1vdUYQmpsW2zmDbk5i-MgRujs9B7wqnAj+af0w@mail.gmail.com> <CAK7LNAR49jFZkEmBqpACE0V_-VyCXfFRcKe1Zq+cqO65QX1ozg@mail.gmail.com>
In-Reply-To: <CAK7LNAR49jFZkEmBqpACE0V_-VyCXfFRcKe1Zq+cqO65QX1ozg@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Tue, 30 Jun 2020 21:12:54 +0200
Message-ID: <CANiq72nE+1F3yM+e9XzfphzOe3mb9DUcRCAtPuLMyFE4Rh38pg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make Clang build userprogs for target architecture
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Sam Ravnborg <sam@ravnborg.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 30, 2020 at 6:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I can reproduce this in the following
> simple test code:
>
>
> ----------------->8----------------
> #include <stdio.h>
>
> int main(void)
> {
>         ssize_t x = 1;
>
>         printf("%zd", x);
>
>         return 0;
> }
> --------------->8-------------------

That is the old implicit int rule. Try including sys/types.h or
compiling with a standard like -std=c99 for instance.

Cheers,
Miguel
