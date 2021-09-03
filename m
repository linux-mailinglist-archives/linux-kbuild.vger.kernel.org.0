Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 918414002D2
	for <lists+linux-kbuild@lfdr.de>; Fri,  3 Sep 2021 18:02:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349827AbhICQDD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Fri, 3 Sep 2021 12:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349836AbhICQDD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 3 Sep 2021 12:03:03 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2210C061757
        for <linux-kbuild@vger.kernel.org>; Fri,  3 Sep 2021 09:02:02 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id w4so10261578ljh.13
        for <linux-kbuild@vger.kernel.org>; Fri, 03 Sep 2021 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=Qdp0SHs3xmfRjgLIyqNwEa9EGz3sQom2u8TOqtBT/Zc=;
        b=asGUuMHPXeQXCb5nqi6dzhAErIG7kM8cyK01AC7EgH+pI6vGW0WEOSLX06tdWZATVa
         Pet3lLv0HGK+7MgFrsW35uUZshEqMYQS8Wr+LpvIlIiD6MR+2JBsgHwnkW74eFpZ9qUP
         kBadcohrMHtAPcceLY8xpEaZjPcjBc+Ospe12JnY/9EL6K4EK3/+urv97oK4J7WZWaw0
         2G1RFX+Zg8vO1AT0KCGYomgsfElE0qNwl2y1vUX0a4mfmM3xHTBWStPU1SeIuBma5Swj
         6fhZ0g/BVvNuLBAVP4Q9hLKB0gfSB0YCeGMtzqgxgGvnxJEN4K57KoG3bgkOhdCzxkRW
         g3gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=Qdp0SHs3xmfRjgLIyqNwEa9EGz3sQom2u8TOqtBT/Zc=;
        b=TnlGSrIdPgSAhENu1LDFvda6l8tCwS9lTUUH8Hk/3FdnUoT6gcSxswLmG1CwtbgxJ3
         YA7PYXrZaZE9XghLxE+YtQZNw6cdvcD9/KNWZ7z42RC2MQPq1VwBPrPLYMl0OhGmYApf
         /pXyuU5vjrzhj5563swMHHj8LtMfMyQO3Z7DZ2NvdHlT+xz7J6ykCqd+LZm5kd8h0rA6
         kMsky0vWbYHmIWzlo5+JceoUF/zriESQo6C7gjbeMkamU7zZQAtk5ywlBmH61/TUiBLe
         NxTRzPfmmGlJbwtIqIZilz/VrZ/60jcreS7h6RcZCzOsdtGTyxr8rjR6NONdj5tM1AKA
         rlcw==
X-Gm-Message-State: AOAM530iExv2l7YZOacqFfH1hAJp3Ds/M2I/+wRw5v8lYbfgzq2iKPUY
        72voITvYPnaCwC2ajgV7/qI7UJGpPLKrTHyXfMc=
X-Google-Smtp-Source: ABdhPJyF5zSsE2px1psAONtdhRVdSR5IGQMoQ5pQZoATmg4l+9mATKW2+2QQEed0JWRrDBg81tNcrWvOq/jXKoT7mJA=
X-Received: by 2002:a2e:b6c8:: with SMTP id m8mr3325491ljo.449.1630684920826;
 Fri, 03 Sep 2021 09:02:00 -0700 (PDT)
MIME-Version: 1.0
Sender: nicolemarois55@gmail.com
Received: by 2002:a05:6512:1504:0:0:0:0 with HTTP; Fri, 3 Sep 2021 09:01:59
 -0700 (PDT)
From:   "Mrs.Nicole  Marois" <nicole1563marois@gmail.com>
Date:   Fri, 3 Sep 2021 16:01:59 +0000
X-Google-Sender-Auth: F-9mwj4kwJBrX9stp0n7Ee6qkyw
Message-ID: <CAH=VPVN1pKhdVv2bjzwghwwCAowL3UsXobgFOF8aUqqLt4HYEQ@mail.gmail.com>
Subject: Hello Dear,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hello Dear,

Please do not feel disturbed for contacting you, based on the critical
condition I find mine self though, it's not financial problem, but my
health you might have know that cancer is not what to talk home about,
I am married to Mr.Duclos Marois who worked with Tunisia embassy in
Burkina Faso for nine years before he died in the year 2012.We were
married for eleven years without a child. He died after a brief
illness that lasted for five days.

Since his death I decided not to remarry, When my late husband was
alive he deposited the sum of US$ 9.2m (Nine million two hundred
thousand dollars) in a bank in Burkina Faso, Presently this money is
still in bank. And My Doctor told me that I don't have much time to
live because of the cancer problem, Having known my condition I
decided to hand you over this fond to take care of the less-privileged
people, you will utilize this money the way I am going to instruct
herein. I want you to take 30 Percent of the total money for your
personal use While 70% of the money will go to charity" people and
helping the orphanage.

I don't want my husband's efforts to be used by the Government. I grew
up as an Orphan and I don't have anybody as my family member,

Regards,

Mrs.Nicole Marois.
written from Hospital.
