Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DDE231C225
	for <lists+linux-kbuild@lfdr.de>; Mon, 15 Feb 2021 20:05:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230290AbhBOTFQ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 15 Feb 2021 14:05:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28522 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230288AbhBOTFO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 15 Feb 2021 14:05:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613415827;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yjLa1ePdzOKfH1hFOxUctagsf0SqnjEtoXHUeu2nq70=;
        b=clpjMCh76cOmE6HjCckSq6/j6Hdq+0JY0LA/AKKVqyxlg5i8j2avKcktwRhHTpKNzC0+ml
        vnwdiMjdofUMIkW3Sdl8kit2udNnlsgBisGiByHlN5nxFeNMyGos92g6HlcoezznUnKObV
        dsRe69jvtmueHYx+lYR3iPuT3TrOnk8=
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com
 [209.85.219.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-136-XoyolH1YMoaq6MeR8G_gIw-1; Mon, 15 Feb 2021 14:03:43 -0500
X-MC-Unique: XoyolH1YMoaq6MeR8G_gIw-1
Received: by mail-yb1-f199.google.com with SMTP id u1so10764990ybu.14
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Feb 2021 11:03:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yjLa1ePdzOKfH1hFOxUctagsf0SqnjEtoXHUeu2nq70=;
        b=VqdjhVKaZQPpLYfqIezQiGkaHUqUUsHmKYE0JsHR7dK6UWUk+Ie/+8FRGyct5EvXRi
         oUj2Z/e/tdCvH7LxszXkZ2ADg0xQmTe5CzBHU7GsgiXCJ+zEUy/jFVzOcJ5EzPA6Uhrb
         BNuaYhtoj3XWylUYnWp0JMoMZO11fYAhNisvv/W9rCklzZy7UAGJ0iTANPPjYSSgug1E
         9SLjLmDdwliCgr++D8XPAVVe1aLZD003gZYtkAMq4Av/zyHLl8MCV3bRzrLrI2bEEiyL
         G0Uvh3x2vQYonEQtr6m694tztczde/OQvfAzpNu78KQWnmtoLbf+6NTPD7YArq/6p7Ri
         xJOg==
X-Gm-Message-State: AOAM532LwbFln4LHRAsJoYcLCgzN78IdAr6SSwcxeWOIyJqtqD17MEs7
        nwWx65mYnAX6ApmdKBDbiARmJRgH+P61xTH+ZBIMTNAjXYW7LsWPsq2hrOl7ot8xbFn7Su8RQEn
        6Spx1VBazMC9hvYwwFdiD33QLzpRotNndOKUnlEyU
X-Received: by 2002:a5b:404:: with SMTP id m4mr24943606ybp.436.1613415822971;
        Mon, 15 Feb 2021 11:03:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxedalHqY8rbPQisLkuArGmVarQZGazs9bCgbyFwBWzr5n/txrW6AMcFAF2u8fzpNzUhxkz8qFAkSuEWt2jT7I=
X-Received: by 2002:a5b:404:: with SMTP id m4mr24943585ybp.436.1613415822772;
 Mon, 15 Feb 2021 11:03:42 -0800 (PST)
MIME-Version: 1.0
References: <20210215181511.2840674-1-mic@digikod.net> <20210215181511.2840674-4-mic@digikod.net>
In-Reply-To: <20210215181511.2840674-4-mic@digikod.net>
From:   Ondrej Mosnacek <omosnace@redhat.com>
Date:   Mon, 15 Feb 2021 20:03:29 +0100
Message-ID: <CAFqZXNsvqx-pbC+wzHB4aXX6h=buU3csM_a=By-zCOmx0n-xCQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] security: Add LSMs dependencies to CONFIG_LSM
To:     =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>
Cc:     James Morris <jmorris@namei.org>,
        Masahiro Yamada <masahiroy@kernel.org>,
        "Serge E . Hallyn" <serge@hallyn.com>,
        Casey Schaufler <casey@schaufler-ca.com>,
        Nicolas Iooss <nicolas.iooss@m4x.org>,
        linux-kbuild@vger.kernel.org,
        Linux kernel mailing list <linux-kernel@vger.kernel.org>,
        Linux Security Module list 
        <linux-security-module@vger.kernel.org>,
        =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Feb 15, 2021 at 7:17 PM Micka=C3=ABl Sala=C3=BCn <mic@digikod.net> =
wrote:
> From: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
>
> Thanks to the previous commit, this gives the opportunity to users, when
> running make oldconfig, to update the list of enabled LSMs at boot time
> if an LSM has just been enabled or disabled in the build.  Moreover,
> this list only makes sense if at least one LSM is enabled.
>
> Cc: Casey Schaufler <casey@schaufler-ca.com>
> Cc: James Morris <jmorris@namei.org>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Serge E. Hallyn <serge@hallyn.com>
> Signed-off-by: Micka=C3=ABl Sala=C3=BCn <mic@linux.microsoft.com>
> Link: https://lore.kernel.org/r/20210215181511.2840674-4-mic@digikod.net
> ---
>
> Changes since v1:
> * Add CONFIG_SECURITY as a dependency of CONFIG_LSM.  This prevent an
>   error when building without any LSMs.
> ---
>  security/Kconfig | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/security/Kconfig b/security/Kconfig
> index 7561f6f99f1d..addcc1c04701 100644
> --- a/security/Kconfig
> +++ b/security/Kconfig
> @@ -277,6 +277,10 @@ endchoice
>
>  config LSM
>         string "Ordered list of enabled LSMs"
> +       depends on SECURITY || SECURITY_LOCKDOWN_LSM || SECURITY_YAMA || =
\
> +               SECURITY_LOADPIN || SECURITY_SAFESETID || INTEGRITY || \
> +               SECURITY_SELINUX || SECURITY_SMACK || SECURITY_TOMOYO || =
\
> +               SECURITY_APPARMOR || BPF_LSM

This looks really awkward, since all of these already depend on
SECURITY (if not, it's a bug)... I guarantee you that after some time
someone will come, see that the weird boolean expression is equivalent
to just SECURITY, and simplify it.

I assume the new mechanism wouldn't work as intended if there is just
SECURITY? If not, then maybe you should rather specify this value
dependency via some new  field rather than abusing "depends on" (say,
"value depends on"?). The fact that a seemingly innocent change to the
config definition breaks your mechanism suggests that the design is
flawed.

I do think this would be a useful feature, but IMHO shouldn't be
implemented like this.

>         default "lockdown,yama,loadpin,safesetid,integrity,smack,selinux,=
tomoyo,apparmor,bpf" if DEFAULT_SECURITY_SMACK
>         default "lockdown,yama,loadpin,safesetid,integrity,apparmor,selin=
ux,smack,tomoyo,bpf" if DEFAULT_SECURITY_APPARMOR
>         default "lockdown,yama,loadpin,safesetid,integrity,tomoyo,bpf" if=
 DEFAULT_SECURITY_TOMOYO
> --
> 2.30.0
>

--
Ondrej Mosnacek
Software Engineer, Linux Security - SELinux kernel
Red Hat, Inc.

