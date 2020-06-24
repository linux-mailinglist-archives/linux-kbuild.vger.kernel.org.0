Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B37572073BE
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 14:52:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389575AbgFXMwj (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 08:52:39 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:37541 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388942AbgFXMwj (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:52:39 -0400
Received: by mail-pf1-f195.google.com with SMTP id j1so1135725pfe.4;
        Wed, 24 Jun 2020 05:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ImZMVmJ6KLEqHAgKJ4c32f0nuRv6OUnQsFfctRSAXJo=;
        b=aq9B/Xquq7abP5W46czT/Y6R0AfQt6SMY2t56fsDVPTTUuHqh3n8759IC7LiWzKPjk
         9pDrbuCKE43BMY5yyu/DY1+aaThShdSqVPXLqw9Ej/9nAZXswXwjlsCFApCp9A5wk4Ia
         56S2A65e3tXtjajxVqXh62RTMBac/9gncxFJ+VeC1QzS3MKKKEeSJ7To01F2bX0iUe/Z
         ZjYqnXEb2hJico4bcPuA2YtGDQHBafYVX8ZC91dStxzivDf+BFItv5QlwXG2hS+3aJig
         A9F2IjgU/b0SspwnpAkV9fHvG8IFGKRTBhwmO+t3FT6J7dl+E+QTt7XxhpLXperTQb3I
         zmyA==
X-Gm-Message-State: AOAM533kBqFXjfTD7+5zoUuwN2YIhwPhXX7YRzOpUOgpr6Bow1FnP1sW
        IzZhNl7SxijYa+6z7KnLn2A=
X-Google-Smtp-Source: ABdhPJzddnf/uaOk9Rgp8vbxcf8lUTdU8rjuvn4Wiik8YZvkhsAy30AnlKe/2Lxzs/SCBU/Spfu6GQ==
X-Received: by 2002:a63:2a8a:: with SMTP id q132mr21027891pgq.279.1593003158753;
        Wed, 24 Jun 2020 05:52:38 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id z11sm20679101pfk.141.2020.06.24.05.52.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 05:52:37 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id BAA8F40430; Wed, 24 Jun 2020 12:52:36 +0000 (UTC)
Date:   Wed, 24 Jun 2020 12:52:36 +0000
From:   Luis Chamberlain <mcgrof@kernel.org>
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Kees Cook <keescook@chromium.org>, Jann Horn <jannh@google.com>,
        Emese Revfy <re.emese@gmail.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
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
Message-ID: <20200624125236.GF4332@42.do-not-panic.com>
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

But why is skipping it safe?

  Luis
