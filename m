Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB21030CB26
	for <lists+linux-kbuild@lfdr.de>; Tue,  2 Feb 2021 20:17:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239532AbhBBTOd (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 2 Feb 2021 14:14:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239186AbhBBTMZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 2 Feb 2021 14:12:25 -0500
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DFB1C0617AA;
        Tue,  2 Feb 2021 11:11:44 -0800 (PST)
Received: by mail-oi1-x231.google.com with SMTP id x71so23925297oia.9;
        Tue, 02 Feb 2021 11:11:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ska71jiHojC54SOYCBQ1AKHCS3X3JTpfbQsFpLGOP0c=;
        b=raM/FPGkdCZz1KmHU8ngiCRO/kehkjF1I6X0oa9wNdobKMGo4aA8QtePyfzrV3qOKh
         UYXLRoV2aEd+AzB30u83r/xfF5WVOpp6ewx0gJNEofxz+Lw+JAk3m7SCIJPw7sAhE9jx
         XPPSTuoVfD2DzDxUXMu4h9QCVNCWAevZ7zw6G4vsX7ABq8r9VJL4pxHtN1ciQ8IhC3W5
         JFOuR8zn5ETP/GLmddvMJZNA83XyvfDapILkKj4YvRZDpB/F8S0E1AIy+R1B988+MVL/
         p/8PF5gtaOuA2ApfAQW/rBbqhwa4WpFMNllcYXO2XCJcKt0/0axs0y6YkyDL+fSWMt6p
         wPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ska71jiHojC54SOYCBQ1AKHCS3X3JTpfbQsFpLGOP0c=;
        b=RtY2QkeSMndtdQMehtWfQhMOQepO+qoPl5DgXlgGBR41dzXgVcyHeGnD7LfMDqZwv9
         Su38wMdRwi3+RQTsBvaYLNBgJgQC03O650orsVgT625Xeem7Jf7/GwJAhcrmAhK1iaXn
         UnYgSyQt35Wi1oG+9r7mHUGfP56YlAaOwEeeDqtLETvqoriy2o3owKUEnl+7M2wwoS1g
         P7//86X/5A9Eeu/gCPI2rToXmQI3gQiBxsMd2MHIm7IEmIcx3LiNcH6X8t/ay5jWaspC
         xqsX1VZYYekiGSqlcFR4ChzBehJilnZ5cUcsLS9bMpSNBpJBtp+OgDVRMsecUHmg+k6Y
         JeBA==
X-Gm-Message-State: AOAM532NAX06aa940BdFdQHUJQV07ZSjP2j3x+6ERdXwjkBTH2JKcR0N
        QjMdd9Y/uPVWY2Gu9009InjmDdS9+2ex0TWM4YwFGZv3V3k=
X-Google-Smtp-Source: ABdhPJx0HkGblkDdLafb1qCDmr3Lo5CvcXHSsskkQ5s9ylD1ve6LTgZwK13heLHXImmHWfwtmz9VcKzjnuVS+eNjJkk=
X-Received: by 2002:a05:6808:1290:: with SMTP id a16mr3892391oiw.161.1612293103833;
 Tue, 02 Feb 2021 11:11:43 -0800 (PST)
MIME-Version: 1.0
References: <CAE1WUT6mp80yFDgAirZcKvc31O23ynpLGcsdPaa8qd1dsXiXhg@mail.gmail.com>
 <20210202053307.GB28542@1wt.eu> <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
In-Reply-To: <CAE1WUT4r1oNmu_7y6AMMSNyNmt8LYo6DXa2DPR=wOGb27XErZA@mail.gmail.com>
From:   Amy Parker <enbyamy@gmail.com>
Date:   Tue, 2 Feb 2021 11:11:32 -0800
Message-ID: <CAE1WUT7zprk-3naBGwZk=bsVR8Od=PT0kqNO6EVBQUOG+F1h3w@mail.gmail.com>
Subject: Re: Alternative compilers to GCC/Clang
To:     linux-kernel@vger.kernel.org
Cc:     linux-gcc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Feb 2, 2021 at 8:26 AM Amy Parker <enbyamy@gmail.com> wrote:
> > It compiles extremely fast, implements some subsets of gcc (a few
> > attributes for example), but is far from being able to compile a kernel
>
> Well, we'll see what I can do with that. :)

Well, just installed it and tried building the kernel. Fails every file. :)

It's definitely something to work towards - but I don't know if kernel
advancements requiring newer GCC versions will go slow enough to allow
TCC improvements to arise. This isn't just something like with Clang
where a few tweaks to files and to Clang itself did the trick.
