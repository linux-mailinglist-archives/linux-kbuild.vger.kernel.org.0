Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D22A42D6ED9
	for <lists+linux-kbuild@lfdr.de>; Fri, 11 Dec 2020 04:48:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2395226AbgLKDqy (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 10 Dec 2020 22:46:54 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36454 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2395222AbgLKDqh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Dec 2020 22:46:37 -0500
Received: by mail-lj1-f194.google.com with SMTP id a1so9341243ljq.3;
        Thu, 10 Dec 2020 19:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Yx2aynEdnPpbXULhzc3uagZjH2w4cvLYDS+eix+Evs8=;
        b=JIcJBf5ILNgFU5P4DA4OuGxtJWfYlORUgtaukyNEtKI13OX0k2nIhrKV5OaDUyM4yA
         cCUYer3q0Jdc2TKqyadi8wAZuqdqMEqy8JCs/GXuk3uj7h40xXjmcR3BfG1vsRAh1yG9
         kqFkuHkYQxTxBfGnpFwQjSty9pvAKSKV6CvbYh8BN9rBycqDDdBWQpXE/vs6BZO6tHb8
         AVavvpaExHcP7QB/w626MJpimQ0TZ4CN46UPVkVPD2m7IUDnv3AWjkkrfl6AD4zX9B99
         QPYpyIqTujMqoNF/dJGEWMaS7inujr/peL1BrYj42P8exKpei4KW8256EK68O0QrFgGE
         oLYQ==
X-Gm-Message-State: AOAM532Z09KyJVN626+WnbUkoiGsGd924xVJbR3Fv+3cC7AlZ9s92jfY
        YGbxFu6MtoM+0a4XvUNMda8BH8Krge7ntuGSRV4=
X-Google-Smtp-Source: ABdhPJwVQfQg8u2BiFAZbc2HANtfVR/hJeKOf4Zup19O9RH33cj/Ho6GVUBDqwD9fgs81xmqrCswpAQD6Km9YVbam4c=
X-Received: by 2002:a05:651c:301:: with SMTP id a1mr4092501ljp.275.1607658355260;
 Thu, 10 Dec 2020 19:45:55 -0800 (PST)
MIME-Version: 1.0
References: <20201210144844.72580-1-chanho61.park@samsung.com>
In-Reply-To: <20201210144844.72580-1-chanho61.park@samsung.com>
From:   Namhyung Kim <namhyung@kernel.org>
Date:   Fri, 11 Dec 2020 12:45:44 +0900
Message-ID: <CAM9d7cjeEgP68Xf3x0EJEQv+gtg_QD=8+bbTJ1vY7dyAC2NaTA@mail.gmail.com>
Subject: Re: [PATCH 0/2] fix perf tool build error on MUSL libc
To:     Chanho Park <parkch98@gmail.com>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Chanho Park <chanho61.park@samsung.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        Leo Yan <leo.yan@linaro.org>,
        John Garry <john.garry@huawei.com>,
        Will Deacon <will@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jiri Olsa <jolsa@redhat.com>, Khem Raj <raj.khem@gmail.com>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Adding people in the original patch + kbuild folks.

On Thu, Dec 10, 2020 at 11:48 PM Chanho Park <parkch98@gmail.com> wrote:
>
> __always_inline can cause build error on musl libc because it's not
> defined. We need to include <linux/stddef.h> before asm/byteorder.h.
> tools/include/uapi/linux/perf_event.h is copied version from
> include/uapi/linux/perf_event.h. To fix this, we need to apply this
> change both header files.
>
> Cc: Mathieu Poirier <mathieu.poirier@linaro.org>
> Cc: Suzuki K Poulose <suzuki.poulose@arm.com>
> Cc: Mike Leach <mike.leach@linaro.org>
> Cc: Leo Yan <leo.yan@linaro.org>
> Cc: John Garry <john.garry@huawei.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Arnaldo Carvalho de Melo <acme@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Jiri Olsa <jolsa@redhat.com>
> Cc: Namhyung Kim <namhyung@kernel.org>
> Cc: Khem Raj <raj.khem@gmail.com>
>
> Chanho Park (2):
>   perf: fix build error on MUSL libc
>   perf: tool: fix build error on MUSL libc
>
>  include/uapi/linux/perf_event.h       | 3 +++
>  tools/include/uapi/linux/perf_event.h | 3 +++
>  2 files changed, 6 insertions(+)
>
> --
> 2.23.0
>
