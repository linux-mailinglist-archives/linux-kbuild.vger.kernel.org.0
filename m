Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B41A837090D
	for <lists+linux-kbuild@lfdr.de>; Sat,  1 May 2021 23:19:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231853AbhEAVT4 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Sat, 1 May 2021 17:19:56 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:52185 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231739AbhEAVT4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 May 2021 17:19:56 -0400
Received: from mail-wr1-f44.google.com ([209.85.221.44]) by
 mrelayeu.kundenserver.de (mreue011 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1Mzyi6-1lP0fe1CZq-00x0e8; Sat, 01 May 2021 23:19:04 +0200
Received: by mail-wr1-f44.google.com with SMTP id x5so1589432wrv.13;
        Sat, 01 May 2021 14:19:04 -0700 (PDT)
X-Gm-Message-State: AOAM532vq+bZNwVlwWxVcsEMyeFRVaQ0jdkzC3/btMkcGGbH4x7/3iuC
        q2VEl4dWMoROGcwY11Zh5PuzCQihQaiMwAL+xG4=
X-Google-Smtp-Source: ABdhPJwxX7UQ1JNp+JEAHWeZp2Bq20dQ0+HLXAT1u6dZ+Krmnx72KZxLPc//au7Gj4to2+E8DyJZ2Tgr7fgRNdrVKcY=
X-Received: by 2002:a05:6000:1843:: with SMTP id c3mr16285978wri.361.1619903944009;
 Sat, 01 May 2021 14:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210501172437.156926-1-masahiroy@kernel.org>
In-Reply-To: <20210501172437.156926-1-masahiroy@kernel.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Sat, 1 May 2021 23:18:23 +0200
X-Gmail-Original-Message-ID: <CAK8P3a2Ng7ZvRh4iT5jrFvp9=Z7oQJ4Ay_OWJ76bnZfn=VEZVw@mail.gmail.com>
Message-ID: <CAK8P3a2Ng7ZvRh4iT5jrFvp9=Z7oQJ4Ay_OWJ76bnZfn=VEZVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove ARCH=sh64 support from top Makefile
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:5Ft+P2rdsLOh6+FnG5AS5WqyqsU0zmZ5Ti2UTDZlvpNSwIMgNAp
 hWqhItN9bZ8BT+EajdtFcnYfLfkmuRtzqE6N/yL/s1zvFjTklptYhV6opiejOWy81JOqtj0
 wo84RgfX0QJ42d6ZJj2L3DnnVhEgQa/cWnQ2JCux7Hg+CA//1PzJ+gC5Y/5dxL2mr0vDKDC
 F8XXK7Wmd71D7HDUxREGQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sqSjb95dxcc=:rZRL8wczBfudxEIfW7QvpA
 9l20oxSvA3P3gCxVMvYcoJrU+UR3d5XbitszkfdJzxL/+94KR3k72vHKWJJldHWhPJyFP8Xbi
 4jqL/AdhbJC4XtDQN0qXj8e7Na3SuhEg62IY+XzJZX4QtVE1MJ+Wnd1Tv4c3IW8XvVXiQM870
 CLDld0pH56vu/+0B3nuSfSfrIHGQrKmML3hLU9FC3EiTsXu7Eim7EAPVpcKag2k49ALmdRCeL
 X+1B5klQII+K6plG31W3JY5e2YwYl6rkNISF85rVA667x/ZosjIy3/qigBid/jXF/gdvehwFS
 AYVwqKHESc/o7eFkqYI1r2yVhsIVVD/63wteBqu2wvcMLFYSq1+oaxYVzikI4BnoOjNHI4SeL
 xdCGjhER2dXTAl4JoGjvWOuQuunCnD19ioK2VttSwSaGAhRzJruLvCTqeOdFF2npqKIEnH9Sz
 BSoF/B+ScMANn8KbFOiuxYR3EfooiU0pYx2ekXvai7Iqw2f0jzPBPD8e7Px3TplSovEn4iZvh
 I5dIshdKwjekBL3eZxgRxQ=
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Sat, May 1, 2021 at 7:26 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Commit 37744feebc08 ("sh: remove sh5 support") removed the SUPERH64
> support entirely.
>
> Remove the left-over code from the top Makefile.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

Good catch!

Acked-by: Arnd Bergmann <arnd@arndb.de>
