Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A2F3318CAC
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Feb 2021 14:57:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231408AbhBKNv2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Feb 2021 08:51:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232157AbhBKNsq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Feb 2021 08:48:46 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C73B4C061786;
        Thu, 11 Feb 2021 05:48:04 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id b10so835297ybn.3;
        Thu, 11 Feb 2021 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EJvV/IO/wKXJfwZmf/emEhZ30GLM6e1NBmfhZuY+thY=;
        b=RWt+9QckhD6/pP7asl12UVoYdR1GoVh+IvAyNDgk7WKRvPtKtq8xdMD58liaiNKBjV
         272hdkckGqe14yFR0XHXNoZuBNu3KOby2QMHGsmY0QVfNXtYIBf1DgPZvK9LF0s6YDs0
         mT2r9jJkujHMx4oxGRwaI6Lwse4hBnOd3Fsk2jns720HiCpEkJNz13B6eLVPtQM739+3
         UmBB/1JksKP4H0Wlh9LG+19jtiFUwFdf3xgSbak6QVFJ2+QTkmm4zksLKVSYR6I8C1j6
         kd4q2nYIrl0S/ypTSDgPsfUAZ8aS8obVuRrfsIKn5DYKMIooc9A3dJvCd4SzWvAlr2uV
         JdLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EJvV/IO/wKXJfwZmf/emEhZ30GLM6e1NBmfhZuY+thY=;
        b=LmAydcMGNtAQ0IGI/c7WPCcJD3DfvG9xy76Wv35zqm9uoqfWAenj7HOWe5bUMVFfnc
         1qjLqvU//RdQpiR5whQHapQb/zhMQvg2hjIaIw63Y3uwQuq9x2nhIZkPKti/EtEoL6T4
         qTfBrrPo7XOObHHVw0MiQD1U0TkYt0s1+b4iM3JyyspPveFuGGmTrqUbL/ZOfhCRHF/P
         MrrV3nEGvKV5uxm/A50Vjg0oHjeawR1jsqUYl+m9z6Bgfbj22gRHWfx4h/+p9VgwmwdG
         V32sXdvCe9CmhChhvntLUUXwjlvE+V/imXKI+2K5RjuQqLXLotm/ytGbDQ7QC7z2zU8R
         V+sA==
X-Gm-Message-State: AOAM530lLg7oUtBY33ngn6ZRI2GdWwX9xAprnoQjJk9+iNBmKi+pMPtS
        0XdlIW4JZG1xDFUyfnXh4zo9z+lckkWet3iR3tk=
X-Google-Smtp-Source: ABdhPJwkyAQXIE3gg6zWz/MCY8VQs6Povyu8VkSBVBxjK5lN+1sL0029temgQPXjT9E7ZfnLSjgAUrKriuiuxVvYwq0=
X-Received: by 2002:a25:9a04:: with SMTP id x4mr12162281ybn.184.1613051284203;
 Thu, 11 Feb 2021 05:48:04 -0800 (PST)
MIME-Version: 1.0
References: <1612783737-3512-1-git-send-email-stephenzhangzsd@gmail.com>
 <20210208195439.GA1097868@ubuntu-m3-large-x86> <CALuz2=d-ENRbWgGYaO_ESEaw5eOVSwkQmkeYBJ-w0Vb3zZ+REg@mail.gmail.com>
 <20210209192729.GA820978@ubuntu-m3-large-x86> <CALuz2=dyA_ki98t8VNe2L1UcBXrSoJT1r6j1puEmLn7WrX87XQ@mail.gmail.com>
 <20210210182400.GA3502674@ubuntu-m3-large-x86>
In-Reply-To: <20210210182400.GA3502674@ubuntu-m3-large-x86>
From:   Stephen Zhang <stephenzhangzsd@gmail.com>
Date:   Thu, 11 Feb 2021 21:47:53 +0800
Message-ID: <CALuz2=eSv2N2Qp7GimLgdWjvWDwDh1Dj0Q7Czm4Br5a50rs4ew@mail.gmail.com>
Subject: Re: [PATCH v1] clang_tools:gen_compile_commands: Change the default
 source directory
To:     Nathan Chancellor <nathan@kernel.org>
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        natechancellor@gmail.com, clang-built-linux@googlegroups.com,
        LKML <linux-kernel@vger.kernel.org>,
        Tom Roeder <tmroeder@google.com>, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=8811=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:24=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Feb 10, 2021 at 08:15:27PM +0800, Stephen Zhang wrote:
> > Nathan Chancellor <nathan@kernel.org> =E4=BA=8E2021=E5=B9=B42=E6=9C=881=
0=E6=97=A5=E5=91=A8=E4=B8=89 =E4=B8=8A=E5=8D=883:27=E5=86=99=E9=81=93=EF=BC=
=9A
> >
> > > Just as an FYI, your email was HTML, which means it won't hit LKML.
> >
> >
> > Thanks for pointing that out. The existence of a GFW makes it difficult=
 for
> > me to connect
> > to the mail server.  so I use git client to send patches only and reply=
 to
> > emails with
> > gmail  web client.
>
> You can configure your Gmail web client to send text responses by
> default by clicking on the three dot menu in the compose window then
> chose the "plain text mode" option.
>

Thanks, this has always been a problem for me.

> The build directory needs to be involved because that is where the .cmd
> files will be but the source directory needs to be known because the
> source files in the .cmd files are relative to the source directory, not
> the build directory. This happens to work in most situations like I
> point out above but not always.
>
> I think that my patch is most likely the way to go unless others feel
> differently. It would be nice if you could give it a go.
>
> Cheers,
> Nathan

Do you mean  my patch's failure  in some cases  is because the build
directoty isn't involved after using "-d" to specify the source directory?

Actually, the build directory has already been involved by the "path"
argument. See:

def main():
    for path in paths:
         ....
        if os.path.isdir(path):
            cmdfiles =3D cmdfiles_in_dir(path)
        .....

where the value of paths  is passed by  the "path" argument. Do I miss
something?

Cheers,
Stephen
