Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38A952073C0
	for <lists+linux-kbuild@lfdr.de>; Wed, 24 Jun 2020 14:53:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389721AbgFXMxI (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Wed, 24 Jun 2020 08:53:08 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:43604 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388942AbgFXMxH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 24 Jun 2020 08:53:07 -0400
Received: by mail-pl1-f196.google.com with SMTP id x8so129660plm.10;
        Wed, 24 Jun 2020 05:53:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LW+cEvL5rxny3qTajLMBWIwk08EKQ6OtW1sh3tGLLCE=;
        b=iKv9nG1J7AtYfYE6bMBegwr/DK+sbIFumxG/fQU8CDAJFemu8/mfLyHUF5u8x2V8l/
         jXy1J9cU5sVhvQjRfIQFen8VTsrOCP53Q0bq2N9DA/h5DEQjwE9bgYQIqewm/OEDQ26X
         V3/TkGrnK6r6NMikSZSNUPOdYVr3y4x501p4OSw6zmzOTlmbwiLIgkz1Dzg3B/YSxqz3
         /YitVOdKb8RhDohqhES/FXiAMLhCESjVOucNmSmvxLGA1Sj5QvucHowLgAVO6y8A9J/4
         G5TiY1admktt1meYrAnbXgu9/NeeNPahWSEkPKmpa/AFknGLe6jfkQRoISjTd2Nn5ckh
         UTIg==
X-Gm-Message-State: AOAM530loANBxhHL9CF7TQdPZFtaILgUdI4eucqtFjb805e39C/74WAd
        oyJ5DOFG+HXuoXwYYrsC7Ts=
X-Google-Smtp-Source: ABdhPJydf2a/ChBdgFCHlq0WCNjf8N9Yo8suilvVTsKI3Zox/8CKs38PB/PLjTY9T+3M/14w9UJfpg==
X-Received: by 2002:a17:90a:ab88:: with SMTP id n8mr20426086pjq.34.1593003187201;
        Wed, 24 Jun 2020 05:53:07 -0700 (PDT)
Received: from 42.do-not-panic.com (42.do-not-panic.com. [157.230.128.187])
        by smtp.gmail.com with ESMTPSA id l2sm5575240pjl.34.2020.06.24.05.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2020 05:53:05 -0700 (PDT)
Received: by 42.do-not-panic.com (Postfix, from userid 1000)
        id 0B6ED40430; Wed, 24 Jun 2020 12:53:05 +0000 (UTC)
Date:   Wed, 24 Jun 2020 12:53:05 +0000
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
Subject: Re: [PATCH v2 5/5] gcc-plugins/stackleak: Add 'verbose' plugin
 parameter
Message-ID: <20200624125305.GG4332@42.do-not-panic.com>
References: <20200624123330.83226-1-alex.popov@linux.com>
 <20200624123330.83226-6-alex.popov@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624123330.83226-6-alex.popov@linux.com>
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jun 24, 2020 at 03:33:30PM +0300, Alexander Popov wrote:
> Add 'verbose' plugin parameter for stackleak gcc plugin.
> It can be used for printing additional info about the kernel code
> instrumentation.
> 
> For using it add the following to scripts/Makefile.gcc-plugins:
>   gcc-plugin-cflags-$(CONFIG_GCC_PLUGIN_STACKLEAK) \
>     += -fplugin-arg-stackleak_plugin-verbose

Would be nice if we instead could pass an argument to make which lets
us enable this.

  Luis
