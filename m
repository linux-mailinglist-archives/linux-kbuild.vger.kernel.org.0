Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ADDD2F6659
	for <lists+linux-kbuild@lfdr.de>; Thu, 14 Jan 2021 17:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727359AbhANQuD (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Thu, 14 Jan 2021 11:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727355AbhANQuD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jan 2021 11:50:03 -0500
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 01584C061574;
        Thu, 14 Jan 2021 08:49:23 -0800 (PST)
Received: by mail-qk1-x732.google.com with SMTP id w79so8851048qkb.5;
        Thu, 14 Jan 2021 08:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=23Gq+U8tqRW6jTOvnenkJZDTDWUxbLpLE/rkMRigKH8=;
        b=GaUR9vgAYSjgkwC5BQA6RgqGZVtkAirpuTeWejfYS22oRO8Ucb4FW55h1/ihOqlmfe
         Wyuvmr8MDrC10rJZC1IRIq4dXmkPa8g2i82GcSMDtX8W6RR9optsWdIhjSU2AFDss7rR
         6iDGQkgkDGQTfGzaqkyJu8PZHFGt90ySq8InE1AlQI2Hxjm7vyYVya38Z6C13H/K94hy
         YObB+ccpyNROGAxl2MmXAo9WWJ9GUn6RVp4j6+wG92dhPsrURu3/Ua5xjwMUXZZM94Et
         i9LF575Z62Liz7TH50QS7UZjmDpPTQ7a0Fico+QModaYHV6lBH2UCELGRstV+tNi/g9/
         bnvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=23Gq+U8tqRW6jTOvnenkJZDTDWUxbLpLE/rkMRigKH8=;
        b=frC7xXOVUdgfF3XeNeFbNxNx7+k8kPRC37KVrGogkq93VEPEkhXxDEozgo10GQNRDo
         2uxagXlgSO5J7nZq5yyviqmCi8mAMNn81l0pVtCLt7zoMByq0Y8MIvzdwbYs28XQ8PXm
         /QJwmxQkXMwkVfdNaPJqh22aksDzwuOZPE5lurflTOGHHMeL54K9LY6vR+9cQggHUYMA
         PbkWajNoWuDfbIjjirXSfPXXdnfsx6cS5aV6dup8SiXS744Tlcssv2bf8J59uxct1hUF
         VZQ+7i10SOiO/RMvW8sh9o+m35u9puLXpR/M4TXlu79wjS9VpjtKnSodUkfKXMnA5ZSo
         UwVg==
X-Gm-Message-State: AOAM531XGBf68zojq7/DbULnxxF2e6MmS6GWFNvNhh3km4Z3hX6wj/nJ
        LoGJ+DleOHHWmsNC98ybt2oqdVZHuPphVg==
X-Google-Smtp-Source: ABdhPJyflr9W90ItsxS/m3igzcBqIh4SLvb04HwWrDjLEpQiG7pwQEUrrBawAIBXR9lwG5OImNqBYA==
X-Received: by 2002:a05:620a:1239:: with SMTP id v25mr7727606qkj.91.1610642962085;
        Thu, 14 Jan 2021 08:49:22 -0800 (PST)
Received: from ubuntu-m3-large-x86 ([2604:1380:45f1:1d00::1])
        by smtp.gmail.com with ESMTPSA id q3sm3288275qkb.73.2021.01.14.08.49.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jan 2021 08:49:21 -0800 (PST)
Date:   Thu, 14 Jan 2021 09:49:20 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Ilie Halip <ilie.halip@gmail.com>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] kbuild: check the minimum compiler version in Kconfig
Message-ID: <20210114164920.GA258518@ubuntu-m3-large-x86>
References: <20210114042420.229524-1-masahiroy@kernel.org>
 <CAHFW8PRr6kjEE=7BSzWo7itSZgAhy_dhmnSe1yq5wMfDwEyJ9g@mail.gmail.com>
 <CAK7LNAQHA7FpYfdDaOuf+t+nMCtLH=Z7cdoK+3z3ScZ3Fn9Xww@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNAQHA7FpYfdDaOuf+t+nMCtLH=Z7cdoK+3z3ScZ3Fn9Xww@mail.gmail.com>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jan 14, 2021 at 06:20:15PM +0900, Masahiro Yamada wrote:
> BTW, when I tried ICC a few years ago,
> I could not build the kernel with it.

Looking at the history behind include/linux/compiler-intel.h, the last
time I see a change that actually references building a kernel with icc
was 503cf95c061a ("x86, build, icc: Remove uninitialized_var() from
compiler-intel.h"), all the way back in 2013. Since then, there do not
appear to be any meaningful changes; every change is basically doing
something for clang or gcc and not wanting to leave icc behind. It might
be worth considering tearing it out.

Cheers,
Nathan
