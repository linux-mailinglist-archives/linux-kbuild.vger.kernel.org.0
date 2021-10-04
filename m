Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 624BA421407
	for <lists+linux-kbuild@lfdr.de>; Mon,  4 Oct 2021 18:26:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235860AbhJDQ1s (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 4 Oct 2021 12:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234124AbhJDQ1r (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Oct 2021 12:27:47 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F34C061745
        for <linux-kbuild@vger.kernel.org>; Mon,  4 Oct 2021 09:25:58 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id a17-20020a4a6851000000b002b59bfbf669so5539544oof.9
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Oct 2021 09:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=mLc0Fek34odD1FMIzueqXa/78SBcfVgbP97vYrbJQc8=;
        b=Und7ZT2O/QKy3PwHipvfFlrL0ZXnwp+KNFSVjJRK4dxcaDVmi+SV55EzF8r7LkEk6W
         X63d2RnxGwTFTHWu6c9gqVTIQjfwxLOK4XTYlXFsZ841zkGIzqMbwV5QZ0ry2byFZNo0
         WP20ZcFf1U0cZbpBV2ZxJW7oSXovwCWgpWSlmgQTo1VekaBNH//8UgX4HoIkaFtQxk+h
         diIpg26bC56lO9sRUNv139RdyIVKDT0aNDEvKt/o3qu40zjcQ8m7bOXGv1l5XxiyH6s8
         yOzos756ADqluoEIZZNMeJvjucoHbh+zk2slJ3wfIoaCK0VFaovdGdc7ebwPU73U7Gub
         v1tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=mLc0Fek34odD1FMIzueqXa/78SBcfVgbP97vYrbJQc8=;
        b=ZG2SF8tSS5w0kan1LchifxTjeV0h/haJqR0ali8wZzR4upIaCPk0pkICpXYgBorydo
         eihMtZNHks8la4w6oshO4ODe9BZJLbfb0dJvcnHFvlrNL52+3jVtE1Dv4hqq/BYiTyhk
         AzR4jfRENZTgFC4xsOxXJpxBrcy8ioXtnG8t9jqcfEUdMqZ6wLi8O/wMaII2I8fFAyV2
         lTcG/EiLTRE6OtYYn/P2YZEn0CVK116xoVfHd0hq718HECHgU4Sqzs6vpVxdmvIOm6LH
         QBDbVPWvFrT9wDKZX3x/WxJ3VoBL4TYIsqoI6Fq9mARK/BJvIcu9Ww5nuexamA2W3vGd
         tKbg==
X-Gm-Message-State: AOAM5317Bz4tOP2LtiWzVimNunGJ14DHWUYKE2Ph5G5UZIN/BU+FruNO
        jhgWK9nFheU/qalakGolfC0uPeCQHqkbIiENXg==
X-Google-Smtp-Source: ABdhPJz0q2XRr1Qfp6FLOFJNKbFVVBsAZTooPNituDqLrLvOFORJozZLLRR3CNunNc+pVqvoT8U5LfQRUAJw3Lw/IX0=
X-Received: by 2002:a4a:c80b:: with SMTP id s11mr9722036ooq.65.1633364753033;
 Mon, 04 Oct 2021 09:25:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6808:2c4:0:0:0:0 with HTTP; Mon, 4 Oct 2021 09:25:52
 -0700 (PDT)
Reply-To: robertskelvin20211@gmail.com
From:   Roberts Kelvin <skyprince20211@gmail.com>
Date:   Mon, 4 Oct 2021 16:25:52 +0000
Message-ID: <CAGZW7rXHbEHPHPh8nAWR6TKqzs2q3JQasRhM2f7qDETk+_a9tA@mail.gmail.com>
Subject: HI
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

--=20
K=C3=A6ri herra/fr=C3=BA,

Sk=C3=B3lastj=C3=B3rar m=C3=ADnir hafa n=C3=BA fengi=C3=B0 gjaldeyriskv=C3=
=B3ta og sam=C3=BEykki
=C3=BE.mt fj=C3=A1rmagn og undir reikninga, vi=C3=B0skiptapallur, fyrirt=C3=
=A6kja
reikninga og jafnvel einkareikninga.

Ertu me=C3=B0 einhverja raunh=C3=A6fa vi=C3=B0skipta=C3=A1=C3=A6tlun sem =
=C3=BEarfnast fj=C3=A1rmagns?
=C3=9Ea=C3=B0 fer eftir
vi=C3=B0skipta=C3=A1=C3=A6tlun/verkefni =C3=BEitt eru sk=C3=B3lastj=C3=B3ra=
r okkar =C3=AD a=C3=B0st=C3=B6=C3=B0u til
veita h=C3=B6fu=C3=B0borginni tilvalinn f=C3=A9lagi tilb=C3=BAinn til a=C3=
=B0 vinna fyrir sameiginlega
=C3=A1vinningi og fj=C3=A1rmagni=C3=B0 ver=C3=B0ur afhent =C3=BE=C3=A9r =C3=
=A1n endurgjalds
Fj=C3=A1rm=C3=A1lavettvangur.

=C3=9Ea=C3=B0 ver=C3=B0ur skylda m=C3=ADn a=C3=B0 lei=C3=B0beina =C3=BE=C3=
=A9r um a=C3=B0 tryggja fars=C3=A6lt fyrirt=C3=A6ki l=C3=ADti=C3=B0
e=C3=B0a st=C3=B3rfj=C3=A1rfesting e=C3=B0a aukning einkafj=C3=A1rmagns.

Fyrir frekari uppl=C3=BDsingar haf=C3=B0u samband vi=C3=B0 mig
{robertskelvin20211@gmail.com}

Kve=C3=B0ja,
Roberts Kelvin
