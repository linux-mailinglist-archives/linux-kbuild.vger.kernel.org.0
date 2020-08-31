Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Original-To: lists+linux-kbuild@lfdr.de
Delivered-To: lists+linux-kbuild@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69B4E258416
	for <lists+linux-kbuild@lfdr.de>; Tue,  1 Sep 2020 00:30:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728197AbgHaWau (ORCPT <rfc822;lists+linux-kbuild@lfdr.de>);
        Mon, 31 Aug 2020 18:30:50 -0400
Received: from ms.lwn.net ([45.79.88.28]:39106 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728083AbgHaWat (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 31 Aug 2020 18:30:49 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0475E7C0;
        Mon, 31 Aug 2020 22:30:48 +0000 (UTC)
Date:   Mon, 31 Aug 2020 16:30:48 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Masahiro Yamada <masahiroy@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        "Theodore Ts'o" <tytso@mit.edu>, Borislav Petkov <bp@suse.de>,
        "Alexander A. Klimov" <grandmaster@al2klimov.de>,
        Will Deacon <will@kernel.org>,
        clang-built-linux@googlegroups.com, linux-kbuild@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: add minimum clang/llvm version
Message-ID: <20200831163048.0cbeca5d@lwn.net>
In-Reply-To: <20200826191555.3350406-1-ndesaulniers@google.com>
References: <20200826191555.3350406-1-ndesaulniers@google.com>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, 26 Aug 2020 12:15:55 -0700
Nick Desaulniers <ndesaulniers@google.com> wrote:

> Based on a vote at the LLVM BoF at Plumbers 2020, we decided to start
> small, supporting just one formal upstream release of LLVM for now.
> 
> We can probably widen the support window of supported versions over
> time.  Also, note that LLVM's release process is different than GCC's.
> GCC tends to have 1 major release per year while releasing minor updates
> to the past 3 major versions.  LLVM tends to support one major release
> and one minor release every six months.
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>

Applied, thanks.

jon
