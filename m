Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4F1525B8AC
	for <lists+linux-kbuild@lfdr.de>; Thu,  3 Sep 2020 04:20:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726526AbgICCSy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 2 Sep 2020 22:18:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726177AbgICCSx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Sep 2020 22:18:53 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F9C6C061244;
        Wed,  2 Sep 2020 19:18:53 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id cr8so609081qvb.10;
        Wed, 02 Sep 2020 19:18:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cLhB9WMKmrTzJrIfToVBunW2YW14xJnlM/mfN1FhJG4=;
        b=gX3y3MR80ivVl7Wr5JGLNIUlIupUMgrEYDyZ/eVweQaVyjyN3T//LKvYJWXrCsSQXH
         GkfX3bls2sQNeJJi3GvVbIli3Ui0z+JqV5LBfGwi/XyR+qCwZQ4UX0+b+zqbEMe56iKO
         P6wQmvKxaIMDqHewpXCNWA8Gooxol7hQjTTh5UJC0PFZ17wNfUsQV8HoELxK6/sjuQ2h
         hnkg5DcOhxev4LgPT8Z6m7m5nxk3Na9kboOMBxp16mJvj+yrBr26YrTKm1Vi964JHvfx
         ogr3ugUlSAV57RoqkIFTdl2Zyg2WafQtECslol5FOFGwFrXdWzT/V7aTbSI7VRdNCZ+V
         FTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cLhB9WMKmrTzJrIfToVBunW2YW14xJnlM/mfN1FhJG4=;
        b=Sazb7mc/lHD10Ij5pIV7f69LSEXwMNkHA4V55bnnUQFSIH/u57dBIjNpj7RSWha8Fj
         4cuzSiFbxTaXIIbaLjr4wO/49OiZar1v9VAnzaHCtwVSOwiP3ZTy4SnvAMBR0Igv9f7q
         MgHLHiMVSWs9WfijrAdY4+gmFrwJgtW07AkHl8j0P1lRRs9UnnjjmHQqDVp3onuEh30n
         X+uj8M4P7f51655LcAI3jCIY4lQaF+2U5kWaYVe50bTl/B5cyDlX2fGgcWwLs1cNL6+Y
         mlvLTQ0miFsbHBDH5DEUAtvl2r92ZEAfdniOkOBFn8S0bpr2bnjdf7134fTCV5ZleNN/
         ik0Q==
X-Gm-Message-State: AOAM531ouWzeiloRZhYdWHoarImpDtH0Cl5KtZ4jUhyncZRyUBMmBSVT
        cJaGa8taHcjlKeyquuM/77uKd+EcsmKptezA7EQ=
X-Google-Smtp-Source: ABdhPJys6BLrvwI+u7/CfWKaY93C9EOeqt1aHbH1XCRC2U2Q3WI/hnaJWrQ5dA5Nv0Zk4NsGH3OxJFjcvT9WmKjFwUY=
X-Received: by 2002:a0c:e188:: with SMTP id p8mr395319qvl.9.1599099532757;
 Wed, 02 Sep 2020 19:18:52 -0700 (PDT)
MIME-Version: 1.0
References: <be80ceda-596b-03aa-394f-166cc6388aa0@infradead.org>
 <CAK7LNAQekh08D6=+CqRWiB7F4KCLOgSK9oof8ArVUvMc7B1YXQ@mail.gmail.com>
 <CALaQ_hq01BCA7=sVJjm6LQrjjBFy1V79uUXcRXeLBB5g3k9M1Q@mail.gmail.com> <CAK7LNARp41EXMmT+ghGVw0Ew8wgHND+Ufn_uCevaVk+OP2-UFQ@mail.gmail.com>
In-Reply-To: <CAK7LNARp41EXMmT+ghGVw0Ew8wgHND+Ufn_uCevaVk+OP2-UFQ@mail.gmail.com>
From:   Nathan Royce <nroycea+kernel@gmail.com>
Date:   Wed, 2 Sep 2020 21:18:41 -0500
Message-ID: <CALaQ_hrs8piRh2-JacEkmrHZQ=rM7yvZUStWfO0YPhNRRYiSBw@mail.gmail.com>
Subject: Re: [PATCH] kconfig: streamline_config.pl: check defined(ENV
 variable) before using it
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Heard, but all the same if it isn't important (which I'm assuming),
I'd just as soon be left out of it. That's just the way I am in
general, not wanting to be seen unless I have to be seen. Thanks
though.

On Wed, Sep 2, 2020 at 9:14 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Even if you do not write the code,
> reporting bugs is a great contribution,
> and the Reported-by exists for that, I think.
>
> So, I just want to add your Reported-by tag
> (if you do not mind).
>
>
> --
> Best Regards
> Masahiro Yamada
