Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEBDC207602
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 16:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391282AbgFXOqW (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 10:46:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391276AbgFXOqU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 10:46:20 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47E15C061573
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:46:19 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id d12so1155516ply.1
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YGEb31AttHeA5YUH1Hedg3SW+2stgVlj3nYXGGbAchU=;
        b=UcuWUiaLtS6hQwB9KxUy3Z9bv7Nks62Tpl6fbvA8uqD2/B7av9kURZB/L+B445OT1t
         NvQdGODIDeocCPW6jfNCyl35CogPsG3G8IknHXCfJJW3FYZfWX6G7dhUvusVDuWMLuDl
         qZYw9sQff/knmaH1usdfgE0F1lzEuWXKIIt4c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YGEb31AttHeA5YUH1Hedg3SW+2stgVlj3nYXGGbAchU=;
        b=rgEp+gLZ+ogK7NDPW17XuF8xJ753kW5FV4ONM2oswmHImkg6WV+iFcAU+htfN04tk5
         oxEKIsrKY6mPczJZDNJMfTIX/sZRuY8oXEHr6Qh5h0GpvwBEw1u1zieFZL4r96/g/iDN
         yHoWifTVwVjb5c93LTHvmOVf7HvKEBG300/+Ytswz1iCpqC7hpVQ3tCok3oQDcA4Kc2b
         CQ0LZxr3J1Yq6EFxT8aJ+rLSJ/fERXIBx1zcz9qjZEBhayQbx+rsZiA3LH/IokXu5wcz
         TZGLv/ObIle7hJRrqO7VFtCI3DiZg1f7HpZ5oi4bNplv5429gZbHK3D2CZP3yO73F5vq
         1/Hw==
X-Gm-Message-State: AOAM5330o015zVCjQdcG4l6cgjNcuaULiBXp0KXRlVzWhWmn88k10Y6m
        p7cNHxHOD4Tz6bBjc/8nf61cPg==
X-Google-Smtp-Source: ABdhPJyaJyusdqr7gDuMQQVuvplY9KQKo74Br6IzoxaZjoYjPgwJk8Z+WqrtZcFpgt19+bLbcQX0cg==
X-Received: by 2002:a17:902:8681:: with SMTP id g1mr27995114plo.161.1593009978891;
        Wed, 24 Jun 2020 07:46:18 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id c9sm20548752pfp.100.2020.06.24.07.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:46:18 -0700 (PDT)
Date:   Wed, 24 Jun 2020 07:46:17 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Jann Horn <jannh@google.com>, Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Jessica Yu <jeyu@kernel.org>,
        Sven Schnelle <svens@stackframe.org>,
        Iurii Zaikin <yzaikin@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Peter Collingbourne <pcc@google.com>,
        Naohiro Aota <naohiro.aota@wdc.com>,
        Alexander Monakov <amonakov@ispras.ru>,
        Mathias Krause <minipli@googlemail.com>,
        PaX Team <pageexec@freemail.hu>,
        Brad Spengler <spender@grsecurity.net>,
        Laura Abbott <labbott@redhat.com>,
        Florian Weimer <fweimer@redhat.com>,
        kernel-hardening@lists.openwall.com, linux-kbuild@vger.kernel.org,
        x86@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, gcc@gcc.gnu.org, notify@kernel.org
Subject: Re: [PATCH v2 3/5] arm64: vdso: Don't use gcc plugins for building
 vgettimeofday.c
Message-ID: <202006240745.19E4F8BDEA@keescook>
References: <20200624123330.83226-1-alex.popov@linux.com>
 <20200624123330.83226-4-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624123330.83226-4-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 03:33:28PM +0300, Alexander Popov wrote:
> Don't use gcc plugins for building arch/arm64/kernel/vdso/vgettimeofday.c
> to avoid unneeded instrumentation.
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>

It looks like Will has taken this already, but:

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
