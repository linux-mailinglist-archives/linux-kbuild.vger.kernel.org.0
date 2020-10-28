Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3825A29DC11
	for <lists+linux-kbuild@lfdr.de>; Thu, 29 Oct 2020 01:19:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731303AbgJ1Wo6 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 28 Oct 2020 18:44:58 -0400
Received: from mout.gmx.net ([212.227.15.18]:47667 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731064AbgJ1WmD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Oct 2020 18:42:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1603924922;
        bh=mjjgd5ywvv3HNXkKe5faSF1dHJHIMuYeEx9hiIOdEh8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:References:Date:In-Reply-To;
        b=e3DmSyyfBc+guSAyIs3YUwc4qrLsWdo0YGyopaPjPoKjoqAkAd9jYzhPAmbXvFGdq
         rtetInYKpNEUgmhGf23EIdzfH9qjwy/JqXYPE39KPmzKMajEKY3ZNfnAs0fyAK7ajP
         ilWeYo8UmeYpivnPR3sY/tODDi0qawhtpHtVZL28=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([79.223.32.86]) by mail.gmx.com
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N0XCw-1kCrOG1TYi-00wUJi; Wed, 28 Oct 2020 19:30:24 +0100
Received: by localhost.localdomain (Postfix, from userid 1000)
        id 62417800D8; Wed, 28 Oct 2020 19:30:23 +0100 (CET)
From:   Sven Joachim <svenjoac@gmx.de>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Guillem Jover <guillem@hadrons.org>
Subject: Re: [PATCH 1/2] builddeb: Fix rootless build in setuid/setgid
 directory
References: <20201026193217.402412-1-svenjoac@gmx.de>
        <CAK7LNAS4VfYLLBZn=Fkd+D5D+3ejVd4jPFLtWu6joLxVXtxKUg@mail.gmail.com>
Date:   Wed, 28 Oct 2020 19:30:23 +0100
In-Reply-To: <CAK7LNAS4VfYLLBZn=Fkd+D5D+3ejVd4jPFLtWu6joLxVXtxKUg@mail.gmail.com>
        (Masahiro Yamada's message of "Wed, 28 Oct 2020 15:00:22 +0900")
Message-ID: <871rhi19vk.fsf@turtle.gmx.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Provags-ID: V03:K1:Yl6/pxi4e/xbPe4GCfZUCwKzrh9fZJX/GZ2OIKcQmsACydYSDYf
 aiRC2bhxwZXaQU63FPIBSDo3opoaFHI+qABi60moHMy601HTzDG6yFF5Yc/LPP970XALYwN
 jBOI4bQsvE0eccEhLt7vcbYkKoMGix8cnBIF+joWEDDwCeW9gcOWx/+nNcgi/l88YZkgmHv
 q33yhyfq4s2ZPFQtZCk2A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:R5fUqhJ/1WM=:hDagFnQG+3Zv/jY8bJJbBk
 mBI8lx4FAf+68qBKu+FGehObFPZkrgpPRJNFzFKTExJGn8Gws8xOCy0rnPMIQF0uDS2um5PEK
 9mRUM5QSuEAOVuos8Ur1ENNIdUf+is8A7ZUx0WYKP0fAR16BB8Uc4WEQGzQBouKDmoarVxRRx
 sGUTC/WqyAqpo0eEn4+rpaexGYa9SwI2UshFSSydy7cYYVAQEGzlk+DoB98ENvR3r1/DUi0e8
 aEGTU6GswOdTGRWCPIOrjYTGr+L8Kbol0ukoV5MniMvwA1hKyHyXpNttzGuL1JqGgFiNs/TqS
 Zt3F6nsGrVfmLvlPEXQJVGko63h2RW7KjFJXZn61/A8XcKZPWtpWPKRU4ow03ceiR9WV7yorN
 /FfBdnfeQhbNyYMK56t1b4C9Piz+XAh8Yw1p3MVR3fB+HthVxH7wF66j5xlXwtVUATz+y3S6k
 /R7DVMmpEbipMjJZbTnrHwlYxO08aRyW48LxEKp0d12jDNiIuSnbDSTezOV0qoCKL45SiMoSj
 KFpPO1oWdnawYgHg1etVL3ivl96m07rWMUHc/EUS4xV6VyElFNeSMt9iYIBZimJh9La+LUcED
 wi0ym2ny7f++T1hs8Gr3/TqU2O/R39BXtNy+akxiAQ1uHsaE2fa/A4H8GIjHiYyhTkPPgk020
 mhh5R1WT8PAklObbk92jUaasq/bf5J8dBLYKHm0yvc1ZSJleu3VPjSgn4auIulbGsPXFPTpYP
 bNauEFeBcAMYWZCsi7Lg3FIGU7hVjUOGkf9oaq+V67IJvNQwj0ErhSQ0P4aNrl9JLhaESfNQq
 Lgmf50eC7IpCL92wR+Sg1NJ/ty8x8UH2bc0d2Gfq4a9HxcYPS2OGNaqWHy4gIWnv+7Z5mb/lV
 cxrfFW1fZSxJ4jv5tFjw==
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On 2020-10-28 15:00 +0900, Masahiro Yamada wrote:

> On Tue, Oct 27, 2020 at 4:32 AM Sven Joachim <svenjoac@gmx.de> wrote:
>>
>> Building 5.10-rc1 in a setgid directory failed with the following
>> error:
>>
>> dpkg-deb: error: control directory has bad permissions 2755 (must be
>> >=0755 and <=0775)
>>
>> When building with fakeroot, the earlier chown call would have removed
>> the setgid bits, but in a rootless build they remain.
>>
>
>
> Applied to linux-kbuild. Thanks.

I don't see it there, have you pushed it out yet?

> I agreed with "g-s" but was not sure about "u-s"
> because nothing is explained about setuid,
> and the setuid bit against directories seems to have no effect.
>
>
>
>
>
> It was interesting to read this article:
> https://superuser.com/questions/471844/why-is-setuid-ignored-on-directories
>
>
>
> Also, it is summarized in the wikipedia
> https://en.wikipedia.org/wiki/Setuid#setuid_and_setgid_on_directories
>
> "The setuid permission set on a directory is ignored on most UNIX and
> Linux systems.[citation needed] However FreeBSD can be configured to
> interpret setuid in a manner similar to setgid, in which case it
> forces all files and sub-directories created in a directory to be
> owned by that directory's owner - a simple form of inheritance.[5]
> This is generally not needed on most systems derived from BSD, since
> by default directories are treated as if their setgid bit is always
> set, regardless of the actual value. As is stated in open(2), "When a
> new file is created it is given the group of the directory which
> contains it.""
>
>
> After all, I am convinced that it would not hurt to do "u-s"
> although I have never tested kernel builds on FreeBSD.

Agreed, setuid directories should not end up in the .deb files even if
that bit does currently nothing.

Cheers,
       Sven
