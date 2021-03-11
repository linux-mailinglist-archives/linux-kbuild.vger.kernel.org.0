Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 00CBE336FB4
	for <lists+linux-kbuild@lfdr.de>; Thu, 11 Mar 2021 11:19:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231991AbhCKKSj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 11 Mar 2021 05:18:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232160AbhCKKSV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 11 Mar 2021 05:18:21 -0500
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00C0DC061574;
        Thu, 11 Mar 2021 02:18:20 -0800 (PST)
Received: by mail-yb1-xb2a.google.com with SMTP id n195so21137709ybg.9;
        Thu, 11 Mar 2021 02:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PE76/wgHFI63Qk8r0BeS/7Wayu5F52U0PT65yrvGBho=;
        b=KV/dCmLmRH8TZk2NhlpOMNZzTlErCwdeopxE6XFCM7FHZKJ1UKwEmwshsOl3r4Wal9
         vSO0FJ6RmsiRyMsMBBUSgFddeuro9HUvpZZGHV55jsRR5ES3nFA84r/RnqrkxG1o3fOS
         TWNKmPjsVMBzvE6sTRl7Lbo2JI/8w1NiHVa9jy028lo+RoVtxXCqIEDyHPOcOUyTLzIK
         nv6wo2h6RH2pXq41wRulSWqj5hqnSJM0dvBqsv+crbK2UDNxwBnLw7QG9TQVQjsmTlvm
         n4T2R2GDuaWEcOewrqtu0Q7LpDIaQTWsj/75iPiWcuO9U/vd0osRtyTVE9DdOcDYEow0
         Pdow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PE76/wgHFI63Qk8r0BeS/7Wayu5F52U0PT65yrvGBho=;
        b=ieR2z4fQnJyid6t2AQCDsMZyh6MXsb9hlJvgk56R1p8rpXDuC7S92/HSy6sqQmkMac
         ZljhrZWazYJ18ywv3q3HqpEn6SSUZpKw9o7hU1+2TRmiAIGTZEdbvoyMN6qoQsN/Tn2r
         h5tqeZw1ahYpI435NzJEzjzhqzza45xYtBBk3dgNPqgX/CMJ4v3pgv63icf9fhGfwkW0
         ewSrmG8H6wrYlz/qztQBPbc+nXLwWXw4jrBTiYq8usorekcqB9zCnLWSEYO81Gni+pvY
         zz4YSu9PDV/aZTQdXZMycGY59uUVK0ntLgt/YGmda5JLos+U2VvRHDxBU99E+bBOx+hj
         /cmA==
X-Gm-Message-State: AOAM530qey4xyRyIu41VOGhEBkLLypJP9MbisrBtwdCITWETpseSwrQx
        sy2Lf4UCNzAFn3T/GyTHIHb4ol5eY2cOblHUc+w=
X-Google-Smtp-Source: ABdhPJyO8YoCMbR4BNe6Cl+vhkkww7M0yF67eahb5yqYaldc6KfVxs/P+3FtLX0I4tuz64W3/8h0Cat6Pzwwm+teFlQ=
X-Received: by 2002:a25:d6d5:: with SMTP id n204mr10363574ybg.22.1615457900276;
 Thu, 11 Mar 2021 02:18:20 -0800 (PST)
MIME-Version: 1.0
References: <20210311094624.923913-1-masahiroy@kernel.org>
In-Reply-To: <20210311094624.923913-1-masahiroy@kernel.org>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 11 Mar 2021 11:18:09 +0100
Message-ID: <CANiq72m1e9MD83sP5iZCfzoCR0qLz2HQj_VVkE4X-56vf6e7fw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: collect minimum tool versions into scripts/min-tool-version.sh
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Nicolas Pitre <nico@fluxnic.net>,
        Nathan Chancellor <nathan@kernel.org>,
        =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@lindev.ch>,
        Miguel Ojeda <ojeda@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 10:47 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> +# When you raise the minimum version, please update
> +# Documentation/process/changes.rst as well.
> +min_gcc_version=4.9.0
> +min_llvm_version=10.0.1
> +min_icc_version=16.0.3 # temporary
> +min_binutils_version=2.23.0

+1 to creating a central place for all minimum versions.

    Acked-by: Miguel Ojeda <ojeda@kernel.org>

I wonder if you considered creating a folder with files like
`scripts/min_versions/gcc` containing the version string. That would
make it easier for reading from other languages or even importing them
dynamically into the documentation, thus removing even more
duplication.

Cheers,
Miguel
