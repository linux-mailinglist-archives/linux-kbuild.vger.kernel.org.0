Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C4641EE4F2
	for <lists+linux-kbuild@lfdr.de>; Thu,  4 Jun 2020 15:05:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726003AbgFDNF2 (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 4 Jun 2020 09:05:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725926AbgFDNF1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jun 2020 09:05:27 -0400
Received: from mail-il1-x143.google.com (mail-il1-x143.google.com [IPv6:2607:f8b0:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB7EC08C5C0
        for <linux-kbuild@vger.kernel.org>; Thu,  4 Jun 2020 06:05:26 -0700 (PDT)
Received: by mail-il1-x143.google.com with SMTP id t8so5953088ilm.7
        for <linux-kbuild@vger.kernel.org>; Thu, 04 Jun 2020 06:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to:cc
         :content-transfer-encoding;
        bh=UB8N71zlZMHST8vuUtfOvgGJkzslH3pcl8exOAZaPxs=;
        b=ns+noux2rc6kuU8n0bGtIusK3cPzXzhzV/zQvGmEo9lg9zSFkKTyYrNIQRCNdNTGJ8
         DUsp2YAbq7PXbn/nXV2Z7fiPkS7UFLrsWEmgb+7nUQzK988V0ZLaj4iBIe44x4PjtGk1
         6vxMJLOJJ3CKTcd4FN6FpbvMkwRCFnYXPAYuhJWTdGJaMY6du9kflDDj1MlCSRgvfIqk
         TQBqq1I1FrRDVMxzLkKnaq1k2o+PZXBIfdVs7icCiwCGKaeBc8AggiyMxPW7HWAqvI8k
         zpo3Ree3gt7pg4QvtqHMtAPL9fwmqxv1wlr9rQqoykevpaGA3Dh60O1k/AEXnXrkHPtB
         Gwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:cc:content-transfer-encoding;
        bh=UB8N71zlZMHST8vuUtfOvgGJkzslH3pcl8exOAZaPxs=;
        b=GF1Czj8YSwvYXPQOXl3iTwpH6WWJ0ljf6GCxzU7UlxabZA52/PS34vEEYSls+09Wh3
         Qtukj0dYZhY9bIWFyUB4bFaQfcY6jRXf2mbF0+kBWmZmHgo8+4DaMhG4B8TKyiNLF2yA
         cAAimLO8HM9KuUzyFkW+UBicW40HdsoBd3ezq2gAdpZ+REw6nHSXtcIfA9v5sPytou5e
         bkXHol7y6khrSiqePzyQYJ/ryZ5Us9GNnqXmW6Jt722bcLMymjibZW4isCkRBN5Rny7x
         AvNPqSJmCIVYDtpRfvbMAR+2u0y4BXg6VkRQkzfjpobNd6ydZnrZSlaC08RqzVdXTA8k
         BH+w==
X-Gm-Message-State: AOAM530iFsJg5/tFJrhob63dqFX/oPeOgvtWGMW1wGkJ+1LPlg/d1GP6
        1QXru5VnzbTeRH1+nZhJZVzbRAqy0tw1X/mJzzjlN+4ptf9XqQ==
X-Google-Smtp-Source: ABdhPJw6K4vpN89GJEJf7SUEXZuv0uN+17ebZXU1+WKEvn+YP1USGkbb0Hp3GGWNozc5HM//EVAOhwl6nozIWSU8QZQ=
X-Received: by 2002:a92:498d:: with SMTP id k13mr3996968ilg.226.1591275925813;
 Thu, 04 Jun 2020 06:05:25 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sedat.dilek@gmail.com
From:   Sedat Dilek <sedat.dilek@gmail.com>
Date:   Thu, 4 Jun 2020 15:05:14 +0200
Message-ID: <CA+icZUU7AAzpYfktqCvn8oKpFMzZud6fQEh=fNWi4xkuqKmYog@mail.gmail.com>
Subject: [PATCH] kbuild: add variables for compression tools
To:     Denis Efremov <efremov@linux.com>
Cc:     linux-kbuild@vger.kernel.org,
        Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Denis,

is it possible to add ZSTD compression support with the possibility to
add - for example multithreading - options?

Quote from your patch:

> As a sidenote, for multi-threaded lzma, xz compression one can use:
> $ export XZ_OPT=3D"--threads=3D0"

man zstd says:

       -T#, --threads=3D#
              Compress using # working threads (default: 1). If # is
0, attempt to detect and use the number of physical CPU cores. In all
cases, the nb  of  threads  is  capped  to  ZST=E2=80=90
              DMT_NBTHREADS_MAX=3D=3D200. This modifier does nothing if
zstd is compiled without multithread support.

Of course, I can help with testing.

For the documentation - which I have not checked - are the tools and
libs mentioned you will need to have installed for certain compression
tools?
For ZSTD on Debian - these are zstd and libzstd1:amd64 packages.

Thanks.

Regards,
- Sedat -


[1] https://patchwork.kernel.org/patch/11585381/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.=
git/commit/?h=3Dkbuild&id=3D1312a1e434c1816e3bbcd4f806aa862dc735dec0
