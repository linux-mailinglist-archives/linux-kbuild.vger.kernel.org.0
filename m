Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0283F1F358C
	for <lists+linux-kbuild@lfdr.de>; Tue,  9 Jun 2020 09:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726888AbgFIHwG (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 9 Jun 2020 03:52:06 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:55079 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbgFIHwF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jun 2020 03:52:05 -0400
Received: from mail-qv1-f50.google.com ([209.85.219.50]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1MmlGg-1jGc0z34Zq-00jsQs; Tue, 09 Jun 2020 09:52:03 +0200
Received: by mail-qv1-f50.google.com with SMTP id e20so9659888qvu.0;
        Tue, 09 Jun 2020 00:52:03 -0700 (PDT)
X-Gm-Message-State: AOAM533e10RpiAAlfYGE4zEuLxNE7PsPdGHE+u0jL1t1ZKv0vnj4Xr05
        pHVtR56SdntKMFAlPf2nfHGs9ajBS6KGv/At6kg=
X-Google-Smtp-Source: ABdhPJzAAwSa7VDzHc0IOAym25K3WCNuXLb4pQor4Gk1xHK/1l3NKmwBdWCSFx9PK4LZHFo8sP9a0U+zPqoOWpClh2M=
X-Received: by 2002:a05:6214:846:: with SMTP id dg6mr2426736qvb.210.1591689122373;
 Tue, 09 Jun 2020 00:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200511042149.1712876-1-masahiroy@kernel.org>
 <20200608020256.GA256950@roeck-us.net> <20200609062012.GA499862@kroah.com>
In-Reply-To: <20200609062012.GA499862@kroah.com>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 9 Jun 2020 09:51:46 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
Message-ID: <CAK8P3a2Pn22c8Z=w0FD15w4_+7LCWOpcbJ9b-Skh5iXzBjEx1g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: make module name conflict fatal error
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Lucas De Marchi <lucas.demarchi@intel.com>,
        Michal Marek <michal.lkml@markovi.net>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:UBHin40ZlcEu9qQg2SBpt8w226nLWkqSbXe4EHUKcVfIHp19t+y
 l75Xomds5u23VGitjViVR6iWv5aL4yKtsXuNrKquRFIbLPbF9/7vcw752JZGXz0q8bq/0GL
 i1Eubh53uoAPzd8KVSD7MtY/NoGLZdDcIbUXLKq6Z4ouYKc1AWoLc2MskDEqrZD75a4YJ9Y
 utBmWKICTh3S2lBuiHRjQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HSXNM3Pcd6k=:AjquIMDn+Qg7VC1712DvZT
 f91RaXqU23MpzpGoQbU6n/0+H5D5grO6/makv7j7XzhUmhVKyt9TkM1wv3lY7+d4H2IHBH6c7
 1WTZdR8v3zlnMGinUTpwTSJNBTHHxnA/4EaC3Cxm2i3mG25w3ycvL0RNNh2+3KNBbWGluA4Hv
 krII+fJCThUVh2Odk5hPAvILaFhJMQ5+1kZYDzPErhP3YORqD1iY18/myjkFXi9rL095H6pW2
 IhGCsg/6wqkdoQL4uRZvlIz84OCndNCiLbLLBwRaEk/SIEx3xaocwVREhdqGPx7WEPji8t4H5
 aqHlImU15Mv7WEHS0M54aOrCPx9K1uW/j5h2bdF7IYcCbugSBF/438DB7mjXPHRDgKSpZFfyU
 gep3Vvwo80Dj633RYD2vEZN0UxMwvHUW+JTfSAoSOT7CbxuuveVZzbBfZMh2ycbT+1mdril+x
 T5rQ05ekJ4WnMZVN+b8ywbqaDgGAkYVgSRMrSDuxrWIct/CJwgo+E9BqtRJgqocF2Ki2Lr+or
 FGuCEE+wuFh90zOXzDwMw8gJiU2B/cK+3SVOZWbnZqTg0J9zi2ieV5iizvj+1+Wu1aXuTReV6
 mrV9at9KEzrlc8CgS6ZvZNc4nECb7fXqFfXEv4vJtvcVjNWytKMJJglLIPChwH80UId/1MnSt
 fUzGiP+9n41/2fD+SG9jqvavul5gz062y+caFVvzuJXJVOUzqGh6qYOsCD3p9/uAxH7Tu8LC5
 PZSeH7y8FvflWh4p5/Pepn2UFMq6PfEzc8EQ/7PzBXV6Qh+jd++Hhj56AcOpq9JTo+m1aWSmg
 0KG4VQWKUo+JaWaFF6n5K4JMRJksiGWDCM5NZ6bYylR57dZTcM=
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Jun 9, 2020 at 8:20 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Jun 07, 2020 at 07:02:56PM -0700, Guenter Roeck wrote:
> > Hi,
> >
> > On Mon, May 11, 2020 at 01:21:49PM +0900, Masahiro Yamada wrote:
> > > I think all the warnings have been fixed by now. Make it a fatal error.
> > >
> >
> > Not entirely. With this patch in the tree, I get:
> >
> > Building sparc64:allmodconfig ... failed
> > --------------
> > Error log:
> > error: the following would cause module name conflict:
> >   drivers/char/adi.ko
> >   drivers/input/joystick/adi.ko
> > make[1]: *** [modules_check] Error 1
> > make[1]: *** Waiting for unfinished jobs....
> > make: *** [__sub-make] Error 2
> >
> > Reverting this patch fixes the problem.
>
> As it doesn't look like either of these drivers can be "auto-loaded"
> based on hardware detection, I don't know what to suggest as for
> renaming either of them.
>
> Any ideas?

I see zero chance of a kernel actually needing to provide both drivers,
given that the hardware is 20 years apart and gameports are almost
exclusive to x86 PCs. How about an ugly hack:

diff --git a/drivers/input/joystick/Kconfig b/drivers/input/joystick/Kconfig
index 940b744639c7..6f73f02059b5 100644
--- a/drivers/input/joystick/Kconfig
+++ b/drivers/input/joystick/Kconfig
@@ -45,6 +45,7 @@ config JOYSTICK_A3D
 config JOYSTICK_ADI
        tristate "Logitech ADI digital joysticks and gamepads"
        select GAMEPORT
+       depends on ADI!=m # avoid module name conflict
        help
          Say Y here if you have a Logitech controller using the ADI
          protocol over the PC gameport.

      Arnd
