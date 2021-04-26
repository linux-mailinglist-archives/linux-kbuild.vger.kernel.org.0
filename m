Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 456AD36ABD5
	for <lists+linux-kbuild@lfdr.de>; Mon, 26 Apr 2021 07:31:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229554AbhDZFcV (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 26 Apr 2021 01:32:21 -0400
Received: from conssluserg-02.nifty.com ([210.131.2.81]:58204 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbhDZFcV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 26 Apr 2021 01:32:21 -0400
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id 13Q5VNwZ015418
        for <linux-kbuild@vger.kernel.org>; Mon, 26 Apr 2021 14:31:23 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 13Q5VNwZ015418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1619415083;
        bh=laZ/hERka+or3Yqxw4QGQ8Xbsd9MCcUnzQVJrtZc3Tw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=tRvKzOSmaLiic5ZSO4D6T6p5S+iJYh1wi1Oo15PLM12tU764+s/N7WiZkDOUqGuLX
         c7EjaHMb2Z/lPORz8ROj96YlMIACh9LzIIOwTvF7p3Ox/AXFacvI3r5oTUyPB9X8jR
         WaengVD58CnXQj5UpDRXqlZGET7iIIKDe2olG6Rb7ZxW15Rvskv3fCllWL4DYO7JZL
         NjQOvbZGnfHF7nIl74k1ATFeBo5E2WcqDOURU38pbkMjvTRKkGAQ4dUBEBwGwVJ7ap
         0qHxLQI9Lbq8nuE0jwvTyG1NgMrrLHL3+RJvcIsaf8cXoqzhrIE0lTtLJSb9fPEgSV
         P1Vw5kZhho3+g==
X-Nifty-SrcIP: [209.85.216.51]
Received: by mail-pj1-f51.google.com with SMTP id f2-20020a17090a4a82b02900c67bf8dc69so4498199pjh.1
        for <linux-kbuild@vger.kernel.org>; Sun, 25 Apr 2021 22:31:23 -0700 (PDT)
X-Gm-Message-State: AOAM533FQ7zjfX9laHPTD3uiuLBf2mFT5wmNPBNlo7y+ARz0LLeZ7cH4
        POmYrD/dLzTZ/EC5CljVzH6xx3eXo7pqgTcYUJk=
X-Google-Smtp-Source: ABdhPJwGJP32sfW4llJeecDWNQFFAPTDGjsOMWCYTjNwF0QW9dLR1Pbl12GA/4UwGRB+OKCU4c9tYBiuOJA1V1vZxgg=
X-Received: by 2002:a17:902:d645:b029:e8:ec90:d097 with SMTP id
 y5-20020a170902d645b02900e8ec90d097mr16978691plh.47.1619415082932; Sun, 25
 Apr 2021 22:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAGRSmLsJmR_NFcovYSP-gK52qDASP4csbaOjx2Sfk9HvhHvAfQ@mail.gmail.com>
 <CAGRSmLtsWvPhbmEkLNWC8FAtkvXBWSBRunAKNYUCRah2m+y2sQ@mail.gmail.com>
In-Reply-To: <CAGRSmLtsWvPhbmEkLNWC8FAtkvXBWSBRunAKNYUCRah2m+y2sQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Mon, 26 Apr 2021 14:30:46 +0900
X-Gmail-Original-Message-ID: <CAK7LNASoK0yhDdeoj1GPELTQ_sz3h=aVdTPUNj-4m6Zacj1fvw@mail.gmail.com>
Message-ID: <CAK7LNASoK0yhDdeoj1GPELTQ_sz3h=aVdTPUNj-4m6Zacj1fvw@mail.gmail.com>
Subject: Re: 5.10 build issue creating library for driver support.
To:     "David F." <df7729@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, Apr 24, 2021 at 10:26 PM David F. <df7729@gmail.com> wrote:
>
> Hello,
>
> I moved to 5.10 from 5.4 now I have build problem:
>
> "No rule to make target '/path/to/sourcefile.o', needed by '/path/to/lib.a' Stop
>
> The build will build a small library file of shared driver support
> routines, but it doesn't appear the build will support a library
> anymore?  Is there a patch for that?
>
> There was a patch that fix a prior problem of linking to a lib.a file:
>
> Subject: Moving from 4.x to 5.4.22 breaks custom module build.
>
> Is there a fix for this new issue?
>
> Thanks.


I think you asked the same question before,
and you found a patch.

https://patchwork.kernel.org/project/linux-kbuild/patch/20200106032324.3147-1-masahiroy@kernel.org/#23088533
Doesn't this solve your problem?

-- 
Best Regards
Masahiro Yamada
