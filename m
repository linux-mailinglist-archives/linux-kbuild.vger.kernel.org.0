Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 957892E8565
	for <lists+linux-kbuild@lfdr.de>; Fri,  1 Jan 2021 19:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727173AbhAAS43 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 1 Jan 2021 13:56:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727138AbhAAS43 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Jan 2021 13:56:29 -0500
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C93FC061573;
        Fri,  1 Jan 2021 10:55:49 -0800 (PST)
Received: by mail-io1-xd34.google.com with SMTP id q137so19574232iod.9;
        Fri, 01 Jan 2021 10:55:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:reply-to:from:date:message-id
         :subject:to:cc;
        bh=6/ykjH+apusSMmJMKlvQel2Pw6wfvKOwrmw7/8sOzbI=;
        b=uptNUX0esdgUkxig3Wl8BGG4AJakniu8L72oDW9dGukN0+WdqjFPwuiWbZfX71UI7w
         Bq1dJlhZHDviBRodc9jMjxyAW8V1mJTqzN9mdtAOP5l0c7kZAvVKMB5XUYauh9IGG6Y+
         Z/vFdlSC22ftFLMpSYHEzhTPffIGdqIKjaKT5gM5fOyrQ+/71IkYI6B40ICxFhb4CBeA
         QUQJzctXsZK2GXFRA/mX+QfBaeVUuYh1PBqa3Hrs1XD4oyVMJ2Z/dW69FjuS2Ymmz3wS
         WiTMgIMnx3axvAN0kNiHGCS0Ue0Dp2gNOJnr+RNhJom6VfvZZwEdz7cF6LeFvQR1+Nhz
         brNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=6/ykjH+apusSMmJMKlvQel2Pw6wfvKOwrmw7/8sOzbI=;
        b=g+pWbU3egi9E0C2/UKM1zliAo1gv1YjifynO1Fqt+GleMjrtz8sRyWA55aOAqufkpa
         8qbjZDUMIS9PFQsAbAFz10Umatz62/Hi2XfL0sTGOqmVNcgh+58GeeyYUaYV8Pcp0+lI
         wUW7hepbUb2klTVmm9D69tEd5eF5rjzRmNzNdfwREvAr1CPW1pclpACWTHp81UQpnz80
         wClkoHQQS2SEfAAnWrnefv7WvxmhfJiq38pCZ45IS3I0IGIGQHftoQKBOTjLwI3bdmU0
         KgsysN4Eyar0GdxCLSasA9bzt4257aw7LBK5ymFXVIB/UzN8kikv8NhxJMh0lZ9ul4b+
         F6qQ==
X-Gm-Message-State: AOAM530SZeUfzxJI6Svbt8RrTSXo5KEFdwfAESXUiBF3A1T7GRP1HWWt
        79tO6k+l91WHjsrdUrjicwZoAPEmoEHPunfuvUo=
X-Google-Smtp-Source: ABdhPJw4rQbUMyUiS1wQY7JminUWLbkJjk94Jib1q0DY/FFzBgiT5OPNd8X1KQo/+ua3itIGVbHaNh+NoFrQT7NbdFg=
X-Received: by 2002:a02:a304:: with SMTP id q4mr52620242jai.97.1609527347177;
 Fri, 01 Jan 2021 10:55:47 -0800 (PST)
MIME-Version: 1.0
References: <CA+icZUUQRKuZzN0ZbaG6vprRWcKPKYVYTryiMFac7q_PRcBvgA@mail.gmail.com>
 <CA+icZUWHiCu9=+80Z8OV+Q3r-TJ4Vm0t62P_Qgck5bRzjrtaWg@mail.gmail.com>
 <CAHk-=wh3AsdUVZ8GKNCdUmY0_nGmoiOVTwy7rR5QM7K31QiSqw@mail.gmail.com> <20210101161435.GA344@duo.ucw.cz>
In-Reply-To: <20210101161435.GA344@duo.ucw.cz>
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Fri, 1 Jan 2021 19:55:36 +0100
Message-ID: <CA+icZUXKXt3NfgVxZN+m+3d_dqBi+o0EyJH53h-sXU8buaUe7g@mail.gmail.com>
Subject: Re: Linux 5.11-rc1
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 1, 2021 at 5:14 PM Pavel Machek <pavel@ucw.cz> wrote:
>
> Hi!
> > >
> > > > $ dpkg -L kmod | grep bin | grep depmod
> > > > /sbin/depmod
> > > >
> > > > $ which depmod
> > > > [ empty ]
> > > >
> > > > $ echo $PATH
> > > > /opt/proxychains-ng/bin:/home/dileks/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games
> >
> > Ok, I think this is a broken setup that has a separate /sbin but does
> > not have it in the PATH.
>
> That's how it is supposed to work, AFAICT. It is so on Debian here,
> for example.
>
> /sbin is for management commands, why would I have it in PATH when
> running as normal user?
>

I am here on Debian/testing AMD64 and waiting for feedback [2].

For now I have applied the diff from [1].

- Sedat -

[1] https://marc.info/?l=linux-kbuild&m=160919738006768&w=2
[2] https://marc.info/?l=linux-kernel&m=160919729606750&w=2
