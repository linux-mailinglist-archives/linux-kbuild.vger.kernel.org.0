Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D42D362079
	for <lists+linux-kbuild@lfdr.de>; Fri, 16 Apr 2021 15:07:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235528AbhDPNHt (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 16 Apr 2021 09:07:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234291AbhDPNHt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Apr 2021 09:07:49 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D64B7C061574;
        Fri, 16 Apr 2021 06:07:22 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id i21-20020a05600c3555b029012eae2af5d4so4555701wmq.4;
        Fri, 16 Apr 2021 06:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=X1QM8B6jbrKekugtXWG7niO37dGaqz+Qr3M5o/z4z7k=;
        b=cXPaqMIsEqgYTmxm1QSn08MWu+7Xa3by/TlAHTNj+RNF9eLNJAgDZUa5HegBkJQRvi
         KctwG2xyTuZUuR7ogCeQvEZNwpw2+Kba022xCN2X9jn21Q2eSj46B3fd9OawP7U74sGD
         m2Ka3v1N95rlEH/Ebj7mY2iRBuWPUwnQzTMS7AO7F20GsnqkQv7hoo04kJ2RT+Kkb3w5
         yZnzu/9+m+MeqTJYDAfaGKhuOOAjbXYDjWzZ1EO9sUC1mxL8CpyR2F9JeSwEixnMz4jG
         iIrMgwpejrRZj6T+5y9u3YOekb6VPSQ+yeuVksZ2hu7zFocrh7AP/P7tL0BZi6u7HH7u
         EJYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=X1QM8B6jbrKekugtXWG7niO37dGaqz+Qr3M5o/z4z7k=;
        b=X61/mi8VEiVr9d3WeneuQh3AnNVKCF25F30bkgnp+1Cb/TtOnPr9OtQZvjTQ/DNqVC
         VHkl6/Vx+HZMp+p4t9i3dPR036unZ1u3Rxp09NQA/g2q0SbYpgYgjE99/2qWqlhk6ySP
         MlvjEV2gb1PhxNCE44EugRJLswHQcQWqoJpdJdyU9slhIoidJScsCYQPLvytmxyoiaqM
         dUFAsyOSe/mQI8BRRpjJ/RVx/ntWcAeaHO4hUKzgdqc2O4i+IuTGA0sF/fmktE6XF/Kq
         iCCLvkGATEHeCHqtFqUgW+jcK0HTqcJEAtXAa1tvwdrxNeIvQxVq9XjzO33rNHf3q+Qw
         pBSQ==
X-Gm-Message-State: AOAM530tu7nWx7tCPmJST2LDVAYrNw2M12tFt6f0zdoxb/5iF+pdlaKR
        4iaOn/Y646niRf9/8Tt89Sax2RXekyFR7KTVxzamcpqMMXyksOna
X-Google-Smtp-Source: ABdhPJx5xdyB+CIx6x7Q9HsKZj2cV5fCDxyKuGcCDwhirLAjzqrruuyvkukN8/XZ1f+cs1hBl/HbbACArBimwvRLTUY=
X-Received: by 2002:a7b:ce09:: with SMTP id m9mr8303247wmc.150.1618578441478;
 Fri, 16 Apr 2021 06:07:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <20210414184604.23473-10-ojeda@kernel.org>
 <CAHk-=wjdZ1KksHHHuekeAx9kKFXEyt+rg0P=yRD1Bia_01wucg@mail.gmail.com>
 <CAKwvOd=Vo3wwm-egc6fTa7gD4dsrc77OvBhUy8e+VM=LujRCfg@mail.gmail.com> <YHfm+tCYp+I1C5I/@kroah.com>
In-Reply-To: <YHfm+tCYp+I1C5I/@kroah.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Fri, 16 Apr 2021 09:07:10 -0400
Message-ID: <CAGngYiV3Q336QLwZ_PjDj9hd+Y4uMjhq209ppYYqc_QeegLvgw@mail.gmail.com>
Subject: Re: [PATCH 09/13] Samples: Rust examples
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org,
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

On Thu, Apr 15, 2021 at 3:11 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> I've been talking with the developers here about doing a "real" driver

Would it be beneficial if the device h/w targeted by the "real" Rust
driver has QEMU emulation? Perhaps in addition to physical silicon.

If developers don't need access to physical hardware, they might be
more likely to get involved with Linux/Rust.

Also, I'm guessing QEMU allows us to embed the emulated device into a
variety of board architectures: x86_64, arm64, powerpc, etc. which
could be useful in smoking out architecture-specific Rust driver
issues.

Sven
