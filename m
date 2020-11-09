Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EB8552AB422
	for <lists+linux-kbuild@lfdr.de>; Mon,  9 Nov 2020 10:57:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729100AbgKIJ5t (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 9 Nov 2020 04:57:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgKIJ5t (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Nov 2020 04:57:49 -0500
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA183C0613CF;
        Mon,  9 Nov 2020 01:57:48 -0800 (PST)
Received: by mail-yb1-xb41.google.com with SMTP id f140so7650396ybg.3;
        Mon, 09 Nov 2020 01:57:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FipAhcEY6Ir/0bMu7F1ZE9qAOr9+LhLFjxwV6mVrxCk=;
        b=fK9GTjNhMAVfjNLy0bIL8Y4doTMgIrhTKz8xDEwUg9Ij9Ku9v8hF/NtKLW7wWWd1ux
         TbXB7jhg7ZWNnKmmaDfSHwnhjKKEWj1Tkz/21fsZ2w2VANI1/kiDKuTjpuMi1FSgLJr7
         ugM0bRnrQ2K8/Ky8IrlC8pwXRRpqiLhe2lFomaJ20FTBwdF2dH1W6CLb0Ewx3TfWAOYX
         c+h3pwxF64BK9jFkweeXTFMD6MJrg3VWfbUs67TZersIFPlBj9VUfXX+T73C4XkOPtbh
         p+MqO1czGHEASoGwmBFlPuDrXzcHKX4sKgjWkmDdemwGiqsB8r9dbZhRyO2X8LyOOdk/
         NIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FipAhcEY6Ir/0bMu7F1ZE9qAOr9+LhLFjxwV6mVrxCk=;
        b=sEZfnuCVIm4caO135v7TriVUkzNf/CRlsSmpGIfZqDUnc4ZvoTzQC1OFHs4r+8UCqB
         4XJauPRjqc2cjPFfylHUpfuWDMwKYrrg3KNFZOSrxOaWkgByDGXZS+FU2wHVeMzkZcxx
         s+J6pIR/BfO0rNRoy/tMWfX9YeSv69sRaN17No/03GJ+UvOUpfkgwr8JjAu/KA6DRvTC
         JBdTfaEgdsnmeFR+A7sm6ENJct6QESjYPMteqBcBH76Qm+Bd5cGdExzaG4z2nhDHEGHA
         6PGj3oQS1hWDuVo8HoiF1i8J9aBqvEHtynKjbfjGl1XxxKKKeRYqDlLwrZpc5N9KuX+E
         mpeQ==
X-Gm-Message-State: AOAM532dC0w+ZAr62F8Iqx6/AKAIHiXYKudnbhWG9V7F3LejotGWbDBN
        0e4aloc+tMypC6QOqEFBL2YQLyexxQFMywZ4vJQ=
X-Google-Smtp-Source: ABdhPJxgo2tgKLozFLe5IzmfX3h47YoM+mi4OBFJzMtL+8cGL40MSpZaqvE27IgUuhbdXJLHD0sc2u2D0Oa1UHgGK+o=
X-Received: by 2002:a25:d981:: with SMTP id q123mr10209426ybg.50.1604915868158;
 Mon, 09 Nov 2020 01:57:48 -0800 (PST)
MIME-Version: 1.0
References: <CAE1WUT75gu9G62Q9uAALGN6vLX=o7vZ9uhqtVWnbUV81DgmFPw@mail.gmail.com>
In-Reply-To: <CAE1WUT75gu9G62Q9uAALGN6vLX=o7vZ9uhqtVWnbUV81DgmFPw@mail.gmail.com>
From:   Ming Lei <tom.leiming@gmail.com>
Date:   Mon, 9 Nov 2020 17:57:37 +0800
Message-ID: <CACVXFVNmYoh20atwG9DOE-ZXFMLqNgGucREBsWAEYnDV4eLs1Q@mail.gmail.com>
Subject: Re: 5.10 tree fails to build
To:     Amy Parker <enbyamy@gmail.com>
Cc:     linux-kbuild@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        masahiroy@kernel.org, michal.lkml@markovi.net,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Alexei Starovoitov <ast@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Nov 5, 2020 at 12:58 PM Amy Parker <enbyamy@gmail.com> wrote:
>
> On all attempts to build the 5.10 tree (from either release candidate,
> Linus's tree, Greg's tree, etc), the build crashes on the BTFID vmlinux
> stage. I've tested this on several different devices with completely
> different hardware and kernel configs. The symbol for vfs_getattr
> appears to be missing. Compiles for all of these work on any compile
> on any 5.9 tree. I've tested all 4 5.9 dot-releases as well as the first
> two and last two release candidates and Greg's staging tree.
>
> The specific error is:
>   BTFIDS  vmlinux
> FAILED unresolved symbol vfs_getattr
> make: *** [Makefile:1164: vmlinux] Error 255
>
> Any thoughts as to what's causing this? The main machine I'm
> compiling with is running kernel 5.8.17 with dwarves 1.17. My
> kernel config is attached as `kernel_config`.

Turns out the issue is introduced in the following commit:

commit 6e22ab9da79343532cd3cde39df25e5a5478c692
Author: Jiri Olsa <jolsa@kernel.org>
Date:   Tue Aug 25 21:21:20 2020 +0200

    bpf: Add d_path helper

The issue can be observed reliably when building kernel in Fedora 33 with
F33's kernel config.

GCC: gcc version 10.2.1 20200826 (Red Hat 10.2.1-3) (GCC)

-- 
Ming Lei
