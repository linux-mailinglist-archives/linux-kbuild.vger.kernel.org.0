Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA1C229A3A1
	for <lists+linux-kbuild@lfdr.de>; Tue, 27 Oct 2020 05:32:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505410AbgJ0EcR (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Tue, 27 Oct 2020 00:32:17 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:37021 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505409AbgJ0EcR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Oct 2020 00:32:17 -0400
Received: by mail-qk1-f196.google.com with SMTP id z6so123796qkz.4;
        Mon, 26 Oct 2020 21:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=zZNvqG1mmjJvDdd08tHMRAXLoOvkI7U3m+B+iJz61dM=;
        b=SQ3l+NZDecsHEszLgeW3EzZHbrivw02bR2AIS4crOmMDssrBHqoWJoiK+kmNnuvW0E
         XboOO4GU4puutn1seSDds2PdVAqG9N+d2ww5QOqJw+WoVgfSBscSaFRi2N9L1cwqHabd
         uMB5Gvnk/bQ6UKRZEiyvTaktOuTioh3d0ds8shkhHUi8Qs3xoUQqUgriCKkRnYofTf5A
         MZEvP+gdduysb3El1y0lQZoY/7rFzNfeIAhkJj7EWs8J8wYuXQxOhdDfbPfR7pMw02jl
         KZu/ZbJf1ZTdhNZGEo6kKpOL59JLOAVl/UPQYWxDgdtTL7LVNmsp0uheWpiNNZzq+qp/
         kFnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=zZNvqG1mmjJvDdd08tHMRAXLoOvkI7U3m+B+iJz61dM=;
        b=m3JI+miYPziSkPHVVk0/bf6pXOjtgjrTHIz0awQDeIRGvLsoaiAGO5Nk0y9m+lIQLE
         UAHPFPYaV4o7Z7NaMPj6Iuv4v6eKSzt9sXwrpQ9GnVqJFIsCfefdlG0k4fKKJsEIDFw+
         bXATrV9JybKkV7oiaD2cqy3eJB0swyYahgzQ1f4E/DIRRr42khN/8iO/OrF9uhCG+jqc
         V7Yrz1Yh1pKZXKuELy8wKngG0GVDCAO+zuCNZArsowaakn861Pw5CmgORwck9kx81To7
         c1Kh+KqgvigyypyNof4HnxsQCbiPqNcnuYIUlxJi5T+H1rMAQvGAmTSlvyb5x5n/g+FU
         8OBQ==
X-Gm-Message-State: AOAM530rS9EFBycYwQthlj0hc5oVrWx7VQ0sRqFmotX1geS31POCvZU1
        oVnA93XvDBDY8QTluccijO8=
X-Google-Smtp-Source: ABdhPJy2nHtM3zAPhoy4j9d7lTfIqFmaCwkmtbtDVgNdsmF8BVQBaMuia/fUllvnPoseMomfeGYQ1Q==
X-Received: by 2002:a05:620a:a4c:: with SMTP id j12mr380131qka.263.1603773135866;
        Mon, 26 Oct 2020 21:32:15 -0700 (PDT)
Received: from ubuntu-m3-large-x86 ([2604:1380:45d1:2600::3])
        by smtp.gmail.com with ESMTPSA id t65sm125322qkc.52.2020.10.26.21.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 21:32:15 -0700 (PDT)
Date:   Mon, 26 Oct 2020 21:32:13 -0700
From:   Nathan Chancellor <natechancellor@gmail.com>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Arnd Bergmann <arnd@arndb.de>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com
Subject: Re: [PATCH 2/2] Makefile.extrawarn: limit -Wnested-externs to clang
Message-ID: <20201027043213.GA2342477@ubuntu-m3-large-x86>
References: <20201026220331.3896226-1-arnd@kernel.org>
 <20201026220331.3896226-2-arnd@kernel.org>
 <20201027014846.GA368335@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201027014846.GA368335@ubuntu-m3-large-x86>
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 26, 2020 at 06:48:46PM -0700, Nathan Chancellor wrote:
> On Mon, Oct 26, 2020 at 11:03:14PM +0100, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > The -Wnested-externs warning has become useless with gcc, since
> > this warns every time that BUILD_BUG_ON() or similar macros
> > are used.
> > 
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Also see:
> 
> 2486baae2cf6 ("objtool: Allow nested externs to enable BUILD_BUG()")
> 6cf4ecf5c51d ("perf build: Allow nested externs to enable BUILD_BUG() usage")
> 
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>

Actually, just delete this line altogether. -Wnested-externs is a GCC
only warning, the flag is only present in clang for compatibility with
GCC:

https://clang.llvm.org/docs/DiagnosticsReference.html#wnested-externs

With that, my reviewed by still stands.

Cheers,
Nathan
