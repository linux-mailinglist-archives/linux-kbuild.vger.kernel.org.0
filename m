Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 401A115AE80
	for <lists+linux-kbuild@lfdr.de>; Wed, 12 Feb 2020 18:13:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727372AbgBLRNx (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 12 Feb 2020 12:13:53 -0500
Received: from mail-vs1-f68.google.com ([209.85.217.68]:42323 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727054AbgBLRNx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Feb 2020 12:13:53 -0500
Received: by mail-vs1-f68.google.com with SMTP id b79so1638400vsd.9
        for <linux-kbuild@vger.kernel.org>; Wed, 12 Feb 2020 09:13:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fLARtlkQ5V54FNIE3ZdRrfKU32yjdaqkKYODoptkcYk=;
        b=WerW6PQIBeKwwjPZTA8DMO3hZSDEobp9lOJYJQ8RP84ewYEZfZIsG2wnz89UWiXkkQ
         QFdIpHXWaDhJ+QqK2ANjRInpZK4GtnYsVurZrWhEsqVRnnuYa1kkeQH7ez8lu8qlkr0V
         ECvN/3yQ+E2pGHry9V1K0Rzb6ftNMp0yCeBvCJQNXY4sqY9jFeth+6ilfTrDPK9/wlJf
         qyXXsFV2eVo1FMW3KKrjf906yRpNmzjnuWGK/8aiRWZgzWeJGyzcgdvV6oRAntbZt/lY
         BJyajF4/um+eZP7l8B98PhUyb9SZEJjbt/HujZEAgF2/GKCtPbNGWX4hGWtaBCUyH/Rj
         PmEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fLARtlkQ5V54FNIE3ZdRrfKU32yjdaqkKYODoptkcYk=;
        b=TX0lPTAL5MSInlzZFz3Jqa0aWJ04C32TDR7C69Ol7uiCYMIunSVkz0FsGR2tBfXX8g
         +JRrfsGbXsw0en8Mq60wCYCbB6/uTmg2eh9G2K9axolhhmizAxS+r2Q4VzTmFj9ijBv8
         Mk4b1lhYiId/6ZNvdkO28lSoKiEqLzqkWC1owc3LyBt33QkjW5ETjzMzCYOpY3TwymKT
         WVRdGSbKAdebnIFG0iixa+3o/F3oaLfuFqth7yZwn9g5NFcEDxztwpYiKm4EnW50edY3
         LxzydhzLf3zECqzhLH5yu7OCwa92kOuy5S3vC3UkfvSTPFi/jjqi00ufHKY/PUPVv2n8
         5ulQ==
X-Gm-Message-State: APjAAAWbfizoSGlebxWJ04oRYzAjVdc0eEO0cQbZwmDn8NI3q7/TII7m
        T62W/m1v3e1T++TInG6jcGUqXzeX93GFTNx5kLjMFw==
X-Google-Smtp-Source: APXvYqxXc8CMyLzSZUjJiXBoVFA+KwhUw4OZokUMJRDyBgehezx83xZlp12bFEdwlGJXQLi06FpDl8lPHP59NprkuS4=
X-Received: by 2002:a67:f4d2:: with SMTP id s18mr12464458vsn.15.1581527631474;
 Wed, 12 Feb 2020 09:13:51 -0800 (PST)
MIME-Version: 1.0
References: <20200210131925.145463-1-samitolvanen@google.com> <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
In-Reply-To: <CAK7LNAS7UchtP_+2m4AB-hJ=nMwsM-qpkJ+VHU1JGJrn8K1KPg@mail.gmail.com>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Wed, 12 Feb 2020 09:13:40 -0800
Message-ID: <CABCJKuemBAeySJQY6yxhzbxK=XGBtVSt+6J6WXpO=RoiVXH7GQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove duplicate dependencies from .mod files
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Feb 12, 2020 at 5:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> In which case are undefined symbols duplicated?

When a module consists of multiple compilation units, which depend on
the same external symbols. In Android, we ran into this when adding
hardening features that all depend on an external error handler
function with a rather long name. When CONFIG_TRIM_UNUSED_SYMS was
later enabled, we ran into this:

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
xargs echo | wc
      2    9136  168660

xargs defaults to 128kiB limit for command line size, so the output
was split into two lines, which means some of the dependencies were
dropped and we ran into modpost errors. One method of fixing this is
to increase the limit:

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
xargs -s 262144 echo | wc
      1    9136  168660

But it seems removing duplicates is a better solution as the length of
the dependency list is reduced significantly:

$ llvm-nm drivers/gpu/drm/nouveau/nouveau.o | sed -n 's/^  *U //p' |
sort -u | xargs echo | wc
      1    2716   50461

> Do you have a .config to reproduce it?

I can currently reproduce this on an Android kernel that has
Control-Flow Integrity (CFI) enabled. While this feature is not
upstreamed yet, there's nothing that would prevent us from hitting the
command line limit with sufficiently large modules otherwise as well.

Sami
