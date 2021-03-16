Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B361E33DF76
	for <lists+linux-kbuild@lfdr.de>; Tue, 16 Mar 2021 21:47:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232185AbhCPUqe (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 16 Mar 2021 16:46:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232047AbhCPUoq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Mar 2021 16:44:46 -0400
Received: from mail-vs1-xe2a.google.com (mail-vs1-xe2a.google.com [IPv6:2607:f8b0:4864:20::e2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE3C8C061756
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Mar 2021 13:44:45 -0700 (PDT)
Received: by mail-vs1-xe2a.google.com with SMTP id l27so19000111vsj.4
        for <linux-kbuild@vger.kernel.org>; Tue, 16 Mar 2021 13:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tLa3leTdMzh1rknpkLUWnm0PAOSso4HRgQA5K7IK6MM=;
        b=e+TXEaCKvma4VGpnwpOaaFkLknHBGuDmEKybhDxTF83sGcUnhvMjnyd4FKoakznEV3
         L+49y3mjg3y9zPjYOau5jDdMUzS1QeQc8EZHIuCnYCEvlu/U3MIphrqZ/uP5UmkwxxeL
         +/myGc8pDphpzzZ7FTh/9hJKxPT9p26Ia2eDhTGk6iETFEiye/52lqU41RoUHrn74DWh
         Z9MX2qar1Tdy5UlVzs8F5VgOHw+sA5zNyUhbhgEJg7yulcKmANZ/MdTHXU3HQZNR3/3z
         jprq7sQ3GQvcxl+Y7QEUl59VHWT5WD2/UpeliEvsAr6IQyyxoheHA9cHYYw051xuDx5U
         BC1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tLa3leTdMzh1rknpkLUWnm0PAOSso4HRgQA5K7IK6MM=;
        b=Bt3da+tDB8Boc90IwyAZaA4RswB1Tmh3skNd8I3W1/ALsstgQrWTIskQS0VQrmo4Au
         iKuK9Yw7jfB84jX2mPNM3Ivudrx05ZT1dQc2mIDC2K6AytKVXgxs+jkXyBkxvmiSQWb6
         SbzPyW2KDRZjdy6oTKA3XwoBaoDq6ORUJgbk0L9dlvaZVYsH/MR7TWwZeF3Yb3Bti/Cs
         OrFVkm9CwPf24u8acGSJY9/M58aTMhcpG4CKIFQAilWKiQPJgeOQGK88YbU4iZ+ZcsHQ
         xPytH5HWfm6B9mWbdLyM/EVege8pice+s/UrH4/uH3vNq1cEXb6BFtC7LA8QRZ4kbvk1
         mOgA==
X-Gm-Message-State: AOAM532a83TmDAL9OeyFUdX0ypELp84FtTCM6YM1B3uS2qfrfJE39xM3
        u+YOlU1ALAvZ7BtXHLac5PktC16RCrpUXsAiLhHN9A==
X-Google-Smtp-Source: ABdhPJwQSd1vGWBZTCJlQRmCK62EXrLyrNMXIW37KTTCmpBtYEbzwPtXhGB1KcQUzWMwYntm7fopfaHU36IppUu0V+Q=
X-Received: by 2002:a67:db98:: with SMTP id f24mr1241866vsk.13.1615927484959;
 Tue, 16 Mar 2021 13:44:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210312004919.669614-1-samitolvanen@google.com>
 <20210312004919.669614-18-samitolvanen@google.com> <202103111851.69AA6E59@keescook>
In-Reply-To: <202103111851.69AA6E59@keescook>
From:   Sami Tolvanen <samitolvanen@google.com>
Date:   Tue, 16 Mar 2021 13:44:33 -0700
Message-ID: <CABCJKucpFHC-9rvT7uNF+E-Jh20fz69zdO49_4p8G_Sb634qmw@mail.gmail.com>
Subject: Re: [PATCH 17/17] arm64: allow CONFIG_CFI_CLANG to be selected
To:     Kees Cook <keescook@chromium.org>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Will Deacon <will@kernel.org>, Jessica Yu <jeyu@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Tejun Heo <tj@kernel.org>,
        bpf@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arch <linux-arch@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        PCI <linux-pci@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Mar 11, 2021 at 6:51 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Thu, Mar 11, 2021 at 04:49:19PM -0800, Sami Tolvanen wrote:
> > Select ARCH_SUPPORTS_CFI_CLANG to allow CFI to be enabled.
> >
> > Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
>
> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> Random thought: the vDSO doesn't need special handling because it
> doesn't make any indirect calls, yes?

That might be true, but we also filter out CC_FLAGS_LTO for the vDSO,
which disables CFI as well.

Sami
