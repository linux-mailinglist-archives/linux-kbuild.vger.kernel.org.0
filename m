Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1FE40A42F7
	for <lists+linux-kbuild@lfdr.de>; Sat, 31 Aug 2019 09:02:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725842AbfHaHCS (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 31 Aug 2019 03:02:18 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:39629 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725781AbfHaHCS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 31 Aug 2019 03:02:18 -0400
Received: by mail-lf1-f65.google.com with SMTP id l11so6953455lfk.6;
        Sat, 31 Aug 2019 00:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BbEil1PHHGNsnFuRIRiobHI97i2Pp0iIHzaiuj3CnoY=;
        b=jp9tm+Kp4Tyb7OiZuB7B6KvNV9Mc7zqG8cy/jYYrM0nvE4XxD+5YV2duKPoqFIsGHD
         ii+7VgBxzrEERwSWguliGmaVxqDgwP0ukUrfc9Ot2YwleCIIU6Ca+AYutlPyER0bL6BY
         zZJuOGfZJff/bkQMLJoXJ3LffN2+4MI3iMesVAjbsXFDiMaDWzQ0TNfNFsuQF5/aedcJ
         LxvGRwzKPM16uO7uzbYcrGRPu94L3sgL55h7pWi6mpzzMqqK2OzYL30LnXpv/nik7KkD
         gxWQvJOR4usAB8tVwFihO4iEEp6lqFKn19ToA7mhyRaU+Len0IW3MG2R6y7b0u5Qh0vX
         qwSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BbEil1PHHGNsnFuRIRiobHI97i2Pp0iIHzaiuj3CnoY=;
        b=V9atq5i/LvKRQUhraeVeq60qVjCZNgSr3kCBQaAWYzKxa6NmS5VhpxFheyuvrgkXbH
         EZV/cvVYdRcZ/mYI+mvFr+UVmRp7eipdIABGb/TgPDWbeN3jlIxKpruzHPulkKeynHfa
         CzNNuEWAqVKMv84DGXIQFZ5FA8K+ry/NYyxodwLkScjr4D5Fk6BD4zJZOdXgT/60cMRz
         9YJR1xw6+jUQZyATjDYRM/jmOTIjfyUI8Uf4aTVmonZMs5FHdCydMVIa93557sMtjz9K
         6kxmnabdyVOwN6tSO4q9qmgi0CEtXKEuzN18y3Ij6myu+uME/urB0l97GlPwXFHbA1yu
         FKPQ==
X-Gm-Message-State: APjAAAXbHaTxliwsJhn5qhG0bpOqJJC8bVK42q7T18H4DFokdErW23BJ
        zOzuMz56o0/YGBalRe1gLi2IBoQSyzEcpHNpSXQ=
X-Google-Smtp-Source: APXvYqzHDgocjTFquji9oW1Fc5ePX1HS18INA/oyibnpxZQP10/I/wp0StbjEYLl3mSZW9NJKTImcX82lhMzytpLtt0=
X-Received: by 2002:a19:428f:: with SMTP id p137mr11862296lfa.149.1567234935907;
 Sat, 31 Aug 2019 00:02:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190829181231.5920-1-yamada.masahiro@socionext.com>
In-Reply-To: <20190829181231.5920-1-yamada.masahiro@socionext.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Sat, 31 Aug 2019 09:02:04 +0200
Message-ID: <CANiq72neaWYEONu0Ww0enP2nU_KMCJuL5g0tzhgA0itCv-XpVg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: refactor scripts/Makefile.extrawarn
To:     Masahiro Yamada <yamada.masahiro@socionext.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Sedat Dilek <sedat.dilek@gmail.com>,
        Michal Marek <michal.lkml@markovi.net>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Aug 29, 2019 at 8:13 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> +# W=1 - warnings that may be relevant and does not occur too often

s/does/do/

Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Cheers,
Miguel
