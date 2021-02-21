Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3DB6B320B16
	for <lists+linux-kbuild@lfdr.de>; Sun, 21 Feb 2021 15:49:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbhBUOrQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sun, 21 Feb 2021 09:47:16 -0500
Received: from conssluserg-02.nifty.com ([210.131.2.81]:64427 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230045AbhBUOrO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 21 Feb 2021 09:47:14 -0500
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 11LEkEJw018830;
        Sun, 21 Feb 2021 23:46:15 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 11LEkEJw018830
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1613918775;
        bh=jpeCrPBkpqDTRmJNiKNUkX+1VgE88GRr1ejOnJsXFaY=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=HAyL7AkohPuL4yy2HMBIdsu5SUvn1dvwYlxH/bL7qO/Vcwa/6lM+gcYNUzRnzDgSc
         tCNCcfuwHGcAlK6IT9aoZ3usZ5hiod3kbu1MAlLl3168IpWqRg6xPattT4RIoQnXOX
         buBy6JSgqZbzZ2sSvI+msSDCPh3s5NLJk7fDl5ZaJ2+H3cE4BfBo5fEi4RY/MpOVE+
         WQBsOTq0ziwdKAi3APXk9ZfBdsn4NGTArQ9pE0hyZbSW4hXFTSH8Y3ki2REA/0ya1p
         DDxKCBhW5PnVekvqahP1bYO46rSzl8I1n87ngbUTIOkuOeB00kb51wEZAiLctQEll3
         7V7myLRS7zKSw==
X-Nifty-SrcIP: [209.85.215.182]
Received: by mail-pg1-f182.google.com with SMTP id a4so8453360pgc.11;
        Sun, 21 Feb 2021 06:46:15 -0800 (PST)
X-Gm-Message-State: AOAM530hOATVVNF9kraYMFShceLMp83BdgpOIiJkhY28ifXb0RBrhlhH
        +dRaXaoROBM5zzHtfslsBwjfSE8ambW7aiSC/xQ=
X-Google-Smtp-Source: ABdhPJxma72dHfe9EEP25keVH9m43oNbIOaTLqkU9zVQyOC0KMwzA1NH/8Cl6Gk80jnpK8xgGwb5fbOUFUoteHKaFSk=
X-Received: by 2002:a62:d454:0:b029:1ed:a6d6:539d with SMTP id
 u20-20020a62d4540000b02901eda6d6539dmr792619pfl.63.1613918774514; Sun, 21 Feb
 2021 06:46:14 -0800 (PST)
MIME-Version: 1.0
References: <20210215181511.2840674-1-mic@digikod.net> <20210215181511.2840674-4-mic@digikod.net>
 <CAFqZXNsvqx-pbC+wzHB4aXX6h=buU3csM_a=By-zCOmx0n-xCQ@mail.gmail.com>
 <CAK7LNAQDWxGJU41D4+AbjFiX63BiA+bsNzTHZsKKc-LPyO7oCQ@mail.gmail.com> <8809a929-980a-95d1-42dc-576ff54e2923@digikod.net>
In-Reply-To: <8809a929-980a-95d1-42dc-576ff54e2923@digikod.net>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 21 Feb 2021 23:45:36 +0900
X-Gmail-Original-Message-ID: <CAK7LNARq3YneLCVReHf8z34T7VKfv5zmkqwSiNZwgQGD64VMtA@mail.gmail.com>
Message-ID: <CAK7LNARq3YneLCVReHf8z34T7VKfv5zmkqwSiNZwgQGD64VMtA@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] security: Add LSMs dependencies to CONFIG_LSM
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     Ondrej Mosnacek <omosnace@redhat.com>,
        James Morris <jmorris@namei.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sun, Feb 21, 2021 at 8:11 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
