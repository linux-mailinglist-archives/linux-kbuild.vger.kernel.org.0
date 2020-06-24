Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 12A53207616
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 16:52:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390869AbgFXOwb (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 10:52:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389400AbgFXOwa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 10:52:30 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89632C0613ED
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:52:29 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id jz3so1269500pjb.0
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=u2t0csFbaqQQKHGsdu4Ps/0+902KB2yFco36m+qYijE=;
        b=GFaiBnqgZnNh4wd8OhfyJj+OLfayMLvp2cUErZCWyE0KhlI4GBJtkNGGjWUje6AqxO
         wKNzdJi720VA34rdPV/0XJ/7pZOCZmT0sTJyMQUrO/d0wFqp6jYj7o9RzGUQli+F2P60
         gHC0u+e67yC+7wO57Px8yJWfH46mIgubSpFls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=u2t0csFbaqQQKHGsdu4Ps/0+902KB2yFco36m+qYijE=;
        b=W8N/KEk3bxU56w5QyW47cDlEVSn3FxJZtNBquBhPSL/h4mDQKUl6KaGCOweFCPGlsP
         YDBMWAWQkhCHDUWPAvyIethacOfBtxC32MAXQSc3+W0IqVAWz423rsub44vzoUxpKjgi
         swc4mGHNmoj59+AHe6ZbbJVauKxqckU2ZrM/0BmZIuG3/Ao/ljXQKrtw3vqYHaHWd837
         uchWIReaRqqp1DHzX+bCSfJMIOiZNCdhs3HNCvlTZIaRY8WrPeXm6+iskFFREj1NVqC/
         gV+rDtJmNQTNHiaUFQRf/MhXU6MLFZrmCrWyfox01JkY0b3qOM0Zdy8dhEn3HF01XDqe
         3nGw==
X-Gm-Message-State: AOAM530RPNMwlqICT0uJ56uOmtEO+Zq7XmyyrI2I65pPOXlyuCjuEGKp
        u4cVV4eRd737uajzObdOcItc7w==
X-Google-Smtp-Source: ABdhPJzSKnjC6q0itcfYB9NBferTrDvxaLliakcW3kWkd4DyBl9K9bBpS0oiH3XZ4hWI1H7d0i4CAw==
X-Received: by 2002:a17:90a:1781:: with SMTP id q1mr27332225pja.24.1593010349195;
        Wed, 24 Jun 2020 07:52:29 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id n15sm3110969pgs.25.2020.06.24.07.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:52:28 -0700 (PDT)
Date:   Wed, 24 Jun 2020 07:52:27 -0700
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
Subject: Re: [PATCH v2 2/5] ARM: vdso: Don't use gcc plugins for building
 vgettimeofday.c
Message-ID: <202006240752.9114041C@keescook>
References: <20200624123330.83226-1-alex.popov@linux.com>
 <20200624123330.83226-3-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624123330.83226-3-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 03:33:27PM +0300, Alexander Popov wrote:
> Don't use gcc plugins for building arch/arm/vdso/vgettimeofday.c to
> avoid unneeded instrumentation.
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>

Applied to for-next/gcc-plugins.

-- 
Kees Cook
