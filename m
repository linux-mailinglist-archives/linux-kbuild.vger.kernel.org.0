Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2DCD918076E
	for <lists+linux-kbuild@lfdr.de>; Tue, 10 Mar 2020 19:52:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726403AbgCJSwx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 10 Mar 2020 14:52:53 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:41403 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726315AbgCJSwx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 10 Mar 2020 14:52:53 -0400
Received: by mail-qt1-f195.google.com with SMTP id l21so10454115qtr.8;
        Tue, 10 Mar 2020 11:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=EtahSso5JAHVpOJNzgS4dPTgoehtv6wYSvMnh2h8YfY=;
        b=ijTf999nN+QQTwsdAsJKj0ZKfM40Xgzqktsmkh646xPgPKSjzD95mHL75yX5ta4TMb
         hLpkGoZDf1hPh1c/XMxCVH6GFcwv/HPpxxr+3hnzuGOGU1wHI8gUsg3MWLJ7y1O9rJp2
         X+poSY2B1oCvJVuFHI5B8uoCPc68NG3fQuFpA9R5Zl1NvAtqH/S+FCcSaDkEmvl6gpF/
         tb3QU7Zi/yMTua0y6Tc29L5zw1BrHjX9erpJ+DRTBlAWy5TmKgJbX7yyMqk23BqbKr89
         3vrN1ia4B2F5daAsapQbN05SA7IG06x0GnCURmjIFQ3O2YCbQqukGL5PSWqoT7uE1kyE
         sx+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=EtahSso5JAHVpOJNzgS4dPTgoehtv6wYSvMnh2h8YfY=;
        b=naRaN0tbArJb3zvVnQ4yhF3JXSUDyrZ7J/j/nv+9uGLYFpyBOrIuc5eCO+fZeJyCkq
         EwyMDoAQi1tP/o5XqshSC0DU0mHDMI/Dwy15M+CrFpA/veDmQeOZYPsthofUjCCnoEts
         pCZOMb3zCXE6EvrX7Aky4Z2nFO9PL3A6yQELj0HRzvImB9vnoFc0yGZc+FfhiFOodOiE
         b7ywTnQ1WoP98XKGatsILVbr7rvX6Yx9kyU/7jbJg3/1Qohl17PAtMcXe7O/9Fqqsb/e
         YzMEpECLqE2KUMsTLtDzTzde2oWfR0h3umrt6IlwArsnFVoysO+n4wwfqOc58AVy41TI
         EWvg==
X-Gm-Message-State: ANhLgQ1Z2YxcSq9OdV2XEN3SJXp2JUHbSVmMOTzlGWzSzxARx3NVbAtq
        y9PwhwIJWTshEjmZtijdq/o=
X-Google-Smtp-Source: ADFU+vuSS9B/uX+Jw77s+9kaUnsZBXNaJp/kp03xcFvsnp7YAQjZI2Tzw9vF7ofSvmHN1nTYARC/zg==
X-Received: by 2002:ac8:348f:: with SMTP id w15mr7314055qtb.219.1583866371680;
        Tue, 10 Mar 2020 11:52:51 -0700 (PDT)
Received: from quaco.ghostprotocols.net (179-240-149-111.3g.claro.net.br. [179.240.149.111])
        by smtp.gmail.com with ESMTPSA id p18sm24243304qkp.47.2020.03.10.11.52.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2020 11:52:51 -0700 (PDT)
From:   Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
X-Google-Original-From: Arnaldo Carvalho de Melo <acme@kernel.org>
Received: by quaco.ghostprotocols.net (Postfix, from userid 1000)
        id 326CE40009; Tue, 10 Mar 2020 15:52:48 -0300 (-03)
Date:   Tue, 10 Mar 2020 15:52:48 -0300
To:     Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc:     Kees Cook <keescook@chromium.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
Message-ID: <20200310185248.GM15931@kernel.org>
References: <202002242114.CBED7F1@keescook>
 <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
 <202003031301.083CF048C2@keescook>
 <CAEf4BzbX-Eo3+DCG4zBMhJtLSZrtp48Z-8SvA8qy-WXA5kjR6A@mail.gmail.com>
 <202003031758.AE8FEB7@keescook>
 <CAEf4Bza31J_3Puwf7gnq0jDYRH2_JkRM9L+PO8dFrCzp+==8Lg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAEf4Bza31J_3Puwf7gnq0jDYRH2_JkRM9L+PO8dFrCzp+==8Lg@mail.gmail.com>
X-Url:  http://acmel.wordpress.com
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Em Tue, Mar 03, 2020 at 08:29:39PM -0800, Andrii Nakryiko escreveu:
> On Tue, Mar 3, 2020 at 6:11 PM Kees Cook <keescook@chromium.org> wrote:
> > On Tue, Mar 03, 2020 at 01:50:52PM -0800, Andrii Nakryiko wrote:
> > > On Tue, Mar 3, 2020 at 1:06 PM Kees Cook <keescook@chromium.org> wrote:
> > > > On Mon, Mar 02, 2020 at 10:55:04PM -0800, Andrii Nakryiko wrote:
> > > > > On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
> > > > > >         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
> > > > > >
> > > > > >         # dump .BTF section into raw binary file to link with final vmlinux

> > > > BTW, in looking at BTF generation, why is this cut up into three steps:
> > > > pahole, objcopy, objcopy... shouldn't pahole just gross an output method
> > > > to dump the final .o file? That would be MUCH nicer. Especially since
> > > > the first step ends up rewriting (?!) the original ELF. This is a lot of
> > > > needless IO...

> > > Just mostly historical reasons, that was the interface pahole already
> > > supported. I agree that it's a good idea to teach pahole to just emit
> > > a binary BTF section dump.

> > /me adds it to giant TODO list ;)

Mine is giant as well, but adding it anyway...

:-)

- Arnaldo