>
>
> On 21/02/2021 09:50, Masahiro Yamada wrote:
> > On Tue, Feb 16, 2021 at 4:03 AM Ondrej Mosnacek <omosnace@redhat.com> w=
rote:
> >>
> >> On Mon, Feb 15, 2021 at 7:17 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.=
net> wrote:
> >>> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> >>>
> >>> Thanks to the previous commit, this gives the opportunity to users, w=
hen
> >>> running make oldconfig, to update the list of enabled LSMs at boot ti=
me
> >>> if an LSM has just been enabled or disabled in the build.  Moreover,
> >>> this list only makes sense if at least one LSM is enabled.
> >>>
> >>> Cc: Casey Schaufler <casey@schaufler-ca.com>
> >>> Cc: James Morris <jmorris@namei.org>
> >>> Cc: Masahiro Yamada <masahiroy@kernel.org>
> >>> Cc: Serge E. Hallyn <serge@hallyn.com>
> >>> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> >>> Link: https://lore.kernel.org/r/20210215181511.2840674-4-mic@digikod.=
net
> >>> ---
> >>>
> >>> Changes since v1:
> >>> * Add CONFIG_SECURITY as a dependency of CONFIG_LSM.  This prevent an
> >>>   error when building without any LSMs.
> >>> ---
> >>>  security/Kconfig | 4 ++++
> >>>  1 file changed, 4 insertions(+)
> >>>
> >>> diff --git a/security/Kconfig b/security/Kconfig
> >>> index 7561f6f99f1d..addcc1c04701 100644
> >>> --- a/security/Kconfig
> >>> +++ b/security/Kconfig
> >>> @@ -277,6 +277,10 @@ endchoice
> >>>
> >>>  config LSM
> >>>         string "Ordered list of enabled LSMs"
> >>> +       depends on SECURITY || SECURITY_LOCKDOWN_LSM || SECURITY_YAMA=
 || \
> >>> +               SECURITY_LOADPIN || SECURITY_SAFESETID || INTEGRITY |=
| \
> >>> +               SECURITY_SELINUX || SECURITY_SMACK || SECURITY_TOMOYO=
 || \
> >>> +               SECURITY_APPARMOR || BPF_LSM
> >>
> >> This looks really awkward, since all of these already depend on
> >> SECURITY (if not, it's a bug)... I guarantee you that after some time
> >> someone will come, see that the weird boolean expression is equivalent
> >> to just SECURITY, and simplify it.
> >
> >
> > Currently, LSM does not depend on SECURITY.
> > So you can always define LSM irrespective of SECURITY,
> > which seems a bug.
> >
> > So, I agree with adding 'depends on SECURITY'.
> >
> > What he is trying to achieve in this series
> > seems wrong, of course.
>
> This may be wrong in the general case, but not for CONFIG_LSM.
>
> >
> >
> >> I assume the new mechanism wouldn't work as intended if there is just
> >> SECURITY? If not, then maybe you should rather specify this value
> >> dependency via some new  field rather than abusing "depends on" (say,
> >> "value depends on"?). The fact that a seemingly innocent change to the
> >> config definition breaks your mechanism suggests that the design is
> >> flawed.
>
> Masahiro, what do you think about this suggested "value depends on"?


Of course, no.


See the help text in init/Kconfig:

          This choice is there only for converting CONFIG_DEFAULT_SECURITY
          in old kernel configs to CONFIG_LSM in new kernel configs. Don't
          change this choice unless you are creating a fresh kernel config,
          for this choice will be ignored after CONFIG_LSM has been set.


When CONFIG_LSM is already set in the .config,
this choice is just ignored.
So, oldconfig is working as the help message says.

If you think 2623c4fbe2ad1341ff2d1e12410d0afdae2490ca
is a pointless commit, you should ask Kees about it.






> >>
> >> I do think this would be a useful feature, but IMHO shouldn't be
> >> implemented like this.
> >>
> >>>         default "lockdown,yama,loadpin,safesetid,integrity,smack,seli=
nux,tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
> >>>         default "lockdown,yama,loadpin,safesetid,integrity,apparmor,s=
elinux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
> >>>         default "lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf=
" if DEFAULT_SECURITY_TOMOYO
> >>> --
> >>> 2.30.0
> >>>
> >>
> >> --
> >> Ondrej Mosnacek
> >> Software Engineer, Linux Security - SELinux kernel
> >> Red Hat, Inc.
> >>
> >
> >
--
Best Regards
Masahiro Yamada
