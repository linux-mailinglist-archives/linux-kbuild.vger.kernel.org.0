Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94744187711
	for <lists+linux-kbuild@lfdr.de>; Tue, 17 Mar 2020 01:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733005AbgCQAsi (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 16 Mar 2020 20:48:38 -0400
Received: from conssluserg-03.nifty.com ([210.131.2.82]:48091 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733152AbgCQAsi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Mar 2020 20:48:38 -0400
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 02H0mQWT012973
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Mar 2020 09:48:27 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 02H0mQWT012973
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1584406107;
        bh=kLX0by3CZi+zeC1hcZEY7sLahFeV0xNt94EUOmF2mFc=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=DUqf9B0RiTge3n0eraW+o/mty/YSZMpYlhmY2H/TbdnLquqLJ0RSS3kLBJlDjwAns
         rGC/i48u4AOnoW8EKzZQZtqHVDC87kFBt6Jk5Zy8cIIuD44YNkE6Bh/yF/Qz2B8Csa
         lgjlJ/NzWBFYEij9Uncfk34bdm3J3EfgmEniZYXuooxcewJ92tgBMHg7JBsTjxqGY2
         ah/4ZLndiaF+x67H4EIq1WZAZAfRndPr907ujhrebKty21DNVnCYRpVRkm8PniIP87
         oFKzTKS50QUgohUO9c5pckEbb/okX6EY51lrJKivGO5tyr7hGtNGZPtXSmm/cPfqqz
         VTwhSuTsatJcg==
X-Nifty-SrcIP: [209.85.222.49]
Received: by mail-ua1-f49.google.com with SMTP id 9so6846212uav.12
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Mar 2020 17:48:27 -0700 (PDT)
X-Gm-Message-State: ANhLgQ1IK8KeAeIFTM6o+nyJCvCsbLgZPm6DWeJ/B/Dmpz7SlBFqaAvQ
        w+zl7mT80m7tpFXE85YLWFDzmPwb0qhMyytjD4A=
X-Google-Smtp-Source: ADFU+vvtpmwd4ztfxCbiy6p8V4dqg2z9mUizLdWEQDAf3TSl8YhRP96Zb4Ebg2nmxSAYmxiRdOOLY3PxUcUvFgDNa5Y=
X-Received: by 2002:a9f:32da:: with SMTP id f26mr2131441uac.40.1584406105799;
 Mon, 16 Mar 2020 17:48:25 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
In-Reply-To: <CAKwvOd=i8mLYsSNtJTcZ=RTk76F_mYy9fM9FBtDveFybxyGyiw@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Tue, 17 Mar 2020 09:47:49 +0900
X-Gmail-Original-Message-ID: <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
Message-ID: <CAK7LNARc4L18CP6ZbTheh43VobQZ1s_2Q=4O7oKmTZRLgiTw6Q@mail.gmail.com>
Subject: Re: linux-kbuild missing from lore?
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Nick,

On Tue, Mar 17, 2020 at 8:22 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hi Masahiro,
> I noticed that linux-kbuild@vger.kernel.org seems to be missing from
> https://lore.kernel.org/lists.html.  Is that intentional or
> accidental?
> --
> Thanks,
> ~Nick Desaulniers


Thanks for letting me know this.
I guess it is accidental.

In fact, I do not know what to do
to take good care of the kbuild ML.


--
Best Regards
Masahiro Yamada
