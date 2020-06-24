Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15DDE207613
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 16:52:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389818AbgFXOwJ (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 10:52:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389400AbgFXOwJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 10:52:09 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88750C0613ED
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:52:08 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id e18so1529676pgn.7
        for <linux-kbuild@vger.kernel.org>; Wed, 24 Jun 2020 07:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=+LYpavnNuYqsfOkUttYqicpUlIfIv5Cp3lganI3VZyY=;
        b=oOpZTa5+wogd5Zo5i06YBiLJFA99TNpd/R+dpAjxia0I1HX72p/pYJ8+r7FI6VpwER
         kzA4slLqc797d9hmoYdf7UkLvHZBonG0ASsGwrh3JEmkqkxa0R9ukdqOi+fcffkssEzd
         F5YHRwr3LVOa1RW5jvA3hKVCIR9zUCv3CwZ08=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=+LYpavnNuYqsfOkUttYqicpUlIfIv5Cp3lganI3VZyY=;
        b=LnfHXuM5IXhRu6Sp6j7j9zZNidXz5wX+LBQUuKZW42DpIOcLEBXS4ZUyubbGiKDPjj
         2Ie2XZffMyP8EybMZTXh6d9txCtIIYetbtYYDPXfcbURVCEOhLFhm8sKZ612WYXVC7Oy
         Ov23eh/4BL9dZBEiy3PRP/lBbUzC4DILFf+kJ6gi+GJAk810k1nWQf+U5LkT+2fYUz6F
         neyGs6jObR+tmIkxiKm4COpZNc/9WltljDdLtKnkkqKRqlffFLEXq50m53q/wPhfw0Om
         n3SArwDCQvOeiMISRC56I922mTW/psQiOyad052Bg+CcpumfLLmBLjiw4QMrka6EfZwW
         jmBw==
X-Gm-Message-State: AOAM532ulxvIFl6JkRT4eWOkahIQRQQJWhKUp61EOVnU082AfhhfZ7YJ
        WM2OuClV4PGmEerUfiJXQRPgDQ==
X-Google-Smtp-Source: ABdhPJwjhADjsZkiUiV63C7UdjS0kr8znYCOvlhuYeRyXXM/eucbfSwVQB3WasGrTPrLaBRSEotjoQ==
X-Received: by 2002:a63:8b42:: with SMTP id j63mr22776554pge.131.1593010327982;
        Wed, 24 Jun 2020 07:52:07 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id cm13sm5609737pjb.5.2020.06.24.07.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 07:52:07 -0700 (PDT)
Date:   Wed, 24 Jun 2020 07:52:06 -0700
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
Subject: Re: [PATCH v2 1/5] gcc-plugins/stackleak: Don't instrument itself
Message-ID: <202006240751.30293A1@keescook>
References: <20200624123330.83226-1-alex.popov@linux.com>
 <20200624123330.83226-2-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624123330.83226-2-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 03:33:26PM +0300, Alexander Popov wrote:
> There is no need to try instrumenting functions in kernel/stackleak.c.
> Otherwise that can cause issues if the cleanup pass of stackleak gcc plugin
> is disabled.
> 
> Signed-off-by: Alexander Popov <alex.popov@linux.com>
> Acked-by: Kees Cook <keescook@chromium.org>

Thanks! Applied to for-next/gcc-plugins.

-- 
Kees Cook
