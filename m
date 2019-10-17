Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2BD5DB21A
	for <lists+linux-kbuild@lfdr.de>; Thu, 17 Oct 2019 18:16:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390441AbfJQQQW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 17 Oct 2019 12:16:22 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:45038 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390535AbfJQQQW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 12:16:22 -0400
Received: by mail-lj1-f196.google.com with SMTP id m13so3170251ljj.11
        for <linux-kbuild@vger.kernel.org>; Thu, 17 Oct 2019 09:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ceYUJ6W2UeLfCUFgLfKX3UCVaGQnunb3VbvN2gzuvds=;
        b=oxsP5XIIJX8CxTHCjDAhvBx0nnEaFdEkDrpbu/F0y5sPo+4jRJ3s6t0NGJ7wdRDbzZ
         +wBw+6T2ULG5yAasY4t4b0Bimb0K4SRPirxI1E8nbQHdkG6PzB7jaIaNSKmWeL0bttsE
         hx5IfsqOl76HgEIjDSnQMxbARQS9/u7lOdm6/wUL8hYIJl5eJCtucqtAmX3wSKvIw6os
         n/IGUp+4pr8MLV68/WdcNssHtI0nrCp4ktYaEEsCrPmM7uMFgaUcvjxzbEZpARCU6Wg2
         uQ9fm4PBLH4b8CrOxSkkmKIHzOLlmgKA3S2HUOOt8tpv7qdBmjncnbvyUMpgOEPD19jF
         3Wpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ceYUJ6W2UeLfCUFgLfKX3UCVaGQnunb3VbvN2gzuvds=;
        b=mEx5esVcKjPQ3MwhMMIrdmNgSviwB+2NvunR73okYO5gqQUWPBaZn3Yzxt29DRNrAC
         Nr2a3aYui63bczoCnILIzyurcjyDlg8aQ7OgyVENiuZUnhAgaXWbT0IQ5T3dTJLHAzh/
         llnqICZ46O3tB6YY9SCJFIv2nYRYVoV0OXVLQPsZcwDS3vF5szd8eeIvEPlQ7N8P3kg/
         Hn2G41k+14PT9an215oq80jDJFbqjJou4/d8sR+t7mYLolbOPJlGJezcVO5HBYiyhsC9
         GG1fRl798BBZhlRboVjtX7tJtummyUiWTq7s/ircyCT0IFizXWw4vD9ppC4TZ5mW+r9A
         J1FQ==
X-Gm-Message-State: APjAAAUiR26rI67Kff0VNOB7jBydHtYmoTxYq3CG4W3Q23zjBQOrLWu0
        4n+Kz3yODroaAZYgImbM8TDQUA==
X-Google-Smtp-Source: APXvYqy0cXNJyzsF9mtqBsnQEj0B/OIu1SsLXqVZYjTaNfR6wPTcmt+r2ZmN/ZSwLX4NeYtowvPwXA==
X-Received: by 2002:a2e:9205:: with SMTP id k5mr2957481ljg.246.1571328979865;
        Thu, 17 Oct 2019 09:16:19 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id f5sm1123163lfh.52.2019.10.17.09.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2019 09:16:19 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 117531001A9; Thu, 17 Oct 2019 19:16:17 +0300 (+03)
Date:   Thu, 17 Oct 2019 19:16:17 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Arnd Bergmann <arnd@arndb.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andrew Pinski <apinski@cavium.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>,
        mm-commits@vger.kernel.org,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Eric Dumazet <edumazet@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Ingo Molnar <mingo@elte.hu>,
        linux-arch <linux-arch@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Subject: Re: [PATCH] [RFC, EXPERIMENTAL] allow building with --std=gnu99
Message-ID: <20191017161617.zj7u6p642mytpzts@box>
References: <CAK8P3a3uiTSaruN7x5iMaDowYziqMFxKWjDyS1c8pYFJgPJ5Dg@mail.gmail.com>
 <20191017125637.1041949-1-arnd@arndb.de>
 <CAHk-=wiH7Ej9x3RqJkUEW4hDCisgWdi6wai6E0tvo4omF_FbeQ@mail.gmail.com>
 <20191017153755.jh6iherf2ywmwbss@box>
 <CAK8P3a1TrOippPUh6Fc_McHcp2LOerdD6ifmcieuy0bAFPvs8g@mail.gmail.com>
 <CAHk-=wh8MsquobFL5TC0yUkG-9yFUZZnikMPA8QHLc7fcyND6w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=wh8MsquobFL5TC0yUkG-9yFUZZnikMPA8QHLc7fcyND6w@mail.gmail.com>
User-Agent: NeoMutt/20180716
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Oct 17, 2019 at 08:56:50AM -0700, Linus Torvalds wrote:
> On Thu, Oct 17, 2019 at 8:47 AM Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > For the record, that seems to mean that moving to gcc-4.8
> > would likely not cause a lot of problems and would let us do
> > some other cleanups, but unfortunately would not help with
> > the compound literals.
> 
> Yeah, that's certainly less than wonderful.
> 
> That said, there's no way in hell we'll support gcc-4 for another 7
> years (eg Suse 12-sp4), so at _some_ point the EOL dates aren't even
> relevant any more.
> 
> But it does look like we can't just say "gcc-5.1 is ok". Darn.

I don't read the picture the same way. All distributions have at least one
major release with GCC >= 5.

The first release with gcc >= 5:

- Debian 9 stretch has 6.3.0, released 2017-06-18;

- Ubuntu 15.10 wily has 5.2.1, released 2015-10-22;

- Fedora 24 has 6.1.1, released 2016-06-21;

- OpenSUSE 15 has 7.4.1, released 2018-05-25;

- RHEL 8.0 has 8.2.1, released 2019-05-06;

- SUSE 15 has 7.3.1, released 2018-06-25;

- Oracle 7.6.4 has 7.6.4, release 2019-07-18;

- Slackware 14.2 has 5.3.0, released 2016-07-01;

-- 
 Kirill A. Shutemov
