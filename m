Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 45362162FAC
	for <lists+linux-kbuild@lfdr.de>; Tue, 18 Feb 2020 20:21:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgBRTVz (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 18 Feb 2020 14:21:55 -0500
Received: from mail-vs1-f65.google.com ([209.85.217.65]:46914 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgBRTVz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 18 Feb 2020 14:21:55 -0500
Received: by mail-vs1-f65.google.com with SMTP id t12so13455467vso.13
        for <linux-kbuild@vger.kernel.org>; Tue, 18 Feb 2020 11:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xSv9DDEnAlG2dciRnTneRn3tnidN19YOSB5toTxKafE=;
        b=Pqb2yyN0w7qffNOmF++Klqty8EApZpt+vTpwO96CkBOthKTTbo2emX/pWMrHdTKxMQ
         drBaf0GnvxUkz3hzxe1aR+BqD3IB2VsG7GAusv0C9E3H+AWb2uNZGef94zJ2Aui2P2B/
         2Ep+Q6J4EJXbIhX6zkBpeoLaN5SnslzMzzylwmRPTL5juABDetEBBuvjrEGZ9n/MI7EN
         6hMGF9ABvdprAulLQp2WpHVxbi+3rShlBKuOG178q03aURr+GleplGccFDHta3F5e+JL
         6biVwIY8PU8dEXxeFZ2VlCbR/B8aypawHi7ZdCpsh3s8t9WvK4Jc0+rKaPdH6c7dUuEE
         Okcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xSv9DDEnAlG2dciRnTneRn3tnidN19YOSB5toTxKafE=;
        b=UPv8nIrREW4PwP5qbrNz+wlqcSsZupndSDIAw903gJAQhADEtO/hxW53tiNHwmxjYm
         A8j6jV/B7zhqedbbPV72IA60UJWyylM5je+NarZcKIqWj8Rh7Ydvdihvjgkn0B8SamgH
         1P5YC/Fhwf4zxhpA9py35rgI/Cao6akYcCxaUBoWQC4N1IIKkhCUEVcBowwflO1TgEiR
         xW+FC2WRZ3CwOPuHbk82dDcUVoUxCEBwTAclHBEkDAQgDyEAQK5dTqB9WYJHeQZENCbV
         p+CT9E6U3/x64HZSKkMAhY2BsxKuqitGDmwCmG5TFvr+KRr16YUqTKqnwWDLVsbLaLkf
         5bwg==
X-Gm-Message-State: APjAAAXLIXksOc1rKPl/zTyn3ot+/1XaBwzWh8FxHxUabvQaXuftwEYk
        I+6vSyV9lzycWQO6z/Cq3k6H6aGw7Jw+VBvvKDW2YA==
X-Google-Smtp-Source: APXvYqw1t26BaomMybNGSWcMJXnCM8vM+6jtUI37Hb+HSNC+M3powdpKva4u81iGu5oJIIda34VLX1xJl8LoLrNKA2c=
X-Received: by 2002:a67:f4d2:: with SMTP id s18mr11783344vsn.15.1582053713770;
 Tue, 18 Feb 2020 11:21:53 -0800 (PST)
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com>
 <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
 <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com> <CAK7LNARyYqmSByD3jQr+TPe1RHEj9CxqRE880AqxA5SU3yUk5A@mail.gmail.com>
In-Reply-To: <CAK7LNARyYqmSByD3jQr+TPe1RHEj9CxqRE880AqxA5SU3yUk5A@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 18 Feb 2020 11:21:42 -0800
Message-ID: <CABCJKudcVo95FcYGJ4223dqVEnkQnQJLx7fVaj1jF21n+sYEcg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Masahiro,

On Sat, Feb 15, 2020 at 8:28 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
> masahiro@grover:~/workspace/linux-kbuild$ llvm-nm
> drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' | sort -u |
> wc
>     572     572   11478

Thank you for testing this!

> Does ACK do this differently?

Yes, the difference is that we use LTO and after looking into this a
bit more, it turns out that when the individual files in the thin
archive are LLVM bitcode, llvm-nm behaves differently and prints out
the symbols for each file separately.

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o
...
nvif/client.o:
---------------- W __cfi_check
---------------- W __cfi_check_fail
                 U __cfi_slowpath_diag
                 U __ubsan_handle_cfi_check_fail
---------------- T nvif_client_fini
---------------- T nvif_client_init
---------------- T nvif_client_ioctl
---------------- T nvif_client_resume
---------------- T nvif_client_suspend
                 U nvif_object_fini
                 U nvif_object_init
                 U strncpy

nvif/device.o:
---------------- W __cfi_check
---------------- W __cfi_check_fail
                 U __ubsan_handle_cfi_check_fail
                 U kfree
---------------- T nvif_device_fini
---------------- T nvif_device_init
---------------- T nvif_device_time
                 U nvif_object_fini
                 U nvif_object_init
                 U nvif_object_mthd
                 U nvif_user_fini
...

While this output format still works for us, it does generate a lot of
duplicates. Anyway, I think we can come back to this when LTO is
closer to getting upstreamed.

Sami
